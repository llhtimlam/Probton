// ============================================================================
// wave_controller.sv
//
// NCO-based dither wave controller for the optical alignment ASIC.
//
//   - 21-bit phase accumulator (NCO) clocked at f_clk = 5 MHz
//   - Calibration mode: emits a burst of dither drive and captures comparator
//     edges to measure the mechanical phase lag of the buzzer-scanner
//   - Readout mode:     emits continuous sine-PWM drive to the MEMS actuator
//                       and a phase-corrected reference LO to the wave mixer
//
// MEMS drive is a single-ended 8-bit sine PWM (1 pin per axis) intended to
// feed an external op-amp / RC reconstruction filter, then the piezo buzzer.
// ============================================================================

`default_nettype none

module wave_controller (
    input  wire clk,
    input  wire rst_n,

    // Config Setting
    // 16-bit: Frequency Control Word (Max MEMS Frequency: 156.24716KHz)
    input logic unsigned [15:0]     cfg_f_MEMS_fcw, // (f_MEMS * 2^k) / f_clk, k = 21, f_clk = 5MHz

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
    input  logic                    comp,         // Comparator raw async wire

    // Latch Strobe
    output logic                    latch_phase90,
    output logic                    latch_phase270,

    // Latch Handshake
    input  logic                    latch_phase90_ack,
    input  logic                    latch_phase270_ack,

    // MEMS Drive / Mixer Reference
    output logic                    mems_drv,       // sine PWM -> ext. op-amp/LPF -> buzzer
    output logic                    ref_wave,       // reference LO -> wave mixer

    // SPI Report
    output logic unsigned [7:0]     delay_wave_cycle,
    output logic unsigned [20:0]    raw_edge1, raw_edge2, raw_edge3,
    output logic                    cal_dir,
    output logic unsigned [20:0]    cal_phase0_offset, cal_phase90_offset, cal_phase270_offset,

    output logic                    latch_error
);

    // ------------------------------------------------------------------------
    // NCO Phase Accumulator
    // ------------------------------------------------------------------------

    logic unsigned [20:0] phase_acc;

    // Concatenate to fit 16-bit FCW in 21-bit Phase Accumulator
    logic unsigned [20:0] delta_N;
    assign delta_N = {5'h00, cfg_f_MEMS_fcw};

    // Single enable term so the accumulator and every cycle counter that
    // tracks it advance on exactly the same condition.
    logic nco_en;
    assign nco_en = (cfg_done || cal_start);

    // Overflow (= one full MEMS period elapsed) computed in 22-bit space so the
    // carry is visible rather than lost to 21-bit wraparound.
    logic unsigned [21:0] phase_next;
    logic                 phase_overflow;

    assign phase_next     = {1'b0, phase_acc} + {1'b0, delta_N};
    assign phase_overflow = nco_en && phase_next[21];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            phase_acc <= 21'b0;
        end else if (nco_en) begin
            phase_acc <= phase_next[20:0];
        end
    end

    // Comparator Sampling
    // Metastability Synchronization (4-tick) and Edge Detection
    logic comp_sync0, comp_sync1, comp_sync2, comp_sync3, comp_sync4;
    logic comp_posedge, comp_negedge;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            comp_sync0 <= 1'b0;
            comp_sync1 <= 1'b0;
            comp_sync2 <= 1'b0;
            comp_sync3 <= 1'b0;
            comp_sync4 <= 1'b0;
        end else begin
            comp_sync0 <= comp;
            comp_sync1 <= comp_sync0;
            comp_sync2 <= comp_sync1;
            comp_sync3 <= comp_sync2;
            comp_sync4 <= comp_sync3;
        end
    end

    assign comp_posedge = (comp_sync3 && !comp_sync4);
    assign comp_negedge = (!comp_sync3 && comp_sync4);

    // ------------------------------------------------------------------------
    // Calibration Run
    // ------------------------------------------------------------------------

    logic unsigned [7:0] wave_cycle_cnt;

    logic capture_pending;
    logic unsigned [1:0] capture_step;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wave_cycle_cnt   <= 8'b0;
            cal_dir          <= 1'b0;
            delay_wave_cycle <= 8'b0;
            capture_pending  <= 1'b1;
            capture_step     <= 2'd0;
            cal_timeout      <= 1'b0;
            cal_done         <= 1'b0;
            raw_edge1        <= 21'b0;
            raw_edge2        <= 21'b0;
            raw_edge3        <= 21'b0;

        // Calibration State
        end else if (cfg_done && cal_start) begin
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
                if (comp_posedge && capture_pending) begin
                    raw_edge1 <= phase_acc;
                    cal_dir <= 1'b1;
                    delay_wave_cycle <= wave_cycle_cnt;
                    capture_pending  <= 1'b0;
                    capture_step     <= 2'd0;
                end

                // Out-of-phase 1st edge detection
                if (comp_negedge && capture_pending) begin
                    raw_edge1 <= phase_acc;
                    cal_dir <= 1'b0;
                    delay_wave_cycle <= wave_cycle_cnt;
                    capture_pending  <= 1'b0;
                    capture_step     <= 2'd0;
                end

                // Capture consecutive edge detection
                if (!capture_pending) begin
                    // Condition: within 1 MEMS cycle from 1st edge detection
                    if (wave_cycle_cnt < (delay_wave_cycle + 8'd2)) begin

                        // In-phase
                        if (cal_dir) begin
                            case (capture_step)
                                2'd0: if (comp_negedge) begin
                                        raw_edge2 <= phase_acc;
                                        capture_step <= 2'd1;
                                    end

                                2'd1: if (comp_posedge) begin
                                        raw_edge3 <= phase_acc;
                                        capture_step <= 2'd2; // Exit the Calibration Loop
                                        cal_done <= 1'b1;
                                    end
                                default: begin
                                    capture_step <= capture_step;   // Do Nothing
                                end
                            endcase

                        // Out-of-phase
                        end else begin
                            case (capture_step)
                                2'd0: if (comp_posedge) begin
                                        raw_edge2 <= phase_acc;
                                        capture_step <= 2'd1;
                                    end
                                
                                2'd1: if (comp_negedge) begin
                                        raw_edge3 <= phase_acc;
                                        capture_step <= 2'd2; // Exit the Calibration Loop
                                        cal_done <= 1'b1;
                                    end
                                default: begin
                                    capture_step <= capture_step;   // Do Nothing
                                end
                            endcase
                        end

                    // False Signal Reset (edges did not arrive within the window)
                    end else begin
                        capture_step    <= 2'd0;   // Invalid
                        capture_pending <= 1'b1;   // Retry
                    end
                end

            end // Freeze after timeout and calibration complete
        end // Freeze if NOT Condition: cal_start:1, cfg_done:1
    end

    // ------------------------------------------------------------------------
    // Phase Offset Computation
    // ------------------------------------------------------------------------
    logic unsigned [20:0] raw_phase90_offset, raw_phase270_offset;

    // Midpoint Determination for most stable latch (Handle Circular Wrapping)
    assign raw_phase90_offset = raw_edge1 + ((raw_edge2 - raw_edge1) >> 1);
    assign raw_phase270_offset = raw_edge2 + ((raw_edge3 - raw_edge2) >> 1);

    // Latency Correction (4-cycle synchronization pipeline delay)
    logic unsigned [20:0] sync_delay;
    assign sync_delay = (delta_N << 2);   // 4 * delta_N

    // Latch point (stable midpoint)
    assign cal_phase90_offset  = raw_phase90_offset  - sync_delay;
    assign cal_phase270_offset = raw_phase270_offset - sync_delay;

    // Wave mixer reference wave delay
    assign cal_phase0_offset = raw_edge3 - sync_delay;

    // ------------------------------------------------------------------------
    // Main Readout Loop - Comparator Latch Strobes
    // ------------------------------------------------------------------------

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            latch_phase90  <= 1'b0;
            latch_phase270 <= 1'b0;

        // Readout State
        end else if (cfg_done && !cal_start) begin  // Condition: cal_start:0, cfg_done:1
            // Latch pulse
            if ((cfg_phase90_offset - phase_acc) < delta_N) begin
                latch_phase90 <= 1'b1;
            end else if (latch_phase90_ack) begin
                latch_phase90 <= 1'b0;  // Handshake to signal processor module
            end

            if ((cfg_phase270_offset - phase_acc) < delta_N) begin
                latch_phase270 <= 1'b1;
            end else if (latch_phase270_ack) begin
                latch_phase270 <= 1'b0; // Handshake to signal processor module
            end
            // Latch fallout
            if (latch_phase90 && latch_phase270) begin
                latch_error    <= 1'b1;
                latch_phase90  <= 1'b0;
                latch_phase270 <= 1'b0;
            end

        end else begin
            latch_phase90  <= 1'b0;
            latch_phase270 <= 1'b0;
        end
    end

    // ========================================================================
    // MEMS Wave Generator
    //
    // Single-ended 8-bit sine PWM, 1 pin per axis.
    //
    //   f_pwm = f_clk / 256 = 19.53 kHz
    //
    // That carrier sits ~54x above the dither tone (~360 Hz) and well clear of
    // the buzzer-scanner's Z resonance (4.12 kHz), so an RC at the external
    // op-amp reconstructs the sine without touching the dither band.
    // ========================================================================

    // --- Sine amplitude from NCO phase ---
    logic unsigned [7:0] sine_amp;

    sine_lut u_sine (
        .phase (phase_acc[20:13]),   // top 8 bits: quadrant[1:0] + index[5:0]
        .amp   (sine_amp)
    );

    // --- PWM carrier ---
    // Free-running, deliberately NOT locked to phase_acc: the carrier must be
    // asynchronous to the modulation.
    logic unsigned [7:0] pwm_cnt;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) pwm_cnt <= 8'b0;
        else        pwm_cnt <= pwm_cnt + 1'b1;
    end

    // 50% duty -> mid-rail out of the reconstruction filter -> zero displacement
    localparam logic unsigned [7:0] PWM_MID = 8'd128;

    // --- Mixer reference phase, compensated for measured mechanical lag ---
    logic unsigned [20:0] ref_phase;
    assign ref_phase = phase_acc - cfg_phase0_offset;

    // --- Calibration burst control ---
    // Drive exactly one MEMS period, started on a phase wrap so the stimulus
    // always begins at 0 degrees and raw_edge1..4 are referenced to a known
    // phase origin.
    logic cal_burst_armed;
    logic cal_burst_active;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mems_drv         <= 1'b0;
            ref_wave         <= 1'b0;
            cal_burst_armed  <= 1'b1;
            cal_burst_active <= 1'b0;

        end else if (cfg_done) begin

            // ---------------- Calibration Run ----------------
            if (cal_start) begin
                if (phase_overflow) begin
                    if (cal_burst_armed) begin
                        cal_burst_armed  <= 1'b0;
                        cal_burst_active <= 1'b1;   // burst opens at phase 0
                    end else if (cal_burst_active) begin
                        cal_burst_active <= 1'b0;   // one full period, then stop
                    end
                end

                // Park at mid-rail between bursts. Driving 0% duty instead would
                // slam the buzzer to one rail -- a mechanical step that rings for
                // roughly Q cycles and corrupts the very delay being measured.
                mems_drv <= cal_burst_active ? (pwm_cnt < sine_amp)
                                             : (pwm_cnt < PWM_MID);

                ref_wave <= 1'b0;   // mixer reference unused during calibration

            // ---------------- Main Run ----------------
            end else begin
                mems_drv         <= (pwm_cnt < sine_amp);   // continuous sine PWM
                ref_wave         <= ref_phase[20];          // square LO, phase-corrected
                cal_burst_armed  <= 1'b1;                   // re-arm for next calibration
                cal_burst_active <= 1'b0;
            end

        end else begin
            // Not configured: hold mid-rail so the actuator rests at zero
            // displacement rather than being pinned to a rail.
            mems_drv         <= (pwm_cnt < PWM_MID);
            ref_wave         <= 1'b0;
            cal_burst_armed  <= 1'b1;
            cal_burst_active <= 1'b0;
        end
    end

endmodule

`default_nettype wire
