// ============================================================================
// sine_lut.sv
//
// Quarter-wave symmetric sine lookup table.
// 64-entry ROM, 8-bit offset-binary output (mid-scale = 128).
//
// Combinational. Address is the top 8 bits of the NCO phase accumulator:
//   phase[7]   = quadrant MSB  -> selects upper / lower half of the sine
//   phase[6]   = quadrant LSB  -> mirrors the quarter-wave ramp
//   phase[5:0] = index within the quadrant
// ============================================================================

`default_nettype none

module sine_lut (
    input  logic unsigned [7:0]    phase,   // {quadrant[1:0], index[5:0]}
    output logic unsigned [7:0]    amp      // 0..255, mid-scale = 128
);

    logic unsigned [5:0] idx;
    logic unsigned [5:0] addr;
    logic unsigned [6:0] q_val;     // quarter-wave magnitude, 0..127
    logic                sign_bit;

    assign idx      = phase[5:0];
    assign sign_bit = phase[7];     // quadrant MSB: 1 = lower half of the sine

    // Quadrants 0 and 2 ramp up the table; quadrants 1 and 3 mirror it.
    assign addr     = phase[6] ? (6'd63 - idx) : idx;

    // 64-entry quarter sine: round-half-up of 127 * sin(pi/2 * (n + 0.5) / 64)
    always_comb begin
        case (addr)
            6'd0 : q_val = 7'd2  ;  6'd1 : q_val = 7'd5;
            6'd2 : q_val = 7'd8  ;  6'd3 : q_val = 7'd11;
            6'd4 : q_val = 7'd14 ;  6'd5 : q_val = 7'd17;
            6'd6 : q_val = 7'd20 ;  6'd7 : q_val = 7'd23;
            6'd8 : q_val = 7'd26 ;  6'd9 : q_val = 7'd29;
            6'd10: q_val = 7'd32 ;  6'd11: q_val = 7'd35;
            6'd12: q_val = 7'd38 ;  6'd13: q_val = 7'd41;
            6'd14: q_val = 7'd44 ;  6'd15: q_val = 7'd47;
            6'd16: q_val = 7'd50 ;  6'd17: q_val = 7'd53;
            6'd18: q_val = 7'd56 ;  6'd19: q_val = 7'd58;
            6'd20: q_val = 7'd61 ;  6'd21: q_val = 7'd64;
            6'd22: q_val = 7'd67 ;  6'd23: q_val = 7'd69;
            6'd24: q_val = 7'd72 ;  6'd25: q_val = 7'd74;
            6'd26: q_val = 7'd77 ;  6'd27: q_val = 7'd79;
            6'd28: q_val = 7'd82 ;  6'd29: q_val = 7'd84;
            6'd30: q_val = 7'd86 ;  6'd31: q_val = 7'd89;
            6'd32: q_val = 7'd91 ;  6'd33: q_val = 7'd93;
            6'd34: q_val = 7'd95 ;  6'd35: q_val = 7'd97;
            6'd36: q_val = 7'd99 ;  6'd37: q_val = 7'd101;
            6'd38: q_val = 7'd103;  6'd39: q_val = 7'd105;
            6'd40: q_val = 7'd106;  6'd41: q_val = 7'd108;
            6'd42: q_val = 7'd110;  6'd43: q_val = 7'd111;
            6'd44: q_val = 7'd113;  6'd45: q_val = 7'd114;
            6'd46: q_val = 7'd115;  6'd47: q_val = 7'd117;
            6'd48: q_val = 7'd118;  6'd49: q_val = 7'd119;
            6'd50: q_val = 7'd120;  6'd51: q_val = 7'd121;
            6'd52: q_val = 7'd122;  6'd53: q_val = 7'd123;
            6'd54: q_val = 7'd124;  6'd55: q_val = 7'd124;
            6'd56: q_val = 7'd125;  6'd57: q_val = 7'd125;
            6'd58: q_val = 7'd126;  6'd59: q_val = 7'd126;
            6'd60: q_val = 7'd127;  6'd61: q_val = 7'd127;
            6'd62: q_val = 7'd127;  6'd63: q_val = 7'd127;
            default: q_val = 7'd0;
        endcase
    end

    // Offset-binary: upper half above mid-scale, lower half below.
    always_comb begin
        if (sign_bit) amp = 8'd128 - {1'b0, q_val};
        else          amp = 8'd128 + {1'b0, q_val};
    end

endmodule

`default_nettype wire
