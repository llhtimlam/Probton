
`default_nettype none

module state_machine (
    input  wire clk,       // clock
    input  wire rst_n,     // reset (active low)

    // Boot
    input wire boot_complete,

    // Load Config
    input wire cfg_done,
    input wire phase_offset_imported,

    // Calibration
    output logic cal_start,
    input wire cal_done,
    input wire cal_timeout,

    // Readout
    output logic read_en,

    // Amp Ratio Adjuster
    input wire amp_ratio_en,
    output logic write_amp_ratio_en,
    input wire amp_update_done,

    // Manual Soft Reset
    input wire soft_rst,

    // SPI
    output logic [2:0] state_o,
);
    typedef enum logic [2:0] {
        S_BOOT     = 3'd0,
        S_LOAD_CFG = 3'd1,
        S_CAL      = 3'd2,
        S_FALLOUT  = 3'd3,
        S_READOUT  = 3'd4,
        S_AMP_ADJ  = 3'd5
    } state_t;

    state_t state_q, state_d;

    always_comb begin
        state_d = state_q;
        case (state_q)
            S_BOOT: begin
                if (boot_complete) state_d = S_LOAD_CFG;
            end
            S_LOAD_CFG: begin
                if (cfg_done) begin
                    if (phase_offset_imported) state_d = S_READOUT;
                    else state_d = S_CAL;
                end
            end
            S_CAL: begin
                if (cal_done) state_d = S_FALLOUT;
                else if (cal_timeout) state_d = S_FALLOUT;
            end
            S_FALLOUT: begin
                if (soft_rst) state_d = S_BOOT;
            end
            S_READOUT: begin
                if (soft_rst) state_d = S_BOOT;
                else if (amp_ratio_en) state_d = S_AMP_ADJ;
            end
            S_AMP_ADJ: begin
                if (amp_update_done) state_d = S_READOUT;
            end

            default: ;
        endcase
    end
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) state_q <= S_BOOT;
        else state_q <= state_d;
    end

    always_comb begin
        cal_start = 1'b0;
        write_amp_ratio_en = 1'b0;
        read_en  = 1'b0;
        case (state_q)
            S_CAL: cal_start = 1'b1; 
            S_READOUT: read_en = 1'b1;
            S_AMP_ADJ: write_amp_ratio_en = 1'b1;
            default: ;
        endcase
    end

    assign state_o = state_q;
        
endmodule

`default_nettype wire