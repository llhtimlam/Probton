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

hdl_toplevel = "integrator"

ADDR_MEMS_FCW_X_L = 0x01
ADDR_MEMS_FCW_X_H = 0x02
ADDR_MEMS_FCW_Y_L = 0x03
ADDR_MEMS_FCW_Y_H = 0x04

ADDR_PHASE0_OFF_X = 0x05
ADDR_PHASE90_OFF_X = 0x08
ADDR_PHASE270_OFF_X = 0x0B
ADDR_PHASE0_OFF_Y = 0x0E
ADDR_PHASE90_OFF_Y = 0x11
ADDR_PHASE270_OFF_Y = 0x14

ADDR_CTRL = 0x17

ADDR_STATUS = 0x4C
ADDR_STATE = 0x4D

CTRL_BOOT_COMPLETE = 0x01
CTRL_CFG_DONE = 0x02
CTRL_PHASE_OFFSET_IMPORTED = 0x04
CTRL_SOFT_RST = 0x08

SCLK_HALF = 8


async def set_defaults(dut):
    dut.spi_cs_n.value = 1
    dut.spi_sclk.value = 0
    dut.spi_mosi.value = 0


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
    await ClockCycles(dut.clk, 4)


async def spi_xfer(dut, r_w, address, data_bytes):
    if address < 0 or address > 127:
        raise ValueError("Address must be 7-bit (0-127)")

    first_byte = (int(r_w) << 7) | address

    async def send_byte(byte):
        got = 0
        for i in range(8):
            dut.spi_sclk.value = 0
            dut.spi_mosi.value = (byte >> (7 - i)) & 0x1
            await ClockCycles(dut.clk, SCLK_HALF)
            dut.spi_sclk.value = 1
            await ClockCycles(dut.clk, SCLK_HALF)
            got = (got << 1) | int(dut.spi_miso.value)
        return got

    dut.spi_sclk.value = 0
    dut.spi_cs_n.value = 0
    await ClockCycles(dut.clk, SCLK_HALF)

    await send_byte(first_byte)
    rx = []
    for b in data_bytes:
        rx.append(await send_byte(b))
    dut.spi_sclk.value = 0
    dut.spi_mosi.value = 0
    dut.spi_cs_n.value = 1
    await ClockCycles(dut.clk, 8)

    return rx


async def spi_write(dut, address, data_bytes):
    await spi_xfer(dut, 1, address, data_bytes)


async def spi_read(dut, address, n):
    return await spi_xfer(dut, 0, address, [0x00] * n)


@cocotb.test()
async def test_default_values(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    assert int(dut.cfg_f_MEMS_fcw_x.value) == 0x0000, "fcw x default"
    assert int(dut.cfg_f_MEMS_fcw_y.value) == 0x0000, "fcw y default"
    assert int(dut.cfg_phase0_offset_x.value) == 0, "phase0 x default"
    assert int(dut.cfg_phase0_offset_y.value) == 0, "phase0 y default"
    assert int(dut.boot_complete.value) == 0, "boot_complete default"
    assert int(dut.cfg_done.value) == 0, "cfg_done default"
    assert int(dut.phase_offset_imported.value) == 0, "phase_offset_imported default"
    assert int(dut.soft_rst_n.value) == 1, "soft_rst_n default"
    assert int(dut.state_o.value) == 0, "state machine default"
    assert int(dut.move_en_x.value) == 0, "move_en_x default"
    assert int(dut.move_en_y.value) == 0, "move_en_y default"
    assert int(dut.spi_miso_oe.value) == 0, "miso_oe default"
    cocotb.log.info("PASS reset defaults")

    logger.info("Done!")


@cocotb.test()
async def test_write_path(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x34, 0x12])
    assert int(dut.cfg_f_MEMS_fcw_x.value) == 0x1234, \
        f"fcw_x: expected 0x1234, got {int(dut.cfg_f_MEMS_fcw_x.value):#06x}"
    cocotb.log.info("PASS 16-bit FCW X burst write (auto-increment)")

    await spi_write(dut, ADDR_MEMS_FCW_Y_L, [0x78, 0x56])
    assert int(dut.cfg_f_MEMS_fcw_y.value) == 0x5678, \
        f"fcw_y: expected 0x5678, got {int(dut.cfg_f_MEMS_fcw_y.value):#06x}"
    cocotb.log.info("PASS 16-bit FCW Y burst write (auto-increment)")

    # 21-bit offset: byte 2 keeps only the low 5 bits
    await spi_write(dut, ADDR_PHASE90_OFF_X, [0xDE, 0xBC, 0xFF])
    assert int(dut.cfg_phase90_offset_x.value) == 0x1FBCDE, \
        f"phase90 x: expected 0x1fbcde, got {int(dut.cfg_phase90_offset_x.value):#08x}"
    cocotb.log.info("PASS 21-bit phase offset burst write")

    await spi_write(dut, ADDR_PHASE270_OFF_Y, [0x11, 0x22, 0x03])
    assert int(dut.cfg_phase270_offset_y.value) == 0x032211, \
        f"phase270 y: expected 0x032211, got {int(dut.cfg_phase270_offset_y.value):#08x}"
    cocotb.log.info("PASS phase offset reaches Y wave controller")

    logger.info("Done!")


@cocotb.test()
async def test_readback_over_miso(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x34, 0x12])
    rd = await spi_read(dut, ADDR_MEMS_FCW_X_L, 2)
    assert rd == [0x34, 0x12], f"fcw burst readback: {[hex(v) for v in rd]}"
    cocotb.log.info("PASS 16-bit FCW burst readback")

    await spi_write(dut, ADDR_PHASE0_OFF_X, [0xAA, 0x55, 0x1F])
    rd = await spi_read(dut, ADDR_PHASE0_OFF_X, 3)
    assert rd == [0xAA, 0x55, 0x1F], f"phase0 x readback: {[hex(v) for v in rd]}"
    cocotb.log.info("PASS 21-bit phase offset readback")

    rd = await spi_read(dut, ADDR_STATE, 1)
    assert rd[0] == int(dut.state_o.value), \
        f"state readback: expected {int(dut.state_o.value)}, got {rd[0]}"
    cocotb.log.info("PASS state register readback")

    logger.info("Done!")


@cocotb.test()
async def test_ctrl_register(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await spi_write(dut, ADDR_CTRL, [CTRL_BOOT_COMPLETE])
    assert int(dut.boot_complete.value) == 1, "boot_complete not set"
    assert int(dut.cfg_done.value) == 0, "cfg_done set unexpectedly"
    assert int(dut.soft_rst_n.value) == 1, "soft_rst_n asserted unexpectedly"
    cocotb.log.info("PASS boot_complete")

    await spi_write(dut, ADDR_CTRL, [CTRL_BOOT_COMPLETE | CTRL_CFG_DONE])
    assert int(dut.cfg_done.value) == 1, "cfg_done not set"
    cocotb.log.info("PASS cfg_done")

    await spi_write(dut, ADDR_CTRL,
                    [CTRL_BOOT_COMPLETE | CTRL_CFG_DONE | CTRL_PHASE_OFFSET_IMPORTED])
    assert int(dut.phase_offset_imported.value) == 1, "phase_offset_imported not set"
    cocotb.log.info("PASS phase_offset_imported")

    rd = await spi_read(dut, ADDR_CTRL, 1)
    assert rd[0] == 0x0F, f"ctrl readback: expected 0x0f, got {rd[0]:#04x}"
    cocotb.log.info("PASS ctrl readback")

    # bit 3 asserts the soft reset (soft_rst_n <= ~data[3])
    await spi_write(dut, ADDR_CTRL, [CTRL_SOFT_RST])
    assert int(dut.soft_rst_n.value) == 0, "soft_rst_n not asserted"
    await spi_write(dut, ADDR_CTRL, [0x00])
    assert int(dut.soft_rst_n.value) == 1, "soft_rst_n not released"
    cocotb.log.info("PASS soft reset control")

    logger.info("Done!")


@cocotb.test()
async def test_unmapped_write_ignored(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x3C, 0x3C])
    await spi_write(dut, 0x7F, [0xFF])          # unmapped
    assert int(dut.cfg_f_MEMS_fcw_x.value) == 0x3C3C, \
        "real register corrupted by unmapped write"
    cocotb.log.info("PASS unmapped write ignored")

    rd = await spi_read(dut, 0x7F, 1)
    assert rd[0] == 0x00, f"unmapped read: expected 0x00, got {rd[0]:#04x}"
    cocotb.log.info("PASS unmapped read returns 0")

    logger.info("Done!")


@cocotb.test()
async def test_cs_abort_recovery(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    dut.spi_cs_n.value = 0
    await ClockCycles(dut.clk, SCLK_HALF)
    for i in range(5):
        dut.spi_sclk.value = 0
        dut.spi_mosi.value = 1
        await ClockCycles(dut.clk, SCLK_HALF)
        dut.spi_sclk.value = 1
        await ClockCycles(dut.clk, SCLK_HALF)
    dut.spi_sclk.value = 0
    dut.spi_cs_n.value = 1
    await ClockCycles(dut.clk, 8)

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x5A, 0x5A])
    assert int(dut.cfg_f_MEMS_fcw_x.value) == 0x5A5A, \
        f"post-abort write failed: {int(dut.cfg_f_MEMS_fcw_x.value):#06x}"
    cocotb.log.info("PASS aborted transaction, clean recovery")

    logger.info("Done!")


@cocotb.test()
async def test_miso_oe(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    assert int(dut.spi_miso_oe.value) == 0, "miso_oe active while bus idle"

    dut.spi_cs_n.value = 0
    await ClockCycles(dut.clk, SCLK_HALF * 2)
    assert int(dut.spi_miso_oe.value) == 1, "miso_oe not asserted with cs low"
    dut.spi_cs_n.value = 1
    await ClockCycles(dut.clk, 8)
    assert int(dut.spi_miso_oe.value) == 0, "miso_oe stuck on after cs high"
    cocotb.log.info("PASS miso_oe follows cs_n")

    logger.info("Done!")


@cocotb.test()
async def test_state_machine_bringup(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    state_idle = int(dut.state_o.value)

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x00, 0x40])
    await spi_write(dut, ADDR_MEMS_FCW_Y_L, [0x00, 0x40])
    await spi_write(dut, ADDR_CTRL, [CTRL_BOOT_COMPLETE])
    await ClockCycles(dut.clk, 100)
    await spi_write(dut, ADDR_CTRL, [CTRL_BOOT_COMPLETE | CTRL_CFG_DONE])
    await ClockCycles(dut.clk, 100)
    await spi_write(dut, ADDR_CTRL,
                    [CTRL_BOOT_COMPLETE | CTRL_CFG_DONE | CTRL_PHASE_OFFSET_IMPORTED])
    await ClockCycles(dut.clk, 200)

    state_run = int(dut.state_o.value)
    logger.info(f"state_o: {state_idle} -> {state_run}")
    assert state_run != state_idle, "state machine never left the reset state"
    cocotb.log.info("PASS state machine bring-up")

    logger.info("Done!")


@cocotb.test()
async def test_mems_drive_toggles(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    # fcw = 0x4000 -> f_MEMS = 16384 * 5MHz / 2^21 = 39.06kHz (128 clk period)
    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x00, 0x40])
    await spi_write(dut, ADDR_MEMS_FCW_Y_L, [0x00, 0x40])
    await spi_write(dut, ADDR_CTRL,
                    [CTRL_BOOT_COMPLETE | CTRL_CFG_DONE | CTRL_PHASE_OFFSET_IMPORTED])
    await ClockCycles(dut.clk, 200)

    seen_x = set()
    seen_y = set()
    for i in range(2000):
        await RisingEdge(dut.clk)
        seen_x.add(int(dut.mems_drv_x.value))
        seen_y.add(int(dut.mems_drv_y.value))

    assert seen_x == {0, 1}, f"mems_drv_x did not toggle, saw {seen_x}"
    assert seen_y == {0, 1}, f"mems_drv_y did not toggle, saw {seen_y}"
    cocotb.log.info("PASS mems drive toggling on both axes")

    logger.info("Done!")


def integrator_runner():

    proj_path = Path(__file__).resolve().parent

    sources = []
    defines = {f"SLOT_{slot.upper()}": True}
    includes = [proj_path / "../src/"]

    if gl:
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "primitives.v")

        sources.append(proj_path / f"../final/pnl/{hdl_toplevel}.pnl.v")
        sources.append(proj_path / "../src/analog_macro.sv")

        defines = {"FUNCTIONAL": True, "USE_POWER_PINS": True}
    else:
        sources.append(proj_path / "../src/integrator.sv")

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
        test_module="integrator_tb",
        plusargs=plusargs,
        waves=True,
    )


if __name__ == "__main__":
    integrator_runner()