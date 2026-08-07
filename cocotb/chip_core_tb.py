# SPDX-FileCopyrightText: © 2026 Project Template Contributors
# SPDX-License-Identifier: Apache-2.0

import os
import random
import logging
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.handle import Force, Release
from cocotb.triggers import Timer, Edge, RisingEdge, FallingEdge, ClockCycles
from cocotb_tools.runner import get_runner

sim = os.getenv("SIM", "icarus")
pdk_root = os.getenv("PDK_ROOT", Path("~/.ciel").expanduser())
pdk = os.getenv("PDK", "gf180mcuD")
scl = os.getenv("SCL", "gf180mcu_fd_sc_mcu7t5v0")
gl = os.getenv("GL", False)
slot = os.getenv("SLOT", "1x1")

hdl_toplevel = "chip_core"

# SPI Setting
ADDR_AMP_RATIO = 0x00
ADDR_MEMS_FCW_X_L = 0x01
ADDR_MEMS_FCW_X_H = 0x02
ADDR_MEMS_FCW_Y_L = 0x03
ADDR_MEMS_FCW_Y_H = 0x04
ADDR_CTRL = 0x17
ADDR_STATE = 0x4D

CTRL_BOOT_COMPLETE = 0x01
CTRL_CFG_DONE = 0x02
CTRL_PHASE_OFFSET_IMPORTED = 0x04
CTRL_SOFT_RST = 0x08
CTRL_AMP_RATIO_EN = 0x10

# Wave Contorller Settings
NCO_BITS = 21
NCO_MOD = 1 << NCO_BITS  # 2097152
PWM_BITS = 8
PWM_MOD = 1 << PWM_BITS  # 256
PWM_MID = PWM_MOD // 2  # 128

QUARTER_OFFSET = NCO_MOD // 4  # 2^19 = 524288

# Pin
PIN_CS_N = 0
PIN_SCLK = 1
PIN_MOSI = 2
PIN_MISO = 3
PIN_MEMS_DRV_X = 8
PIN_MEMS_DRV_Y = 9

# State Machine
S_BOOT = 0
S_LOAD_CFG = 1
S_CAL = 2
S_FALLOUT = 3
S_READOUT = 4
S_AMP_ADJ = 5

# MEMS Frequency and timing Setting
F_CLK = 5000000 # 5MHz
FREQ_X = 300
FREQ_Y = 400
FCW_X = int(round((FREQ_X * NCO_MOD) / F_CLK)) # 126
FCW_Y = int(round((FREQ_Y * NCO_MOD) / F_CLK)) # 168
PERIOD_X = int(round(NCO_MOD / FCW_X)) # 16644
PERIOD_Y = int(round(NCO_MOD / FCW_Y)) # 12483
SCLK_HALF = 8

def get_pin(dut, bus, index):
    v = getattr(dut, bus).value
    s = str(v)
    ch = s[len(s) - 1 - index]
    return int(ch) if ch in "01" else None

async def drive_spi_pins(dut, cs_n, sclk, mosi):
    dut.bidir_in.value = (cs_n << PIN_CS_N) | (sclk << PIN_SCLK) | (mosi << PIN_MOSI)

async def set_defaults(dut):
    await drive_spi_pins(dut, 1, 0, 0)
    dut.input_in.value = 0

    if not gl:
        dut.comp_x.value = Force(0)
        dut.comp_y.value = Force(0)

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
            mosi = (byte >> (7 - i)) & 0x1
            await drive_spi_pins(dut, 0, 0, mosi)
            await ClockCycles(dut.clk, SCLK_HALF)
            await drive_spi_pins(dut, 0, 1, mosi)
            await ClockCycles(dut.clk, SCLK_HALF)
            got = (got << 1) | get_pin(dut, "bidir_out", PIN_MISO)
        return got

    await drive_spi_pins(dut, 1, 0, 0)
    await drive_spi_pins(dut, 0, 0, 0)
    await ClockCycles(dut.clk, SCLK_HALF)

    await send_byte(first_byte)
    rx = []
    for b in data_bytes:
        rx.append(await send_byte(b))
    await drive_spi_pins(dut, 1, 0, 0)
    await ClockCycles(dut.clk, 8)

    return rx

async def spi_write(dut, address, data_bytes):
    await spi_xfer(dut, 1, address, data_bytes)

async def spi_read(dut, address, n):
    return await spi_xfer(dut, 0, address, [0x00] * n)

async def sample_bidir_pin(dut, pin_name, pin_idx, n_clks):
    """Sample a bidir pin index over n_clks, one value per rising edge."""
    bits = []
    for _ in range(n_clks):
        await RisingEdge(dut.clk)
        # Capture the current 0 or 1 value of the pin
        val = get_pin(dut, pin_name, pin_idx)
        bits.append(int(val))
    return bits

async def wait_for_state(dut, state, timeout_clks=1000):
    """Wait until the FSM reaches a state, return how many clks it took.
    Returns on the same edge the state changes so the calibration timer
    and the comparator injection start together."""
    for i in range(timeout_clks):
        if int(dut.state_o.value) == state:
            return i
        await RisingEdge(dut.clk)
    raise AssertionError(
        f"state {state} not reached in {timeout_clks} clk, "
        f"stuck at {int(dut.state_o.value)}")

@cocotb.test()
async def test_default_values(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    assert int(dut.cfg_f_MEMS_fcw_x.value) == 0x0000, "fcw x default"
    assert int(dut.cfg_f_MEMS_fcw_y.value) == 0x0000, "fcw y default"
    assert int(dut.state_o.value) == S_BOOT, "state default"
    assert int(dut.soft_rst.value) == 0, "soft_rst default"
    assert int(dut.soft_rst_n.value) == 1, "soft_rst_n default"
    assert get_pin(dut, "bidir_oe", PIN_MISO) == 0, "miso_oe default"

    logger.info("Measuring default MEMS X/Y idle duty cycles...")
    
    # Sample long enough to capture complete PWM cycles (e.g., PWM_MOD * 8)
    sample_depth = PWM_MOD * 8
    
    x_bits = await sample_bidir_pin(dut, "bidir_out", PIN_MEMS_DRV_X, sample_depth)
    y_bits = await sample_bidir_pin(dut, "bidir_out", PIN_MEMS_DRV_Y, sample_depth)
    
    duty_x = sum(x_bits) / len(x_bits)
    duty_y = sum(y_bits) / len(y_bits)
    
    logger.info(f"mems_drv_x default duty: {duty_x:.4f}")
    logger.info(f"mems_drv_y default duty: {duty_y:.4f}")

    assert 0.48 < duty_x < 0.52, f"mems_drv_x default duty {duty_x:.4f} is not mid-rail"
    assert 0.48 < duty_y < 0.52, f"mems_drv_y default duty {duty_y:.4f} is not mid-rail"
    
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

    rd = await spi_read(dut, ADDR_STATE, 1)
    assert rd[0] == int(dut.state_o.value), \
        f"state readback: expected {int(dut.state_o.value)}, got {rd[0]}"
    cocotb.log.info("PASS state readback")

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

    logger.info("Done!")

@cocotb.test()
async def test_cs_abort_recovery(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await drive_spi_pins(dut, 0, 0, 0)
    await ClockCycles(dut.clk, SCLK_HALF)
    for i in range(5):
        await drive_spi_pins(dut, 0, 0, 1)
        await ClockCycles(dut.clk, SCLK_HALF)
        await drive_spi_pins(dut, 0, 1, 1)
        await ClockCycles(dut.clk, SCLK_HALF)
    await drive_spi_pins(dut, 1, 0, 0)
    await ClockCycles(dut.clk, 8)

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [0x5A, 0x5A])
    assert int(dut.cfg_f_MEMS_fcw_x.value) == 0x5A5A, \
        f"post-abort write failed: {int(dut.cfg_f_MEMS_fcw_x.value):#06x}"
    cocotb.log.info("PASS aborted transaction, clean recovery")

    logger.info("Done!")

@cocotb.test()
async def test_soft_rst_from_calibration(dut):
    """Soft reset now works from any state, including a stuck S_CAL."""
    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    logger.info("Running the test...")

    await spi_write(dut, ADDR_CTRL, [CTRL_BOOT_COMPLETE])
    await wait_for_state(dut, S_LOAD_CFG)
    await spi_write(dut, ADDR_CTRL, [CTRL_BOOT_COMPLETE | CTRL_CFG_DONE])
    await wait_for_state(dut, S_CAL)
    cocotb.log.info("PASS in calibration")

    await spi_write(dut, ADDR_CTRL, [CTRL_SOFT_RST])
    await wait_for_state(dut, S_BOOT)
    assert int(dut.cal_start.value) == 0, "cal_start still on after soft reset"
    cocotb.log.info("PASS soft reset escapes calibration")

    logger.info("Done!")

@cocotb.test()
async def test_comparator_x_y(dut):

    logger = logging.getLogger("my_testbench")

    logger.info("Startup sequence...")
    await start_up(dut)

    if gl:
        cocotb.log.info("SKIP comparator injection under GL")
        return

    logger.info("Running the test...")

    await spi_write(dut, ADDR_MEMS_FCW_X_L, [FCW_X & 0xFF, FCW_X >> 8])
    await spi_write(dut, ADDR_MEMS_FCW_Y_L, [FCW_Y & 0xFF, FCW_Y >> 8])

    await spi_write(dut, ADDR_CTRL, [CTRL_BOOT_COMPLETE])
    n = await wait_for_state(dut, S_LOAD_CFG)
    logger.info(f"S_LOAD_CFG reached after {n} clk")

    await spi_write(dut, ADDR_CTRL, [CTRL_BOOT_COMPLETE | CTRL_CFG_DONE])
    n = await wait_for_state(dut, S_CAL)
    logger.info(f"S_CAL reached after {n} clk")

    # cal_start is combinational off the state, so the calibration timer
    # starts on this edge. Injection below starts from the same edge.
    assert int(dut.cal_start.value) == 1, "cal_start not asserted on entry to S_CAL"
    logger.info(f"delay_wave_cycle x/y at cal_start = "
                f"{int(dut.delay_wave_cycle_x.value)}/"
                f"{int(dut.delay_wave_cycle_y.value)}")
    cocotb.log.info("PASS entered calibration, cal_start asserted")

    # The wave controller expects comp to be the sign of the FILTERED analog
    # signal, not the raw delta-sigma bitstream on mems_drv. Model it as a
    # square wave from an NCO matching the RTL, offset by the mechanical lag
    # that calibration is trying to measure.
    LAG = QUARTER_OFFSET          # 90 degrees of lag
    acc_x = 0
    acc_y = 0

    # mems_drv is a delta-sigma stream, so track density per PWM_MOD window
    ones_x = 0
    ones_y = 0
    duty_x = []
    duty_y = []

    run = PERIOD_X * 4
    for i in range(run):
        await RisingEdge(dut.clk)

        acc_x = (acc_x + FCW_X) % NCO_MOD
        acc_y = (acc_y + FCW_Y) % NCO_MOD
        dut.comp_x.value = Force(((acc_x - LAG) % NCO_MOD) >> (NCO_BITS - 1))
        dut.comp_y.value = Force(((acc_y - LAG) % NCO_MOD) >> (NCO_BITS - 1))

        drv_x = get_pin(dut, "bidir_out", PIN_MEMS_DRV_X)
        drv_y = get_pin(dut, "bidir_out", PIN_MEMS_DRV_Y)
        assert drv_x is not None, "mems_drv_x went X during calibration"
        assert drv_y is not None, "mems_drv_y went X during calibration"

        ones_x += drv_x
        ones_y += drv_y
        if (i + 1) % PWM_MOD == 0:
            duty_x.append(ones_x / PWM_MOD)
            duty_y.append(ones_y / PWM_MOD)
            ones_x = 0
            ones_y = 0

    logger.info(f"mems_drv_x density min/max/mean: {min(duty_x):.4f}/"
                f"{max(duty_x):.4f}/{sum(duty_x)/len(duty_x):.4f}")
    logger.info(f"mems_drv_y density min/max/mean: {min(duty_y):.4f}/"
                f"{max(duty_y):.4f}/{sum(duty_y)/len(duty_y):.4f}")

    assert max(duty_x) - min(duty_x) > 0.1, \
        f"mems_drv_x density not moving (spread {max(duty_x) - min(duty_x):.4f}), " \
        "sine burst never fired"
    assert max(duty_y) - min(duty_y) > 0.1, \
        f"mems_drv_y density not moving (spread {max(duty_y) - min(duty_y):.4f}), " \
        "sine burst never fired"
    cocotb.log.info("PASS sine burst on both axes at 300Hz / 400Hz")

    logger.info(f"delay_wave_cycle x/y = {int(dut.delay_wave_cycle_x.value)}/"
                f"{int(dut.delay_wave_cycle_y.value)}")
    logger.info(f"raw_edge x = {int(dut.raw_edge1_x.value)}/"
                f"{int(dut.raw_edge2_x.value)}/{int(dut.raw_edge3_x.value)}")
    logger.info(f"raw_edge y = {int(dut.raw_edge1_y.value)}/"
                f"{int(dut.raw_edge2_y.value)}/{int(dut.raw_edge3_y.value)}")
    logger.info(f"cal_dir x/y = {int(dut.cal_dir_x.value)}/{int(dut.cal_dir_y.value)}")

    assert int(dut.cal_done_x.value) == 1, "X calibration never completed"
    assert int(dut.cal_done_y.value) == 1, "Y calibration never completed"
    assert int(dut.cal_timeout_x.value) == 0, "X calibration timed out"
    assert int(dut.cal_timeout_y.value) == 0, "Y calibration timed out"
    cocotb.log.info("PASS both axes captured 3 edges, cal_done latched")

    assert int(dut.state_o.value) == S_FALLOUT, \
        f"cal_done should advance to S_FALLOUT, got {int(dut.state_o.value)}"
    cocotb.log.info("PASS cal_done (X AND Y) advanced the FSM to S_FALLOUT")

    dut.comp_x.value = Release()
    dut.comp_y.value = Release()

    logger.info("Done!")


def chip_core_runner():

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
        sources.append(proj_path / "../src/chip_core.sv")

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
        test_module="chip_core_tb",
        plusargs=plusargs,
        waves=True,
    )

if __name__ == "__main__":
    chip_core_runner()