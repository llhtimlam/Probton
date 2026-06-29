import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.axes_grid1.inset_locator import inset_axes, mark_inset
from config import *

# ==========================================
# ERROR INJECTION FUNCTION (Analog domain only)
# ==========================================
def inject_errors(y_clean):
    """Analog domain errors only (photocurrent, TIA, filter)"""
    if not ENABLE_SIGNAL_ERRORS:
        return y_clean
    
    y_noisy = y_clean.copy()
    
    if ENABLE_WHITE_NOISE and WHITE_NOISE_LEVEL > 0:
        white_noise = np.random.normal(0, WHITE_NOISE_LEVEL * ERROR_LEVEL, len(y_noisy))
        y_noisy += white_noise
    
    if ENABLE_SHOT_NOISE and SHOT_NOISE_LEVEL > 0:
        lambda_param = np.clip(y_noisy * 1000, 0, None)
        shot_noise = np.random.poisson(lambda_param) / 1000 - y_noisy
        y_noisy += shot_noise * SHOT_NOISE_LEVEL * ERROR_LEVEL
    
    # QUANTIZATION REMOVED - now in VTT
    
    if ENABLE_SINE_RIPPLE and SINE_RIPPLE_AMPLITUDE > 0:
        x_pos = np.linspace(0, 2*np.pi, len(y_noisy))
        ripple = SINE_RIPPLE_AMPLITUDE * ERROR_LEVEL * np.sin(SINE_RIPPLE_FREQ * x_pos)
        y_noisy += ripple
    
    if ENABLE_OFFSET_DRIFT and OFFSET_DRIFT > 0:
        drift = np.linspace(0, OFFSET_DRIFT * ERROR_LEVEL, len(y_noisy))
        y_noisy += drift
    
    if ENABLE_SPIKE_NOISE and SPIKE_RATE > 0 and SPIKE_AMPLITUDE > 0:
        num_spikes = int(len(y_noisy) * SPIKE_RATE)
        spike_indices = np.random.choice(len(y_noisy), min(num_spikes, len(y_noisy)), replace=False)
        y_noisy[spike_indices] += np.random.uniform(-SPIKE_AMPLITUDE * ERROR_LEVEL, 
                                                    SPIKE_AMPLITUDE * ERROR_LEVEL, 
                                                    len(spike_indices))
    
    return np.clip(y_noisy, 0, None)

# ==========================================
# VOLTAGE-TO-TIME CONVERSION ERRORS (8-bit)
# ==========================================

def voltage_to_time_convert(area_analog):
    """
    Simulate 8-bit Voltage-to-Time conversion with realistic errors
    area_analog: true area value from integrator (0-2.0 range)
    returns: quantized area with VTT errors
    """
    if not ENABLE_VTT_ERRORS:
        return area_analog
    
    # Ideal code (8-bit)
    max_code = 2**BITS - 1
    ideal_code = int(area_analog / VTT_VREF * max_code)
    ideal_code = np.clip(ideal_code, 0, max_code)
    
    # 1. Comparator offset (adds constant offset)
    offset_codes = np.random.normal(0, VTT_OFFSET_LSB)
    
    # 2. Current source noise (gain error)
    gain_error = 1 + np.random.normal(0, VTT_GAIN_ERROR)
    
    # 3. Clock jitter (adds random timing noise)
    jitter_codes = np.random.normal(0, VTT_CLOCK_JITTER_NS / 10)
    
    # 4. Nonlinearity (INL)
    inl_error = np.random.uniform(-VTT_NONLINEARITY_LSB, VTT_NONLINEARITY_LSB)
    
    # Combine errors
    noisy_code = ideal_code * gain_error + offset_codes + jitter_codes + inl_error
    noisy_code = int(np.clip(noisy_code, 0, max_code))
    
    # Convert back to area
    area_vtt = noisy_code * VTT_VREF / max_code
    
    return area_vtt

# Precompute log table (256 entries) using the same VTT reference
LOG_TABLE = None

def init_log_table():
    global LOG_TABLE
    max_code = 2**BITS - 1
    LOG_TABLE = np.zeros(2**BITS)
    for code in range(2**BITS):
        area = code / max_code
        # Add a small epsilon to avoid log(0)
        LOG_TABLE[code] = np.log(max(area, + 1e-6))

def log_8bit(x):
    """Return log(x) using an 8‑bit lookup table. x must be in [0,1]."""
    if not ENABLE_BIT_LOG:
        return np.log(x + 1e-10)
    # ---------- 8-bit LUT version ----------
    if LOG_TABLE is None:
        init_log_table()
    max_code = 2**BITS - 1
    code = int(round(x * max_code))
    code = max(0, min(max_code, code))
    return LOG_TABLE[code]

def quantize_amplitude(amp):
    """Quantize amplitude to bits. amp must be in [0,1]."""
    if not ENABLE_BIT_LOG:
        return amp
    max_code = 2**BITS - 1
    code = int(round(amp * max_code))
    code = max(0, min(max_code, code))
    return code / max_code

# ==========================================
# HARDWARE EXECUTION WITH REALISTIC MOTOR ERRORS
# ==========================================
def execute_motor_step(command_code, current_position):
    """
    command_code : 8-bit integer control signal (-128..127 or 0..255)
    Returns: new_position (in simulation units), actual_move (simulation units), command_code
    """
    # Clamp to valid 8-bit range (signed or unsigned)
    code = int(round(command_code))
    code = max(MIN_CODE, min(MAX_CODE, code))

    # Apply electronic gear ratio: convert code to desired move in simulation units
    desired_um = code * MOTOR_GEAR_RATIO

    # ---- Motor imperfections (same units) ----
    if not ENABLE_MOTOR_ERRORS:
        return current_position + desired_um, desired_um, code

    if abs(desired_um) < BACKLASH_UM:
        return current_position, 0, code

    actual_move = desired_um * (1 + np.random.uniform(-STEP_ERROR_PERCENT, STEP_ERROR_PERCENT))
    if abs(actual_move) < MIN_MOVE_UM:
        actual_move = 0

    return current_position + actual_move, actual_move, code

# ==========================================
# AREA CALCULATION (Compatible with all numpy versions)
# ==========================================
def sweep_sensor(center_position, left_wing, right_wing, sigma, return_clean=False):
    lower_bound = center_position - left_wing
    upper_bound = center_position + right_wing
    x_trace = np.linspace(lower_bound, upper_bound, 300)
    y_trace_clean = np.exp(-(x_trace**2) / (2 * sigma**2))
    y_trace_noisy = inject_errors(y_trace_clean)
    if return_clean:
        return x_trace, y_trace_clean, y_trace_noisy
    return x_trace, y_trace_noisy

def calculate_area(x, y):
    """
    Calculate area under curve using trapezoidal rule,
    then apply Voltage-to-Time conversion (8-bit emulation)
    """
    # Calculate area using trapezoidal rule
    try:
        area = np.trapezoid(y, x)
    except AttributeError:
        area = np.trapz(y, x)
    
    # Apply Voltage-to-Time conversion (8-bit with errors) -> result in volts [0, VTT_VREF]
    area_v = voltage_to_time_convert(area)
    
    # Normalize to [0,1]
    return area_v / VTT_VREF

def run_AA(plotting=False, verbose=False):

    # ==========================================
    # RANDOMIZED HARDWARE COMPONENT SELECTION
    # ==========================================
    step_dist_1_to_2 = np.random.randint(MIN_STEP, MAX_STEP + 1)
    vibration_span    = VIBRATION_SPAN

    skew_factor = np.random.uniform(-MAX_ASYMMETRIC_SKEW, MAX_ASYMMETRIC_SKEW)
    left_wing   = (vibration_span / 2) * (1.0 + skew_factor)
    right_wing  = (vibration_span / 2) * (1.0 - skew_factor)

    total_mems_span = left_wing + right_wing
    left_pct        = (left_wing / total_mems_span) * 100
    right_pct       = (right_wing / total_mems_span) * 100

    if verbose:
        # ==========================================
        # PRINT ERROR CONFIGURATION
        # ==========================================
        print("\n" + "="*80)
        print("SIMULATION CONFIGURATION")
        print("="*80)

        print("\nALGORITHM TARGETS: ({ALIGNMENT_THRESHOLD:.3f} µm")

        print("\nMOTOR ERRORS:")
        if ENABLE_MOTOR_ERRORS:
            print(f"ENABLED - Backlash: {BACKLASH_UM}µm, Min Move: {MIN_MOVE_UM}µm, Step Error: ±{STEP_ERROR_PERCENT*100:.0f}%")
        else:
            print("DISABLED - Ideal motor")

        print("\nANALOG SIGNAL ERRORS:")
        if not ENABLE_SIGNAL_ERRORS:
            print("   DISABLED - Clean signal")
        else:
            print(f"   ENABLED - Error Level: {ERROR_LEVEL:.1%}")
            print(f"      • White Noise: {WHITE_NOISE_LEVEL * ERROR_LEVEL:.4f}")
            print(f"      • Shot Noise: {SHOT_NOISE_LEVEL * ERROR_LEVEL:.4f}")
            print(f"      • Sine Ripple: {SINE_RIPPLE_AMPLITUDE * ERROR_LEVEL:.4f}")
            print(f"      • Offset Drift: {OFFSET_DRIFT * ERROR_LEVEL:.4f}")

        print("\nVOLTAGE-TO-TIME CONVERSION (8-bit):")
        if ENABLE_VTT_ERRORS:
            print(f"   ENABLED - {BITS}-bit resolution")
            print(f"      • VREF: {VTT_VREF}V")
            print(f"      • Comparator Offset: {VTT_OFFSET_LSB} LSB")
            print(f"      • Gain Error: {VTT_GAIN_ERROR*100:.1f}%")
            print(f"      • Clock Jitter: {VTT_CLOCK_JITTER_NS}ns")
            print(f"      • INL: ±{VTT_NONLINEARITY_LSB} LSB")
        else:
            print("   DISABLED - Ideal area")

        print("\nBIT LOG & AMPLITUDE QUANTIZATION:")
        if ENABLE_BIT_LOG:
            print(f"   ENABLED - {BITS}-bit log lookup table (normalized [0,1])")
        else:
            print("   DISABLED - using floating-point np.log")
        print(f"   Amplitude quantization: {'ENABLED' if ENABLE_BIT_LOG else 'DISABLED'} (range [0,1], {BITS} bits)")

        print("\nMOTOR COMMAND INTERFACE:")
        print(f"   Command type: {'signed' if MOTOR_COMMAND_SIGNED else 'unsigned'} 8-bit")
        print(f"   Command range: {MIN_CODE}..{MAX_CODE}")
        print(f"   Gear ratio: {MOTOR_GEAR_RATIO} µm per count")
        print(f"   Motor errors: {'ENABLED' if ENABLE_MOTOR_ERRORS else 'DISABLED'}")

    # ==========================================
    # PHYSICAL STEP 1
    # ==========================================
    X1 = np.random.uniform(*INITIAL_OFFSET_BOUNDS)
    X1_trace, Y1_clean, Y1_noisy = sweep_sensor(X1, left_wing, right_wing, sigma, return_clean=True)
    Y1_trace = Y1_noisy

    max_Y1 = np.max(Y1_trace)
    min_Y1 = np.min(Y1_trace)
    delta_Y1 = max_Y1 - min_Y1
    area_A1 = calculate_area(X1_trace, Y1_trace)

    # ==========================================
    # PHYSICAL STEP 2
    # ==========================================
    initial_direction = 1.0 if X1 < 0 else -1.0
    command_step1 = initial_direction * step_dist_1_to_2
    X2, actual_move12, _ = execute_motor_step(command_step1, X1)
    X2_trace, Y2_clean, Y2_noisy = sweep_sensor(X2, left_wing, right_wing, sigma, return_clean=True)
    Y2_trace = Y2_noisy

    max_Y2 = np.max(Y2_trace)
    min_Y2 = np.min(Y2_trace)
    delta_Y2 = max_Y2 - min_Y2
    area_A2 = calculate_area(X2_trace, Y2_trace)

    # ==========================================
    # ALGORITHM TRACK 1: LOG-DELTA
    # ==========================================
    slope_sign_step1 = 1.0 if Y1_trace[-1] >= Y1_trace[0] else -1.0
    slope_sign_step2 = 1.0 if Y2_trace[-1] >= Y2_trace[0] else -1.0

    max_Y1_q = quantize_amplitude(max_Y1)
    min_Y1_q = quantize_amplitude(min_Y1)
    max_Y2_q = quantize_amplitude(max_Y2)
    min_Y2_q = quantize_amplitude(min_Y2)

    G1 = (log_8bit(max_Y1_q) - log_8bit(min_Y1_q)) * slope_sign_step1
    G2 = (log_8bit(max_Y2_q) - log_8bit(min_Y2_q)) * slope_sign_step2

    denominator_delta = G2 - G1
    if abs(denominator_delta) > 1e-3:
        # slope = (G2 - G1) / (X2 - X1)
        # final_target_delta = X1 - G1 / slope
        command_step_delta = -G2 * command_step1 / denominator_delta
    else:
        command_step_delta = 0

    final_target_delta, _, _ = execute_motor_step(command_step_delta, X2)

    final_delta_x_trace, final_delta_clean, final_delta_noisy = sweep_sensor(final_target_delta, left_wing, right_wing, sigma, return_clean=True)
    final_delta_y_trace = final_delta_noisy
    final_delta_max = np.max(final_delta_y_trace)
    final_delta_min = np.min(final_delta_y_trace)
    final_delta_val = final_delta_max - final_delta_min
    final_delta_area = calculate_area(final_delta_x_trace, final_delta_y_trace)

    # =========================================================================
    # TRACKING LOOP (Evaluates condition AFTER initial sampling)
    # =========================================================================
    delta_y1_trace = Y2_trace
    delta_max_y1  = max_Y2
    delta_min_y1  = min_Y2

    delta_y2_trace = final_delta_y_trace
    delta_max_y2  = final_delta_max
    delta_min_y2  = final_delta_min

    delta_x2      = final_target_delta
    delta_step   = command_step_delta

    converge_delta = 3
    delta_history = []

    while abs(final_target_delta) > ALIGNMENT_THRESHOLD and converge_delta < TIMEOUT:
        converge_delta += 1
        
        slope_sign_step1 = 1.0 if delta_y1_trace[-1] >= delta_y1_trace[0] else -1.0
        slope_sign_step2 = 1.0 if delta_y2_trace[-1] >= delta_y2_trace[0] else -1.0

        max_Y1_q = quantize_amplitude(delta_max_y1)
        min_Y1_q = quantize_amplitude(delta_min_y1)
        max_Y2_q = quantize_amplitude(delta_max_y2)
        min_Y2_q = quantize_amplitude(delta_min_y2)

        G1 = (log_8bit(max_Y1_q) - log_8bit(min_Y1_q)) * slope_sign_step1
        G2 = (log_8bit(max_Y2_q) - log_8bit(min_Y2_q)) * slope_sign_step2

        denominator_delta = G2 - G1
        if abs(denominator_delta) > 1e-3:
            command_step_delta = -G2 * delta_step / denominator_delta
        else:
            direction_to_center = 1.0 if delta_x2 < 0 else -1.0
            command_step_delta = direction_to_center # Apply force nudge to prevent stuck in loop

        # Execute next tracking step
        final_target_delta, _, _ = execute_motor_step(command_step_delta, delta_x2)

        delta_history.append([int(round(command_step_delta)), final_target_delta])

        # Sample new data trace
        final_delta_x_trace, final_delta_clean, final_delta_noisy = sweep_sensor(final_target_delta, left_wing, right_wing, sigma, return_clean=True)
        final_delta_y_trace = final_delta_noisy
        final_delta_max = np.max(final_delta_y_trace)
        final_delta_min = np.min(final_delta_y_trace)
        final_delta_val = final_delta_max - final_delta_min
        final_delta_area = calculate_area(final_delta_x_trace, final_delta_y_trace)

        # Shift streaming data frames forward for the next iteration
        delta_y1_trace = delta_y2_trace
        delta_max_y1  = delta_max_y2
        delta_min_y1  = delta_min_y2
        
        delta_y2_trace = final_delta_y_trace
        delta_max_y2  = final_delta_max
        delta_min_y2  = final_delta_min
        
        delta_x2      = final_target_delta
        delta_step    = command_step_delta


    # ==========================================
    # ALGORITHM TRACK 2: LOG-AREA
    # ==========================================
    # Smart random
    area_ratio = area_A2 / area_A1 if area_A1 > 0 else 1.0
    direction_to_center = 1.0 if X2 < 0 else -1.0
    crossed_axis = (X1 * X2) < 0

    if not crossed_axis: # Alwayas toward center
        min_bound = MIN_STEP
        max_bound = MAX_STEP
        area_heading = direction_to_center

    else: # Handle overshoot (Known by MEMs and readout wave)
        # Adjust bounds for random steps based on area ratio
        if area_ratio > 1.0: # Damped reverse
            min_bound = MIN_STEP
            max_bound = int(round(max(MIN_STEP, step_dist_1_to_2 / 2)))  # Upper bound (Capped with min_step)
            area_heading = direction_to_center
        else: # Over-extended reverse
            min_bound = int(round(step_dist_1_to_2 / 2))  # Lower bound
            max_bound = int(round(step_dist_1_to_2 / 2 * 1.05))  # Conservative reverse in case initial at peak
            area_heading = direction_to_center

    step_dist_2_to_2b = np.random.randint(min_bound, max_bound + 1)
    command_step2 = area_heading * step_dist_2_to_2b
    X2b, actual_move2b2, _ = execute_motor_step(command_step2, X2)
    X2b_trace, Y2b_clean, Y2b_noisy = sweep_sensor(X2b, left_wing, right_wing, sigma, return_clean=True)
    Y2b_trace = Y2b_noisy

    max_Y2b = np.max(Y2b_trace)
    min_Y2b = np.min(Y2b_trace)
    delta_Y2b = max_Y2b - min_Y2b
    area_A2b = calculate_area(X2b_trace, Y2b_trace)

    ln_A1  = log_8bit(area_A1)
    ln_A2  = log_8bit(area_A2)
    ln_A2b = log_8bit(area_A2b)

    h1 = command_step1
    h2 = command_step2

    if abs(h1) < 1e-3 or abs(h2) < 1e-3:
        denominator_area = 0.0
    else:
        denominator_area = (ln_A2b - ln_A2) / h2 - (ln_A2 - ln_A1) / h1

    if abs(denominator_area) > 1e-3 and abs(h1 + h2) > 1e-3 and abs(ln_A2 - ln_A1) > 1e-3:
        command_step_area = (-h1 / 2.0 - h2) - ((ln_A2 - ln_A1) / (2.0 * h1 * denominator_area)) * (h1 + h2) # (X1 + X2) / 2.0 - ((ln_A2 - ln_A1) / (2.0 * h1 * denominator_area)) * (h1 + h2)
    else:
        command_step_area = 0

    final_target_area, _, _ = execute_motor_step(command_step_area, X2b)
    final_area_x_trace, final_area_clean, final_area_noisy = sweep_sensor(final_target_area, left_wing, right_wing, sigma, return_clean=True)
    final_area_y_trace = final_area_noisy
    final_area_max = np.max(final_area_y_trace)
    final_area_min = np.min(final_area_y_trace)
    final_area_delta = final_area_max - final_area_min
    final_area_val = calculate_area(final_area_x_trace, final_area_y_trace)

    # =========================================================================
    # TRACKING LOOP (Evaluates condition AFTER initial sampling)
    # =========================================================================
    area_ln_A1 = ln_A2
    area_h1    = h2

    area_ln_A2 = ln_A2b
    area_h2    = command_step_area

    area_ln_A2b = log_8bit(calculate_area(final_area_x_trace, final_area_y_trace))
    area_X2b   = final_target_area

    converge_area = 4
    area_history = []

    while abs(final_target_area) > ALIGNMENT_THRESHOLD and converge_area < TIMEOUT:
        converge_area += 1

        if abs(area_h1) < 1e-3 or abs(area_h2) < 1e-3:
            denominator_area = 0.0
        else:
            denominator_area = (area_ln_A2b - area_ln_A2) / area_h2 - (area_ln_A2 - area_ln_A1) / area_h1

        if abs(denominator_area) > 1e-3 and abs(area_h1 + area_h2) > 1e-3 and abs(area_ln_A2 - area_ln_A1) > 1e-3:
            command_step_area = (-area_h1 / 2.0 - area_h2) - ((area_ln_A2 - area_ln_A1) / (2.0 * area_h1 * denominator_area)) * (area_h1 + area_h2)
        else:
            direction_to_center = 1.0 if area_X2b < 0 else -1.0
            command_step_area = direction_to_center # Apply force nudge to prevent stuck in loop
        
        if np.isnan(command_step_area) or np.isinf(command_step_area):
            direction_to_center = 1.0 if area_X2b < 0 else -1.0
            command_step_area = direction_to_center
        
        # Execute next tracking step
        final_target_area, _, _ = execute_motor_step(command_step_area, area_X2b)
        
        area_history.append([int(round(command_step_area)), final_target_area])

        # Sample new data trace
        final_area_x_trace, final_area_clean, final_area_noisy = sweep_sensor(final_target_area, left_wing, right_wing, sigma, return_clean=True)
        final_area_y_trace = final_area_noisy
        final_area_max = np.max(final_area_y_trace)
        final_area_min = np.min(final_area_y_trace)
        final_area_delta = final_area_max - final_area_min
        
        # Shift streaming data frames forward for the next iteration
        area_ln_A1  = area_ln_A2
        area_h1     = area_h2
        
        area_ln_A2  = area_ln_A2b
        area_h2     = command_step_area
        
        area_ln_A2b = log_8bit(calculate_area(final_area_x_trace, final_area_y_trace))
        area_X2b    = final_target_delta

    # ==========================================
    # CALCULATE DELTAS
    # ==========================================
    delta12_max   = max_Y2 - max_Y1
    delta12_min   = min_Y2 - min_Y1
    delta12_delta = delta_Y2 - delta_Y1
    delta12_area  = area_A2 - area_A1

    delta2b2_max   = max_Y2b - max_Y2
    delta2b2_min   = min_Y2b - min_Y2
    delta2b2_delta = delta_Y2b - delta_Y2
    delta2b2_area  = area_A2b - area_A2

    # ==========================================
    # CALCULATE RMSE AND SNR
    # ==========================================
    rmse_step1 = np.sqrt(np.mean((Y1_clean - Y1_noisy)**2))
    rmse_step2 = np.sqrt(np.mean((Y2_clean - Y2_noisy)**2))
    rmse_step2b = np.sqrt(np.mean((Y2b_clean - Y2b_noisy)**2))

    snr_step1 = 10 * np.log10(np.mean(Y1_clean**2) / rmse_step1**2) if rmse_step1 > 0 else np.inf
    snr_step2 = 10 * np.log10(np.mean(Y2_clean**2) / rmse_step2**2) if rmse_step2 > 0 else np.inf
    snr_step2b = 10 * np.log10(np.mean(Y2b_clean**2) / rmse_step2b**2) if rmse_step2b > 0 else np.inf

    # ==========================================
    # CALCULATE FINAL ERRORS
    # ==========================================
    pos_error_delta = abs(final_target_delta)
    pos_error_area = abs(final_target_area)

    if verbose:
        # ==========================================
        # PRINT RESULTS
        # ==========================================
        print(f"\nRESULTS:")
        print("\nAmplitude Tracking History (command steps, resulting position in µm):")
        if delta_history and isinstance(delta_history[0], list):
            for i, (cmd, pos) in enumerate(delta_history, 1):
                print(f"  Step {i:0d}: [{cmd:+0d}] position = {pos:8.3f} µm")
        else:
            print(f"  {delta_history}")   # fallback
        print(f"  Total amplitude steps: {len(delta_history)}")

        print("\nArea Tracking History (command steps, resulting position in µm):")
        if area_history and isinstance(area_history[0], list):
            for i, (cmd, pos) in enumerate(area_history, 1):
                print(f"  Step {i:0d}: [{cmd:+0d}] position = {pos:8.3f} µm")
        else:
            print(f"  {area_history}")   # fallback
        print(f"  Total area steps: {len(area_history)}")

        print(f"   Amplitude Error: {pos_error_delta:.4f} µm")
        print(f"   Area Error:  {pos_error_area:.4f} µm")
        print(f"   Better: {'Amplitude' if pos_error_delta < pos_error_area else 'Area'}")

    if plotting:
        # ==========================================
        # PLOTTING
        # ==========================================
        plt.close('all')

        # Create a clean canvas layout
        fig, ax = plt.subplots(figsize=(13, 8))

        # Continuous Hidden Reference Profile
        x_profile = np.linspace(LOWER_BOUND, UPPER_BOUND, 1000)
        y_profile = np.exp(-((x_profile - 0)**2) / (2 * sigma**2))
        ax.plot(x_profile, y_profile, color='#d3d3d3', linestyle=':', label='Continuous Gaussian Beam Profile')

        # Plot Step 1 (Red)
        ax.plot(X1_trace, Y1_trace, color='#e60000', linewidth=2, label='Step 1 Profile')
        ax.fill_between(X1_trace, Y1_trace, color='#e60000', alpha=0.08)

        # Plot Step 2 (Blue)
        ax.plot(X2_trace, Y2_trace, color='#0066cc', linewidth=2, label='Step 2 Profile')
        ax.fill_between(X2_trace, Y2_trace, color='#0066cc', alpha=0.08)

        # Plot Step 2b (Orange)
        ax.plot(X2b_trace, Y2b_trace, color='#ff9900', linewidth=2, label='Step 2b Profile')
        ax.fill_between(X2b_trace, Y2b_trace, color='#ff9900', alpha=0.08)

        # --- VISUAL OVERLAP REMEDY: SEPARATE HATCH PATTERNS ---
        ax.plot(final_delta_x_trace, final_delta_y_trace, color='#2eb82e', linewidth=3.0, label='Amplitude Calculated Final Target')
        ax.fill_between(final_delta_x_trace, final_delta_y_trace, facecolor='none', edgecolor='#2eb82e', hatch='//', alpha=0.25)

        ax.plot(final_area_x_trace, final_area_y_trace, color='#8a2be2', linewidth=2.0, linestyle='-.', label='Area Calculated Final Target')
        ax.fill_between(final_area_x_trace, final_area_y_trace, facecolor='none', edgecolor='#8a2be2', hatch='\\\\', alpha=0.25)

        # Target Core Centroid Indicator Axis (0 µm)
        ax.axvline(0, color='#404040', linestyle='--', alpha=0.6)

        # ==========================================
        # ADD ZOOM INSET FOR PEAK REGION
        # ==========================================
        axins = inset_axes(ax, width="35%", height="35%",
                        bbox_to_anchor=(0.6, -0.15, 0.4, 0.4), bbox_transform=ax.transAxes)

        # Plot zoomed region
        zoom_xmin, zoom_xmax = -2, 2
        zoom_mask_delta = (final_delta_x_trace >= zoom_xmin) & (final_delta_x_trace <= zoom_xmax)
        zoom_mask_area = (final_area_x_trace >= zoom_xmin) & (final_area_x_trace <= zoom_xmax)
        axins.plot(final_delta_x_trace[zoom_mask_delta], final_delta_y_trace[zoom_mask_delta], 
                color='#2eb82e', linewidth=2.5, label='Amplitude')
        axins.plot(final_area_x_trace[zoom_mask_area], final_area_y_trace[zoom_mask_area], 
                color='#8a2be2', linewidth=2, linestyle='-.', label='Area')
        axins.axvline(0, color='#404040', linestyle='--', alpha=0.6, linewidth=1)
        axins.axhline(1.0, color='gray', linestyle=':', alpha=0.5)
        axins.set_xlim(zoom_xmin, zoom_xmax)
        axins.set_ylim(min(final_delta_min, final_area_min) * 0.99, max(final_delta_max, final_area_max) * 1.01)
        axins.grid(True, alpha=0.3, linestyle=':')
        axins.set_title('Zoom at Peak', fontsize=7)
        axins.tick_params(labelsize=6)
        axins.legend(fontsize=6)

        # Mark the zoom area on main plot
        mark_inset(ax, axins, loc1=1, loc2=3, fc="none", ec="gray", linewidth=1, linestyle='--')

        # ==========================================
        # ZOOM INSET 1 - Step 1 Region
        # ==========================================
        axins_step1 = inset_axes(ax, width="32%", height="32%",
                                bbox_to_anchor=(0.55, 0.4, 0.30, 0.32),
                                bbox_transform=ax.transAxes, borderpad=0.5)

        # Plot zoomed region around Step 1 with wider range
        zoom1_xmin, zoom1_xmax = min(X1_trace), max(X1_trace)
        zoom1_mask = (X1_trace >= zoom1_xmin) & (X1_trace <= zoom1_xmax)
        axins_step1.plot(X1_trace[zoom1_mask], Y1_trace[zoom1_mask], 
                        color='#e60000', linewidth=3, label='_nolegend_')
        axins_step1.plot(X1_trace[zoom1_mask], Y1_clean[zoom1_mask], 
                        color='#cc0000', linewidth=2, linestyle=':', label='_nolegend_')
        axins_step1.axvline(X1, color='#e60000', linestyle='--', alpha=0.6, linewidth=1.5)
        axins_step1.axvline(0, color='#404040', linestyle='--', alpha=0.3, linewidth=1)
        axins_step1.set_xlim(zoom1_xmin, zoom1_xmax)
        axins_step1.set_ylim(min_Y1 * 0.99, max_Y1 * 1.01)
        axins_step1.grid(True, alpha=0.3, linestyle=':', linewidth=0.8)
        axins_step1.set_title(f'Step 1 Zoom', fontsize=10, fontweight='bold')
        axins_step1.tick_params(labelsize=8)
        axins_step1.set_xlabel('Position (µm)', fontsize=8)
        axins_step1.set_ylabel('Intensity', fontsize=8)

        # ==========================================
        # ZOOM INSET 2 - Step 2 Region
        # ==========================================
        axins_step2 = inset_axes(ax, width="32%", height="32%",
                                bbox_to_anchor=(0.7, 0.4, 0.30, 0.32),
                                bbox_transform=ax.transAxes, borderpad=0.5)

        # Plot zoomed region around Step 2
        zoom2_xmin, zoom2_xmax = min(X2_trace), max(X2_trace)
        zoom2_mask = (X2_trace >= zoom2_xmin) & (X2_trace <= zoom2_xmax)
        axins_step2.plot(X2_trace[zoom2_mask], Y2_trace[zoom2_mask], 
                        color='#0066cc', linewidth=3, label='_nolegend_')
        axins_step2.plot(X2_trace[zoom2_mask], Y2_clean[zoom2_mask], 
                        color='#004499', linewidth=2, linestyle=':', label='_nolegend_')
        axins_step2.axvline(X2, color='#0066cc', linestyle='--', alpha=0.6, linewidth=1.5)
        axins_step2.axvline(0, color='#404040', linestyle='--', alpha=0.3, linewidth=1)
        axins_step2.set_xlim(zoom2_xmin, zoom2_xmax)
        axins_step2.set_ylim(min_Y2 * 0.99, max_Y2 * 1.01)
        axins_step2.grid(True, alpha=0.3, linestyle=':', linewidth=0.8)
        axins_step2.set_title(f'Step 2 Zoom', fontsize=10, fontweight='bold')
        axins_step2.tick_params(labelsize=8)
        axins_step2.set_xlabel('Position (µm)', fontsize=8)
        axins_step2.set_ylabel('Intensity', fontsize=8)

        # ==========================================
        # ZOOM INSET 3 - Step 2b Region
        # ==========================================
        axins_step2b = inset_axes(ax, width="32%", height="32%",
                                bbox_to_anchor=(0.55, 0.15, 0.30, 0.32),
                                bbox_transform=ax.transAxes, borderpad=0.5)

        # Plot zoomed region around Step 2b
        zoom3_xmin, zoom3_xmax = min(X2b_trace), max(X2b_trace)
        zoom3_mask = (X2b_trace >= zoom3_xmin) & (X2b_trace <= zoom3_xmax)
        axins_step2b.plot(X2b_trace[zoom3_mask], Y2b_trace[zoom3_mask], 
                        color='#ff9900', linewidth=3, label='_nolegend_')
        axins_step2b.plot(X2b_trace[zoom3_mask], Y2b_clean[zoom3_mask], 
                        color='#cc7a00', linewidth=2, linestyle=':', label='_nolegend_')
        axins_step2b.axvline(X2b, color='#ff9900', linestyle='--', alpha=0.6, linewidth=1.5)
        axins_step2b.axvline(0, color='#404040', linestyle='--', alpha=0.3, linewidth=1)
        axins_step2b.set_xlim(zoom3_xmin, zoom3_xmax)
        axins_step2b.set_ylim(min_Y2b * 0.99, max_Y2b * 1.01)
        axins_step2b.grid(True, alpha=0.3, linestyle=':', linewidth=0.8)
        axins_step2b.set_title(f'Step 2b Zoom', fontsize=10, fontweight='bold')
        axins_step2b.tick_params(labelsize=8)
        axins_step2b.set_xlabel('Position (µm)', fontsize=8)
        axins_step2b.set_ylabel('Intensity', fontsize=8)

        # Add subtle borders
        for inset in [axins_step1, axins_step2, axins_step2b]:
            inset.set_facecolor('white')
            inset.set_alpha(0.95)
            for spine in inset.spines.values():
                spine.set_edgecolor('#999999')
                spine.set_linewidth(1)

        # ==========================================
        # ADD ERROR METER BAR CHART
        # ==========================================
        ax_error_meter = inset_axes(ax, width="32%", height="32%",
                                    bbox_to_anchor=(0.7, 0.15, 0.30, 0.32), bbox_transform=ax.transAxes)

        algorithms = ['Amplitude', 'Area']
        errors = [pos_error_delta, pos_error_area]
        colors = ['#ff6b6b' if e > 0.3 else '#4ecdc4' for e in errors]

        bars = ax_error_meter.barh(algorithms, errors, color=colors, alpha=0.8, edgecolor='black', linewidth=0.5)

        ax_error_meter.set_xlabel('Error (µm)', fontsize=7)
        ax_error_meter.set_title('Algorithm Error', fontsize=8, fontweight='bold')
        ax_error_meter.tick_params(labelsize=7)
        ax_error_meter.grid(True, alpha=0.3, axis='x', linestyle=':')

        max_err = max(errors) if max(errors) > 0 else 0.1
        ax_error_meter.set_xlim(0, max_err * 1.4)

        for bar, err in zip(bars, errors):
            ax_error_meter.text(
                bar.get_width() + (max_err * 0.05),
                bar.get_y() + bar.get_height()/2.0,
                f'{err:.3f} µm', 
                ha='left', va='center', 
                fontsize=7, fontweight='bold', color='#333333'
            )

        # ==========================================
        # ADD PERFORMANCE SUMMARY BOX
        # ==========================================
        performance_text = f"PERFORMANCE SUMMARY:\n"
        performance_text += f"Algorithm : {'Area' if pos_error_area < pos_error_delta else 'Amplitude'}\n"
        performance_text += f"Error : {min(pos_error_delta, pos_error_area):.3f}µm\n"

        props_perf = dict(boxstyle='round,pad=0.5', facecolor='#e8f5e9', edgecolor='#2e7d32', alpha=0.95)
        ax.text(0.98, 0.95, performance_text, transform=ax.transAxes, fontsize=9, 
                verticalalignment='top', horizontalalignment='right', bbox=props_perf, fontfamily='monospace')

        # --- SEQUENTIAL LEFT-TO-RIGHT METRIC PANEL PLACEMENT ---
        text_step1_label = f"Step 1 Metrics:\n• Max: {max_Y1:.4f}\n• Min: {min_Y1:.4f}\n• Delta: {delta_Y1:.4f}\n• Area: {area_A1:.4f}"
        text_step2_label = f"Step 2 Metrics:\n• Max: {max_Y2:.4f}\n• Min: {min_Y2:.4f}\n• Delta: {delta_Y2:.4f}\n• Area: {area_A2:.4f}"
        text_step2b_meas = f"Step 2b Metrics:\n• Max: {max_Y2b:.4f}\n• Min: {min_Y2b:.4f}\n• Delta: {delta_Y2b:.4f}\n• Area: {area_A2b:.4f}"
        text_delta_final = f"Amplitude Final:\n• Max: {final_delta_max:.4f}\n• Min: {final_delta_min:.4f}\n• Delta: {final_delta_val:.4f}\n• Area: {final_delta_area:.4f}"
        text_area_final  = f"Area Final:\n• Max: {final_area_max:.4f}\n• Min: {final_area_min:.4f}\n• Delta: {final_area_delta:.4f}\n• Area: {final_area_val:.4f}"

        # Step performance
        ax.text(LOWER_BOUND * 2.75, 0.2, text_step1_label, color='#b30000', fontsize=8, ha='center', va='bottom', bbox=dict(boxstyle='round,pad=0.3', facecolor='#fff7f7', edgecolor='#e60000', alpha=0.9))
        ax.text(LOWER_BOUND * 2.25, 0.2, text_step2_label, color='#004499', fontsize=8, ha='center', va='bottom', bbox=dict(boxstyle='round,pad=0.3', facecolor='#f7faff', edgecolor='#0066cc', alpha=0.9))
        ax.text(LOWER_BOUND * 1.75, 0.2, text_step2b_meas, color='#b36b00', fontsize=8, ha='center', va='bottom', bbox=dict(boxstyle='round,pad=0.3', facecolor='#fffaf2', edgecolor='#ff9900', alpha=0.9))
        # Calculated optimization targets
        ax.text(LOWER_BOUND * 2.5, 0.05, text_delta_final, color='#1f7a1f', fontsize=8, ha='center', va='bottom', bbox=dict(boxstyle='round,pad=0.3', facecolor='#f2fff2', edgecolor='#2eb82e', alpha=0.9))
        ax.text(LOWER_BOUND * 2, 0.05, text_area_final, color='#5c1da3', fontsize=8, ha='center', va='bottom', bbox=dict(boxstyle='round,pad=0.3', facecolor='#fbf7ff', edgecolor='#8a2be2', alpha=0.9))

        # --- VERTICAL CENTERLINES TRUNCATED CLEANLY UNDER RESPECTIVE PEAKS ---
        ax.vlines(X1, ymin=0, ymax=max_Y1, color='#b30000', linestyle='--', alpha=0.4)
        ax.vlines(X2, ymin=0, ymax=max_Y2, color='#004499', linestyle='--', alpha=0.4)
        ax.vlines(final_target_delta, ymin=0, ymax=final_delta_max, color='#1f7a1f', linestyle='--', alpha=0.5)
        ax.vlines(X2b, ymin=0, ymax=max_Y2b, color='#ff9900', linestyle='--', alpha=0.4)
        ax.vlines(final_target_area, ymin=0, ymax=final_area_max, color='#5c1da3', linestyle='--', alpha=0.5)

        # ==========================================
        # SYSTEM METRIC PERFORMANCE BOX (UPPER LEFT)
        # ==========================================
        error_status = "ENABLED" if ENABLE_SIGNAL_ERRORS else "DISABLED"
        motor_status = "ENABLED" if ENABLE_MOTOR_ERRORS else "DISABLED"
        vtt_status = "ENABLED" if ENABLE_VTT_ERRORS else "DISABLED"
        bit_status = 'ENABLED' if ENABLE_BIT_LOG else 'DISABLED'

        text_panel_deltas = (f"SIGNAL ANALYSIS:\n"
                            f"                 [Stage 1→2] | [Stage 2→2b]\n"
                            f"• Δ Max Value  :  {delta12_max:+.4f}    | {delta2b2_max:+.4f}\n"
                            f"• Δ Min Value  :  {delta12_min:+.4f}    | {delta2b2_min:+.4f}\n"
                            f"• Δ Amplitude  :  {delta12_delta:+.4f}    | {delta2b2_delta:+.4f}\n"
                            f"• Δ Sweep Area :  {delta12_area:+.4f}    | {delta2b2_area:+.4f}\n\n"
                            f"HARDWARE COORDINATES:\n"
                            f"• MEMs Vibration   : {left_pct:.1f}% Left ({left_wing:.2f}µm) ◄ {right_pct:.1f}% Right ({right_wing:.2f}µm)\n"
                            f"• Step 1 Position  : {X1:.3f} µm\n"
                            f"• Step 2 Position  : {X2:.3f} µm (Move: [{command_step1:+.0f}] {actual_move12:+.3f}µm )\n"
                            f"• Step 2b Position : {X2b:.3f} µm (Move: [{command_step2:+.0f}] {actual_move2b2:+.3f}µm)\n\n"
                            f"ALGORITHM TARGETS: ({ALIGNMENT_THRESHOLD:.3f} µm)\n"
                            f"              [Steps] | [Error]   | [Error in Gear Ratio]\n"
                            f"• Amplitude : [{converge_delta}]     | {final_target_delta:+.3f} µm | {final_target_delta/MOTOR_GEAR_RATIO:+.3f}\n"
                            f"• Area      : [{converge_area}]     | {final_target_area:+.3f} µm | {final_target_area/MOTOR_GEAR_RATIO:+.3f}\n\n"
                            f"ERROR STATUS:\n"
                            f"• {motor_status} Motor | {error_status} Signal | {vtt_status} VTT | {bit_status} Bit\n"
                            f"• Step1 RMSE: {rmse_step1:.5f} | SNR: {snr_step1:.1f}dB\n"
                            f"• Step2 RMSE: {rmse_step2:.5f} | SNR: {snr_step2:.1f}dB\n"
                            f"• Step2b RMSE: {rmse_step2b:.5f} | SNR: {snr_step2b:.1f}dB")

        props_deltas = dict(boxstyle='round,pad=0.5', facecolor='#f7fff2', edgecolor='#4da61a', alpha=0.95)
        ax.text(0.02, 0.95, text_panel_deltas, transform=ax.transAxes, fontsize=9.5, 
                verticalalignment='top', horizontalalignment='left', bbox=props_deltas, fontfamily='monospace')

        # Interface Formatting Configuration
        ax.set_title('Active Alignment Tracking for Gaussian Peak (With Errors)', fontsize=11, fontweight='bold')
        ax.set_xlabel('Spatial Coordinate Positioning (µm)')
        ax.set_ylabel('Coupled Intensity Efficiency')
        ax.set_xlim(3 * LOWER_BOUND, 2 * UPPER_BOUND)
        ax.set_ylim(0.0, 1.2)
        ax.grid(True, linestyle=':', alpha=0.5)

        plt.tight_layout()
        plt.show()
    return converge_delta, pos_error_delta, converge_area, pos_error_area

    if verbose:
        print("\n" + "="*80)
        print("SIMULATION COMPLETE")
        print("="*80)

if __name__ == "__main__":
    # When run directly, show plot and print messages
    run_AA(plotting=True, verbose=True)