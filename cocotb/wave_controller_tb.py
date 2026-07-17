# SPDX-FileCopyrightText: © 2025 Project Template Contributors
# SPDX-License-Identifier: Apache-2.0

import math
import os
import random
import logging
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, Edge, RisingEdge, FallingEdge, ClockCycles
from cocotb_tools.runner import get_runner

sim = os.getenv("SIM", "icarus")
pdk_root = os.getenv("PDK_ROOT", Path("~/.ciel").expanduser())
pdk = os.getenv("PDK", "gf180mcuD")
scl = os.getenv("SCL", "gf180mcu_fd_sc_mcu7t5v0")
gl = os.getenv("GL", False)
slot = os.getenv("SLOT", "1x1")

hdl_toplevel = "wave_controller"

# ---------------------------------------------------------------------------
# Design constants
# ---------------------------------------------------------------------------

NCO_BITS = 21
NCO_MOD = 1 << NCO_BITS  # 2097152
PWM_BITS = 8
PWM_MOD = 1 << PWM_BITS  # 256
PWM_MID = PWM_MOD // 2  # 128

# Real dither tone: FCW = f_MEMS * 2^21 / f_clk = 360 * 2097152 / 5e6 = 151
FCW_360HZ = 151

# Faster FCW so the sim finishes quickly. Must stay well below the PWM carrier
# (256 clocks) or the carrier cannot sweep against the modulation and the
# output saturates instead of tracking the sine.
#   FCW = 512 -> dither period = 2^21 / 512 = 4096 clocks = 16 carrier cycles
FCW_FAST = 512
PERIOD_CLKS = NCO_MOD // FCW_FAST  # 4096

QUARTER_OFFSET = NCO_MOD // 4  # 2^19 = 524288

# --- Calibration test constants (from the calibration testbench) ---
# Test Parameter
NCO_BITS = 21 # k from 2^k
NCO_MOD = 1 << NCO_BITS  # 2097152
FCW_360HZ = 151 # (f_MEMS * 2^k) / f_clk, k = 21, f_clk = 5MHz
CAL_DELAY_CYCLE = 1.6 # 1.6 MEMS wave behind

ACC_RANGE = 2 ** NCO_BITS # Span of phase_acc: 2^k = 2,097,152, where k = 21
TICKS_PER_CYCLE = ACC_RANGE / FCW_360HZ # Tick for 1 MEMS Wave: 13,888.423

CAL_DELAY = round(CAL_DELAY_CYCLE * TICKS_PER_CYCLE) # Delay Cycle (1.6 MEMS Wave) * 2^(21) / FCW

# Conversion Scaling Constants = (2^(21) / FCW) / 360
DEG_TO_CLK_SCALE = TICKS_PER_CYCLE / 360.0   # 38.578955

PHASE_90_TICKS  = round(90 * DEG_TO_CLK_SCALE)   # 3472
PHASE_180_TICKS = round(180 * DEG_TO_CLK_SCALE)  # 6944
PHASE_270_TICKS = round(270 * DEG_TO_CLK_SCALE)  # 10416
PHASE_360_TICKS = round(360 * DEG_TO_CLK_SCALE)  # 13888



# ---------------------------------------------------------------------------
# Reference model
# ---------------------------------------------------------------------------

def golden_sine(phase8: int) -> int:
    """Independent model of the sine LUT.

    Quarter-wave symmetric, 8-bit offset-binary. Computed from math.sin rather
    than mirroring the RTL's ROM, so this is a genuine reference -- if the ROM
    table has a typo, this catches it.
    """
    quad = (phase8 >> 6) & 0x3
    idx = phase8 & 0x3F
    addr = (63 - idx) if (quad & 1) else idx
    # round-half-up: Python's round() is banker's rounding and disagrees
    # with the ROM at .5 boundaries
    q_val = math.floor(127 * math.sin(math.pi / 2 * (addr + 0.5) / 64) + 0.5)
    return (128 - q_val) if (quad & 2) else (128 + q_val)


def reconstruct(drive_bits, alpha=1.0 / 900.0, y0=0.5):
    """Single-pole RC low-pass, standing in for the external reconstruction
    filter that sits between the ASIC pin and the piezo buzzer."""
    y = y0
    out = []
    for b in drive_bits:
        y += alpha * (b - y)
        out.append(y)
    return out


def tone_amplitude(samples, period, harmonic=1):
    """Amplitude of a given harmonic, by quadrature correlation."""
    n = len(samples)
    mean = sum(samples) / n
    si = sum((v - mean) * math.sin(2 * math.pi * harmonic * i / period)
             for i, v in enumerate(samples))
    co = sum((v - mean) * math.cos(2 * math.pi * harmonic * i / period)
             for i, v in enumerate(samples))
    return 2 * math.hypot(si, co) / n


# ---------------------------------------------------------------------------
# Template helpers
# ---------------------------------------------------------------------------

async def set_defaults(dut):
    """Set all inputs in the module to default"""
    dut.cfg_f_MEMS_fcw.value = 0
    dut.cfg_phase0_offset.value = 0
    dut.cfg_phase90_offset.value = 0
    dut.cfg_phase270_offset.value = 0
    dut.cfg_done.value = 0
    dut.cal_start.value = 0
    dut.comp.value = 0
    dut.soft_rst_n.value = 1
    dut.cfg_phase90_offset.value = 0
    dut.cfg_phase270_offset.value = 0
    dut.latch_phase90_ack.value = 0
    dut.latch_phase270_ack.value = 0

async def enable_power(dut):
    dut.VDD.value = 1
    dut.VSS.value = 0

async def start_clock(clock, freq=5):
    """Start the clock @ freq MHz"""
    c = Clock(clock, 1 / freq * 1000, "ns")
    cocotb.start_soon(c.start())


async def reset(reset, active_low=True, time_ns=1000):
    """Reset dut"""

    reset.value = not active_low
    await Timer(time_ns, "ns")
    reset.value = active_low

    cocotb.log.info("Reset deasserted.")


async def start_up(dut):
    """Startup sequence"""
    await set_defaults(dut)
    dut.soft_rst_n.value = 1        # merged wave_controller has soft_rst_n
    if gl:
        await enable_power(dut)
    await start_clock(dut.clk)
    await reset(dut.rst_n)


# ---------------------------------------------------------------------------
# Local helpers
# ---------------------------------------------------------------------------

async def enter_readout(dut, fcw=FCW_FAST, phase0=0):
    """Configure the NCO and drop into the Readout state."""
    dut.cfg_f_MEMS_fcw.value = fcw
    dut.cfg_phase0_offset.value = phase0
    dut.cal_start.value = 0
    dut.cfg_done.value = 1
    await ClockCycles(dut.clk, 5)


async def sample_drive(dut, n_clks):
    """Sample mems_drv for n_clks, one value per rising edge."""
    bits = []
    for _ in range(n_clks):
        await RisingEdge(dut.clk)
        bits.append(int(dut.mems_drv.value))
    return bits


async def wait_phase_wrap(dut, timeout_clks=None):
    """Wait until the NCO wraps (RTL-only: needs internal phase_acc)."""
    limit = timeout_clks or (PERIOD_CLKS * 2)
    for _ in range(limit):
        await RisingEdge(dut.clk)
        if int(dut.phase_acc.value) < FCW_FAST:
            return True
    return False


async def capture_ref_edge(dut, rising=True, timeout_clks=None):
    """Return phase_acc at the next ref_wave edge (RTL-only)."""
    limit = timeout_clks or (PERIOD_CLKS * 2)
    prev = int(dut.ref_wave.value)
    for _ in range(limit):
        await RisingEdge(dut.clk)
        cur = int(dut.ref_wave.value)
        hit = (cur == 1 and prev == 0) if rising else (cur == 0 and prev == 1)
        if hit:
            return int(dut.phase_acc.value)
        prev = cur
    return None


# ===========================================================================
# Tests
# ===========================================================================

@cocotb.test()
async def test_sine_lut(dut):
    """Sine LUT matches an independent math.sin reference model"""

    logger = logging.getLogger("wave_controller")

    if gl:
        logger.warning("Skipping: needs internal sine_amp / phase_acc (RTL only)")
        return

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Checking the sine LUT against a golden model...")

    # Drive the NCO slowly enough that every LUT address is visited, then
    # compare sine_amp against the reference at each phase.
    await enter_readout(dut, fcw=FCW_FAST)

    mismatches = 0
    checked = 0
    for _ in range(PERIOD_CLKS + 64):
        await RisingEdge(dut.clk)
        phase = int(dut.phase_acc.value)
        expect = golden_sine((phase >> 13) & 0xFF)
        actual = int(dut.sine_amp.value)
        checked += 1
        if actual != expect:
            mismatches += 1
            if mismatches <= 5:
                logger.error(
                    "phase=%d addr=0x%02X expect=%d got=%d",
                    phase, (phase >> 13) & 0xFF, expect, actual)

    assert mismatches == 0, (
        f"sine LUT mismatched the reference model on {mismatches}/{checked} samples")

    logger.info("LUT matched the reference on all %d samples.", checked)

    # Endpoint sanity, in engineering terms
    assert golden_sine(0) == 130, "phase 0 should sit just above mid-scale"
    assert golden_sine(63) == 255, "phase 90 should reach full scale"
    assert golden_sine(191) == 1, "phase 270 should reach zero scale"

    logger.info("Done!")


@cocotb.test()
async def test_idle_parks_at_midrail(dut):
    """Unconfigured output parks at 50% duty, not at a rail"""

    logger = logging.getLogger("wave_controller")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Measuring idle duty...")

    # cfg_done stays low: the module is unconfigured
    dut.cfg_done.value = 0
    dut.cal_start.value = 0
    await ClockCycles(dut.clk, 10)

    bits = await sample_drive(dut, PWM_MOD * 8)
    duty = sum(bits) / len(bits)
    logger.info("idle duty = %.4f", duty)

    # 50% duty -> mid-rail out of the RC -> zero displacement.
    # 0% would slam the buzzer to a rail and ring for ~Q cycles.
    assert 0.48 < duty < 0.52, (
        f"idle duty {duty:.4f} is not mid-rail -- the buzzer would be driven "
        f"to a rail instead of resting at zero displacement")

    logger.info("Done!")


@cocotb.test()
async def test_drive_tracks_sine(dut):
    """PWM duty follows the sine, with no DC bias into the actuator"""

    logger = logging.getLogger("wave_controller")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await enter_readout(dut, fcw=FCW_FAST)

    if not gl:
        assert await wait_phase_wrap(dut), "NCO never wrapped -- is it running?"

    bits = await sample_drive(dut, PERIOD_CLKS)

    # Quarter-by-quarter duty: positive half above mid, negative half below
    q = PERIOD_CLKS // 4
    duties = [sum(bits[i * q:(i + 1) * q]) / q for i in range(4)]
    logger.info("quarter duties: Q0=%.3f Q1=%.3f Q2=%.3f Q3=%.3f", *duties)

    assert (duties[0] + duties[1]) / 2 > 0.55, (
        "positive half-cycle should sit above mid-rail")
    assert (duties[2] + duties[3]) / 2 < 0.45, (
        "negative half-cycle should sit below mid-rail")

    # Mean over a whole dither period must be 50%: any DC here is a static
    # displacement bias that shifts the dither centre off the alignment peak.
    mean = sum(bits) / len(bits)
    logger.info("full-period mean duty = %.5f", mean)
    assert 0.49 < mean < 0.51, (
        f"mean duty {mean:.5f} implies a DC bias into the piezo")

    logger.info("Done!")


@cocotb.test()
async def test_reconstructed_sine(dut):
    """After an RC, the delta-sigma drive reconstructs a clean sine at the tone"""

    logger = logging.getLogger("wave_controller")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Reconstructing the drive through a modelled RC...")

    await enter_readout(dut, fcw=FCW_FAST)
    bits = await sample_drive(dut, PERIOD_CLKS * 3)

    # Model what the external op-amp + RC does, then discard the settling
    # transient and analyse exactly one dither period.
    rec = reconstruct(bits)
    seg = rec[PERIOD_CLKS:PERIOD_CLKS * 2]

    fund = tone_amplitude(seg, PERIOD_CLKS, harmonic=1)
    h3 = tone_amplitude(seg, PERIOD_CLKS, harmonic=3)
    thd3_db = 20 * math.log10(h3 / fund) if h3 > 0 else -math.inf

    logger.info("fundamental = %.4f", fund)
    logger.info("3rd harmonic = %.6f  (%.1f dB below fundamental)", h3, thd3_db)

    assert fund > 0.2, (
        f"fundamental amplitude {fund:.4f} is too small -- the drive is not "
        f"swinging over a useful fraction of the rail")
    assert thd3_db < -30, (
        f"3rd harmonic only {thd3_db:.1f} dB down -- the reconstructed drive "
        f"is not a clean tone, and its harmonics will fold to DC in the mixer")

    logger.info("Done!")


@cocotb.test()
async def test_high_frequency_headroom(dut):
    """Delta-sigma still reconstructs a tone where 8-bit PWM cannot

    At a high FCW the MEMS period is fewer than 256 clocks. Fixed 8-bit PWM
    needs 256 clocks per carrier period, so its carrier would fall BELOW the
    signal and the tone could not be represented at all. This is exactly the
    ceiling the delta-sigma modulator removes. The test asserts a recognisable
    fundamental survives reconstruction in that regime.
    """

    logger = logging.getLogger("wave_controller")

    logger.info("Startup sequence...")
    await start_up(dut)

    # FCW giving ~64 clocks/period -- a quarter of the 256 PWM would require.
    FCW_HI = 32768
    HI_PERIOD = (1 << NCO_BITS) // FCW_HI            # 64 clocks
    logger.info("High-frequency test: %d clocks/period (PWM needs 256)", HI_PERIOD)
    assert HI_PERIOD < 256, "test premise: period must be below the PWM floor"

    await enter_readout(dut, fcw=FCW_HI)

    # Capture many periods so the tone is well-resolved despite the coarse
    # per-period sampling.
    n_periods = 200
    bits = await sample_drive(dut, HI_PERIOD * n_periods)

    # Reconstruct with a filter matched to this (much higher) tone.
    # Filter cutoff scaled to this (higher) tone -- a lower cutoff would
    # attenuate the fundamental itself, not just the shaped noise.
    rec = reconstruct(bits, alpha=1.0 / HI_PERIOD)
    seg = rec[HI_PERIOD * 8:]                        # drop settling

    fund = tone_amplitude(seg, HI_PERIOD, harmonic=1)
    logger.info("high-freq fundamental = %.4f", fund)

    # The bar is deliberately modest: at this frequency the tone is coarse, but
    # PWM would produce NOTHING here, so any real fundamental proves the point.
    assert fund > 0.03, (
        f"no usable tone at {HI_PERIOD} clocks/period (fund={fund:.4f}) -- the "
        f"delta-sigma driver failed in the regime it was added to cover. "
        f"(8-bit PWM would produce fund=0 here: its carrier falls below the tone.)")

    # And the drive must still be centred (no DC walk into the piezo).
    mean = sum(bits) / len(bits)
    logger.info("high-freq mean density = %.4f", mean)
    assert 0.47 < mean < 0.53, (
        f"drive mean {mean:.4f} at high frequency implies a DC bias")

    logger.info("Done!")


@cocotb.test()
async def test_reference_lo_rate(dut):
    """Reference LO is a square wave at the dither frequency"""

    logger = logging.getLogger("wave_controller")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Counting reference LO toggles...")

    await enter_readout(dut, fcw=FCW_FAST)

    toggles = 0
    prev = int(dut.ref_wave.value)
    for _ in range(PERIOD_CLKS * 2):
        await RisingEdge(dut.clk)
        cur = int(dut.ref_wave.value)
        if cur != prev:
            toggles += 1
        prev = cur

    logger.info("ref_wave toggled %d times over 2 dither periods", toggles)

    # A square at f_MEMS toggles twice per period: 4 over two periods,
    # +/-1 depending on where sampling starts and stops.
    assert 3 <= toggles <= 5, (
        f"ref_wave toggled {toggles} times over 2 dither periods -- expected "
        f"~4 for a square LO at f_MEMS")

    logger.info("Done!")


@cocotb.test()
async def test_calibration_burst(dut):
    """Calibration burst opens on a phase wrap and lasts exactly one period"""

    logger = logging.getLogger("wave_controller")

    if gl:
        logger.warning("Skipping: needs internal cal_burst_active (RTL only)")
        return

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the calibration burst...")

    dut.cfg_f_MEMS_fcw.value = FCW_FAST
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    # Hold the comparators idle so calibration does not complete and freeze
    # the burst logic mid-test.
    dut.comp.value = 0
    await RisingEdge(dut.clk)

    # Wait for the burst to open
    opened = False
    for _ in range(PERIOD_CLKS * 4):
        await RisingEdge(dut.clk)
        if int(dut.cal_burst_active.value) == 1:
            opened = True
            break
    assert opened, "calibration burst never opened"

    phase_at_open = int(dut.phase_acc.value)
    logger.info("burst opened at phase_acc = %d (period = %d)",
                phase_at_open, NCO_MOD)

    # The burst must start at a phase wrap, so the stimulus always begins at
    # 0 degrees and raw_edge1..3 are referenced to a known phase origin.
    assert phase_at_open < 2 * FCW_FAST, (
        f"burst opened at phase {phase_at_open}, not at a wrap -- the "
        f"calibration stimulus would start at an arbitrary phase")

    # Count how long it stays active
    active = 0
    while active < PERIOD_CLKS * 4:
        await RisingEdge(dut.clk)
        if int(dut.cal_burst_active.value) == 0:
            break
        active += 1

    # Tim's edge capture needs rise-fall-rise, so the burst spans TWO MEMS
    # periods (CAL_BURST_PERIODS = 2), not one.
    CAL_BURST_PERIODS = 2
    expected = PERIOD_CLKS * CAL_BURST_PERIODS
    logger.info("burst active for %d clocks (%d periods, one period = %d)",
                active, CAL_BURST_PERIODS, PERIOD_CLKS)

    assert abs(active - expected) <= 2, (
        f"burst lasted {active} clocks, expected ~{expected} "
        f"({CAL_BURST_PERIODS} periods)")
    assert int(dut.cal_burst_active.value) == 0, "burst never closed"

    logger.info("Done!")


@cocotb.test()
async def test_phase_offset_shift(dut):
    """cfg_phase0_offset shifts the reference LO by exactly that much"""

    logger = logging.getLogger("wave_controller")

    if gl:
        logger.warning("Skipping: needs internal phase_acc (RTL only)")
        return

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Measuring the reference LO phase shift...")

    # Baseline: no correction applied
    await enter_readout(dut, fcw=FCW_FAST, phase0=0)
    await ClockCycles(dut.clk, 10)
    edge_0 = await capture_ref_edge(dut, rising=True)
    assert edge_0 is not None, "no ref_wave edge with offset = 0"
    logger.info("offset = 0        -> ref edge at phase_acc = %d", edge_0)

    # Quarter-period correction
    dut.cfg_phase0_offset.value = QUARTER_OFFSET
    await ClockCycles(dut.clk, 10)
    edge_q = await capture_ref_edge(dut, rising=True)
    assert edge_q is not None, "no ref_wave edge with offset = 2^19"
    logger.info("offset = %d   -> ref edge at phase_acc = %d",
                QUARTER_OFFSET, edge_q)

    # Which absolute phase the edge lands on depends on which accumulator bit
    # drives ref_wave, so do not assert on that. What matters for the control
    # loop is that a +2^19 offset moves the reference by exactly +2^19.
    #
    # A SIGN error would give NCO_MOD - 2^19 = 1572864, which would invert the
    # demodulated error term: the loop would drive AWAY from the alignment peak
    # instead of toward it. That fault passes every other test in this file.
    delta = (edge_q - edge_0) % NCO_MOD
    logger.info("edge moved by %d  [expect %d]", delta, QUARTER_OFFSET)

    tol = QUARTER_OFFSET // 50  # 2%
    assert abs(delta - QUARTER_OFFSET) < tol, (
        f"reference LO moved by {delta}, expected {QUARTER_OFFSET}. "
        f"A result near {NCO_MOD - QUARTER_OFFSET} means the sign of the "
        f"phase correction is inverted.")

    logger.info("Done!")


# ===========================================================================
# Runner
# ===========================================================================

# ===========================================================================
# Calibration tests (merged from wave_controller_calibration_tb.py)
# ===========================================================================

@cocotb.test()
async def test_meta_sync(dut):
    # Create a logger for this testbench
    logger = logging.getLogger("wave_controller_calibration")

    logger.info("Startup sequence...")

    # Start up
    await start_up(dut)

    logger.info("Running Metastability Synchronization test...")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps") # Wait 1ps for non-blocking registers to update
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"

    logger.info("Simulating Calibration Pulse")
    await ClockCycles(dut.clk, CAL_DELAY)

    logger.info("1st Edge (Rise) Detection Test")
    logger.info("Driving comp HIGH (Tick 0)")
    dut.comp.value = 1

    # Clock Tick 1: comp moves into comp_sync0
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 1: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    assert dut.comp_sync0.value == 1, "comp failed to enter sync0 on Tick 1"
    assert dut.comp_posedge.value == 0, "comp_posedge fired too early!"

    # Clock Tick 2: signal moves from comp_sync0 into comp_sync1
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 2: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    assert dut.comp_sync1.value == 1, "Signal failed to enter sync1 on Tick 2"
    assert dut.comp_posedge.value == 0, "comp_posedge fired too early!"

    # Clock Tick 3: signal moves from comp_sync1 into comp_sync2
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 3: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    assert dut.comp_sync2.value == 1, "Signal failed to enter sync2 on Tick 3"
    assert dut.comp_posedge.value == 0, "comp_posedge fired too early!"

    # Clock Tick 4: signal moves from comp_sync2 into comp_sync3
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 4: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    # comp_sync3 = 1 and comp_sync4 = 0
    assert dut.comp_sync3.value == 1, "Signal failed to hit sync3 on Tick 4"
    assert dut.comp_sync4.value == 0, "sync4 fired too early!"
    assert dut.comp_posedge.value == 1, "comp_posedge failed to fire on Tick 4!"

    logger.info("Edge successfully captured! raw_edge1 locked at: %d", int(dut.raw_edge1.value))

    # Clock Tick 5: comp_posedge clears out
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 5: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    assert dut.comp_sync4.value == 1, "Signal failed to enter sync4 on Tick 5"
    assert dut.comp_posedge.value == 0, "comp_posedge stayed high too long"

    # 1st edge -> 2nd edge
    logger.info("Proceed to 2nd Edge (Fall) Detection Test")
    await ClockCycles(dut.clk, PHASE_180_TICKS)
    logger.info("2nd Edge (Fall) Detection Test")
    logger.info("Driving comp LOW (Tick 0)")
    dut.comp.value = 0

    # Clock Tick 1: comp moves into comp_sync0
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 1: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    assert dut.comp_sync0.value == 0, "comp failed to enter sync0 on Tick 1"
    assert dut.comp_negedge.value == 0, "comp_posedge fired too early!"

    # Clock Tick 2: signal moves from comp_sync0 into comp_sync1
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 2: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    assert dut.comp_sync1.value == 0, "Signal failed to enter sync1 on Tick 2"
    assert dut.comp_negedge.value == 0, "comp_posedge fired too early!"

    # Clock Tick 3: signal moves from comp_sync1 into comp_sync2
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 3: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    assert dut.comp_sync2.value == 0, "Signal failed to enter sync2 on Tick 3"
    assert dut.comp_negedge.value == 0, "comp_negedge fired too early!"

    # Clock Tick 4: signal moves from comp_sync2 into comp_sync3
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 4: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    # comp_sync3 = 0 and comp_sync4 = 1
    assert dut.comp_sync3.value == 0, "Signal failed to hit sync3 on Tick 4"
    assert dut.comp_sync4.value == 1, "sync4 fired too early!"
    assert dut.comp_negedge.value == 1, "comp_negedge failed to fire on Tick 4!"

    logger.info("Edge successfully captured! raw_edge2 locked at: %d", int(dut.raw_edge2.value))

    # Clock Tick 5: comp_negedge clears out
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    logger.info("Tick 5: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    assert dut.comp_sync4.value == 0, "Signal failed to enter sync4 on Tick 5"
    assert dut.comp_negedge.value == 0, "comp_posedge stayed high too long"

    logger.info("Metastability Synchronization test complete. Pipeline chain behaves perfectly.")

@cocotb.test()
async def test_calibration_tracker(dut):
    # Create a logger for this testbench
    logger = dut._log
    RUN_FULL_TRACKER_AND_TIMEOUT = True

    if RUN_FULL_TRACKER_AND_TIMEOUT:
        logger.info("Startup sequence...")

        # Start up
        await start_up(dut)

        logger.info("Running Waveform Cycle Tracking and Calibration Timeout test...")

        # Load Config -> Calibration
        logger.info("Load Config...")
        dut.cfg_f_MEMS_fcw.value = FCW_360HZ
        dut.cfg_done.value = 1
        dut.cal_start.value = 1
        
        await RisingEdge(dut.clk)
        await Timer(1, unit="ps")
        assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"

        # Waveform Cycle Tracker test
        logger.info("Testing Waveform Cycle Tracking Logic")

        expected_phase_acc = int(dut.phase_acc.value)
        
        # wave_cycle_cnt (0 -> 255)
        for cycle_idx in range(1, 256):
            
            # MATH ENGINE: Compute exactly how many clock cycles remain until the next NCO overflow
            remaining_phase = NCO_MOD - expected_phase_acc
            ticks_to_overflow = remaining_phase // FCW_360HZ
            if remaining_phase % FCW_360HZ != 0:
                ticks_to_overflow += 1
                
            # 1-tick before phase_overflow
            await ClockCycles(dut.clk, ticks_to_overflow - 2)
            await Timer(1, unit="ps")
            expected_phase_acc = (expected_phase_acc + (FCW_360HZ * (ticks_to_overflow - 2))) % NCO_MOD
            
            assert dut.phase_overflow.value == 0, f"phase_overflow trigger too early on cycle {cycle_idx}!"
            
            # tick at phase_overflow
            await ClockCycles(dut.clk, 1)
            await Timer(1, unit="ps")
            expected_phase_acc = (expected_phase_acc + FCW_360HZ) % NCO_MOD

            assert int(dut.phase_acc.value) == expected_phase_acc, f"Phase mismatch (phase_acc = {int(dut.phase_acc.value)}): Expected: {expected_phase_acc}"
            assert dut.phase_overflow.value == 1, f"Failed to capture phase_overflow on cycle {cycle_idx}!"
            
            # 1-tick after phase_overflow
            await ClockCycles(dut.clk, 1)
            await Timer(1, unit="ps")
            expected_phase_acc = (expected_phase_acc + FCW_360HZ) % NCO_MOD
            
            assert dut.phase_overflow.value == 0, f"Failed to reset phase_overflow on cycle {cycle_idx}!"
            assert dut.wave_cycle_cnt.value == cycle_idx, f"Failed to track wave_cycle_cnt ({cycle_idx}): Current wave cycle tracker on cycle {dut.wave_cycle_cnt.value}"
            if cycle_idx == 255:
                    assert dut.cal_timeout.value == 0, "cal_timeout trigger too early!"
            if cycle_idx % 64 == 0:
                logger.info(f"Verified cycle {cycle_idx}/255: Tracking and Overflow logic behaves perfectly.")
        
        logger.info("Waveform Cycle Tracking test complete. Tracking and Overflow logic behaves perfectly.")
        
        # cal_timeout test (wave_cycle_cnt after 255)
        logger.info("Entering Timeout test...")

        # tick at cal_timeout
        await RisingEdge(dut.clk)
        await Timer(1, unit="ps")
        assert dut.cal_timeout.value == 1, "Failed to capture timeout!"
        logger.info("Timeout Triggered successfully.")
        logger.info("Timeout Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)

        # Check if freeze after cal_timeout
        await ClockCycles(dut.clk, 1)
        await Timer(1, unit="ps")
        assert dut.cal_timeout.value == 1, "Failed to timeout and freeze!"
        logger.info("Timeout Status + 1-tick: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                    dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)

        await ClockCycles(dut.clk, PHASE_360_TICKS)
        await Timer(1, unit="ps")
        assert dut.cal_timeout.value == 1, "Failed to timeout and freeze!"
        logger.info("Timeout Status + 1 MEMS Cycle: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                    dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)

        logger.info("Calibration Timeout test complete. Timeout behaves perfectly and exit.")

    else:
        logger.info("Bypasse Waveform Cycle Tracking and Calibration Timeout...")

@cocotb.test()
async def test_calibration_jitter_0(dut):
    # Create a logger for this testbench
    logger = dut._log

    logger.info("Startup sequence...")

    # Start up
    await start_up(dut)

    logger.info("Running Calibration Fallout test...")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"
    logger.info("Testing False Signal Fallout Logic")

    # Jitter (wave_is_valid) Test
    logger.info("Testing Jitter Fallout Logic (capture_step = 0)")
    dut.comp.value = 1
    logger.info("Tick 1: Jitter Test (ON: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    await ClockCycles(dut.clk, 1)
    dut.comp.value = 0
    logger.info("Tick 2: Jitter Test (OFF: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)

    # Clock Tick 5: 1st Edge Detection (Jitter Signal)
    await ClockCycles(dut.clk, 3)
    await Timer(1, unit="ps")
    logger.info("Tick 5: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")

    assert dut.capture_pending.value == 0, "Failed to capture raw_edge1 on Tick 6!"
    logger.info("Edge successfully captured! raw_edge1 locked at: %d", int(dut.raw_edge1.value))

    logger.info("Tick 6: phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    logger.info("Tick 6: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    

    # Clock Tick 6: 2nd Edge Detection (Jitter Signal)
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.raw_edge2.value == 0, "Failed to reset from false edge detection!"
    
    logger.info("Tick 7: phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)

    logger.info("Jitter Fallout (1/2) test complete. Jitter safeguard behaves perfectly.")

@cocotb.test()
async def test_calibration_fail_jitter_1(dut):
    # Create a logger for this testbench
    logger = dut._log

    logger.info("Startup sequence...")

    # Start up
    await start_up(dut)

    logger.info("Running Calibration Fallout test...")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"
    logger.info("Testing False Signal Fallout Logic")

    # Jitter (wave_is_valid) Test
    logger.info("Testing Jitter Fallout Logic (capture_step = 1)")
    dut.comp.value = 1
    logger.info("Tick 1 (ON: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    # Clock Tick 5: 1st Edge Detection
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_pending.value == 0, "Failed to capture raw_edge1 on Tick 4!"
    logger.info("Edge successfully captured! raw_edge1 locked at: %d", int(dut.raw_edge1.value))

    logger.info("Tick 6: phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    # 1st edge -> 2nd edge -> Jitter
    logger.info("Proceed to 2nd Edge")
    await ClockCycles(dut.clk, PHASE_180_TICKS)
    dut.comp.value = 0
    logger.info("Tick 1 + (6944 + 5): Jitter Test (OFF: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    await ClockCycles(dut.clk, 1)
    dut.comp.value = 1
    logger.info("Tick 2 + (6944 + 5): Jitter Test (ON: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)

    # Clock Tick 5: 2nd Edge Detection (Jitter Signal)
    await ClockCycles(dut.clk, 3)
    await Timer(1, unit="ps")
    logger.info("Tick 5 + (6944 + 5): comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_step.value == 1, "Failed to capture raw_edge2 on Tick 6!"
    logger.info("Edge successfully captured! raw_edge2 locked at: %d", int(dut.raw_edge2.value))

    logger.info("Tick 6 + (6944 + 5): phase_acc = %d, delay_wave_cycle = %d, cal_dir = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    logger.info("Tick 6 + (6944 + 5): comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    # Clock Tick 6: 3rd Edge Detection (Jitter Signal)
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")

    assert dut.raw_edge3.value == 0, "Failed to reset from false edge detection!"
    
    logger.info("Tick 7 + (6944 + 5): phase_acc = %d, delay_wave_cycle = %d, cal_dir = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    logger.info("Jitter Fallout (2/2) test complete. Jitter safeguard behaves perfectly.")

@cocotb.test()
async def test_calibration_fail_1MEMS_timeout_0(dut):
    # Create a logger for this testbench
    logger = dut._log

    logger.info("Startup sequence...")

    # Start up
    await start_up(dut)

    logger.info("Running Calibration Fallout test...")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"
    logger.info("Testing False Signal Fallout Logic")

    # 1 MEMS Cycle (window_open) Timeout Test
    logger.info("1 MEMS Cycle Timeout Test (capture_step = 0)")
    dut.comp.value = 1
    logger.info("Tick 1 (ON: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)

    # Clock Tick 5: 1st Edge Detection
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_pending.value == 0, "Failed to capture raw_edge1 on Tick 6!"
    logger.info("Edge successfully captured! raw_edge1 locked at: %d", int(dut.raw_edge1.value))

    logger.info("Tick 6: phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)

    # 1 MEMS Cycle Timeout    
    logger.info("Proceed to 1 MEMS Cycle Timeout")
    await Timer(1, unit="ps")
    await ClockCycles(dut.clk, PHASE_360_TICKS)
    logger.info("Tick 13888 + (6): 1 MEMS Cycle Test (ON: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_pending.value == 1, "Failed to reset from 1 MEMS Cycle Timeout!"
    
    logger.info("Tick 1 + (13888) + (6): phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    logger.info("1 MEMS Cycle Timeout (1/2) test complete. Timeout safeguard behaves perfectly.")

@cocotb.test()
async def test_calibration_fail_1MEMS_timeout_1(dut):
    # Create a logger for this testbench
    logger = dut._log

    logger.info("Startup sequence...")

    # Start up
    await start_up(dut)

    logger.info("Running Calibration Fallout test...")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"
    logger.info("Testing False Signal Fallout Logic")

    # 1 MEMS Cycle (window_open) Timeout Test
    logger.info("1 MEMS Cycle Timeout Test (capture_step = 1)")
    dut.comp.value = 1
    logger.info("Tick 1 (ON: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)

    # Clock Tick 5: 1st Edge Detection
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_pending.value == 0, "Failed to capture raw_edge1 on Tick 6!"
    logger.info("Edge successfully captured! raw_edge1 locked at: %d", int(dut.raw_edge1.value))

    logger.info("Tick 6: phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    # 1st edge -> 2nd edge
    logger.info("Proceed to 2nd Edge")
    await ClockCycles(dut.clk, PHASE_180_TICKS)
    dut.comp.value = 0
    logger.info("Tick 1 + (6944 + 5) (OFF: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)

    # Clock Tick 5: 2nd Edge Detection
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5 + (6944 + 5): comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_step.value == 1, "Failed to capture raw_edge2 on Tick 6!"
    logger.info("Edge successfully captured! raw_edge2 locked at: %d", int(dut.raw_edge2.value))

    logger.info("Tick 6 + (6944 + 5): phase_acc = %d, delay_wave_cycle = %d, cal_dir = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    # 1 MEMS Cycle Timeout    
    logger.info("Proceed to 1 MEMS Cycle Timeout")
    await Timer(1, unit="ps")
    await ClockCycles(dut.clk, PHASE_360_TICKS)
    logger.info("Tick 13888 + (6) + (6944 + 5): 1 MEMS Cycle Test (OFF: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_pending.value == 1, "Failed to reset from 1 MEMS Cycle Timeout!"
    
    logger.info("Tick 1 + (13888) + (6) + (6944 + 5): phase_acc = %d, delay_wave_cycle = %d, cal_dir = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    logger.info("1 MEMS Cycle Timeout (2/2) test complete. Timeout safeguard behaves perfectly.")

@cocotb.test()
async def test_calibration_fail_early_signal_0(dut):
    # Create a logger for this testbench
    logger = dut._log

    logger.info("Startup sequence...")

    # Start up
    await start_up(dut)

    logger.info("Running Calibration Fallout test...")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"
    logger.info("Testing False Signal Fallout Logic")
    
    # 90-360° phase delay window (wave_is_valid) Test
    logger.info("<90° Phase Delay Signal Test (capture_step = 0)")
    dut.comp.value = 1
    logger.info("Tick 1 (ON: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    # Clock Tick 5: 1st Edge Detection
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_pending.value == 0, "Failed to capture raw_edge1 on Tick 6!"
    logger.info("Edge successfully captured! raw_edge1 locked at: %d", int(dut.raw_edge1.value))

    logger.info("Tick 6: phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    # <90° phase delay 2nd edge
    await ClockCycles(dut.clk, PHASE_90_TICKS - 12)
    await Timer(1, unit="ps")
    dut.comp.value = 0
    logger.info("Tick 1 + (3472 - 7): <90° 2nd edge Test (OFF: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    # Clock Tick 5: 2nd Edge Detection (False Signal)
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5 + (3472 - 7): comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.raw_edge2.value == 0, "Failed to reset from incorrect phase delay!"
    
    logger.info("Tick 6 + (3472 - 7) (1-tick before 90° phase delay): phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    logger.info("<90° Phase Delay Signal (1/2) test complete. Early signal safeguard behaves perfectly.")

@cocotb.test()
async def test_calibration_fail_early_signal_1(dut):
    # Create a logger for this testbench
    logger = dut._log

    logger.info("Startup sequence...")

    # Start up
    await start_up(dut)

    logger.info("Running Calibration Fallout test...")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"
    logger.info("Testing False Signal Fallout Logic")
    
    # 90-360° phase delay window (wave_is_valid) Test
    logger.info("<90° Phase Delay Signal Test (capture_step = 1)")
    dut.comp.value = 1
    logger.info("Tick 1 (ON: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    # Clock Tick 5: 1st Edge Detection
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5: comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_pending.value == 0, "Failed to capture raw_edge1 on Tick 6!"
    logger.info("Edge successfully captured! raw_edge1 locked at: %d", int(dut.raw_edge1.value))

    logger.info("Tick 6: phase_acc = %d, delay_wave_cycle = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    # 1st edge -> 2nd edge
    logger.info("Proceed to 2nd Edge")
    await ClockCycles(dut.clk, PHASE_180_TICKS)
    dut.comp.value = 0
    logger.info("Tick 1 + (6944 + 5) (OFF: %d): phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)

    # Clock Tick 5: 2nd Edge Detection
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5 + (6944 + 5): comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.capture_pending.value == 0, "Failed to capture raw_edge1 on Tick 6!"
    logger.info("Edge successfully captured! raw_edge1 locked at: %d", int(dut.raw_edge1.value))

    logger.info("Tick 6 + (6944 + 5): phase_acc = %d, delay_wave_cycle = %d, cal_dir = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    # <90° phase delay 3rd edge
    await ClockCycles(dut.clk, PHASE_90_TICKS - 12)
    dut.comp.value = 1
    logger.info("Tick 1 + (3472 - 7) + (6944 + 5): <90° 3rd edge Test (ON: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    # Clock Tick 5: 3rd Edge Detection (False Signal)
    await ClockCycles(dut.clk, 4)
    await Timer(1, unit="ps")
    logger.info("Tick 5 + (3472 - 7) + (6944 + 5): comp_sync0 = %d, comp_sync1 = %d, comp_sync2 = %d, comp_sync3 = %d, comp_sync4 = %d, comp_posedge = %d, comp_negedge = %d",
                dut.comp_sync0.value, dut.comp_sync1.value, dut.comp_sync2.value, dut.comp_sync3.value, dut.comp_sync4.value, dut.comp_posedge.value, dut.comp_negedge.value)
    
    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    assert dut.raw_edge3.value == 0, "Failed to reset from incorrect phase delay!"
    
    logger.info("Tick 6 + (3472 - 7) + (6944 + 5) (1-tick before 90° phase delay): phase_acc = %d, delay_wave_cycle = %d, cal_dir = %d, capture_step = %d, window_open = %d, wave_is_valid = %d",
                dut.phase_acc.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value)
    
    logger.info("<90° Phase Delay Signal (2/2) test complete. Early signal safeguard behaves perfectly.")

@cocotb.test()
async def test_calibration(dut):
    # Create a logger for this testbench
    logger = dut._log

    logger.info("Startup sequence...")

    # Start up
    await start_up(dut)

    logger.info("Running Calibration test...")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"
    
    # In-phase Calibration Test
    logger.info("Testing in-phase Calibration")

    # Startup Jittering Test
    logger.info("Entering Startup Jittering")
    target_cutoff_tick = ((NCO_MOD + FCW_360HZ - 1) // FCW_360HZ) - 9

    current_tick = 0
    logger.info("Testing Jittering Fallout Logic")
    while current_tick < target_cutoff_tick:
        # Injects a completely random 0 or 1 on every single clock edge
        dut.comp.value = random.choice([0, 1])
        
        await RisingEdge(dut.clk)
        current_tick += 1

    # Setup edge detection and Enter 1-tick before phase_overflow after pipeline
    dut.comp.value = 1
    await RisingEdge(dut.clk)
    dut.comp.value = 0

    await Timer(1, unit="ps")
    logger.info("Startup Jitter Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)
    
    assert dut.cal_done.value == 0, "Failed to ignore startup jittering!"
    logger.info("Startup Jittering Completed")

    # Calibration
    logger.info("Entering Calibration")
    await RisingEdge(dut.clk)
    logger.info("Testing Calibration Capture Logic")
    dut.comp.value = 1
    logger.info("Sending Calibration Pulse: 0° (ON: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    await ClockCycles(dut.clk, 5)
    await Timer(1, unit="ps")
    logger.info("0° Pulse Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)

    await ClockCycles(dut.clk, PHASE_180_TICKS - 4)
    dut.comp.value = 0
    logger.info("Sending Calibration Pulse: 180° (OFF: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    await ClockCycles(dut.clk, 5)
    await Timer(1, unit="ps")
    logger.info("180° Pulse Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)


    await ClockCycles(dut.clk, PHASE_180_TICKS + 9)
    dut.comp.value = 1
    logger.info("Sending Calibration Pulse: 360° (ON: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    await ClockCycles(dut.clk, 5)
    await Timer(1, unit="ps")
    logger.info("360° Pulse Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)

    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    phase0_offset = int(dut.cal_phase0_offset.value)
    phase90_offset = int(dut.cal_phase90_offset.value)
    phase270_offset = int(dut.cal_phase270_offset.value)
    logger.info("Storing cal_phase_offset: 0°: %d, 90°: %d 270°: %d",
                phase0_offset, phase90_offset, phase270_offset)
    assert dut.cal_done.value == 1, "Failed to calibrate!"
    assert dut.cal_dir.value == 1, "Failed to capture direction!"
    logger.info("Calibration Complete")

    # Post Jittering
    logger.info("Entering Post Jittering")

    current_tick = 0
    logger.info("Testing Freeze Logic")
    while current_tick < target_cutoff_tick:
        # Injects a completely random 0 or 1 on every single clock edge
        dut.comp.value = random.choice([0, 1])
        
        await ClockCycles(dut.clk, 1)
        current_tick += 1
    
    logger.info("Simulation Complete (1/2)")
    logger.info("Calibration Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)
    logger.info("cal_phase_offset Value: 0°: %d, 90°: %d 270°: %d",
                phase0_offset, phase90_offset, phase270_offset)
    assert dut.cal_done.value == 1, "Failed to freeze!"
    assert int(dut.cal_phase0_offset.value) == phase0_offset, "Failed to store phase0_offset!"
    assert int(dut.cal_phase90_offset.value) == phase90_offset, "Failed to store phase90_offset!"
    assert int(dut.cal_phase270_offset.value) == phase270_offset, "Failed to store phase270_offset!"

    # Soft reset and memory wipe
    logger.info("Testing soft_rst_n and memory wipe...")
    dut.soft_rst_n.value = 0
    await ClockCycles(dut.clk, 1)
    await Timer(10, unit="ps")
    assert dut.phase_acc.value == 0, "Failed to wipe phase_acc"
    assert dut.comp_sync0.value == 0, "Failed to wipe comp_sync0"
    assert dut.comp_sync1.value == 0, "Failed to wipe comp_sync1"
    assert dut.comp_sync2.value == 0, "Failed to wipe comp_sync2"
    assert dut.comp_sync3.value == 0, "Failed to wipe comp_sync3"
    assert dut.comp_sync4.value == 0, "Failed to wipe comp_sync4"
    assert dut.wave_cycle_cnt.value == 0, "Failed to wipe wave_cycle_cnt"
    assert dut.cal_dir.value == 0, "Failed to wipe cal_dir"
    assert dut.delay_wave_cycle.value == 0, "Failed to wipe delay_wave_cycle"
    assert dut.capture_pending.value == 1, "Failed to wipe capture_pending"
    assert dut.capture_step.value == 0, "Failed to wipe capture_step"
    assert dut.cal_done.value == 0, "Failed to wipe cal_done"
    assert dut.raw_edge1.value == 0, "Failed to wipe raw_edge1"
    assert dut.raw_edge2.value == 0, "Failed to wipe raw_edge2"
    assert dut.raw_edge1.value == 0, "Failed to wipe raw_edge3"

    await set_defaults(dut)
    await Timer(1, unit="ps")
    assert dut.cfg_f_MEMS_fcw.value == 0, "Failed to wipe cfg_f_MEMS_fcw"
    assert dut.cfg_phase0_offset.value == 0, "Failed to wipe cfg_phase0_offset"
    assert dut.cfg_phase90_offset.value == 0, "Failed to wipe cfg_phase90_offset"
    assert dut.cfg_phase270_offset.value == 0, "Failed to wipe cfg_phase270_offset"
    assert dut.cfg_done.value == 0, "Failed to wipe cfg_done"
    assert dut.cal_start.value == 0, "Failed to wipe cal_start"
    assert dut.comp.value == 0, "Failed to wipe comp"
    
    await ClockCycles(dut.clk, 5)
    dut.soft_rst_n.value = 1
    logger.info("Soft Reset Completed")

    # Load Config -> Calibration
    logger.info("Load Config...")
    dut.cfg_f_MEMS_fcw.value = FCW_360HZ
    dut.cfg_done.value = 1
    dut.cal_start.value = 1
    
    await RisingEdge(dut.clk)
    await Timer(1, unit="ps")
    assert dut.nco_en.value == 1, f"Numerical Controlled Oscillator failed to start from cfg_done or cal_start"
    
    # Out-of-phase Calibration Test
    logger.info("Testing out-of-phase Calibration")

    # Startup Jittering Test
    logger.info("Entering Startup Jittering")
    target_cutoff_tick = ((NCO_MOD + FCW_360HZ - 1) // FCW_360HZ) - 3

    current_tick = 0
    logger.info("Testing Jittering Fallout Logic")
    while current_tick < target_cutoff_tick:
        # Injects a completely random 0 or 1 on every single clock edge
        dut.comp.value = random.choice([0, 1])
        
        await RisingEdge(dut.clk)
        current_tick += 1

    # Setup edge detection and Enter phase_overflow
    dut.comp.value = 0
    await RisingEdge(dut.clk)
    dut.comp.value = 1

    await Timer(1, unit="ps")
    logger.info("Startup Jitter Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)
    
    assert dut.cal_done.value == 0, "Failed to ignore startup jittering!"
    logger.info("Startup Jittering Completed")

    # Calibration
    logger.info("Entering Calibration")
    await RisingEdge(dut.clk)
    logger.info("Testing Calibration Capture Logic")
    dut.comp.value = 0
    logger.info("Sending Calibration Pulse: 0° (OFF: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    await ClockCycles(dut.clk, 5)
    await Timer(1, unit="ps")
    logger.info("0° Pulse Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)

    await ClockCycles(dut.clk, PHASE_180_TICKS + 7)
    dut.comp.value = 1
    logger.info("Sending Calibration Pulse: 180° (ON: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    await ClockCycles(dut.clk, 5)
    await Timer(1, unit="ps")
    logger.info("180° Pulse Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)


    await ClockCycles(dut.clk, PHASE_180_TICKS - 4)
    dut.comp.value = 0
    logger.info("Sending Calibration Pulse: 360° (OFF: %d), phase_acc = %d",
                dut.comp.value, dut.phase_acc.value)
    
    await ClockCycles(dut.clk, 5)
    await Timer(1, unit="ps")
    logger.info("360° Pulse Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)

    await ClockCycles(dut.clk, 1)
    await Timer(1, unit="ps")
    phase0_offset = int(dut.cal_phase0_offset.value)
    phase90_offset = int(dut.cal_phase90_offset.value)
    phase270_offset = int(dut.cal_phase270_offset.value)
    logger.info("Storing cal_phase_offset: 0°: %d, 90°: %d 270°: %d",
                phase0_offset, phase90_offset, phase270_offset)
    assert dut.cal_done.value == 1, "Failed to calibrate!"
    assert dut.cal_dir.value == 0, "Failed to capture direction!"
    logger.info("Calibration Complete")
    logger.info("Entering Post Jittering")

    current_tick = 0
    logger.info("Testing Freeze Logic")
    while current_tick < target_cutoff_tick:
        # Injects a completely random 0 or 1 on every single clock edge
        dut.comp.value = random.choice([0, 1])
        
        await ClockCycles(dut.clk, 1)
        current_tick += 1
    
    logger.info("Simulation Complete (2/2)")
    logger.info("Calibration Status: phase_acc = %d, wave_cycle_cnt = %d, delay_wave_cycle = %d, cal_dir = %d, capture_pending = %d, capture_step = %d, window_open = %d, wave_is_valid = %d, raw_edge1 = %d, raw_edge2 = %d, raw_edge3 = %d",
                dut.phase_acc.value, dut.wave_cycle_cnt.value, dut.delay_wave_cycle.value, dut.cal_dir.value, dut.capture_pending.value, dut.capture_step.value, dut.window_open.value, dut.wave_is_valid.value, dut.raw_edge1.value, dut.raw_edge2.value, dut.raw_edge3.value)
    logger.info("cal_phase_offset Value: 0°: %d, 90°: %d 270°: %d",
                phase0_offset, phase90_offset, phase270_offset)
    assert dut.cal_done.value == 1, "Failed to freeze!"
    assert int(dut.cal_phase0_offset.value) == phase0_offset, "Failed to store phase0_offset!"
    assert int(dut.cal_phase90_offset.value) == phase90_offset, "Failed to store phase90_offset!"
    assert int(dut.cal_phase270_offset.value) == phase270_offset, "Failed to store phase270_offset!"

    logger.info("Calibration test complete. Calibration capture logic behaves perfectly.")


@cocotb.test()
async def test_readout_latch_strobes(dut):
    """In Readout, latch_phase90/270 fire near their offsets and clear on ack

    Covers the strobe interface to the signal processor (Ash's block):
      - each strobe rises when phase_acc reaches its cfg_phaseNN_offset window
      - the strobe is HELD until the matching ack clears it (handshake)
      - the two strobes fire at different phases (90 vs 270)
    """

    logger = logging.getLogger("wave_controller")

    if gl:
        logger.warning("Skipping: inspects internal phase_acc (RTL only)")
        return

    logger.info("Startup sequence...")
    await start_up(dut)

    dut.cfg_phase90_offset.value  = QUARTER_OFFSET
    dut.cfg_phase270_offset.value = 3 * QUARTER_OFFSET
    dut.latch_phase90_ack.value   = 0
    dut.latch_phase270_ack.value  = 0
    await enter_readout(dut, fcw=FCW_FAST)

    # ---- 90 strobe fires, near the right phase ----
    fired90_phase = None
    for _ in range(PERIOD_CLKS + 20):
        await RisingEdge(dut.clk)
        if int(dut.latch_phase90.value) == 1:
            fired90_phase = int(dut.phase_acc.value)
            break
    assert fired90_phase is not None, "latch_phase90 never fired in Readout"
    logger.info("latch_phase90 fired at phase_acc = %d (target %d)",
                fired90_phase, QUARTER_OFFSET)
    near90 = min((fired90_phase - QUARTER_OFFSET) % NCO_MOD,
                 (QUARTER_OFFSET - fired90_phase) % NCO_MOD)
    assert near90 <= 4 * FCW_FAST, (
        f"latch_phase90 fired at {fired90_phase}, not near offset {QUARTER_OFFSET}")

    # ---- held until acked ----
    await ClockCycles(dut.clk, 3)
    assert int(dut.latch_phase90.value) == 1, (
        "latch_phase90 should stay high until acked (it dropped on its own)")

    # ---- ack clears it ----
    dut.latch_phase90_ack.value = 1
    await ClockCycles(dut.clk, 2)
    dut.latch_phase90_ack.value = 0
    dropped = False
    for _ in range(4):
        await RisingEdge(dut.clk)
        if int(dut.latch_phase90.value) == 0:
            dropped = True
            break
    assert dropped, "latch_phase90 did not clear after ack"
    logger.info("latch_phase90 cleared on ack")

    # ---- 270 strobe fires, at a different phase ----
    fired270_phase = None
    for _ in range(PERIOD_CLKS + 20):
        await RisingEdge(dut.clk)
        if int(dut.latch_phase270.value) == 1:
            fired270_phase = int(dut.phase_acc.value)
            break
    assert fired270_phase is not None, "latch_phase270 never fired in Readout"
    logger.info("latch_phase270 fired at phase_acc = %d (target %d)",
                fired270_phase, 3 * QUARTER_OFFSET)
    near270 = min((fired270_phase - 3 * QUARTER_OFFSET) % NCO_MOD,
                  (3 * QUARTER_OFFSET - fired270_phase) % NCO_MOD)
    assert near270 <= 4 * FCW_FAST, (
        f"latch_phase270 fired at {fired270_phase}, not near {3*QUARTER_OFFSET}")

    assert abs(fired90_phase - fired270_phase) > NCO_MOD // 8, (
        "90 and 270 strobes fired at nearly the same phase")

    # ---- 270 held until acked (mirror of the 90 handshake) ----
    await ClockCycles(dut.clk, 3)
    assert int(dut.latch_phase270.value) == 1, (
        "latch_phase270 should stay high until acked (it dropped on its own)")

    # ---- 270 ack clears it ----
    dut.latch_phase270_ack.value = 1
    await ClockCycles(dut.clk, 2)
    dut.latch_phase270_ack.value = 0
    dropped270 = False
    for _ in range(4):
        await RisingEdge(dut.clk)
        if int(dut.latch_phase270.value) == 0:
            dropped270 = True
            break
    assert dropped270, "latch_phase270 did not clear after ack"
    logger.info("latch_phase270 cleared on ack")

    logger.info("Done!")


@cocotb.test()
async def test_no_latch_outside_readout(dut):
    """Strobes stay low when not in Readout (unconfigured, and during cal)"""

    logger = logging.getLogger("wave_controller")

    logger.info("Startup sequence...")
    await start_up(dut)

    dut.cfg_phase90_offset.value  = QUARTER_OFFSET
    dut.cfg_phase270_offset.value = 3 * QUARTER_OFFSET

    # Unconfigured -> no strobes
    dut.cfg_done.value  = 0
    dut.cal_start.value = 0
    for _ in range(PERIOD_CLKS):
        await RisingEdge(dut.clk)
        assert int(dut.latch_phase90.value) == 0 and \
               int(dut.latch_phase270.value) == 0, \
               "strobe fired while unconfigured"

    # Calibration -> no readout strobes
    dut.cfg_f_MEMS_fcw.value = FCW_FAST
    dut.cfg_done.value  = 1
    dut.cal_start.value = 1
    for _ in range(PERIOD_CLKS):
        await RisingEdge(dut.clk)
        assert int(dut.latch_phase90.value) == 0 and \
               int(dut.latch_phase270.value) == 0, \
               "readout strobe fired during calibration"

    logger.info("Done!")

def wave_controller_runner():

    proj_path = Path(__file__).resolve().parent

    sources = []
    defines = {f"SLOT_{slot.upper()}": True}
    includes = [proj_path / "../src/"]

    if gl:
        # SCL models
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "primitives.v")

        # We use the powered netlist
        sources.append(proj_path / f"../final/pnl/{hdl_toplevel}.pnl.v")

        defines = {"FUNCTIONAL": True, "USE_POWER_PINS": True}
    else:
        sources.append(proj_path / "../src/sine_lut.sv")
        sources.append(proj_path / "../src/wave_controller.sv")

    build_args = []

    if sim == "icarus":
        # For debugging
        # build_args = ["-Winfloop", "-pfileline=1"]
        pass

    if sim == "verilator":
        build_args = ["--timing", "--trace", "--trace-fst", "--trace-structs"]

    runner = get_runner(sim)
    runner.build(
        sources=sources,
        hdl_toplevel=hdl_toplevel,
        defines=defines,
        always=True,
        includes=includes,
        build_args=build_args,
        timescale=("1ns", "1ps"),
        waves=True,
    )

    plusargs = []

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="wave_controller_tb",
        plusargs=plusargs,
        timescale=("1ns", "1ps"),
        waves=True,
    )


if __name__ == "__main__":
    wave_controller_runner()
