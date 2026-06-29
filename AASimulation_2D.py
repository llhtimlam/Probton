import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from collections import deque

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

ENABLE_BIT_LOG = True
BITS = 8
ENABLE_AREA_QUANT = False

# ======================== LOG‑AREA HELPER =======================
def log_8bit(x, bits=8):
    if not ENABLE_BIT_LOG:
        return np.log(max(x, 1e-10))
    max_code = 2**bits - 1
    code = int(round(max(0, min(1, x)) * max_code))
    if not hasattr(log_8bit, 'table'):
        log_8bit.table = np.log(np.arange(2**bits) / max_code + 1e-10)
    return log_8bit.table[code]

def quantize_amplitude(amp, bits=8):
    if not ENABLE_AREA_QUANT:
        return amp
    max_code = 2**bits - 1
    code = int(round(max(0, min(1, amp)) * max_code))
    return code / max_code

def log_area_step(x0, a0, x1, a1, x2, a2):
    h1 = x1 - x0
    h2 = x2 - x1
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

# ======================== SIMULATION FUNCTIONS ===================
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
    area_x = np.mean(intensity[:samples_TX])
    area_y = np.mean(intensity[:samples_TY])
    # Signs (for direction fallback)
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
    lag_x = np.random.uniform(0.95, 1.05)
    lag_y = np.random.uniform(0.95, 1.05)
    new_x = curr_x + step_x * lag_x
    new_y = curr_y + step_y * lag_y
    return new_x, new_y

# ======================== MAIN LOOP ====================
current_x, current_y = START_X, START_Y

# Rolling histories (max 3 points)
hist_x = deque(maxlen=3)
hist_y = deque(maxlen=3)

# Priming: first two steps are fixed positive
step_x = MAX_STEP
step_y = MAX_STEP

# Storage for plotting
stage_x_hist = [START_X]
stage_y_hist = [START_Y]
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

print("Cycle | x y areaX    areaY    signX signY  stepX stepY | Status")
for cycle in range(1, SIM_CYCLES + 1):
    area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path = simulate_analog_readout(current_x, current_y)
    time_axis.append(t_w + (cycle-1)*0.001)
    wave_data.append(intensity)
    mems_path_x.append(x_path)
    mems_path_y.append(y_path)
    area_x_hist_all.append(area_x)
    area_y_hist_all.append(area_y)
    sign_x_hist.append(sign_x)
    sign_y_hist.append(sign_y)

    # Append current data to rolling windows
    hist_x.append((current_x, area_x))
    hist_y.append((current_y, area_y))

    # --- Determine step for X ---
    if len(hist_x) < 3:
        step_x = MAX_STEP   # priming
    else:
        x0, a0 = hist_x[0]
        x1, a1 = hist_x[1]
        x2, a2 = hist_x[2]
        step_x_calc = log_area_step(x0, a0, x1, a1, x2, a2)
        step_x_calc = np.clip(step_x_calc, -MAX_STEP, MAX_STEP)

        # If calculation fails, use mixer sign to move TOWARD the peak
        if np.isnan(step_x_calc) or abs(step_x_calc) < 1e-9:
            dir_x = sign_x if sign_x != 0 else 1.0
            step_x_calc = dir_x * MAX_STEP
        step_x = step_x_calc

    # --- Determine step for Y ---
    if len(hist_y) < 3:
        step_y = MAX_STEP
    else:
        y0, b0 = hist_y[0]
        y1, b1 = hist_y[1]
        y2, b2 = hist_y[2]
        step_y_calc = log_area_step(y0, b0, y1, b1, y2, b2)
        step_y_calc = np.clip(step_y_calc, -MAX_STEP, MAX_STEP)
        if np.isnan(step_y_calc) or abs(step_y_calc) < 1e-9:
            dir_y = sign_y if sign_y != 0 else 1.0   # CORRECTED
            step_y_calc = dir_y * MAX_STEP
        step_y = step_y_calc

    step_x_hist.append(step_x)
    step_y_hist.append(step_y)

    # Move the stage
    current_x, current_y = move_stage(current_x, current_y, step_x, step_y)
    stage_x_hist.append(current_x)
    stage_y_hist.append(current_y)

    # Print status
    status_x = f"step={step_x:.2f}" if len(hist_x) == 3 else "Priming"
    status_y = f"step={step_y:.2f}" if len(hist_y) == 3 else "Priming"
    if cycle % 1 == 0 or cycle == SIM_CYCLES:
        print(f"{cycle:5d} {current_x:10.2f} {current_y:10.2f} {area_x:10.2f} {area_y:10.2f}   {sign_x:2d}   {sign_y:2d}    {step_x:6.2f} {step_y:6.2f} | X: {status_x} / Y: {status_y}")

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
cycles = np.arange(1, len(area_x_hist_all)+1)

max_area_display = max(max(area_x_hist_all), max(area_y_hist_all), 1)
norm_area_x = np.array(area_x_hist_all) / max_area_display
norm_area_y = np.array(area_y_hist_all) / max_area_display

fig, ((ax_track, ax_scope), (ax_tdc, ax_sign)) = plt.subplots(2, 2, figsize=(14, 10))
fig.suptitle("Log‑Area Tracking (Rolling Window, Incremental Steps)", fontsize=14, fontweight='bold')

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
    ax_sign.set_title("Mixer Sign (for reference)", fontsize=10)
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