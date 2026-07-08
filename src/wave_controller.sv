
`default_nettype none

module wave_controller (
    input  wire clk,       // clock
    input  wire rst_n,     // reset (active low)

    // Config Setting
    // 17 bit: MEMS frequency (Max: 97.65KHz)
    output logic [16:0] cfg_f_MEMS,

    // 8 bit: MEMS phase offset (Resolution: 1/256 MEMS frequency)
    output logic [7:0]  phase0_offset,
    output logic [7:0]  phase90_offset,
    output logic [7:0]  phase270_offset,

    // State Machine
    input  logic        cfg_done,

    // Calibration
    input  logic        cal_start,

    // Latch Strobe
    output logic        latch_phase0,
    output logic        latch_phase90,
    output logic        latch_phase270

);

    // MEMS Wave Generator
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin

        end else if (cfg_done) begin

            // Calibration Run
            if (cal_start) begin

            end

            // Normal Run
            else begin

            end
        
        end
    end
            

    // Comparator Latch
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin

        end else if (cfg_done && !cal_start) begin

        end
    end

endmodule

`default_nettype wire