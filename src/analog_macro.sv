
`default_nettype none

// Readout (Switch -> TIA -> Low Pass Filter)
module analog_readout (
    input  wire read_en,
    input  wire ain,
    output wire aout,
    inout  wire vdd,
    inout  wire vss
);
endmodule

// Wave mixer (X/Y)
module analog_wave_mixer (
    input  wire ain,
    input  wire aref,
    output wire aout,
    inout  wire vdd,
    inout  wire vss
);
endmodule

// Comparator (X/Y)
module analog_comp (
    input  wire clk,
    input  wire ain,
    output wire aout,
    inout  wire vdd,
    inout  wire vss
);
endmodule

`default_nettype wire