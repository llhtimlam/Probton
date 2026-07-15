# SPDX-FileCopyrightText: © 2026 Project Template Contributors
# SPDX-License-Identifier: Apache-2.0

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

hdl_toplevel = "state_machine"

S_BOOT = 0 
S_LOAD_CFG = 1
S_CAL = 2
S_FALLOUT = 3
S_READOUT = 4
S_AMP_ADJ = 5

STATE_NAMES = {
    S_BOOT: "BOOT", S_LOAD_CFG: "LOAD_CFG", S_CAL: "CAL",
    S_FALLOUT: "FALLOUT", S_READOUT: "READOUT", S_AMP_ADJ: "AMP_ADJ",
}


def check_state(dut, expected, msg):
    """Assert the FSM is in the expected state, with named states in errors."""
    got = int(dut.state_o.value)
    assert got == expected, (
        f"{msg}: state={STATE_NAMES.get(got, got)} "
        f"expected {STATE_NAMES[expected]}"
    )
    cocotb.log.info(f"PASS {msg} (state={STATE_NAMES[expected]})")


async def set_defaults(dut):
    dut.boot_complete.value = 0
    dut.cfg_done.value = 0
    dut.phase_offset_imported.value = 0
    dut.cal_done.value = 0
    dut.cal_timeout.value = 0
    dut.amp_ratio_en.value = 0
    dut.amp_update_done.value = 0
    dut.soft_rst.value = 0


async def enable_power(dut):
    dut.VDD.value = 1
    dut.VSS.value = 0


async def start_clock(clock, freq=5):
    c = Clock(clock, 1 / freq * 1000, "ns")
    cocotb.start_soon(c.start())


async def reset(reset, active_low=True, time_ns=1000):
    cocotb.log.info("Reset asserted...")

    reset.value = not active_low
    await Timer(time_ns, "ns")
    reset.value = active_low

    cocotb.log.info("Reset deasserted.")


async def start_up(dut):
    await set_defaults(dut)
    if gl:
        await enable_power(dut)
    await start_clock(dut.clk)
    await reset(dut.rst_n)
    await ClockCycles(dut.clk, 2)


async def user_reboot(dut):
    dut.boot_complete.value = 0
    dut.cfg_done.value = 0
    dut.phase_offset_imported.value = 0
    dut.soft_rst.value = 1
    await ClockCycles(dut.clk, 1)
    dut.soft_rst.value = 0
    await ClockCycles(dut.clk, 2)


async def goto_readout(dut):
    dut.boot_complete.value = 1
    await ClockCycles(dut.clk, 2)
    dut.phase_offset_imported.value = 1
    dut.cfg_done.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_READOUT, "reached Readout via imported offsets")


@cocotb.test()
async def test_boot_to_calibration_freeze(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")

    await start_up(dut)

    logger.info("Running the test...")

    check_state(dut, S_BOOT, "reset lands in Boot")

    dut.boot_complete.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_LOAD_CFG, "boot_complete -> Load Config")

    dut.cfg_done.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_CAL, "cfg_done, no offset -> Calibration")
    assert dut.cal_start.value == 1, "cal_start tag must be on in Calibration"
    cocotb.log.info("PASS cal_start tag on")

    await ClockCycles(dut.clk, 10)
    dut.cal_done.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_FALLOUT, "cal_done -> Fallout Report (freeze)")
    assert dut.cal_start.value == 0, "cal_start must drop in freeze"
    assert dut.read_en.value == 0, "read_en must be off in freeze"
    assert dut.write_amp_ratio_en.value == 0, "amp write must be off in freeze"
    cocotb.log.info("PASS all outputs off while frozen")

    await ClockCycles(dut.clk, 50)
    check_state(dut, S_FALLOUT, "stays frozen until user reboot")

    logger.info("Done!")


@cocotb.test()
async def test_reboot_with_imported_offsets(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    dut.boot_complete.value = 1
    await ClockCycles(dut.clk, 2)
    dut.cfg_done.value = 1
    await ClockCycles(dut.clk, 2)
    dut.cal_done.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_FALLOUT, "frozen after first-pass calibration")

    await user_reboot(dut)
    dut.cal_done.value = 0  # wave controller cleared by the reboot
    check_state(dut, S_BOOT, "soft_rst exits freeze -> Boot")

    dut.boot_complete.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_LOAD_CFG, "second pass in Load Config")
    dut.phase_offset_imported.value = 1
    dut.cfg_done.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_READOUT, "offsets imported -> Readout, cal skipped")
    assert dut.read_en.value == 1, "read_en must be on in Readout"
    cocotb.log.info("PASS read_en on in Readout")

    logger.info("Done!")


@cocotb.test()
async def test_amp_ratio_adjuster(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")
    await goto_readout(dut)

    dut.amp_ratio_en.value = 1
    await ClockCycles(dut.clk, 2)
    dut.amp_ratio_en.value = 0
    check_state(dut, S_AMP_ADJ, "amp_ratio_en -> Amp Ratio Adjuster")
    assert dut.write_amp_ratio_en.value == 1, "amp write en must be on"
    assert dut.read_en.value == 0, "readout must pause during amp update"
    cocotb.log.info("PASS amp write on, readout paused")

    await ClockCycles(dut.clk, 10)
    dut.amp_update_done.value = 1
    await ClockCycles(dut.clk, 2)
    dut.amp_update_done.value = 0
    check_state(dut, S_READOUT, "amp_update_done -> back to Readout")
    assert dut.read_en.value == 1, "read_en must be back on"
    cocotb.log.info("PASS read_en restored")

    logger.info("Done!")


@cocotb.test()
async def test_calibration_timeout_freeze(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    dut.boot_complete.value = 1
    await ClockCycles(dut.clk, 2)
    dut.cfg_done.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_CAL, "in Calibration")

    await ClockCycles(dut.clk, 10)
    dut.cal_timeout.value = 1
    await ClockCycles(dut.clk, 2)
    check_state(dut, S_FALLOUT, "cal_timeout -> freeze")

    await user_reboot(dut)
    dut.cal_timeout.value = 0
    check_state(dut, S_BOOT, "reboot recovers from timeout freeze")

    logger.info("Done!")


@cocotb.test()
async def test_soft_rst_from_readout(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")
    await goto_readout(dut)

    await user_reboot(dut)
    check_state(dut, S_BOOT, "soft_rst from Readout -> Boot")

    logger.info("Done!")


def state_machine_runner():

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
        sources.append(proj_path / "../src/state_machine.sv")

    build_args = []

    if sim == "icarus":
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
        test_module="state_machine_tb",
        plusargs=plusargs,
        waves=True,
    )


if __name__ == "__main__":
    state_machine_runner()