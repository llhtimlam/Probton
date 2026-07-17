# SPDX-FileCopyrightText: © 2026 Project Template Contributors
# SPDX-License-Identifier: Apache-2.0
#
# cocotb testbench for sign_bit_interpreter (single axis).
#
# Drives the block the way the wave_controller and Nitin's comparator do:
#   - comp_raw arrives RAW (the module runs its own 4-tick metastability sync)
#   - latch_phase90/270 are HELD high until this module acks them
#   - each MEMS cycle presents a {90, 270} comparator pair; 16 cycles vote
#
# Mirrors the SystemVerilog testbench: ack handshake, in/out-of-phase decisions,
# held outputs, 00/11 jitter, the 13-vs-14 threshold, jitter recovery, fresh
# windows, and the amp-ratio freeze.

import os
import logging
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge, ClockCycles
from cocotb_tools.runner import get_runner

sim = os.getenv("SIM", "icarus")
pdk_root = os.getenv("PDK_ROOT", Path("~/.ciel").expanduser())
pdk = os.getenv("PDK", "gf180mcuD")
scl = os.getenv("SCL", "gf180mcu_fd_sc_mcu7t5v0")
gl = os.getenv("GL", False)
slot = os.getenv("SLOT", "1x1")

hdl_toplevel = "sign_bit_interpreter"

# Must match the module parameters
VOTE_WINDOW = 16
VOTE_THRESHOLD = 14
SYNC_DEPTH = 4


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

async def start_clock(clock, freq=5):
    """Start the clock @ freq MHz"""
    c = Clock(clock, 1 / freq * 1000, "ns")
    cocotb.start_soon(c.start())


async def set_defaults(dut):
    dut.comp_raw.value = 0
    dut.latch_phase90.value = 0
    dut.latch_phase270.value = 0
    dut.amp_ratio_en.value = 0
    dut.amp_update_done.value = 0


async def do_reset(dut):
    await set_defaults(dut)
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 6)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)


async def start_up(dut):
    await set_defaults(dut)
    await start_clock(dut.clk)
    await do_reset(dut)


async def strobe_hold(dut, which90, val, settle):
    """Present a comparator value and hold the strobe high until acked.

    The wave_controller holds each strobe until this module acks it. Because the
    module delays the strobe by SYNC_DEPTH, we settle comp_raw first so the sync
    pipe is filled, then raise the strobe and wait for the ack before releasing.
    """
    dut.comp_raw.value = val
    for _ in range(settle):
        await RisingEdge(dut.clk)

    if which90:
        dut.latch_phase90.value = 1
    else:
        dut.latch_phase270.value = 1

    ack = dut.latch_phase90_ack if which90 else dut.latch_phase270_ack
    guard = 0
    while int(ack.value) != 1 and guard < 40:
        await RisingEdge(dut.clk)
        guard += 1

    if which90:
        dut.latch_phase90.value = 0
    else:
        dut.latch_phase270.value = 0
    await RisingEdge(dut.clk)


async def mems_cycle(dut, v90, v270):
    """One MEMS cycle: a 90 sample then a 270 sample."""
    await strobe_hold(dut, True, v90, SYNC_DEPTH + 2)
    await strobe_hold(dut, False, v270, SYNC_DEPTH + 2)


async def run_n(dut, v90, v270, n):
    for _ in range(n):
        await mems_cycle(dut, v90, v270)


# ---------------------------------------------------------------------------
# Tests
# ---------------------------------------------------------------------------

@cocotb.test()
async def test_ack_handshake(dut):
    """Ack asserts after the strobe propagates and falls when it is released"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    dut.comp_raw.value = 1
    for _ in range(SYNC_DEPTH + 2):
        await RisingEdge(dut.clk)

    dut.latch_phase90.value = 1
    guard = 0
    while int(dut.latch_phase90_ack.value) != 1 and guard < 40:
        await RisingEdge(dut.clk)
        guard += 1
    assert int(dut.latch_phase90_ack.value) == 1, \
        "90 ack never asserted after the strobe propagated"

    # wave_controller drops its strobe on seeing the ack; emulate that. The ack
    # follows the strobe down once it drains the sync pipe (SYNC_DEPTH) plus the
    # ack's own register stage, so wait until we observe the fall rather than
    # assuming an exact count.
    dut.latch_phase90.value = 0
    fell = False
    for _ in range(SYNC_DEPTH + 4):
        await RisingEdge(dut.clk)
        if int(dut.latch_phase90_ack.value) == 0:
            fell = True
            break
    assert fell, "ack did not fall after the strobe was released"

    logger.info("Done!")


@cocotb.test()
async def test_in_phase(dut):
    """16 in-phase cycles (90=1, 270=0) -> move_en high, dir=1"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 1, 0, VOTE_WINDOW)
    logger.info("votes: in=%d out=%d",
                int(dut.votes_in_phase.value), int(dut.votes_out_phase.value))

    assert int(dut.votes_in_phase.value) == VOTE_WINDOW, "all 16 should tally in-phase"
    assert int(dut.move_en.value) == 1, "move_en should assert"
    assert int(dut.dir.value) == 1, "dir should be 1 (toward MEMS-positive)"
    assert int(dut.jitter_flag.value) == 0, "jitter should be clear"

    logger.info("Done!")


@cocotb.test()
async def test_outputs_are_held(dut):
    """dir/move_en hold their value across idle clocks with no strobes"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 1, 0, VOTE_WINDOW)
    assert int(dut.move_en.value) == 1, "move_en high after decision"

    await ClockCycles(dut.clk, 200)
    assert int(dut.move_en.value) == 1, "move_en must STILL be high after idle"
    assert int(dut.dir.value) == 1, "dir must still be held"

    logger.info("Done!")


@cocotb.test()
async def test_out_of_phase(dut):
    """16 out-of-phase cycles (90=0, 270=1) -> move_en high, dir=0"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 0, 1, VOTE_WINDOW)
    logger.info("votes: in=%d out=%d",
                int(dut.votes_in_phase.value), int(dut.votes_out_phase.value))

    assert int(dut.votes_out_phase.value) == VOTE_WINDOW, "all 16 should tally out-of-phase"
    assert int(dut.move_en.value) == 1, "move_en should assert"
    assert int(dut.dir.value) == 0, "dir should be 0 (opposite direction)"

    logger.info("Done!")


@cocotb.test()
async def test_all_00_jitter(dut):
    """All 00 samples -> no majority -> jitter, move_en low"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 0, 0, VOTE_WINDOW)
    assert int(dut.votes_in_phase.value) == 0 and \
           int(dut.votes_out_phase.value) == 0, "00 votes for neither"
    assert int(dut.move_en.value) == 0, "move_en should be low"
    assert int(dut.jitter_flag.value) == 1, "jitter should be raised"

    logger.info("Done!")


@cocotb.test()
async def test_all_11_jitter(dut):
    """All 11 samples -> no majority -> jitter"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 1, 1, VOTE_WINDOW)
    assert int(dut.votes_in_phase.value) == 0 and \
           int(dut.votes_out_phase.value) == 0, "11 votes for neither"
    assert int(dut.jitter_flag.value) == 1, "jitter should be raised"

    logger.info("Done!")


@cocotb.test()
async def test_below_threshold(dut):
    """13 of 16 in-phase (below 14) -> does not fire"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 1, 0, 13)
    await run_n(dut, 0, 1, 3)
    logger.info("votes: in=%d out=%d",
                int(dut.votes_in_phase.value), int(dut.votes_out_phase.value))

    assert int(dut.votes_in_phase.value) == 13, "13 should be counted"
    assert int(dut.move_en.value) == 0, "13/16 must not fire"
    assert int(dut.jitter_flag.value) == 1, "jitter should be raised"

    logger.info("Done!")


@cocotb.test()
async def test_at_threshold(dut):
    """Exactly 14 of 16 -> fires (threshold is inclusive)"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 1, 0, 14)
    await run_n(dut, 0, 1, 2)
    logger.info("votes: in=%d out=%d",
                int(dut.votes_in_phase.value), int(dut.votes_out_phase.value))

    assert int(dut.votes_in_phase.value) == 14, "14 should be counted"
    assert int(dut.move_en.value) == 1, "14/16 must fire"
    assert int(dut.jitter_flag.value) == 0, "jitter should be clear"

    logger.info("Done!")


@cocotb.test()
async def test_jitter_clears_on_good_window(dut):
    """A bad window raises jitter; a following good window clears it"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 0, 0, VOTE_WINDOW)
    assert int(dut.jitter_flag.value) == 1, "bad window should raise jitter"

    await run_n(dut, 1, 0, VOTE_WINDOW)
    assert int(dut.jitter_flag.value) == 0, "good window should clear jitter"
    assert int(dut.move_en.value) == 1, "move_en should re-assert"

    logger.info("Done!")


@cocotb.test()
async def test_fresh_window_each_time(dut):
    """Each window starts from zero; direction can flip window to window"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 1, 0, VOTE_WINDOW)
    assert int(dut.dir.value) == 1, "window 1 -> dir 1"

    await run_n(dut, 0, 1, VOTE_WINDOW)
    assert int(dut.votes_out_phase.value) == VOTE_WINDOW, "window 2 tallies from zero"
    assert int(dut.dir.value) == 0, "window 2 -> dir 0"

    logger.info("Done!")


@cocotb.test()
async def test_amp_ratio_freeze(dut):
    """amp_ratio_en freezes the channel; amp_update_done resumes it"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    await run_n(dut, 1, 0, VOTE_WINDOW)
    assert int(dut.move_en.value) == 1, "move_en high before freeze"

    dut.amp_ratio_en.value = 1
    await RisingEdge(dut.clk)
    dut.amp_ratio_en.value = 0
    await ClockCycles(dut.clk, 4)
    assert int(dut.move_en.value) == 0, "freeze should stop the stage"

    await run_n(dut, 0, 1, VOTE_WINDOW)
    assert int(dut.move_en.value) == 0, "no decision while frozen"
    assert int(dut.votes_out_phase.value) == 0, "no votes accumulated while frozen"

    dut.amp_update_done.value = 1
    await RisingEdge(dut.clk)
    dut.amp_update_done.value = 0
    await ClockCycles(dut.clk, 4)

    await run_n(dut, 0, 1, VOTE_WINDOW)
    assert int(dut.move_en.value) == 1, "should resume after amp_update_done"
    assert int(dut.votes_out_phase.value) == VOTE_WINDOW, "post-freeze window complete"

    logger.info("Done!")


@cocotb.test()
async def test_ack_during_freeze(dut):
    """Strobe is still acked during freeze so the wave_controller never wedges"""

    logger = logging.getLogger("sign_bit_interpreter")
    logger.info("Startup...")
    await start_up(dut)

    dut.amp_ratio_en.value = 1
    await RisingEdge(dut.clk)
    dut.amp_ratio_en.value = 0

    dut.comp_raw.value = 1
    for _ in range(SYNC_DEPTH + 2):
        await RisingEdge(dut.clk)
    dut.latch_phase90.value = 1
    guard = 0
    while int(dut.latch_phase90_ack.value) != 1 and guard < 40:
        await RisingEdge(dut.clk)
        guard += 1
    assert int(dut.latch_phase90_ack.value) == 1, \
        "ack must still fire while frozen (wave_controller must not wedge)"
    dut.latch_phase90.value = 0

    logger.info("Done!")


# ---------------------------------------------------------------------------
# Runner
# ---------------------------------------------------------------------------

def sign_bit_interpreter_runner():

    proj_path = Path(__file__).resolve().parent

    sources = []
    defines = {f"SLOT_{slot.upper()}": True}
    includes = [proj_path / "../src/"]

    if gl:
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "primitives.v")
        sources.append(proj_path / f"../final/pnl/{hdl_toplevel}.pnl.v")
        defines = {"FUNCTIONAL": True, "USE_POWER_PINS": True}
    else:
        sources.append(proj_path / "../src/sign_bit_interpreter.sv")

    build_args = []
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

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="sign_bit_interpreter_tb",
        timescale=("1ns", "1ps"),
        waves=True,
    )


if __name__ == "__main__":
    sign_bit_interpreter_runner()
