
`default_nettype none

(* blackbox *)
module analog_block (
    input  wire       clk,
    input  wire       clk1,
    input  wire       read_en,
    input  wire       ref_wave_x,
    input  wire       ref_wave_y,
    output wire       comp_x,
    output wire       comp_y,
    
    input  wire analog_readout_input,
    output wire analog_readout_output,
    output wire analog_error_x_output,
    output wire analog_error_y_output
);
    wire VDD;
    wire VSS;

    // Module Routing

    // Analog
    // Readout (Switch -> TIA -> Low Pass Filter)
    (* keep_hierarchy *)
    analog_readout analog_readout_inst (
        .read_en(read_en),
        .ain (analog_readout_input),
        .aout(analog_readout_output),
        .vdd (VDD),
        .vss (VSS)
    );

    // Wave mixer (X/Y)
    (* keep_hierarchy *)
    analog_wave_mixer analog_wave_mixer_x_inst (
        .ain (analog_readout_output),
        .aref(ref_wave_x),
        .aout(analog_error_x_output),
        .vdd (VDD),
        .vss (VSS)
    );

    (* keep_hierarchy *)
    analog_wave_mixer analog_wave_mixer_y_inst (
        .ain (analog_readout_output),
        .aref(ref_wave_y),
        .aout(analog_error_y_output),
        .vdd (VDD),
        .vss (VSS)
    );

    // Comparator (X/Y)
    (* keep_hierarchy *)
    analog_comp analog_comp_x_inst (
        .clk (clk),
        .ain (analog_error_x_output),
        .aout(comp_x),
        .vdd (VDD),
        .vss (VSS)
    );

    (* keep_hierarchy *)
    analog_comp analog_comp_y_inst (
        .clk (clk1),
        .ain (analog_error_y_output),
        .aout(comp_y),
        .vdd (VDD),
        .vss (VSS)
    );

endmodule


// Readout (Switch -> TIA -> Low Pass Filter)
//(* blackbox *)
module analog_readout (
    input  wire read_en,
    input  wire ain,
    output wire aout,
    inout  wire vdd,
    inout  wire vss
);
    //assign aout = read_en ? ain : 1'b0; // dummy
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
    //assign aout = ain & aref; // dummy
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
    //reg aout_reg;
    //always @(posedge clk) begin
    //    aout_reg <= ain;
    //end
    //assign aout = aout_reg;

endmodule

`default_nettype wire