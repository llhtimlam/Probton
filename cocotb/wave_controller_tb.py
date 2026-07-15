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


def reconstruct(pwm_bits, alpha=1.0 / 900.0, y0=0.5):
    """Single-pole RC low-pass, standing in for the external reconstruction
    filter that sits between the ASIC pin and the piezo buzzer."""
    y = y0
    out = []
    for b in pwm_bits:
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
async def test_pwm_tracks_sine(dut):
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
    """After an RC, the PWM reconstructs a clean sine at the dither tone"""

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

    logger.info("burst active for %d clocks (one period = %d)",
                active, PERIOD_CLKS)

    assert abs(active - PERIOD_CLKS) <= 2, (
        f"burst lasted {active} clocks, expected ~{PERIOD_CLKS} (one period)")
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
