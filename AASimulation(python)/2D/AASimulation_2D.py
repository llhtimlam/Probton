# AASimulation_2D.py
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import math

from config2D import *

# ======================== LOG‑AREA HELPER ============================
def log_8bit(x, bits=8):
    if not ENABLE_BIT_LOG:
        return np.log(max(x, 1e-10))
    max_code = 2**bits - 1
    code = int(round(max(0, min(1, x)) * max_code))
    if not hasattr(log_8bit, 'table'):
        log_8bit.table = np.log(np.arange(2**bits) / max_code + 1e-10)
    return log_8bit.table[code]

def quantize_amplitude(amp, bits=8):
    if not ENABLE_BIT_LOG:
        return amp
    max_code = 2**bits - 1
    code = int(round(max(0, min(1, amp)) * max_code))
    return code / max_code

def log_area_step(a0, h1, a1, h2, a2):
    if abs(h1) < 1e-9 or abs(h2) < 1e-9:
        return 0.0
    a0_q = quantize_amplitude(a0)
    a1_q = quantize_amplitude(a1)
    a2_q = quantize_amplitude(a2)
    ln_a0 = log_8bit(a0_q)
    ln_a1 = log_8bit(a1_q)
    ln_a2 = log_8bit(a2_q)
    denom = (ln_a2 - ln_a1) / h2 - (ln_a1 - ln_a0) / h1
    if abs(denom) < 1e-9:
        return 0.0
    step = (-h1/2.0 - h2) - ((ln_a1 - ln_a0) / (2.0 * h1 * denom)) * (h1 + h2)
    return step

# ======================== SIMULATION ================================
def simulate_analog_readout(stage_x, stage_y, duration=DURATION):
    samples = int(duration * SAMPLE_RATE)
    t = np.linspace(0, duration, samples)
    x_mems = MEMS_AMP_X * np.sin(2 * np.pi * FX * t)
    y_mems = MEMS_AMP_Y * np.sin(2 * np.pi * FY * t)
    x_total = stage_x + x_mems
    y_total = stage_y + y_mems
    intensity = np.exp(-((x_total - TRUE_PEAK_X)**2 + (y_total - TRUE_PEAK_Y)**2) / (2 * BEAM_WIDTH**2))
    intensity += np.random.normal(0, NOISE_SIGMA, size=samples)

    T_X = 1 / FX
    T_Y = 1 / FY
    samples_TX = int(T_X * SAMPLE_RATE)
    samples_TY = int(T_Y * SAMPLE_RATE)

    area_x = np.mean(intensity[:samples_TX])
    area_y = np.mean(intensity[:samples_TY])

    local_dc_offset_x = np.mean(intensity[:samples_TX])
    local_dc_offset_y = np.mean(intensity[:samples_TY])
    
    ref_wave_x = np.sin(2 * np.pi * FX * t[:samples_TX])
    ref_wave_y = np.sin(2 * np.pi * FY * t[:samples_TY])
    
    mixer_x = (intensity[:samples_TX] - local_dc_offset_x) * ref_wave_x
    mixer_y = (intensity[:samples_TY] - local_dc_offset_y) * ref_wave_y

    idx_90_x = np.argmax(ref_wave_x)
    idx_270_x = np.argmin(ref_wave_x)
    idx_90_y = np.argmax(ref_wave_y)
    idx_270_y = np.argmin(ref_wave_y)

    comp_90_x  = 1 if mixer_x[idx_90_x] > 0 else -1
    comp_270_x = 1 if mixer_x[idx_270_x] > 0 else -1
    comp_90_y  = 1 if mixer_y[idx_90_y] > 0 else -1
    comp_270_y = 1 if mixer_y[idx_270_y] > 0 else -1

    sum_x = comp_90_x + comp_270_x
    sum_y = comp_90_y + comp_270_y

    if sum_x == 0:
        sign_x = 0
    else:
        sign_x = 1 if sum_x > 0 else -1
    if sum_y == 0:
        sign_y = 0
    else:
        sign_y = 1 if sum_y > 0 else -1

    return area_x, area_y, sign_x, sign_y, t, intensity, x_total, y_total

def move_stage(curr_x, curr_y, step_x, step_y):
    lag_x = np.random.uniform(0.95, 1.05)
    lag_y = np.random.uniform(0.95, 1.05)
    new_x = curr_x + step_x * lag_x
    new_y = curr_y + step_y * lag_y
    return new_x, new_y

# ======================== MAIN RUNNABLE =============================
def run_AA_2D(plotting=False, verbose=False):
    # ---- Generate random start positions ----
    start_x = np.random.uniform(LOWER_BOUND, UPPER_BOUND)
    start_y = np.random.uniform(LOWER_BOUND, UPPER_BOUND)

    # ---- Local variables for logging ----
    stage_x_hist = [start_x]
    stage_y_hist = [start_y]
    time_axis = []
    wave_data = []
    mems_path_x = []
    mems_path_y = []
    area_x_hist_all = []
    area_y_hist_all = []
    sign_x_hist = []
    sign_y_hist = []
    step_x_hist = []
    step_y_hist = []
    cycle_counter = 0

    def log_cycle(area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, step_x, step_y, pos_x, pos_y):
        nonlocal cycle_counter
        cycle_counter += 1
        time_axis.append(t_w + (cycle_counter - 1) * DURATION)
        wave_data.append(intensity)
        mems_path_x.append(x_path)
        mems_path_y.append(y_path)
        area_x_hist_all.append(area_x)
        area_y_hist_all.append(area_y)
        sign_x_hist.append(sign_x)
        sign_y_hist.append(sign_y)
        step_x_hist.append(step_x)
        step_y_hist.append(step_y)
        stage_x_hist.append(pos_x)
        stage_y_hist.append(pos_y)

    def move_with_chunks(curr_x, curr_y, total_step_x, total_step_y, max_chunk=MAX_STEP):
        if abs(total_step_x) < 1e-9 and abs(total_step_y) < 1e-9:
            area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path = simulate_analog_readout(curr_x, curr_y)
            log_cycle(area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, 0.0, 0.0, curr_x, curr_y)
            return curr_x, curr_y, area_x, area_y, sign_x, sign_y

        def get_chunks(total, max_chunk):
            if abs(total) < 1e-9:
                return []
            sign = 1 if total >= 0 else -1
            abs_total = abs(total)
            num_full = int(abs_total // max_chunk)
            rem = abs_total % max_chunk
            chunks = [sign * max_chunk] * num_full
            if rem > 1e-9:
                chunks.append(sign * rem)
            return chunks

        chunks_x = get_chunks(total_step_x, max_chunk)
        chunks_y = get_chunks(total_step_y, max_chunk)
        max_ticks = max(len(chunks_x), len(chunks_y))
        x, y = curr_x, curr_y
        for i in range(max_ticks):
            step_x = chunks_x[i] if i < len(chunks_x) else 0.0
            step_y = chunks_y[i] if i < len(chunks_y) else 0.0
            x, y = move_stage(x, y, step_x, step_y)
            area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path = simulate_analog_readout(x, y)
            log_cycle(area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, step_x, step_y, x, y)
        return x, y, area_x, area_y, sign_x, sign_y

    # ---------- ALGORITHM ----------
    current_x, current_y = start_x, start_y

    # ---- Phase 1: Coarse multi‑scale sweeps ----
    for level_idx, mult in enumerate(LEVELS):
        current_max_step = MAX_STEP * mult
        if current_max_step < MIN_STEP:
            current_max_step = MIN_STEP

        # X‑Axis
        area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path = simulate_analog_readout(current_x, current_y)
        hist_x = [(current_x, area_x, sign_x)]
        log_cycle(area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, 0.0, 0.0, current_x, current_y)

        step1_x = sign_x * current_max_step
        if verbose:
            print(f"Scale {mult:.2f}x Step 1: X={current_x:.2f}, Y={current_y:.2f}, AreaX={area_x:.2f}, AreaY={area_y:.2f}, sign_x={sign_x}, move X={step1_x:.2f}")
        current_x, current_y, area_x1, area_y1, sign_x1, sign_y1 = move_with_chunks(current_x, current_y, step1_x, 0.0)
        hist_x.append((current_x, area_x1, sign_x1))

        if area_x1 <= area_x:
            step2_x = -0.9 * step1_x
        elif sign_x1 != sign_x:
            step2_x = -0.5 * step1_x
        else:
            step2_x = 0.75 * step1_x

        if verbose:
            print(f"Scale {mult:.2f}x Step 2: X={current_x:.2f}, Y={current_y:.2f}, AreaX={area_x1:.2f}, AreaY={area_y1:.2f}, sign_x={sign_x}, move X={step2_x:.2f}")
        current_x, current_y, area_x2, area_y2, sign_x2, sign_y2 = move_with_chunks(current_x, current_y, step2_x, 0.0)
        hist_x.append((current_x, area_x2, sign_x2))

        # Y‑Axis
        hist_y = [(current_y, area_y2, sign_y2)]
        step1_y = sign_y2 * current_max_step
        if verbose:
            print(f"Scale {mult:.2f}x Step 3: X={current_x:.2f}, Y={current_y:.2f}, AreaX={area_x2:.2f}, AreaY={area_y2:.2f}, sign_y={sign_y}, move Y={step1_y:.2f}")
        current_x, current_y, area_x3_y, area_y3, sign_x3_y, sign_y3 = move_with_chunks(current_x, current_y, 0.0, step1_y)
        hist_y.append((current_y, area_y3, sign_y3))

        if area_y3 <= area_y2:
            step2_y = -0.9 * step1_y
        elif sign_y3 != sign_y2:
            step2_y = -0.5 * step1_y
        else:
            step2_y = 0.75 * step1_y

        if verbose:
            print(f"Scale {mult:.2f}x Step 4: X={current_x:.2f}, Y={current_y:.2f}, AreaX={area_x3_y:.2f}, AreaY={area_y3:.2f}, sign_y={sign_y}, move Y={step2_y:.2f}")
        current_x, current_y, area_x4_y, area_y4, sign_x4_y, sign_y4 = move_with_chunks(current_x, current_y, 0.0, step2_y)
        hist_y.append((current_y, area_y4, sign_y4))

        # Mathematical jump
        x0, a0, _ = hist_x[0]; x1, a1, _ = hist_x[1]; x2, a2, _ = hist_x[2]
        step_x_calc = log_area_step(a0, step1_x, a1, step2_x, a2)
        if np.isnan(step_x_calc) or abs(step_x_calc) < 1e-9:
            step_x_calc = sign_x2 * current_max_step
        step_x = np.clip(step_x_calc, -current_max_step, current_max_step)

        y0, b0, _ = hist_y[0]; y1, b1, _ = hist_y[1]; y2, b2, _ = hist_y[2]
        step_y_calc = log_area_step(b0, step1_y, b1, step2_y, b2)
        if np.isnan(step_y_calc) or abs(step_y_calc) < 1e-9:
            step_y_calc = sign_y4 * current_max_step
        step_y = np.clip(step_y_calc, -current_max_step, current_max_step)

        current_x, current_y, _, _, _, _ = move_with_chunks(current_x, current_y, step_x, step_y)
        if verbose:
            print(f"Scale {mult:.2f}x: jump X={step_x:.2f}, Y={step_y:.2f}")

    # ---- Phase 2: Fine refinement ----
    if verbose:
        print("\nEntering refinement...")

    h1_x, h2_x = step1_x, step2_x
    ref_ax0, ref_ax1, ref_ax2 = area_x, area_x1, area_x2
    sign_x_last = sign_x2

    h1_y, h2_y = step1_y, step2_y
    ref_ay0, ref_ay1, ref_ay2 = hist_y[0][1], hist_y[1][1], hist_y[2][1]
    sign_y_last = sign_y4

    refine_count = 0
    converged_x = False
    converged_y = False
    zero_step_count_x = 0
    zero_step_count_y = 0
    cumulative_sign_x = 0
    cumulative_sign_y = 0

    while not (converged_x and converged_y) and refine_count < MAX_REFINE_ITERATIONS:
        refine_count += 1

        # X step
        if not converged_x:
            step_x_calc = log_area_step(ref_ax0, h1_x, ref_ax1, h2_x, ref_ax2)
            if np.isnan(step_x_calc) or abs(step_x_calc) < 1e-9:
                step_x_calc = sign_x_last * MAX_STEP
            step_x = np.clip(step_x_calc, -MAX_STEP, MAX_STEP)
            if step_x == 0.0:
                zero_step_count_x += 1
                if zero_step_count_x >= 3:
                    if verbose:
                        print(f"X converged via 3-Consecutive Zero Steps at iteration {refine_count}")
                    converged_x = True
            else:
                zero_step_count_x = 0
        else:
            step_x = 0.0

        # Y step
        if not converged_y:
            step_y_calc = log_area_step(ref_ay0, h1_y, ref_ay1, h2_y, ref_ay2)
            if np.isnan(step_y_calc) or abs(step_y_calc) < 1e-9:
                step_y_calc = sign_y_last * MAX_STEP
            step_y = np.clip(step_y_calc, -MAX_STEP, MAX_STEP)
            if step_y == 0.0:
                zero_step_count_y += 1
                if zero_step_count_y >= 3:
                    if verbose:
                        print(f"Y converged via 3-Consecutive Zero Steps at iteration {refine_count}")
                    converged_y = True
            else:
                zero_step_count_y = 0
        else:
            step_y = 0.0

        # Execute
        current_x, current_y, next_area_x, next_area_y, sign_x_next, sign_y_next = move_with_chunks(current_x, current_y, step_x, step_y)

        # Update bias registers
        if sign_x_next == sign_x_last and sign_x_next != 0:
            cumulative_sign_x += sign_x_next
        else:
            cumulative_sign_x = sign_x_next
        if sign_y_next == sign_y_last and sign_y_next != 0:
            cumulative_sign_y += sign_y_next
        else:
            cumulative_sign_y = sign_y_next

        # Update history
        if not converged_x:
            h1_x = h2_x
            h2_x = step_x
            ref_ax0 = ref_ax1
            ref_ax1 = ref_ax2
            ref_ax2 = next_area_x
        sign_x_last = sign_x_next

        if not converged_y:
            h1_y = h2_y
            h2_y = step_y
            ref_ay0 = ref_ay1
            ref_ay1 = ref_ay2
            ref_ay2 = next_area_y
        sign_y_last = sign_y_next

        if verbose:
            print(f"Refine {refine_count}: X={current_x:.2f}, Y={current_y:.2f}, AreaX={ref_ax1:.2f}, AreaY={ref_ay1:.2f}, sign_x={sign_x_last:2d}, sign_y={sign_y_last:2d}, move X={step_x:6.2f}, move Y={step_y:6.2f} | sign_x count={cumulative_sign_x}, sign_y count={cumulative_sign_y}")

        # Cross‑axis trap handling
        trigger_x = abs(cumulative_sign_x) >= SIGN_STUCK_LIMIT
        trigger_y = abs(cumulative_sign_y) >= SIGN_STUCK_LIMIT

        if trigger_x or trigger_y:
            if verbose:
                print(f"Cross-Axis Shift Detected! [X Wake-up Needed: {trigger_x}, Y Wake-up Needed: {trigger_y}]")
            boot_max_step = MAX_STEP * 0.5
            if boot_max_step < MIN_STEP:
                boot_max_step = MIN_STEP

            if trigger_x:
                if verbose:
                    print("   -> Running isolated X-axis re-priming...")
                converged_x = False
                zero_step_count_x = 0
                cumulative_sign_x = 0

                area_x_base, _, _, _, _, _, _, _ = simulate_analog_readout(current_x, current_y)
                step1_x = np.sign(sign_x_last) * boot_max_step
                if step1_x == 0: step1_x = boot_max_step
                current_x, current_y, area_x1, _, sign_x1, _ = move_with_chunks(current_x, current_y, step1_x, 0.0)

                if area_x1 <= area_x_base:
                    step2_x = -0.9 * step1_x
                elif sign_x1 != np.sign(step1_x):
                    step2_x = -0.5 * step1_x
                else:
                    step2_x = 0.75 * step1_x
                current_x, current_y, area_x2, _, sign_x2, _ = move_with_chunks(current_x, current_y, step2_x, 0.0)
                _, _, sign_x_next, _, _, _, _, _ = simulate_analog_readout(current_x, current_y)

                h1_x, h2_x = step1_x, step2_x
                ref_ax0, ref_ax1, ref_ax2 = area_x_base, area_x1, area_x2
                sign_x_last = sign_x_next

            if trigger_y:
                if verbose:
                    print("   -> Running isolated Y-axis re-priming...")
                converged_y = False
                zero_step_count_y = 0
                cumulative_sign_y = 0

                _, area_y_base, _, _, _, _, _, _ = simulate_analog_readout(current_x, current_y)
                step1_y = np.sign(sign_y_last) * boot_max_step
                if step1_y == 0: step1_y = boot_max_step
                current_x, current_y, _, area_y1, _, sign_y1 = move_with_chunks(current_x, current_y, 0.0, step1_y)

                if area_y1 <= area_y_base:
                    step2_y = -0.9 * step1_y
                elif sign_y1 != np.sign(step1_y):
                    step2_y = -0.5 * step1_y
                else:
                    step2_y = 0.75 * step1_y
                current_x, current_y, _, area_y2, _, sign_y2 = move_with_chunks(current_x, current_y, 0.0, step2_y)
                _, _, _, sign_y_next, _, _, _, _ = simulate_analog_readout(current_x, current_y)

                h1_y, h2_y = step1_y, step2_y
                ref_ay0, ref_ay1, ref_ay2 = area_y_base, area_y1, area_y2
                sign_y_last = sign_y_next

            if verbose:
                print("   -> Repriming completed successfully. Counters reset.")

    # ---- Final results ----
    final_x = current_x
    final_y = current_y
    err_x = abs(final_x - TRUE_PEAK_X)
    err_y = abs(final_y - TRUE_PEAK_Y)
    total_readouts = cycle_counter

    if verbose:
        if not converged_x:
            print("X did not converge within iteration limit.")
        if not converged_y:
            print("Y did not converge within iteration limit.")
        print(f"\nFinal position: ({final_x:.2f}, {final_y:.2f})")
        print(f"Error: X = {err_x:.3f} µm, Y = {err_y:.3f} µm")
        print(f"Total readouts: {total_readouts}")

    # ---- Plotting ----
    if plotting:
        # Prepare data
        t_flat = np.concatenate(time_axis) * 1000
        wave_flat = np.concatenate(wave_data)
        num_frames = len(stage_x_hist) - 1

        cycles = np.arange(1, len(area_x_hist_all) + 1)
        max_area = max(max(area_x_hist_all), max(area_y_hist_all), 1)
        norm_area_x = np.array(area_x_hist_all) / max_area
        norm_area_y = np.array(area_y_hist_all) / max_area

        # Compute per‑cycle mean intensities (for the readout DC offset)
        # We have the raw intensity arrays per cycle in wave_data
        # Calculate the mean of each cycle's intensity
        cycle_means = [np.mean(w) for w in wave_data]
        # Build a time array for the step‑curve: each cycle's mean is constant over its duration
        step_times = []
        step_means = []
        for i, (t_arr, mean_val) in enumerate(zip(time_axis, cycle_means)):
            t_arr_ms = t_arr * 1000
            # start and end of this cycle
            t_start = t_arr_ms[0]
            t_end = t_arr_ms[-1]
            step_times.extend([t_start, t_end])
            step_means.extend([mean_val, mean_val])
        step_times = np.array(step_times)
        step_means = np.array(step_means)

        fig, ((ax_track, ax_scope), (ax_tdc, ax_sign)) = plt.subplots(
            2, 2, figsize=(14, 10), constrained_layout=True
        )
        fig.suptitle(f"2D Active Alignment – Log‑area Algorithm", fontsize=16, fontweight='bold')

        # ---- Stage path (top left) ----
        all_x = stage_x_hist + [x for arr in mems_path_x for x in arr]
        all_y = stage_y_hist + [y for arr in mems_path_y for y in arr]
        margin = 2.0
        x_min = min(min(all_x), TRUE_PEAK_X) - margin
        x_max = max(max(all_x), TRUE_PEAK_X) + margin
        y_min = min(min(all_y), TRUE_PEAK_Y) - margin
        y_max = max(max(all_y), TRUE_PEAK_Y) + margin

        ax_track.set_xlim(LOWER_BOUND, UPPER_BOUND)
        ax_track.set_ylim(LOWER_BOUND, UPPER_BOUND)
        ax_track.grid(True, linestyle='--', alpha=0.5)
        ax_track.set_title("Stage Path", fontsize=12)
        ax_track.set_xlabel("X (µm)", fontsize=11)
        ax_track.set_ylabel("Y (µm)", fontsize=11)
        ax_track.plot(TRUE_PEAK_X, TRUE_PEAK_Y, 'X', color='#e60000', markersize=14, label="True Peak")
        stage_line, = ax_track.plot([], [], 'o--', color='#e60000', lw=2, markersize=4, label="Stage")
        mems_trace, = ax_track.plot([], [], color='#0066cc', alpha=0.3, lw=1.0, label="MEMS")
        ax_track.legend(loc='upper right', fontsize=10)

        # ---- Readout (top right) with DC offset overlay ----
        ax_scope.set_xlim(0, t_flat[-1] if len(t_flat) > 0 else 1)
        ax_scope.set_ylim(-0.1, 1.1)
        ax_scope.grid(True, linestyle='--', alpha=0.5)
        ax_scope.set_title("Readout", fontsize=12)
        ax_scope.set_xlabel("Time (ms)", fontsize=11)
        ax_scope.set_ylabel("Intensity", fontsize=11, color='forestgreen')
        # Cumulative intensity (history)
        scope_line, = ax_scope.plot([], [], color='forestgreen', lw=1, alpha=0.4, label='History')
        # Current cycle (thick)
        scope_line_last, = ax_scope.plot([], [], color='forestgreen', lw=2.5, alpha=0.8, label='Current cycle')
        # DC offset step‑curve (mean per cycle)
        dc_line, = ax_scope.plot([], [], color='forestgreen', linestyle='--', lw=1.5, alpha=0.9, label='Mean intensity')
        ax_scope.legend(loc='upper right', fontsize=9)

        # ---- Area bars (bottom left) with overlay line ----
        ax_tdc.set_title("Integrated Area per MEMS Period", fontsize=12)
        ax_tdc.set_xlabel("Cycle", fontsize=11)
        ax_tdc.set_ylabel("Normalized Area", fontsize=11)
        ax_tdc.set_xlim(0, SIM_CYCLES + 1)
        ax_tdc.set_ylim(0, 1.05)
        ax_tdc.grid(True, linestyle='--', alpha=0.5)
        # We'll draw the bar chart and a line overlay in the animation

        # ---- Sign plot (bottom right) ----
        ax_sign.set_title("Direction Sign", fontsize=12)
        ax_sign.set_xlabel("Cycle", fontsize=11)
        ax_sign.set_ylabel("Sign", fontsize=11)
        ax_sign.axhline(0, color='gray', linestyle='--', alpha=0.5)
        ax_sign.set_xlim(0, SIM_CYCLES + 1)
        ax_sign.set_ylim(-1.2, 1.2)
        ax_sign.grid(True, linestyle='--', alpha=0.5)

        # Pre‑compute the step‑curve data (DC offset) for all cycles
        # We already have step_times and step_means

        # ---- Animation update ----
        def update(frame):
            # Update stage path
            stage_line.set_data(stage_x_hist[:frame+1], stage_y_hist[:frame+1])
            if frame < len(mems_path_x):
                mems_trace.set_data(mems_path_x[frame], mems_path_y[frame])

            # ---- Readout: cumulative, current cycle, and DC offset ----
            end_idx = sum(len(w) for w in wave_data[:frame+1])
            scope_line.set_data(t_flat[:end_idx], wave_flat[:end_idx])
            if frame >= 0 and frame < len(wave_data):
                # Current cycle
                last_t = time_axis[frame] * 1000
                last_w = wave_data[frame]
                scope_line_last.set_data(last_t, last_w)

            # DC offset: show the step‑curve up to the current cycle
            # The step_times and step_means arrays have 2 points per cycle
            # We need to limit to current frame
            max_cycle = frame  # zero‑based
            if max_cycle >= 0:
                # indices: for cycle i, times are at 2*i and 2*i+1
                idx_end = 2 * (max_cycle + 1)  # inclusive of the end of that cycle
                if idx_end <= len(step_times):
                    dc_line.set_data(step_times[:idx_end], step_means[:idx_end])
                else:
                    dc_line.set_data([], [])

            # ---- Area bars with overlay line ----
            ax_tdc.clear()
            ax_tdc.grid(True, linestyle='--', alpha=0.5)
            ax_tdc.set_title("Integrated Area per MEMS Period", fontsize=12)
            ax_tdc.set_xlabel("Cycle", fontsize=11)
            ax_tdc.set_ylabel("Normalized Area", fontsize=11)
            x_vals = cycles[:frame+1]
            yx_vals = norm_area_x[:frame+1]
            yy_vals = norm_area_y[:frame+1]

            # Bars (transparent with hatches)
            ax_tdc.bar(x_vals, yx_vals, facecolor='none', edgecolor='#2eb82e',
                       linewidth=0.25, hatch='/', alpha=0.5, label='Area X')
            ax_tdc.bar(x_vals, yy_vals, facecolor='none', edgecolor='#ff9900',
                       linewidth=0.25, hatch='\\\\', alpha=0.5, label='Area Y')

            # Overlay line plot of the same data (trend line)
            if len(x_vals) > 0:
                ax_tdc.plot(x_vals, yx_vals, 'o-', color='#2eb82e', markersize=4,
                            linewidth=1.5, alpha=0.9, label='Trend X')
                ax_tdc.plot(x_vals, yy_vals, 's-', color='#ff9900', markersize=4,
                            linewidth=1.5, alpha=0.9, label='Trend Y')

            ax_tdc.legend(loc='upper right', fontsize=9)
            ax_tdc.set_xlim(0, SIM_CYCLES + 1)
            ax_tdc.set_ylim(0, 1.05)

            # ---- Sign plot ----
            ax_sign.clear()
            ax_sign.grid(True, linestyle='--', alpha=0.5)
            ax_sign.set_title("Direction Sign", fontsize=12)
            ax_sign.set_xlabel("Cycle", fontsize=11)
            ax_sign.set_ylabel("Sign", fontsize=11)
            ax_sign.axhline(0, color='gray', linestyle='--', alpha=0.5)
            x_vals = cycles[:frame+1]
            sx_vals = sign_x_hist[:frame+1]
            sy_vals = sign_y_hist[:frame+1]

            ax_sign.plot(x_vals, sx_vals, 'x-', color='#2eb82e',
                         markersize=6, linewidth=0.8, label='Sign X')
            ax_sign.plot(x_vals, sy_vals, 's-', color='#ff9900', markerfacecolor='none',
                         markersize=6, linewidth=0.8, label='Sign Y')
            ax_sign.legend(loc='upper right', fontsize=9)
            ax_sign.set_xlim(0, SIM_CYCLES + 1)
            ax_sign.set_ylim(-1.2, 1.2)

            return stage_line, mems_trace, scope_line, scope_line_last, dc_line

        ani = FuncAnimation(fig, update, frames=num_frames,
                            interval=200, blit=False, repeat=True)
        plt.show()

    return converged_x, converged_y, final_x, final_y, err_x, err_y, total_readouts

if __name__ == "__main__":
    run_AA_2D(plotting=True, verbose=True)