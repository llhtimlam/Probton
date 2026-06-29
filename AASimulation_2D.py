import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import math

# ======================== PARAMETERS ============================
SIM_CYCLES = 150
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

duration = 0.1

ENABLE_BIT_LOG = True
BITS = 8
ENABLE_AREA_QUANT = False

# ---------- Multi‑scale refinement levels ----------
LEVELS = [4.0, 2.0, 1.0]
MAX_REFINE_ITERATIONS = 50
CONVERGENCE_FLIPS = 6          # Check convergence (even in the consecutive flips window)

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

# ======================== SIMULATION ===================
def simulate_analog_readout(stage_x, stage_y, duration=duration):
    samples = int(duration * SAMPLE_RATE)
    t = np.linspace(0, duration, samples)
    x_mems = MEMS_AMP_X * np.sin(2 * np.pi * FX * t)
    y_mems = MEMS_AMP_Y * np.sin(2 * np.pi * FY * t)
    x_total = stage_x + x_mems
    y_total = stage_y + y_mems
    intensity = np.exp(-((x_total - TRUE_PEAK_X)**2 + (y_total - TRUE_PEAK_Y)**2) / (2 * BEAM_WIDTH**2))
    intensity += np.random.normal(0, NOISE_SIGMA, size=samples)

    T_X = 1 / FX; T_Y = 1 / FY
    samples_TX = int(T_X * SAMPLE_RATE)
    samples_TY = int(T_Y * SAMPLE_RATE)
    area_x = np.mean(intensity[:samples_TX])
    area_y = np.mean(intensity[:samples_TY])

    local_dc_offset_x = np.mean(intensity[:samples_TX])
    local_dc_offset_y = np.mean(intensity[:samples_TY])
    mixer_x = (intensity[:samples_TX] - local_dc_offset_x) * np.sin(2 * np.pi * FX * t[:samples_TX])
    mixer_y = (intensity[:samples_TY] - local_dc_offset_y) * np.sin(2 * np.pi * FY * t[:samples_TY])
    idx_peak_x = np.argmax(np.sin(2 * np.pi * FX * t[:samples_TX]))
    idx_peak_y = np.argmax(np.sin(2 * np.pi * FY * t[:samples_TY]))
    sign_x = 1 if mixer_x[idx_peak_x] > 0 else -1
    sign_y = 1 if mixer_y[idx_peak_y] > 0 else -1

    # 2ω amplitude (monitoring only)
    dc = np.mean(intensity)
    sin_2x = np.sin(4 * np.pi * FX * t)
    cos_2x = np.cos(4 * np.pi * FX * t)
    I_2x_sin = np.mean((intensity - dc) * sin_2x)
    I_2x_cos = np.mean((intensity - dc) * cos_2x)
    amp_2omega_x = np.sqrt(I_2x_sin**2 + I_2x_cos**2)

    sin_2y = np.sin(4 * np.pi * FY * t)
    cos_2y = np.cos(4 * np.pi * FY * t)
    I_2y_sin = np.mean((intensity - dc) * sin_2y)
    I_2y_cos = np.mean((intensity - dc) * cos_2y)
    amp_2omega_y = np.sqrt(I_2y_sin**2 + I_2y_cos**2)

    return area_x, area_y, sign_x, sign_y, t, intensity, x_total, y_total, amp_2omega_x, amp_2omega_y

def move_stage(curr_x, curr_y, step_x, step_y):
    lag_x = np.random.uniform(0.95, 1.05)
    lag_y = np.random.uniform(0.95, 1.05)
    new_x = curr_x + step_x * lag_x
    new_y = curr_y + step_y * lag_y
    return new_x, new_y

# ======================== LOGGING ====================
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

cycle_counter = 0
latest_amp_2x = 1.0
latest_amp_2y = 1.0

def log_cycle(area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, step_x, step_y, pos_x, pos_y, amp_2x, amp_2y):
    global cycle_counter, latest_amp_2x, latest_amp_2y
    cycle_counter += 1
    time_axis.append(t_w + (cycle_counter - 1) * duration)
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
    latest_amp_2x = amp_2x
    latest_amp_2y = amp_2y

def move_with_chunks(curr_x, curr_y, total_step_x, total_step_y, max_chunk=MAX_STEP):
    # If no movement, readout at current position
    if abs(total_step_x) < 1e-9 and abs(total_step_y) < 1e-9:
        area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, amp_2x, amp_2y = simulate_analog_readout(curr_x, curr_y)
        log_cycle(area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, 0.0, 0.0, curr_x, curr_y, amp_2x, amp_2y)
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
        area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, amp_2x, amp_2y = simulate_analog_readout(x, y)
        log_cycle(area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, step_x, step_y, x, y, amp_2x, amp_2y)
    return x, y, area_x, area_y, sign_x, sign_y

# ======================== MAIN ====================
current_x, current_y = START_X, START_Y
prev_sign_x = None
prev_sign_y = None

# ---------- Coarse scales ----------
for level_idx, mult in enumerate(LEVELS):
    current_max_step = MAX_STEP * mult
    if current_max_step < MIN_STEP:
        current_max_step = MIN_STEP

    # X collection
    area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, amp_2x, amp_2y = simulate_analog_readout(current_x, current_y)
    hist_x = [(current_x, area_x, sign_x)]
    log_cycle(area_x, area_y, sign_x, sign_y, t_w, intensity, x_path, y_path, 0.0, 0.0, current_x, current_y, amp_2x, amp_2y)

    step1_x = sign_x * current_max_step
    current_x, current_y, area_x1, area_y1, sign_x1, sign_y1 = move_with_chunks(current_x, current_y, step1_x, 0.0)
    hist_x.append((current_x, area_x1, sign_x1))

    if area_x1 <= area_x:
        step2_x = -step1_x
    elif sign_x1 != sign_x:
        step2_x = -0.5 * step1_x
    else:
        step2_x = step1_x

    current_x, current_y, area_x2, area_y2, sign_x2, sign_y2 = move_with_chunks(current_x, current_y, step2_x, 0.0)
    hist_x.append((current_x, area_x2, sign_x2))

    # Y collection
    hist_y = [(current_y, area_y2, sign_y2)]
    step1_y = sign_y2 * current_max_step
    current_x, current_y, area_x1, area_y1, sign_x1, sign_y1 = move_with_chunks(current_x, current_y, 0.0, step1_y)
    hist_y.append((current_y, area_y1, sign_y1))

    if area_y1 <= area_y2:
        step2_y = -step1_y
    elif sign_y1 != sign_y2:
        step2_y = -0.5 * step1_y
    else:
        step2_y = step1_y

    current_x, current_y, area_x2, area_y2, sign_x2, sign_y2 = move_with_chunks(current_x, current_y, 0.0, step2_y)
    hist_y.append((current_y, area_y2, sign_y2))

    # Jump
    x0, a0, _ = hist_x[0]; x1, a1, _ = hist_x[1]; x2, a2, _ = hist_x[2]
    step_x_calc = log_area_step(x0, a0, x1, a1, x2, a2)
    if np.isnan(step_x_calc) or abs(step_x_calc) < 1e-9:
        step_x_calc = sign_x2 * current_max_step
    if abs(step_x_calc) > 1e-9 and np.sign(step_x_calc) != sign_x2:
        step_x_calc = sign_x2 * current_max_step * 0.5
    step_x = np.clip(step_x_calc, -current_max_step, current_max_step)

    y0, b0, _ = hist_y[0]; y1, b1, _ = hist_y[1]; y2, b2, _ = hist_y[2]
    step_y_calc = log_area_step(y0, b0, y1, b1, y2, b2)
    if np.isnan(step_y_calc) or abs(step_y_calc) < 1e-9:
        step_y_calc = sign_y2 * current_max_step
    if abs(step_y_calc) > 1e-9 and np.sign(step_y_calc) != sign_y2:
        step_y_calc = sign_y2 * current_max_step * 0.5
    step_y = np.clip(step_y_calc, -current_max_step, current_max_step)

    current_x, current_y, _, _, _, _ = move_with_chunks(current_x, current_y, step_x, step_y)
    print(f"Scale {mult:.2f}x: jump X={step_x:.2f}, Y={step_y:.2f}")

# ---------- Refinement (independent axis convergence with freeze) ----------
print("Entering refinement...")
x_hist = [p for p, a, s in hist_x]
a_hist = [a for p, a, s in hist_x]
sign_x_last = hist_x[-1][2]
y_hist = [p for p, a, s in hist_y]
b_hist = [a for p, a, s in hist_y]
sign_y_last = hist_y[-1][2]

refine_count = 0
converged_x = False
converged_y = False
flip_counter_x = 0
flip_counter_y = 0
prev_step_sign_x = 0
prev_step_sign_y = 0

while not (converged_x and converged_y) and refine_count < MAX_REFINE_ITERATIONS:
    refine_count += 1

    # Compute X step (only if not converged)
    if not converged_x:
        x0, a0 = x_hist[0], a_hist[0]
        x1, a1 = x_hist[1], a_hist[1]
        x2, a2 = x_hist[2], a_hist[2]
        step_x_calc = log_area_step(x0, a0, x1, a1, x2, a2)
        if np.isnan(step_x_calc) or abs(step_x_calc) < 1e-9:
            step_x_calc = sign_x_last * MAX_STEP
        if abs(step_x_calc) > 1e-9 and np.sign(step_x_calc) != sign_x_last:
            step_x_calc = sign_x_last * MAX_STEP * 0.5
        step_x = np.clip(step_x_calc, -MAX_STEP, MAX_STEP)
    else:
        step_x = 0.0

    # Compute Y step (only if not converged)
    if not converged_y:
        y0, b0 = y_hist[0], b_hist[0]
        y1, b1 = y_hist[1], b_hist[1]
        y2, b2 = y_hist[2], b_hist[2]
        step_y_calc = log_area_step(y0, b0, y1, b1, y2, b2)
        if np.isnan(step_y_calc) or abs(step_y_calc) < 1e-9:
            step_y_calc = sign_y_last * MAX_STEP
        if abs(step_y_calc) > 1e-9 and np.sign(step_y_calc) != sign_y_last:
            step_y_calc = sign_y_last * MAX_STEP * 0.5
        step_y = np.clip(step_y_calc, -MAX_STEP, MAX_STEP)
    else:
        step_y = 0.0

    # Update flip counters (only for non‑converged axes)
    if not converged_x:
        sign_x_step = 1 if step_x > 0 else (-1 if step_x < 0 else 0)
        if sign_x_step != 0 and sign_x_step != prev_step_sign_x:
            flip_counter_x += 1
        else:
            flip_counter_x = 0
        prev_step_sign_x = sign_x_step
        if flip_counter_x >= CONVERGENCE_FLIPS and flip_counter_x % 2 == 0:
            print(f"X converged at iteration {refine_count} (flips={flip_counter_x})")
            converged_x = True
            # Ensure step_x is zero for the move
            step_x = 0.0

    if not converged_y:
        sign_y_step = 1 if step_y > 0 else (-1 if step_y < 0 else 0)
        if sign_y_step != 0 and sign_y_step != prev_step_sign_y:
            flip_counter_y += 1
        else:
            flip_counter_y = 0
        prev_step_sign_y = sign_y_step
        if flip_counter_y >= CONVERGENCE_FLIPS and flip_counter_y % 2 == 0:
            print(f"Y converged at iteration {refine_count} (flips={flip_counter_y})")
            converged_y = True
            step_y = 0.0

    # Apply steps (both axes move; one may be zero)
    current_x, current_y, new_area_x, new_area_y, new_sign_x, new_sign_y = move_with_chunks(current_x, current_y, step_x, step_y)

    # Update rolling windows **only** for non‑converged axes
    if not converged_x:
        x_hist.pop(0); a_hist.pop(0)
        x_hist.append(current_x); a_hist.append(new_area_x)
        sign_x_last = new_sign_x
    if not converged_y:
        y_hist.pop(0); b_hist.pop(0)
        y_hist.append(current_y); b_hist.append(new_area_y)
        sign_y_last = new_sign_y

    print(f"Refine {refine_count}: X step={step_x:.2f}, flips={flip_counter_x}, Y step={step_y:.2f}, flips={flip_counter_y}")

if not converged_x:
    print("X did not converge within iteration limit.")
if not converged_y:
    print("Y did not converge within iteration limit.")

final_x = current_x
final_y = current_y
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
fig.suptitle("Multi‑Scale Log‑Area with Direction Check", fontsize=14, fontweight='bold')

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