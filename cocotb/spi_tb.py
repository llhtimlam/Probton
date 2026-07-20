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

hdl_toplevel = "spi_regs"

ADDR_AMP_RATIO    = 0x00
ADDR_MEMS_FCW_X_L = 0x01
ADDR_MEMS_FCW_X_H = 0x02
ADDR_MEMS_FCW_Y_L = 0x03
ADDR_MEMS_FCW_Y_H = 0x04

SCLK_HALF = 8

async def set_defaults(dut):
    dut.spi_cs_n.value = 1
    dut.spi_sclk.value = 0
    dut.spi_mosi.value = 0

    dut.delay_wave_cycle_x.value = 0
    dut.delay_wave_cycle_y.value = 0
    dut.raw_edge1_x.value = 0
    dut.raw_edge2_x.value = 0
    dut.raw_edge3_x.value = 0
    dut.raw_edge1_y.value = 0
    dut.raw_edge2_y.value = 0
    dut.raw_edge3_y.value = 0
    dut.cal_dir_x.value = 0
    dut.cal_dir_y.value = 0
    dut.cal_phase0_offset_x.value = 0
    dut.cal_phase90_offset_x.value = 0
    dut.cal_phase270_offset_x.value = 0
    dut.cal_phase0_offset_y.value = 0
    dut.cal_phase90_offset_y.value = 0
    dut.cal_phase270_offset_y.value = 0
    dut.cal_timeout_x.value = 0
    dut.cal_timeout_y.value = 0
    dut.latch_error_x.value = 0
    dut.latch_error_y.value = 0
    dut.state_o.value = 0


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
    if address <0 or address > 127:
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
async def test_write_path(dut):
    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await spi_write(dut, ADDR_AMP_RATIO, [0xA5])
    assert int(dut.cfg_amp_ratio.value) == 0xA5, \
        f"cfg_amp_ratio: expected 0xa5, got {int(dut.cfg_amp_ratio.value):#04x}"
    cocotb.log.info("PASS amp ratio write")

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x34, 0x12])
    assert int(dut.cfg_f_MEMS_fcw_x.value) == 0x1234, \
        f"fcw_x: expected 0x1234, got {int(dut.cfg_f_MEMS_fcw_x.value):#06x}"
    cocotb.log.info("PASS 16-bit FCW burst write (auto-increment)")

    logger.info("Done!")

@cocotb.test()
async def test_readback_over_miso(dut):
    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await spi_write(dut, ADDR_AMP_RATIO, [0xA5])
    rd = await spi_read(dut, ADDR_AMP_RATIO, 1)
    assert rd[0] == 0xA5, f"amp readback: expected 0xa5, got {rd[0]:#04x}"
    cocotb.log.info("PASS amp readback")

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x34, 0x12])
    rd = await spi_read(dut, ADDR_MEMS_FCW_X_L, 2)
    assert rd == [0x34, 0x12], f"fcw burst readback: {[hex(v) for v in rd]}"
    cocotb.log.info("PASS 16-bit FCW burst readback")

    logger.info("Done!")


@cocotb.test()
async def test_default_values(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    assert int(dut.cfg_amp_ratio.value) == 0x00, "amp default"
    assert int(dut.cfg_f_MEMS_fcw_x.value) == 0x0000, "fcw x default"
    assert int(dut.cfg_f_MEMS_fcw_y.value) == 0x0000, "fcw y default"
    cocotb.log.info("PASS reset defaults")

    logger.info("Done!")

@cocotb.test()
async def test_unmapped_write_ignored(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await spi_write(dut, ADDR_AMP_RATIO, [0x3C])
    await spi_write(dut, 0x7F, [0xFF])          # unmapped
    assert int(dut.cfg_amp_ratio.value) == 0x3C, \
        "real register corrupted by unmapped write"
    cocotb.log.info("PASS unmapped write ignored")

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

    await spi_write(dut, ADDR_AMP_RATIO, [0x5A])
    assert int(dut.cfg_amp_ratio.value) == 0x5A, \
        f"post-abort write failed: {int(dut.cfg_amp_ratio.value):#04x}"
    cocotb.log.info("PASS aborted transaction, clean recovery")

    logger.info("Done!")


def spi_regs_runner():

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
        sources.append(proj_path / "../src/spi.sv")

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
        test_module="spi_tb",
        plusargs=plusargs,
        waves=True,
    )


if __name__ == "__main__":
    spi_regs_runner()