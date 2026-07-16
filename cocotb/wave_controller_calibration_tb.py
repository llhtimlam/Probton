# SPDX-FileCopyrightText: © 2025 Project Template Contributors
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

hdl_toplevel = "wave_controller"

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

async def set_defaults(dut):
    # Set all input in the module to default
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
    cocotb.log.info("Reset asserted...")

    reset.value = not active_low
    await Timer(time_ns, "ns")
    reset.value = active_low

    cocotb.log.info("Reset deasserted.")


async def start_up(dut):
    """Startup sequence"""
    await set_defaults(dut)
    dut.soft_rst_n.value = 1
    if gl:
        await enable_power(dut)
    await start_clock(dut.clk)
    await reset(dut.rst_n)


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
        test_module="wave_controller_calibration_tb",
        plusargs=plusargs,
        waves=True,
    )


if __name__ == "__main__":
    wave_controller_runner()
