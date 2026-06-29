import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# ======================== PARAMETERS ============================
SIM_CYCLES = 100
MIN_STEP = 0.01
MAX_STEP = 1.28
NOISE_SIGMA = 0.01

TRUE_PEAK_X = 0
TRUE_PEAK_Y = 0
BEAM_WIDTH = 10.0
MEMS_AMP_X = 5.0
MEMS_AMP_Y = 5.0
FX = 300
FY = 400
SAMPLE_RATE = 40000

START_X = np.random.uniform(-20, 20)
START_Y = np.random.uniform(-20.0, 20.0)

def simulate_analog_readout(stage_x, stage_y, duration=0.001):
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

    # Area (mean intensity over one MEMS period) – normalized to [0,1]
    area_x = np.mean(intensity[:samples_TX])
    area_y = np.mean(intensity[:samples_TY])

    # Mixer and sign (direction indicator)
    local_dc_offset_x = np.mean(intensity[:samples_TX])
    local_dc_offset_y = np.mean(intensity[:samples_TY])
    mixer_x = (intensity[:samples_TX] - local_dc_offset_x) * np.sin(2 * np.pi * FX * t[:samples_TX])
    mixer_y = (intensity[:samples_TY] - local_dc_offset_y) * np.sin(2 * np.pi * FY * t[:samples_TY])
    idx_peak_x = np.argmax(np.sin(2 * np.pi * FX * t[:samples_TX]))
    idx_peak_y = np.argmax(np.sin(2 * np.pi * FY * t[:samples_TY]))
    sign_x = 1 if mixer_x[idx_peak_x] > 0 else -1
    sign_y = 1 if mixer_y[idx_peak_y] > 0 else -1

    return area_x, area_y, sign_x, sign_y, t, intensity, x_total, y_total

def move_stage(curr_x, curr_y, step_x, step_y):
    # Simulate mechanical lag
    lag_x = np.random.uniform(0.95, 1.05)
    lag_y = np.random.uniform(0.95, 1.05)
    new_x = curr_x + step_x * lag_x
    new_y = curr_y + step_y * lag_y
    return new_x, new_y

# ======================== FAIR COMPASS LOOP =====================
current_x, current_y = START_X, START_Y

# Initial step and direction (arbitrary, will be corrected)
step_x = MAX_STEP
step_y = MAX_STEP
direction_x = 1.0   # will be overwritten by sign
direction_y = 1.0

prev_area_x = None
prev_area_y = None
prev_sign_x = None
prev_sign_y = None
same_sign_count_x = 0
same_sign_count_y = 0

# Storage for plotting
stage_x_hist = [START_X]
stage_y_hist = [START_Y]
time_axis = []
wave_data = []
mems_path_x = []
mems_path_y = []
area_x_hist = []
area_y_hist = []
sign_x_hist = []
sign_y_hist = []
step_x_hist = []
step_y_hist = []

print("Cycle |   x      y     areaX    areaY   signX signY  stepX stepY | Status")
for cycle in range(1, SIM_CYCLES + 1):
    area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path = simulate_analog_readout(current_x, current_y)
    time_axis.append(t_w + (cycle-1)*0.001)
    wave_data.append(intensity)
    mems_path_x.append(x_path)
    mems_path_y.append(y_path)
    area_x_hist.append(area_x)
    area_y_hist.append(area_y)
    sign_x_hist.append(sign_x)
    sign_y_hist.append(sign_y)

    # 1. Direction = mixer sign (always)
    direction_x = sign_x
    direction_y = sign_y

    # 2. Step adjustment based on area change (if previous area exists)
    if prev_area_x is not None:
        # X axis
        if area_x > prev_area_x:
            step_x = min(MAX_STEP, step_x)   # uphill
        elif area_x < prev_area_x:
            step_x = max(MIN_STEP, step_x * 0.5)    # downhill: slow down (but don't reverse!)
        # if area unchanged, keep step

        # Y axis same
        if area_y > prev_area_y:
            step_y = min(MAX_STEP, step_y)
        elif area_y < prev_area_y:
            step_y = max(MIN_STEP, step_y * 0.5)

        # If sign changed, we crossed the peak – reduce step to avoid overshoot
        if prev_sign_x is not None and sign_x != prev_sign_x:
            step_x = max(MIN_STEP, step_x * 0.5)
            same_sign_count_x = 0
        else:
            # Sign unchanged: increment counter
            same_sign_count_x += 1
            # If we've been moving in the same direction for a while, increase step (recovery)
            if same_sign_count_x >= 5 and step_x < MAX_STEP:
                step_x = MAX_STEP
                same_sign_count_x = 0  # reset to avoid constant boost

        if prev_sign_y is not None and sign_y != prev_sign_y:
            step_y = max(MIN_STEP, step_y * 0.5)
            same_sign_count_y = 0
        else:
            same_sign_count_y += 1
            if same_sign_count_y >= 5 and step_y < MAX_STEP:
                step_y = MAX_STEP
                same_sign_count_y = 0

    # Store for next cycle
    prev_area_x = area_x
    prev_area_y = area_y
    prev_sign_x = sign_x
    prev_sign_y = sign_y

    # (Optional: if step becomes tiny, we could stop, but we let it run)

    step_x_hist.append(step_x)
    step_y_hist.append(step_y)

    # Move the stage
    current_x, current_y = move_stage(current_x, current_y, direction_x * step_x, direction_y * step_y)
    stage_x_hist.append(current_x)
    stage_y_hist.append(current_y)

    # Print status
    status = f"dir={direction_x:+.0f} step={step_x:.2f}" if cycle > 1 else "Priming"
    if cycle % 1 == 0 or cycle == SIM_CYCLES:
        print(f"{cycle:5d} {current_x:10.2f} {current_y:10.2f} {area_x:10.2f} {area_y:10.2f}   {sign_x:2d}   {sign_y:2d}    {step_x:6.2f} {step_y:6.2f} | {status}")

final_x = stage_x_hist[-1]
final_y = stage_y_hist[-1]
err_x = abs(final_x - TRUE_PEAK_X)
err_y = abs(final_y - TRUE_PEAK_Y)
print(f"\nFinal position: ({final_x:.2f}, {final_y:.2f})")
print(f"Error: X = {err_x:.3f} µm, Y = {err_y:.3f} µm")

# ======================== PLOTTING ===================
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
