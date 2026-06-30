import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# ======================== PARAMETERS ============================
SIM_CYCLES = 100
MIN_STEP = 0.0588 * 5
MAX_STEP = 0.375 * 5
NOISE_SIGMA = 0.01

TRUE_PEAK_X = 0
TRUE_PEAK_Y = 0
BEAM_WIDTH = 10.0
MEMS_AMP_X = 5.0
MEMS_AMP_Y = 5.0
FX = 300
FY = 400
SAMPLE_RATE = 2000

START_X = np.random.uniform(-20, 20)
START_Y = np.random.uniform(-20.0, 20.0)

duration = 0.1   # readout length (0.1 s)

# ---------- Convergence parameters ----------
STUCK_FLIPS = 4
CONVERGENCE_FLIPS = 8          # require at least this many consecutive flips AND even
MAX_REFINE_ITERATIONS = 50     # safety limit (overrides SIM_CYCLES if needed)

def simulate_analog_readout(stage_x, stage_y, duration=duration):
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
            same_sign_count = 0
        else:
            same_sign_count += 1
            if same_sign_count >= STUCK_FLIPS and step < MAX_STEP:
                step = MAX_STEP
                same_sign_count = 0

    prev_area = area
    prev_sign = sign
    return step, same_sign_count, prev_area, prev_sign

# ======================== MAIN LOOP =============================
current_x, current_y = START_X, START_Y

state_x = {'step': MAX_STEP, 'prev_area': None, 'prev_sign': None, 'same_sign_count': 0}
state_y = {'step': MAX_STEP, 'prev_area': None, 'prev_sign': None, 'same_sign_count': 0}

converged_x = False
converged_y = False
flip_counter_x = 0
flip_counter_y = 0
prev_step_sign_x = 0
prev_step_sign_y = 0

move_x = True

stage_x_hist = [START_X]
stage_y_hist = [START_Y]
time_axis, wave_data, mems_path_x, mems_path_y = [], [], [], []
area_x_hist, area_y_hist, sign_x_hist, sign_y_hist, step_x_hist, step_y_hist = [], [], [], [], [], []

print("Cycle |   x      y     areaX    areaY   signX signY  stepX stepY | Status")
for cycle in range(1, SIM_CYCLES + 1):
    area_x, area_y, sign_x, sign_y, t_w, intensity, x_mems, y_mems, x_path, y_path = simulate_analog_readout(current_x, current_y)
    
    time_axis.append(t_w + (cycle - 1) * duration)
    wave_data.append(intensity)
    mems_path_x.append(x_path)
    mems_path_y.append(y_path)
    area_x_hist.append(area_x)
    area_y_hist.append(area_y)
    sign_x_hist.append(sign_x)
    sign_y_hist.append(sign_y)

    # Initialize current loop step snapshots as flat defaults
    step_x = 0.0
    step_y = 0.0
    active_axis = 'X' if move_x else 'Y'

    # ---- Track and Update X Axis (With False-Convergence Recovery) ----
    if move_x:
        # Recovery Check: If marked converged but hardware reads a real direction, wake up!
        if converged_x and sign_x != 0:
            print(f"X recovered from false convergence at cycle {cycle} (sign_x={sign_x})")
            converged_x = False
            state_x['step'] = MAX_STEP  # Reset to default searching scale

        if not converged_x:
            if sign_x == 0:
                print(f"X converged via 0-Sum Phase Lock at cycle {cycle}")
                converged_x = True
                state_x['step'] = 0.0
                step_x = 0.0
            else:
                step_x, state_x['same_sign_count'], state_x['prev_area'], state_x['prev_sign'] = \
                    update_axis_step(area_x, state_x['prev_area'], sign_x, state_x['prev_sign'],
                                     state_x['step'], state_x['same_sign_count'])
                state_x['step'] = step_x

                # Track flips for X
                if sign_x != prev_step_sign_x:
                    flip_counter_x += 1
                else:
                    flip_counter_x = 0
                prev_step_sign_x = sign_x

                if flip_counter_x >= CONVERGENCE_FLIPS and flip_counter_x % 2 == 0:
                    print(f"X converged at cycle {cycle} (flips={flip_counter_x})")
                    converged_x = True
                    step_x = 0.0
                    state_x['step'] = 0.0
        else:
            # Clean hold state: axis is converged and sign is still 0
            step_x = 0.0

    # ---- Track and Update Y Axis (With False-Convergence Recovery) ----
    else:  # This is purely Y's turn (not move_x)
        # Recovery Check: If marked converged but hardware reads a real direction, wake up!
        if converged_y and sign_y != 0:
            print(f"Y recovered from false convergence at cycle {cycle} (sign_y={sign_y})")
            converged_y = False
            state_y['step'] = MAX_STEP  # Reset to default searching scale

        if not converged_y:
            if sign_y == 0:
                print(f"Y converged via 0-Sum Phase Lock at cycle {cycle}")
                converged_y = True
                state_y['step'] = 0.0
                step_y = 0.0
            else:
                step_y, state_y['same_sign_count'], state_y['prev_area'], state_y['prev_sign'] = \
                    update_axis_step(area_y, state_y['prev_area'], sign_y, state_y['prev_sign'],
                                     state_y['step'], state_y['same_sign_count'])
                state_y['step'] = step_y

                # Track flips for Y
                if sign_y != prev_step_sign_y:
                    flip_counter_y += 1
                else:
                    flip_counter_y = 0
                prev_step_sign_y = sign_y

                if flip_counter_y >= CONVERGENCE_FLIPS and flip_counter_y % 2 == 0:
                    print(f"Y converged at cycle {cycle} (flips={flip_counter_y})")
                    converged_y = True
                    step_y = 0.0
                    state_y['step'] = 0.0
        else:
            # Clean hold state: axis is converged and sign is still 0
            step_y = 0.0

    step_x_hist.append(step_x)
    step_y_hist.append(step_y)

    # to enforce correct vector tracking direction mapping.
    command_step_x = sign_x * step_x if not converged_x else 0.0
    command_step_y = sign_y * step_y if not converged_y else 0.0

    current_x, current_y = move_stage(current_x, current_y, command_step_x, command_step_y)
    stage_x_hist.append(current_x)
    stage_y_hist.append(current_y)

    status = f"dir={active_axis} step={step_x if active_axis == 'X' else step_y:.2f}"
    if converged_x and converged_y:
        status += " (both converged)"
    elif converged_x:
        status += " (X converged)"
    elif converged_y:
        status += " (Y converged)"
    else:
        status += f" flips X={flip_counter_x}, Y={flip_counter_y}"
        
    print(f"{cycle:5d} {current_x:10.2f} {current_y:10.2f} {area_x:10.2f} {area_y:10.2f}   {sign_x:2d}   {sign_y:2d}    {step_x:6.2f} {step_y:6.2f} | {status}")

    move_x = not move_x

    if converged_x and converged_y:
        print("Both axes converged. Stopping early.")
        break


# Final results
final_x = stage_x_hist[-1]
final_y = stage_y_hist[-1]
err_x = abs(final_x - TRUE_PEAK_X)
err_y = abs(final_y - TRUE_PEAK_Y)
print(f"\nFinal position: ({final_x:.2f}, {final_y:.2f})")
print(f"Error: X = {err_x:.3f} µm, Y = {err_y:.3f} µm")

# ======================== PLOTTING ===================
# (unchanged from original)
t_flat = np.concatenate(time_axis) * 1000
wave_flat = np.concatenate(wave_data)
num_frames = len(stage_x_hist) - 1
cycles = np.arange(1, len(area_x_hist)+1)

max_area_display = max(max(area_x_hist), max(area_y_hist), 1)
norm_area_x = np.array(area_x_hist) / max_area_display
norm_area_y = np.array(area_y_hist) / max_area_display

fig, ((ax_track, ax_scope), (ax_tdc, ax_sign)) = plt.subplots(2, 2, figsize=(14, 10))
fig.suptitle("Optimized Dual-Zone Memory Alignment Core", fontsize=14, fontweight='bold')

ax_track.set_xlim(min(START_X, TRUE_PEAK_X) - 10, max(START_X, TRUE_PEAK_X) + 10)
ax_track.set_ylim(min(START_Y, TRUE_PEAK_Y) - 10, max(START_Y, TRUE_PEAK_Y) + 10)
ax_track.grid(True, linestyle='--', alpha=0.5)
ax_track.set_title("Stage Path", fontsize=10)
ax_track.set_xlabel("X")
ax_track.set_ylabel("Y")
ax_track.plot(TRUE_PEAK_X, TRUE_PEAK_Y, 'X', color='red', markersize=14, label="True Peak")
stage_line, = ax_track.plot([], [], 'o--', color='crimson', lw=1.5, markersize=4, label="Stage")
mems_trace, = ax_track.plot([], [], color='teal', alpha=0.3, lw=1.0, label="MEMS")
ax_track.legend(loc="upper right", fontsize=8)

ax_scope.set_xlim(0, t_flat[-1])
ax_scope.set_ylim(-0.1, 1.1)
ax_scope.grid(True, linestyle='--', alpha=0.5)
ax_scope.set_title("TIA Readout", fontsize=10)
ax_scope.set_xlabel("Time (ms)")
ax_scope.set_ylabel("Intensity")
scope_line, = ax_scope.plot([], [], color='forestgreen', lw=2)

def update(frame):
    stage_line.set_data(stage_x_hist[:frame+1], stage_y_hist[:frame+1])
    if frame < len(mems_path_x):
        mems_trace.set_data(mems_path_x[frame], mems_path_y[frame])
    end_idx = sum(len(w) for w in wave_data[:frame+1])
    scope_line.set_data(t_flat[:end_idx], wave_flat[:end_idx])

    ax_tdc.clear()
    ax_tdc.grid(True, linestyle='--', alpha=0.5)
    ax_tdc.set_title("TDC Area (normalized)", fontsize=10)
    ax_tdc.set_xlabel("Cycle")
    ax_tdc.set_ylabel("Normalized Area")
    x_vals = cycles[:frame+1]
    yx_vals = norm_area_x[:frame+1]
    yy_vals = norm_area_y[:frame+1]
    ax_tdc.bar(x_vals, yx_vals, facecolor='none', edgecolor='darkorange', linewidth=1, hatch='/', label='TDC X')
    ax_tdc.bar(x_vals, yy_vals, facecolor='none', edgecolor='purple', linewidth=1, hatch='\\\\', label='TDC Y')
    ax_tdc.legend(loc="upper right", fontsize=8)
    ax_tdc.set_xlim(0, SIM_CYCLES+1)
    ax_tdc.set_ylim(0, 1.05)

    ax_sign.clear()
    ax_sign.grid(True, linestyle='--', alpha=0.5)
    ax_sign.set_title("Mixer Sign (direction)", fontsize=10)
    ax_sign.set_xlabel("Cycle")
    ax_sign.set_ylabel("Sign")
    ax_sign.axhline(0, color='gray', linestyle='--', alpha=0.5)
    x_vals = cycles[:frame+1]
    sx_vals = sign_x_hist[:frame+1]
    sy_vals = sign_y_hist[:frame+1]
    ax_sign.plot(x_vals, sx_vals, 'o-', color='darkorange', label='Sign X')
    ax_sign.plot(x_vals, sy_vals, 's-', color='purple', label='Sign Y')
    ax_sign.legend(loc="upper right", fontsize=8)
    ax_sign.set_xlim(0, SIM_CYCLES+1)
    ax_sign.set_ylim(-1.2, 1.2)

    return stage_line, mems_trace, scope_line

ani = FuncAnimation(fig, update, frames=num_frames, interval=200, blit=False, repeat=True)
plt.tight_layout()
plt.show()