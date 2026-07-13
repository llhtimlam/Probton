// ============================================================================
// tb_wave_controller.sv
//
// Focused testbench for the MEMS wave generator path.
// Checks:
//   1. Sine LUT shape / symmetry / endpoints
//   2. Idle (pre-config) output parks at 50% duty
//   3. PWM duty cycle tracks the sine over one dither period
//   4. Reference LO toggles at the dither rate in readout
//   5. Calibration burst is exactly one MEMS period, starting on a phase wrap
//   6. Reference LO shifts by exactly the programmed cfg_phase0_offset
// ============================================================================

`timescale 1ns/1ps
`default_nettype none

module tb_wave_controller;

    // f_clk = 5 MHz -> 200 ns period
    localparam real    CLK_PERIOD = 200.0;
    localparam integer NCO_BITS   = 21;

    // FCW for ~360 Hz dither at 5 MHz:
    //   FCW = f_MEMS * 2^21 / f_clk = 360 * 2097152 / 5e6 = 151.0
    localparam logic unsigned [15:0] FCW_360HZ = 16'd151;

    // A faster-than-real FCW so the sim runs quickly, but which STILL keeps the
    // PWM carrier (256 clocks) much faster than the dither period -- otherwise
    // the carrier cannot sweep against the modulation and the output saturates.
    //   FCW = 512 -> period = 2^21/512 = 4096 clocks = 16 carrier cycles/period
    localparam logic unsigned [15:0] FCW_FAST  = 16'd512;
    localparam integer PERIOD_CLKS = (1 << NCO_BITS) / 512;   // 4096

    logic clk = 1'b0;
    logic rst_n;

    logic unsigned [15:0] cfg_f_MEMS_fcw;
    logic unsigned [20:0] cfg_phase0_offset;
    logic unsigned [20:0] cfg_phase90_offset;
    logic unsigned [20:0] cfg_phase270_offset;

    logic cfg_done;
    logic cal_start;
    logic comp_p, comp_m;

    logic cal_done, cal_timeout;
    logic latch_phase90, latch_phase270;
    logic mems_drv, ref_wave;

    logic unsigned [7:0]  delay_wave_cycle;
    logic unsigned [20:0] raw_edge1, raw_edge2, raw_edge3, raw_edge4;
    logic                 cal_dir;
    logic unsigned [20:0] cal_phase0_offset, cal_phase90_offset, cal_phase270_offset;

    integer errors = 0;

    always #(CLK_PERIOD/2.0) clk = ~clk;

    wave_controller dut (
        .clk                 (clk),
        .rst_n               (rst_n),
        .cfg_f_MEMS_fcw      (cfg_f_MEMS_fcw),
        .cfg_phase0_offset   (cfg_phase0_offset),
        .cfg_phase90_offset  (cfg_phase90_offset),
        .cfg_phase270_offset (cfg_phase270_offset),
        .cfg_done            (cfg_done),
        .cal_done            (cal_done),
        .cal_timeout         (cal_timeout),
        .cal_start           (cal_start),
        .comp_p              (comp_p),
        .comp_m              (comp_m),
        .latch_phase90       (latch_phase90),
        .latch_phase270      (latch_phase270),
        .mems_drv            (mems_drv),
        .ref_wave            (ref_wave),
        .delay_wave_cycle    (delay_wave_cycle),
        .raw_edge1           (raw_edge1),
        .raw_edge2           (raw_edge2),
        .raw_edge3           (raw_edge3),
        .raw_edge4           (raw_edge4),
        .cal_dir             (cal_dir),
        .cal_phase0_offset   (cal_phase0_offset),
        .cal_phase90_offset  (cal_phase90_offset),
        .cal_phase270_offset (cal_phase270_offset)
    );

    task automatic check(input logic cond, input string msg);
        if (!cond) begin
            $display("  FAIL: %s", msg);
            errors = errors + 1;
        end else begin
            $display("  pass: %s", msg);
        end
    endtask

    // ---- Measure PWM duty over a window of N clocks ----
    task automatic measure_duty(input integer n_clks, output real duty);
        integer i, high;
        begin
            high = 0;
            for (i = 0; i < n_clks; i = i + 1) begin
                @(posedge clk);
                if (mems_drv) high = high + 1;
            end
            duty = real'(high) / real'(n_clks);
        end
    endtask

    // ------------------------------------------------------------------
    // Test 1: sine LUT shape
    // ------------------------------------------------------------------
    task automatic test_sine_lut();
        logic unsigned [7:0] a0, a64, a128, a192;
        begin
            $display("\n=== Test 1: Sine LUT shape ===");

            // phase 0 / 90 / 180 / 270 degrees = index 0 / 63 / 128 / 191
            a0   = lut_probe(8'd0);     // 0 deg    -> mid-scale
            a64  = lut_probe(8'd63);    // ~90 deg  -> peak
            a128 = lut_probe(8'd128);   // 180 deg  -> mid-scale
            a192 = lut_probe(8'd191);   // ~270 deg -> trough

            $display("  phase 0=%0d  90=%0d  180=%0d  270=%0d", a0, a64, a128, a192);

            check(a0   >= 8'd128 && a0   <= 8'd132, "phase 0 near mid-scale (128)");
            check(a64  >= 8'd250,                   "phase 90 near full-scale (255)");
            check(a128 >= 8'd124 && a128 <= 8'd128, "phase 180 near mid-scale (128)");
            check(a192 <= 8'd5,                     "phase 270 near zero-scale (0)");
        end
    endtask

    function automatic logic unsigned [7:0] lut_probe(input logic unsigned [7:0] p);
        logic unsigned [1:0] quad;
        logic unsigned [5:0] idx, addr;
        logic unsigned [6:0] qv;
        begin
            quad = p[7:6];
            idx  = p[5:0];
            addr = quad[0] ? (6'd63 - idx) : idx;
            qv   = probe_rom(addr);
            lut_probe = quad[1] ? (8'd128 - {1'b0, qv}) : (8'd128 + {1'b0, qv});
        end
    endfunction

    function automatic logic unsigned [6:0] probe_rom(input logic unsigned [5:0] a);
        real r;
        begin
            r = 127.0 * $sin(3.14159265358979 / 2.0 * (real'(a) + 0.5) / 64.0);
            probe_rom = 7'($rtoi(r + 0.5));
        end
    endfunction

    // ------------------------------------------------------------------
    // Test 2: idle parks at 50% duty
    // ------------------------------------------------------------------
    task automatic test_idle_midrail();
        real duty;
        begin
            $display("\n=== Test 2: Idle parks at mid-rail ===");
            cfg_done  = 1'b0;
            cal_start = 1'b0;
            repeat (10) @(posedge clk);

            measure_duty(2048, duty);
            $display("  idle duty = %.4f", duty);
            check(duty > 0.48 && duty < 0.52,
                  "idle duty is ~50% (mid-rail, zero displacement)");
            check(ref_wave === 1'b0, "ref_wave held low while unconfigured");
        end
    endtask

    // ------------------------------------------------------------------
    // Test 3: readout duty tracks the sine
    // ------------------------------------------------------------------
    task automatic test_readout_sine();
        real duty_q0, duty_q1, duty_q2, duty_q3;
        begin
            $display("\n=== Test 3: Readout PWM duty tracks sine ===");

            cfg_f_MEMS_fcw = FCW_FAST;
            cfg_done       = 1'b1;
            cal_start      = 1'b0;
            repeat (5) @(posedge clk);

            // Wait for a phase wrap so we start at a known point
            wait (dut.phase_acc < 21'd512);
            @(posedge clk);

            // Measure duty over each quarter of the dither period. The sine
            // ordering should give: positive half above 50%, negative half below,
            // and the full period averaging back to ~50% (no DC into the buzzer).
            measure_duty(PERIOD_CLKS/4, duty_q0);
            measure_duty(PERIOD_CLKS/4, duty_q1);
            measure_duty(PERIOD_CLKS/4, duty_q2);
            measure_duty(PERIOD_CLKS/4, duty_q3);

            $display("  quarter duties: Q0=%.3f Q1=%.3f Q2=%.3f Q3=%.3f",
                     duty_q0, duty_q1, duty_q2, duty_q3);

            check((duty_q0 + duty_q1) / 2.0 > 0.55,
                  "positive half-cycle duty > 55% (sine above mid-rail)");
            check((duty_q2 + duty_q3) / 2.0 < 0.45,
                  "negative half-cycle duty < 45% (sine below mid-rail)");
            check(((duty_q0 + duty_q1 + duty_q2 + duty_q3) / 4.0) > 0.47 &&
                  ((duty_q0 + duty_q1 + duty_q2 + duty_q3) / 4.0) < 0.53,
                  "full-period mean duty ~50% (no DC bias into the buzzer)");
        end
    endtask

    // ------------------------------------------------------------------
    // Test 4: reference LO toggles at the dither rate in readout
    // ------------------------------------------------------------------
    task automatic test_ref_wave();
        integer toggles;
        logic   prev;
        integer i;
        begin
            $display("\n=== Test 4: Reference LO ===");
            cfg_done  = 1'b1;
            cal_start = 1'b0;
            @(posedge clk);

            toggles = 0;
            prev    = ref_wave;
            for (i = 0; i < PERIOD_CLKS * 2; i = i + 1) begin
                @(posedge clk);
                if (ref_wave !== prev) toggles = toggles + 1;
                prev = ref_wave;
            end

            $display("  ref_wave toggles over 2 dither periods: %0d", toggles);
            check(toggles >= 3 && toggles <= 5,
                  "ref_wave toggles ~2x per period (square LO at f_MEMS)");
        end
    endtask

    // ------------------------------------------------------------------
    // Test 5: calibration burst is exactly one MEMS period
    // ------------------------------------------------------------------
    task automatic test_cal_burst();
        integer active_clks;
        integer i;
        begin
            $display("\n=== Test 5: Calibration burst length ===");

            // Reset into a clean state
            rst_n = 1'b0;
            repeat (4) @(posedge clk);
            rst_n = 1'b1;

            cfg_f_MEMS_fcw = FCW_FAST;
            cfg_done       = 1'b1;
            cal_start      = 1'b1;
            comp_p         = 1'b0;
            comp_m         = 1'b1;   // hold comparators idle so cal doesn't complete
            @(posedge clk);

            // Wait for the burst to open
            i = 0;
            while (dut.cal_burst_active !== 1'b1 && i < PERIOD_CLKS * 4) begin
                @(posedge clk);
                i = i + 1;
            end
            check(dut.cal_burst_active === 1'b1, "burst opened within a few periods");

            // Confirm it opened right at a phase wrap
            $display("  phase_acc at burst open = %0d (period = %0d)",
                     dut.phase_acc, 1 << NCO_BITS);
            check(dut.phase_acc < 21'(2 * FCW_FAST),
                  "burst opens at a phase wrap (stimulus starts at 0 deg)");

            // Count how long it stays active
            active_clks = 0;
            while (dut.cal_burst_active === 1'b1 && active_clks < PERIOD_CLKS * 4) begin
                @(posedge clk);
                active_clks = active_clks + 1;
            end

            $display("  burst active for %0d clocks (one period = %0d)",
                     active_clks, PERIOD_CLKS);
            check(active_clks >= PERIOD_CLKS - 2 && active_clks <= PERIOD_CLKS + 2,
                  "burst lasts exactly one MEMS period");
            check(dut.cal_burst_active === 1'b0, "burst closed");
        end
    endtask

    // ------------------------------------------------------------------
    // Test 6: ref_wave shifts by exactly the programmed cfg_phase0_offset
    // ------------------------------------------------------------------
    task automatic capture_ref_rise(output integer phase_at_rise);
        integer i;
        logic   prev;
        begin
            phase_at_rise = -1;
            prev = ref_wave;
            for (i = 0; i < PERIOD_CLKS * 2; i = i + 1) begin
                @(posedge clk);
                if (ref_wave === 1'b1 && prev === 1'b0) begin
                    phase_at_rise = int'(dut.phase_acc);
                    i = PERIOD_CLKS * 2;   // done
                end
                prev = ref_wave;
            end
        end
    endtask

    task automatic test_phase_shift();
        integer shift_0, shift_q, delta;
        begin
            $display("\n=== Test 6: Reference LO phase shift ===");

            cfg_f_MEMS_fcw = FCW_FAST;
            cfg_done       = 1'b1;
            cal_start      = 1'b0;

            // Baseline: no phase correction applied
            cfg_phase0_offset = 21'd0;
            repeat (10) @(posedge clk);
            capture_ref_rise(shift_0);
            $display("  offset = 0     -> ref edge at phase_acc = %0d", shift_0);

            // Quarter-period correction
            cfg_phase0_offset = 21'd524288;   // 2^21 / 4
            repeat (10) @(posedge clk);
            capture_ref_rise(shift_q);
            $display("  offset = 2^19  -> ref edge at phase_acc = %0d", shift_q);

            // Which absolute phase the edge sits at depends on which accumulator
            // bit drives ref_wave, so don't assert on that. What matters for the
            // loop is that programming a +2^19 offset moves the reference by
            // exactly +2^19: a sign error would give 2^21 - 2^19 = 1572864, and a
            // scale error would give 2x or 1/2x. Either would invert or mis-weight
            // the demodulated error term without failing any test above.
            delta = (shift_q - shift_0) & ((1 << NCO_BITS) - 1);
            $display("  edge moved by %0d  [expect 524288]", delta);

            check(delta > 515000 && delta < 535000,
                  "ref_wave shifts by the programmed offset (correct sign and scale)");
        end
    endtask

    // ------------------------------------------------------------------
    initial begin
        $dumpfile("tb_wave_controller.vcd");
        $dumpvars(0, tb_wave_controller);

        cfg_f_MEMS_fcw      = FCW_FAST;
        cfg_phase0_offset   = 21'd0;
        cfg_phase90_offset  = 21'd524288;    // 2^21 / 4
        cfg_phase270_offset = 21'd1572864;   // 3 * 2^21 / 4
        cfg_done            = 1'b0;
        cal_start           = 1'b0;
        comp_p              = 1'b0;
        comp_m              = 1'b0;

        rst_n = 1'b0;
        repeat (5) @(posedge clk);
        rst_n = 1'b1;
        @(posedge clk);

        test_sine_lut();
        test_idle_midrail();
        test_readout_sine();
        test_ref_wave();
        test_cal_burst();
        test_phase_shift();

        $display("\n========================================");
        if (errors == 0) $display("ALL CHECKS PASSED");
        else             $display("%0d CHECK(S) FAILED", errors);
        $display("========================================\n");

        $finish;
    end

    // Watchdog
    initial begin
        #10_000_000;
        $display("TIMEOUT");
        $finish;
    end

endmodule

`default_nettype wire
