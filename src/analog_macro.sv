
`default_nettype none

// Readout (Switch -> TIA -> Low Pass Filter)
//(* blackbox *)
module analog_readout (
    input  wire read_en,
    input  wire ain,
    output wire aout,
    inout  wire vdd,
    inout  wire vss
);
    assign aout = read_en ? ain : 1'b0; // dummy
endmodule

// Wave mixer (X/Y)
//(* blackbox *)
module analog_wave_mixer (
    input  wire ain,
    input  wire aref,
    output wire aout,
    inout  wire vdd,
    inout  wire vss
);
    assign aout = ain & aref; // dummy
endmodule

// Comparator (X/Y)
//(* blackbox *)
module analog_comp (
    input  wire clk,
    input  wire ain,
    output wire aout,
    inout  wire vdd,
    inout  wire vss
);
    // dummy
    reg aout_reg;
    always @(posedge clk) begin
        aout_reg <= ain;
    end
    assign aout = aout_reg;

endmodule

`default_nettype wire