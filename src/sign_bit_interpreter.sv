`default_nettype none

module sign_bit_interpreter #(
    parameter int unsigned VOTE_WINDOW    = 16,  // MEMS cycles per decision
    parameter int unsigned VOTE_THRESHOLD = 14,  // supermajority needed to act
    parameter int unsigned SYNC_DEPTH     = 4    // metastability pipeline depth
) (
    input  wire  clk,
    input  wire  rst_n,
    input  logic comp_raw,

    // Phase strobes from this axis's wave_controller. Held high by the wave_controller until acked below.
    input  logic latch_phase90,
    input  logic latch_phase270,

    // Acks back to the wave_controller: pulse to release each strobe.
    output logic latch_phase90_ack,
    output logic latch_phase270_ack,

    // Freeze the state machine during amplitude adjustments. Because the comparator threshold shifts while the amplitude ratio changes, votes collected across this transition boundary are invalid. Consequently, the channel must be held and the partial window discarded.
    input  logic amp_ratio_en,
    input  logic amp_update_done,

    // STEP/DIR command out to the stage. HELD LEVELS.
    output logic       dir,
    output logic       move_en,

    // Held: set when a window produced no clear majority, cleared by a later good window.
    output logic       jitter_flag,

    // Observability (SPI / debug)
    output logic [1:0] phase_state,      // last {s90, s270} captured
    output logic [4:0] votes_in_phase,
    output logic [4:0] votes_out_phase
);

    localparam logic [1:0] ST_OUT_PHASE = 2'b01;
    localparam logic [1:0] ST_IN_PHASE  = 2'b10;

    // Metastability synchroniser + matched strobe delay
    // comp_raw and both strobes are each pushed through a SYNC_DEPTH-deep shift register. Using the SAME depth for all three keeps the sampled comparator value aligned with the strobe that selects it: when a delayed strobe fires, the delayed comparator has travelled the same number of ticks.

    logic [SYNC_DEPTH-1:0] comp_pipe;
    logic [SYNC_DEPTH-1:0] s90_pipe;
    logic [SYNC_DEPTH-1:0] s270_pipe;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            comp_pipe <= '0;
            s90_pipe  <= '0;
            s270_pipe <= '0;
        end else begin
            comp_pipe <= {comp_pipe[SYNC_DEPTH-2:0], comp_raw};
            s90_pipe  <= {s90_pipe [SYNC_DEPTH-2:0], latch_phase90};
            s270_pipe <= {s270_pipe[SYNC_DEPTH-2:0], latch_phase270};
        end
    end

    logic comp_sync;
    logic strobe90;
    logic strobe270;

    assign comp_sync = comp_pipe [SYNC_DEPTH-1];
    assign strobe90  = s90_pipe  [SYNC_DEPTH-1];
    assign strobe270 = s270_pipe [SYNC_DEPTH-1];

    // Amplitude-adjustment freeze

    logic freeze;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)               freeze <= 1'b0;
        else if (amp_ratio_en)    freeze <= 1'b1;
        else if (amp_update_done) freeze <= 1'b0;
    end

    // Sampling + voting
    // s90 is captured at the (delayed) 90 strobe and held. The (delayed) 270 strobe completes the pair: that is one MEMS cycle's evidence, so the vote updates there. Each strobe also drives its ack so the wave_controller can drop the corresponding strobe.


    logic       s90;
    logic       s90_valid;      // guards a 270 strobe with no prior 90
    logic       vote_now;
    logic [1:0] state_now;

    assign vote_now  = strobe270 && s90_valid && !freeze;
    assign state_now = {s90, comp_sync};

    logic [4:0] cnt_in,  cnt_out;
    logic [4:0] next_in, next_out;
    logic [4:0] cycle_count;
    logic       window_done;

    always_comb begin
        next_in  = cnt_in;
        next_out = cnt_out;
        if (vote_now) begin
            case (state_now)
                ST_IN_PHASE:  next_in  = cnt_in  + 5'd1;
                ST_OUT_PHASE: next_out = cnt_out + 5'd1;
                default:      /* 00 or 11: no evidence */ ;
            endcase
        end
    end

    assign window_done = vote_now && (cycle_count == 5'(VOTE_WINDOW - 1));

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s90                <= 1'b0;
            s90_valid          <= 1'b0;
            cnt_in             <= 5'd0;
            cnt_out            <= 5'd0;
            cycle_count        <= 5'd0;
            dir                <= 1'b0;
            move_en            <= 1'b0;
            jitter_flag        <= 1'b0;
            phase_state        <= 2'b00;
            votes_in_phase     <= 5'd0;
            votes_out_phase    <= 5'd0;
            latch_phase90_ack  <= 1'b0;
            latch_phase270_ack <= 1'b0;

        end else begin
            // Acks are single-tick: default low, pulse when the matching (delayed) strobe is seen. These fire regardless of freeze so the wave_controller's strobe is always released and never wedged.
            latch_phase90_ack  <= strobe90;
            latch_phase270_ack <= strobe270;

            if (freeze) begin
                // Comparator threshold is moving: discard the partial window and stop the stage. dir holds (move_en gates it anyway).
                s90_valid   <= 1'b0;
                cnt_in      <= 5'd0;
                cnt_out     <= 5'd0;
                cycle_count <= 5'd0;
                move_en     <= 1'b0;

            end else begin
                // ---- 90 deg: first sample of this MEMS cycle ----
                if (strobe90) begin
                    s90       <= comp_sync;
                    s90_valid <= 1'b1;
                end

                // ---- 270 deg: pair complete -> one vote ----
                if (vote_now) begin
                    phase_state <= state_now;
                    s90_valid   <= 1'b0;

                    if (window_done) begin
                        votes_in_phase  <= next_in;
                        votes_out_phase <= next_out;

                        if (next_in >= 5'(VOTE_THRESHOLD)) begin
                            // In-phase: step toward MEMS-positive.
                            move_en     <= 1'b1;
                            dir         <= 1'b1;
                            jitter_flag <= 1'b0;

                        end else if (next_out >= 5'(VOTE_THRESHOLD)) begin
                            // Out-of-phase: step the other way.
                            move_en     <= 1'b1;
                            dir         <= 1'b0;
                            jitter_flag <= 1'b0;

                        end else begin
                            // No majority: do not step. Also covers the near-peak case, which is not observable against the 3.3V/2 baseline.
                            move_en     <= 1'b0;
                            jitter_flag <= 1'b1;
                        end

                        cnt_in      <= 5'd0;
                        cnt_out     <= 5'd0;
                        cycle_count <= 5'd0;

                    end else begin
                        cnt_in      <= next_in;
                        cnt_out     <= next_out;
                        cycle_count <= cycle_count + 5'd1;
                    end
                end
            end
        end
    end

endmodule

`default_nettype wire
