
`default_nettype none

module wave_controller (
    input  wire clk,
    input  wire rst_n,

    // Config Setting
    // 16-bit: Frequency Control Word (Max MEMS Frequency: 156.24716KHz)
    input logic unsigned [15:0]     cfg_f_MEMS_fcw, // Frequency Control Word (f_MEMS * 2^k) / f_clk, where k is 21, f_clk is 5MHz

    // 21-bit: MEMS phase offset in phase accumulator space
    input logic unsigned [20:0]     cfg_phase0_offset,
    input logic unsigned [20:0]     cfg_phase90_offset,
    input logic unsigned [20:0]     cfg_phase270_offset,

    // State Machine
    input  logic                    cfg_done,
    output logic                    cal_done,
    output logic                    cal_timeout,

    // Calibration
    input  logic                    cal_start,

    // Interface from Analog Comparator Output
    input  logic                    comp_p,         // Comparator (+) raw async wire
    input  logic                    comp_m,         // Comparator (-) raw async wire

    // Latch Strobe
    output logic                    latch_phase90,
    output logic                    latch_phase270,

    // SPI Report
    output logic unsigned [7:0]     delay_wave_cycle,
    output logic unsigned [20:0]    raw_edge1, raw_edge2, raw_edge3, raw_edge4,
    output logic                    cal_dir,
    output logic unsigned [20:0]    cal_phase0_offset, cal_phase90_offset, cal_phase270_offset
);

    // 21-bit NCO Phase Accumulator
    logic unsigned [20:0] phase_acc;

    // Concatenate to fit 16-bit FCW in 21-bit Phase Accumulator
    logic unsigned [20:0] delta_N;
    assign delta_N = {5'h00, cfg_f_MEMS_fcw};

    // Phase Accumulator Engine
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            phase_acc <= 21'b0;
        end else if (cfg_done || cal_start) begin // Start Clock after config is loaded (proceed with calibration if prefill is empty)
            phase_acc <= phase_acc + delta_N;
        end
    end

    // Asynchronous Comparator Sampling
    // Metastability Synchronization (4-tick) and Edge Detection
    logic comp_p_sync0, comp_p_sync1, comp_p_sync2, comp_p_sync3, comp_p_sync4;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            comp_p_sync0 <= 1'b0;
            comp_p_sync1 <= 1'b0;
            comp_p_sync2 <= 1'b0;
            comp_p_sync3 <= 1'b0;
            comp_p_sync4 <= 1'b0;
        end else begin
            comp_p_sync0 <= comp_p;
            comp_p_sync1 <= comp_p_sync0;
            comp_p_sync2 <= comp_p_sync1;
            comp_p_sync3 <= comp_p_sync2;
            comp_p_sync4 <= comp_p_sync3;
        end
    end

    assign comp_p_posedge = (comp_p_sync3 && !comp_p_sync4);
    assign comp_p_negedge = (!comp_p_sync3 && comp_p_sync4);

    logic comp_m_sync0, comp_m_sync1, comp_m_sync2, comp_m_sync3, comp_m_sync4;
    logic comp_m_posedge, comp_m_negedge;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            comp_m_sync0 <= 1'b0;
            comp_m_sync1 <= 1'b0;
            comp_m_sync2 <= 1'b0;
            comp_m_sync3 <= 1'b0;
            comp_m_sync4 <= 1'b0;
        end else begin
            comp_m_sync0 <= comp_m;
            comp_m_sync1 <= comp_m_sync0;
            comp_m_sync2 <= comp_m_sync1;
            comp_m_sync3 <= comp_m_sync2;
            comp_m_sync4 <= comp_m_sync3;
        end
    end

    assign comp_m_posedge = (comp_m_sync3 && !comp_m_sync4);
    assign comp_m_negedge = (!comp_m_sync3 && comp_m_sync4);

    // Calibration Run
    logic unsigned [7:0] wave_cycle_cnt;

    logic phase_overflow;
    assign phase_overflow = (phase_acc + delta_N < phase_acc); 

    logic cal_dir; // 1: In-phase 0: Out-of-phase

    logic capture_pending;
    logic unsigned [1:0] capture_step;
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wave_cycle_cnt <= 8'b0;
            cal_dir <= 1'b0;
            delay_wave_cycle <= 8'b0;
            capture_pending <= 1'b1;
            capture_step <= 2'd0;
            cal_timeout <= 1'b0;
            cal_done <= 1'b0;
        // Calibration State
        end else if (cfg_done && cal_start) begin // Condition: cal_start:1, cfg_done:1
            // Stop loop after timeout and finish calibration
            if (!cal_timeout && !cal_done) begin
                // Track for waveform cycle count
                if (phase_overflow) begin
                    wave_cycle_cnt <= wave_cycle_cnt + 1'b1;
                end

                // Calibration Timeout
                if (wave_cycle_cnt == 8'hFF) begin
                    cal_timeout <= 1'b1;
                end

                // In-phase 1st edge detection
                if (comp_p_posedge && capture_pending) begin
                    raw_edge1 <= phase_acc;
                    cal_dir <= 1'b1;
                    delay_wave_cycle <= wave_cycle_cnt;
                    capture_pending <= 1'b0;
                end

                // Out-of-phase 1st edge detection
                if (comp_m_negedge && capture_pending) begin
                    raw_edge1 <= phase_acc;
                    cal_dir <= 1'b0;
                    delay_wave_cycle <= wave_cycle_cnt;
                    capture_pending <= 1'b0;
                end

                // Capture consecutive edge detection 
                if (~capture_pending) begin
                    // Condition: within 1 MEMS cycle from 1st edge detection
                    if (wave_cycle_cnt < (delay_wave_cycle + 8'd2)) begin
                        // In-phase
                        if (cal_dir) begin
                            case (capture_step)
                                2'd0: if (comp_p_negedge) begin
                                        raw_edge2 <= phase_acc;
                                        capture_step <= 2'd1;
                                    end

                                2'd1: if (comp_m_negedge) begin
                                        raw_edge3 <= phase_acc;
                                        capture_step <= 2'd2;
                                    end

                                2'd2: if (comp_m_posedge) begin
                                        raw_edge4 <= phase_acc;
                                        capture_step <= 2'd3; // Exit the Calibration Loop
                                        cal_done <= 1'b1;
                                    end
                                default: begin
                                    capture_step <= capture_step; // Do Nothing
                                end
                            endcase
                        end
                        // Out-of-phase
                        else begin
                            case (capture_step)
                                2'd0: if (comp_m_posedge) begin
                                        raw_edge2 <= phase_acc;
                                        capture_step <= 2'd1;
                                    end

                                2'd1: if (comp_p_posedge) begin
                                        raw_edge3 <= phase_acc;
                                        capture_step <= 2'd2;
                                    end

                                2'd2: if (comp_p_negedge) begin
                                        raw_edge4 <= phase_acc;
                                        capture_step <= 2'd3; // Exit the Calibration Loop
                                        cal_done <= 1'b1;
                                    end
                                default: begin
                                    capture_step <= capture_step; // Do Nothing
                                end
                            endcase
                        end
                    end
                    // False Signal Reset (Condition not meet: within 1 MEMS cycle from 1st edge detection)
                    else begin
                        capture_step <= 2'd0; // Invalid
                        capture_pending <= 1'b1; // Retry
                    end
                end
                
            end // Freeze after timeout and calibration complete
        end // Freeze if NOT Condition: cal_start:1, cfg_done:1
    end

    // Midpoint Determination for most stable latch (Handle Circular Wrapping)
    assign raw_phase90_offset = raw_edge1 + ((raw_edge2 - raw_edge1) >> 1);
    assign raw_phase270_offset = raw_edge3 + ((raw_edge4 - raw_edge3) >> 1);

    // Latency Correction (4-cycle synchronization pipeline delay)
    logic unsigned [20:0] sync_delay;
    assign sync_delay = (delta_N << 2); // 4 * delta_N

    // Latch point (stable midpoint)
    assign cal_phase90_offset = raw_phase90_offset - sync_delay;
    assign cal_phase270_offset = raw_phase270_offset - sync_delay;

    // Wave mixer reference wave delay estimated from two latch points
    localparam logic unsigned [20:0] PHASE_90 = 21'b0_0100_0000_0000_0000_0000; // 90° phase shift constant: Bit (MSB-2) = 1, [1/4 wave cycle]

    // Averaging 90-90 and 270+90
    wire unsigned [20:0] phase0_est90;
    wire unsigned [20:0] phase0_est270;
    
    assign phase0_est90 = cal_phase90_offset - PHASE_90;
    assign phase0_est270 = cal_phase270_offset + PHASE_90;
    
    assign cal_phase0_offset = phase0_est90 + ((phase0_est270 - phase0_est90) >> 1);

    // Main Readout Loop
    // Comparator Latch
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            latch_phase90  <= 1'b0;
            latch_phase270 <= 1'b0;
        // Readout State
        end else if (cfg_done && !cal_start) begin  // Condition: cal_start:0, cfg_done:1
            // 1-tick Latch pulse
            latch_phase90 <= ((cfg_phase90_offset - phase_acc) < delta_N);
            latch_phase270 <= ((cfg_phase270_offset - phase_acc) < delta_N);
        end else begin
            latch_phase90  <= 1'b0;
            latch_phase270 <= 1'b0;
        end
    end

    // MEMS Wave Generator
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin

        end else if (cfg_done) begin

            // Calibration Run
            if (cal_start) begin
                // Generate 1-wave pulse for calibration to measure delay
            end

            // Main Run
            else begin
                // Generate continuous wave to MEMS driver
                // Generate continuous delay reference wave to wave mixer
                // + phase0_offset
            end
        
        end
    end

endmodule

`default_nettype wire