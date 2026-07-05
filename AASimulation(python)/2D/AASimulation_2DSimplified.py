# AASimulation_2DSimplified.py
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

from config2D import *

# ======================== SIMULATION FUNCTIONS ======================
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

    return area_x, area_y, sign_x, sign_y, t, intensity, x_mems, y_mems, x_total, y_total

def move_stage(curr_x, curr_y, step_x, step_y):
    lag_x = np.random.uniform(0.95, 1.05)
    lag_y = np.random.uniform(0.95, 1.05)
    new_x = curr_x + step_x * lag_x
    new_y = curr_y + step_y * lag_y
    return new_x, new_y

def update_axis_step(area, prev_area, sign, prev_sign, step, same_sign_count):
    if prev_area is not None:
        if area > prev_area:
            step = min(MAX_STEP, step)
        else:
            step = max(MIN_STEP, step * 0.5)

        if prev_sign is not None and sign != prev_sign:
            step = max(MIN_STEP, step * 0.5)

    prev_area = area
    prev_sign = sign
    return step, same_sign_count, prev_area, prev_sign

# ======================== MAIN CALLABLE =============================
def run_AA_2D_simplified(plotting=False, verbose=False):
    # Initialize random starting locations within your physics limits
    start_x = np.random.uniform(LOWER_BOUND, UPPER_BOUND)
    start_y = np.random.uniform(LOWER_BOUND, UPPER_BOUND)
    current_x, current_y = start_x, start_y

    # Pipeline history dictionaries matching your state arrays
    state_x = {'step': MAX_STEP, 'prev_area': None, 'prev_sign': None, 'same_sign_count': 0}
    state_y = {'step': MAX_STEP, 'prev_area': None, 'prev_sign': None, 'same_sign_count': 0}

    converged_x = False
    converged_y = False
    
    # NEW CONFIG CONSTANT (Replaces the arbitrary 3-step check)
    CONVERGENCE_THRESHOLD = 8  # Require the condition to hold for 8 consecutive cycles
    
    # Performance tracking counters
    zero_sign_count_x = 0
    zero_sign_count_y = 0
    zero_step_count_x = 0
    zero_step_count_y = 0
    
    # Cumulative drift monitoring registers 
    cumulative_sign_x = 0
    cumulative_sign_y = 0
    SIGN_STUCK_LIMIT = 5  
    
    move_x = True

    # Logger array initialization blocks
    stage_x_hist = [start_x]
    stage_y_hist = [start_y]
    time_axis, wave_data, mems_path_x, mems_path_y = [], [], [], []
    area_x_hist, area_y_hist, sign_x_hist, sign_y_hist, step_x_hist, step_y_hist = [], [], [], [], [], []
    cycle_counter = 0

    if verbose:
        print("Cycle |   x      y     areaX    areaY   signX signY  stepX stepY | Status")

    for _ in range(SIM_CYCLES):   # loop without using cycle variable
        cycle_counter += 1        # ← increment before each readout
        area_x, area_y, sign_x, sign_y, t_w, intensity, x_mems, y_mems, x_path, y_path = simulate_analog_readout(current_x, current_y)
        
        time_axis.append(t_w + (cycle_counter - 1) * DURATION)
        wave_data.append(intensity)
        mems_path_x.append(x_path)
        mems_path_y.append(y_path)
        area_x_hist.append(area_x)
        area_y_hist.append(area_y)
        sign_x_hist.append(sign_x)
        sign_y_hist.append(sign_y)

        command_step_x = 0.0
        command_step_y = 0.0
        active_axis = 'X' if move_x else 'Y'

        # ----------------------------------------------------------------------
        # ---- X-AXIS INTERLEAVED EXECUTION SEGMENT ----
        # ----------------------------------------------------------------------
        if move_x:
            if converged_x and sign_x != 0:
                if verbose: print(f"X recovered from false convergence at cycle {cycle_counter}")
                converged_x = False
                state_x['step'] = MAX_STEP * 0.5
                zero_sign_count_x = 0
                zero_step_count_x = 0

            if not converged_x:
                # 1. PARALLEL TRACKING 1: Monitor 90°/270° Quadrature Balance Sign
                if sign_x == 0:
                    zero_sign_count_x += 1
                    if zero_sign_count_x >= CONVERGENCE_THRESHOLD:
                        if verbose: print(f"X converged via 0-Sum Phase Lock at cycle {cycle_counter}")
                        converged_x = True
                else:
                    zero_sign_count_x = 0

                # 2. RUN HILL-CLIMBING COMPASS SEARCH ENGINE (Only if not tripped yet)
                if not converged_x:
                    step_val, state_x['same_sign_count'], state_x['prev_area'], state_x['prev_sign'] = \
                        update_axis_step(area_x, state_x['prev_area'], sign_x, state_x['prev_sign'],
                                         state_x['step'], state_x['same_sign_count'])
                    state_x['step'] = step_val
                    command_step_x = sign_x * step_val

                    # 3. PARALLEL TRACKING 2: Monitor Hill-Climbing Step Size Freezes
                    if step_val == 0.0:
                        zero_step_count_x += 1
                        if zero_step_count_x >= CONVERGENCE_THRESHOLD:
                            if verbose: print(f"X converged via Compass Step Freeze at cycle {cycle_counter}")
                            converged_x = True
                            command_step_x = 0.0
                    else:
                        zero_step_count_x = 0
            else:
                command_step_x = 0.0

        # ----------------------------------------------------------------------
        # ---- Y-AXIS INTERLEAVED EXECUTION SEGMENT ----
        # ----------------------------------------------------------------------
        else:
            if converged_y and sign_y != 0:
                if verbose: print(f"Y recovered from false convergence at cycle {cycle_counter}")
                converged_y = False
                state_y['step'] = MAX_STEP * 0.5
                zero_sign_count_y = 0
                zero_step_count_y = 0

            if not converged_y:
                # 1. PARALLEL TRACKING 1: Monitor Quadrature Balance Sign
                if sign_y == 0:
                    zero_sign_count_y += 1
                    if zero_sign_count_y >= CONVERGENCE_THRESHOLD:
                        if verbose: print(f"Y converged via 0-Sum Phase Lock at cycle {cycle_counter}")
                        converged_y = True
                else:
                    zero_sign_count_y = 0

                # 2. RUN HILL-CLIMBING COMPASS SEARCH ENGINE
                if not converged_y:
                    step_val, state_y['same_sign_count'], state_y['prev_area'], state_y['prev_sign'] = \
                        update_axis_step(area_y, state_y['prev_area'], sign_y, state_y['prev_sign'],
                                         state_y['step'], state_y['same_sign_count'])
                    state_y['step'] = step_val
                    command_step_y = sign_y * step_val

                    # 3. PARALLEL TRACKING 2: Monitor Hill-Climbing Step Size Freezes
                    if step_val == 0.0:
                        zero_step_count_y += 1
                        if zero_step_count_y >= CONVERGENCE_THRESHOLD:
                            if verbose: print(f"Y converged via Compass Step Freeze at cycle {cycle_counter}")
                            converged_y = True
                            command_step_y = 0.0
                    else:
                        zero_step_count_y = 0
            else:
                command_step_y = 0.0

        # Log and execute physical movements
        step_x_hist.append(command_step_x)
        step_y_hist.append(command_step_y)
        current_x, current_y = move_stage(current_x, current_y, command_step_x, command_step_y)
        stage_x_hist.append(current_x)
        stage_y_hist.append(current_y)

        if move_x:
            if state_x['prev_sign'] == sign_x and sign_x != 0:
                cumulative_sign_x += sign_x
            else:
                cumulative_sign_x = sign_x
        else:
            if state_y['prev_sign'] == sign_y and sign_y != 0:
                cumulative_sign_y += sign_y
            else:
                cumulative_sign_y = sign_y

        # --- X-Axis Wake-up Gate ---
        if abs(cumulative_sign_x) >= SIGN_STUCK_LIMIT:
            if verbose:
                # Differentiate in logs if it's a speed adjustment or a true wake-up
                if converged_x:
                    print(f"X REAWAKENED from convergence at cycle {cycle_counter} due to orthogonal bias! (sign_x={sign_x})")
                else:
                    print(f"   -> X Bias Escape Triggered at cycle {cycle_counter}. Dampening velocity ceiling.")
            
            converged_x = False                # Force axis back into active tracking mode
            zero_sign_count_x = 0              # Wipe out stale convergence counts
            zero_step_count_x = 0
            state_x['step'] = MAX_STEP * 0.9   # Re-prime to a controlled, gear-reduced scale
            cumulative_sign_x = 0              # Clear bias register

        # --- Y-Axis Wake-up Gate ---
        if abs(cumulative_sign_y) >= SIGN_STUCK_LIMIT:
            if verbose:
                if converged_y:
                    print(f"Y REAWAKENED from convergence at cycle {cycle_counter} due to orthogonal bias! (sign_y={sign_y})")
                else:
                    print(f"   -> Y Bias Escape Triggered at cycle {cycle_counter}. Dampening velocity ceiling.")
            
            converged_y = False                # Force axis back into active tracking mode
            zero_sign_count_y = 0              # Wipe out stale convergence counts
            zero_step_count_y = 0
            state_y['step'] = MAX_STEP * 0.9   # Re-prime to a controlled, gear-reduced scale
            cumulative_sign_y = 0              # Clear bias register

        if verbose:
            current_step_display = command_step_x if active_axis == 'X' else command_step_y
            status = f"dir={active_axis} step={current_step_display:.3f}"
            if converged_x and converged_y: status += " (BOTH CONVERGED)"
            elif converged_x: status += " (X locked)"
            elif converged_y: status += " (Y locked)"
            else: status += f" S_cnt=[X:{zero_sign_count_x},Y:{zero_sign_count_y}] Step_cnt=[X:{zero_step_count_x},Y:{zero_step_count_y}]"
            print(f"Step {cycle_counter:d}: X={current_x:.2f}, Y={current_y:.2f}, AreaX={area_x:.2f}, AreaY={area_y:.2f}, sign_x={sign_x}, sign_y={sign_y} | {status}")
        move_x = not move_x
        if converged_x and converged_y:
            break
    
    final_x = current_x
    final_y = current_y
    err_x = abs(final_x - TRUE_PEAK_X)
    err_y = abs(final_y - TRUE_PEAK_Y)
    total_readouts = cycle_counter  # number of iterations run

    if verbose:
        if not converged_x:
            print("X did not converge within iteration limit.")
        if not converged_y:
            print("Y did not converge within iteration limit.")
        print(f"\nFinal position: ({final_x:.2f}, {final_y:.2f})")
        print(f"Error: X = {err_x:.3f} µm, Y = {err_y:.3f} µm")
        print(f"Total readouts: {total_readouts}")
    
    if plotting:
        # Prepare data
        t_flat = np.concatenate(time_axis) * 1000
        wave_flat = np.concatenate(wave_data)
        num_frames = len(stage_x_hist) - 1

        cycles = np.arange(1, len(area_x_hist) + 1)
        max_area = max(max(area_x_hist), max(area_y_hist), 1)
        norm_area_x = np.array(area_x_hist) / max_area
        norm_area_y = np.array(area_y_hist) / max_area

        # ---- Compute per‑cycle mean intensity (DC offset) ----
        cycle_means = [np.mean(w) for w in wave_data]
        step_times = []
        step_means = []
        for i, (t_arr, mean_val) in enumerate(zip(time_axis, cycle_means)):
            t_arr_ms = t_arr * 1000
            t_start = t_arr_ms[0]
            t_end = t_arr_ms[-1]
            step_times.extend([t_start, t_end])
            step_means.extend([mean_val, mean_val])
        step_times = np.array(step_times)
        step_means = np.array(step_means)

        fig, ((ax_track, ax_scope), (ax_tdc, ax_sign)) = plt.subplots(
            2, 2, figsize=(14, 10), constrained_layout=True
        )
        fig.suptitle("2D Active Alignment – Sign‑bit Algorithm", fontsize=16, fontweight='bold')

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
        scope_line, = ax_scope.plot([], [], color='forestgreen', lw=1, alpha=0.4, label='History')
        scope_line_last, = ax_scope.plot([], [], color='forestgreen', lw=2.5, alpha=0.8, label='Current cycle')
        dc_line, = ax_scope.plot([], [], color='forestgreen', linestyle='--', lw=1.5, alpha=0.9, label='Mean intensity')
        ax_scope.legend(loc='upper right', fontsize=9)

        # ---- Area bars (bottom left) with trend line overlay ----
        ax_tdc.set_title("Integrated Area per MEMS Period", fontsize=12)
        ax_tdc.set_xlabel("Cycle", fontsize=11)
        ax_tdc.set_ylabel("Normalized Area", fontsize=11)
        ax_tdc.set_xlim(0, SIM_CYCLES + 1)
        ax_tdc.set_ylim(0, 1.05)
        ax_tdc.grid(True, linestyle='--', alpha=0.5)

        # ---- Sign plot (bottom right) ----
        ax_sign.set_title("Direction Sign", fontsize=12)
        ax_sign.set_xlabel("Cycle", fontsize=11)
        ax_sign.set_ylabel("Sign", fontsize=11)
        ax_sign.axhline(0, color='gray', linestyle='--', alpha=0.5)
        ax_sign.set_xlim(0, SIM_CYCLES + 1)
        ax_sign.set_ylim(-1.2, 1.2)
        ax_sign.grid(True, linestyle='--', alpha=0.5)

        # ---- Animation update ----
        def update(frame):
            # Stage path
            stage_line.set_data(stage_x_hist[:frame+1], stage_y_hist[:frame+1])
            if frame < len(mems_path_x):
                mems_trace.set_data(mems_path_x[frame], mems_path_y[frame])

            # Readout: cumulative + current cycle + DC offset
            end_idx = sum(len(w) for w in wave_data[:frame+1])
            scope_line.set_data(t_flat[:end_idx], wave_flat[:end_idx])
            if frame >= 0 and frame < len(wave_data):
                last_t = time_axis[frame] * 1000
                last_w = wave_data[frame]
                scope_line_last.set_data(last_t, last_w)

            # DC offset step‑curve up to current frame
            max_cycle = frame
            if max_cycle >= 0:
                idx_end = 2 * (max_cycle + 1)
                if idx_end <= len(step_times):
                    dc_line.set_data(step_times[:idx_end], step_means[:idx_end])
                else:
                    dc_line.set_data([], [])

            # Area bars + trend lines
            ax_tdc.clear()
            ax_tdc.grid(True, linestyle='--', alpha=0.5)
            ax_tdc.set_title("Integrated Area per MEMS Period", fontsize=12)
            ax_tdc.set_xlabel("Cycle", fontsize=11)
            ax_tdc.set_ylabel("Normalized Area", fontsize=11)
            x_vals = cycles[:frame+1]
            yx_vals = norm_area_x[:frame+1]
            yy_vals = norm_area_y[:frame+1]

            ax_tdc.bar(x_vals, yx_vals, facecolor='none', edgecolor='#2eb82e',
                       linewidth=0.25, hatch='/', alpha=0.5, label='Area X')
            ax_tdc.bar(x_vals, yy_vals, facecolor='none', edgecolor='#ff9900',
                       linewidth=0.25, hatch='\\\\', alpha=0.5, label='Area Y')
            if len(x_vals) > 0:
                ax_tdc.plot(x_vals, yx_vals, 'o-', color='#2eb82e', markersize=4,
                            linewidth=1.5, alpha=0.9, label='Trend X')
                ax_tdc.plot(x_vals, yy_vals, 's-', color='#ff9900', markersize=4,
                            linewidth=1.5, alpha=0.9, label='Trend Y')
            ax_tdc.legend(loc='upper right', fontsize=9)
            ax_tdc.set_xlim(0, SIM_CYCLES + 1)
            ax_tdc.set_ylim(0, 1.05)

            # Sign plot
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
    run_AA_2D_simplified(plotting=True, verbose=True)