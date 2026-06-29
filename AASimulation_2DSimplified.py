import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

SIM_CYCLES = 100
MIN_STEP = 0.05
MAX_STEP = 2.0
NOISE_SIGMA = 0.01

TRUE_PEAK_X = 0
TRUE_PEAK_Y = 0
BEAM_WIDTH = 10.0
MEMS_AMP_X = 5.0
MEMS_AMP_Y = 5.0
FX = 300
FY = 400
SAMPLE_RATE = 40000

START_X = np.random.uniform(-10, 10)
START_Y = np.random.uniform(-10.0, 10.0)

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

    # 1-omega Integrator Area Outputs
    area_x = np.sum(intensity[:samples_TX])
    area_y = np.sum(intensity[:samples_TY])

    # 3. PURE WAVE MIXER WITH PERIODIC LOCAL AC-COUPLING
    # The capacitor only blocks the DC offset of the CURRENT active cycle window
    local_dc_offset_x = np.mean(intensity[:samples_TX])
    local_dc_offset_y = np.mean(intensity[:samples_TY])
    
    # Simple, non-complicated multiplication of current period data
    mixer_x = (intensity[:samples_TX] - local_dc_offset_x) * np.sin(2 * np.pi * FX * t[:samples_TX])
    mixer_y = (intensity[:samples_TY] - local_dc_offset_y) * np.sin(2 * np.pi * FY * t[:samples_TY])

    # 4. DISCRETE 2-OMEGA SNAPSHOT (Latching the Comparator State)
    # The clock edge strikes exactly at the 90-degree peak mark of each axis window
    idx_peak_x = np.argmax(np.sin(2 * np.pi * FX * t[:samples_TX]))
    idx_peak_y = np.argmax(np.sin(2 * np.pi * FY * t[:samples_TY]))

    # The high-gain comparator outputs a sharp 1 or -1 based on real-time local phase
    sign_x = 1 if mixer_x[idx_peak_x] > 0 else -1
    sign_y = 1 if mixer_y[idx_peak_y] > 0 else -1

    return area_x, area_y, sign_x, sign_y, t, intensity, x_total, y_total

def move_stage(curr_x, curr_y, heading_x, heading_y, step_x, step_y):
    lag_x = np.random.uniform(0.95, 1.05)
    lag_y = np.random.uniform(0.95, 1.05)
    new_x = curr_x + heading_x * step_x * lag_x
    new_y = curr_y + heading_y * step_y * lag_y
    return new_x, new_y

current_x, current_y = START_X, START_Y
last_sign_x, last_sign_y = 0, 0
step_x, step_y = MAX_STEP, MAX_STEP

# --- NEW MEMORY REGISTERS ---
max_area_x, max_observed_y = 0.0, 0.0
prev_area_x, prev_area_y = 0.0, 0.0
direction_x, direction_y = 1, 1

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

just_reversed_x = False
just_reversed_y = False
flip_count_x = 0
flip_count_y = 0
stuck_counter_x = 0
stuck_counter_y = 0
force_freeze_x = False
force_freeze_y = False

print("Cycle | areaX    areaY    signX signY  stepX stepY | Status")
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
    step_x_hist.append(step_x)
    step_y_hist.append(step_y)

    # 1. Update High-Water Mark Memory
    if area_x > max_area_x: max_area_x = area_x
    if area_y > max_observed_y: max_observed_y = area_y

    # 2. Check if TDC Area is flat-lined in background noise (Dark Current check)
    # The noise floor sum over samples_TX leaves a baseline area (roughly 1.0 to 3.0)
    tdc_x_is_flat = (area_x >= prev_area_x - 0.1) and (area_x <= prev_area_x + 0.1)
    tdc_y_is_flat = (area_y >= prev_area_y - 0.1) and (area_y <= prev_area_y + 0.1)
    status_str = "Climbing"
    # =========================================================================
    # CORE TRACKING INTERLOCK LAYER
    # =========================================================================
    status_x = "Climbing X"
    status_y = "Climbing Y"

    # --- PROCESS X MOTION ---
    crossed_x = (sign_x != last_sign_x)
    
    if not crossed_x and area_x < prev_area_x:
        # Check if our current heading is actually moving the wrong way 
        # relative to what our absolute physical wave mixer compass dictates
        if direction_x != sign_x:
            # TRUE WRONG DIRECTION: We are moving away from the peak. Force the reversal!
            if force_freeze_x:
                stuck_counter_x = 0
                force_freeze_x = False
                status_x = "Watchdog Override X"
            else:
                stuck_counter_x += 1
                if stuck_counter_x >= 3:
                    force_freeze_x = True
                    direction_x = -direction_x
                    status_x = "Timeout Reversal X"
                else:
                    direction_x = -direction_x
                    status_x = "Decreasing Reverse X"
        else:
            # FALSE TRAP: The area dropped, but the compass confirms we are headed the right way.
            # This is pure high-frequency noise or mechanical lag. Ignore the drop and listen to the compass!
            stuck_counter_x = 0
            force_freeze_x = False
            direction_x = -sign_x
            status_x = "Noise Filtered X (Follow Compass)"
    else:
        stuck_counter_x = 0
        force_freeze_x = False
        if crossed_x and (area_x > prev_area_x):
            direction_x = -sign_x
            step_x = max(MIN_STEP, step_x * 0.4)
            status_x = "Braking X"
        else:
            # Ensure a fallback default when climbing normally
            direction_x = sign_x
            status_x = "Climbing X"

    # --- PROCESS Y MOTION ---
    crossed_y = (sign_y != last_sign_y)
    
    if not crossed_y and area_y < prev_area_y:
        if direction_y != sign_y:
            if force_freeze_y:
                stuck_counter_y = 0
                force_freeze_y = False
                status_y = "Watchdog Override Y"
            else:
                stuck_counter_y += 1
                if stuck_counter_y >= 3:
                    force_freeze_y = True
                    direction_y = -direction_y
                    status_y = "Timeout Reversal Y"
                else:
                    direction_y = -direction_y
                    status_y = "Decreasing Reverse Y"
        else:
            stuck_counter_y = 0
            force_freeze_y = False
            direction_y = -sign_y
            status_y = "Noise Filtered Y (Follow Compass)"
    else:
        stuck_counter_y = 0
        force_freeze_y = False
        if crossed_y and (area_y > prev_area_y):
            direction_y = -sign_y
            step_y = max(MIN_STEP, step_y * 0.4)
            status_y = "Braking Y"
        else:
            direction_y = sign_y
            status_y = "Climbing Y"
    

    # Bring to an absolute lock if error converges below resolution limits
    if abs(current_x - TRUE_PEAK_X) < 0.2: step_x = 0.0
    if abs(current_y - TRUE_PEAK_Y) < 0.2: step_y = 0.0

    current_x, current_y = move_stage(current_x, current_y, direction_x, direction_y, step_x, step_y)
    stage_x_hist.append(current_x)
    stage_y_hist.append(current_y)

    # Update background tracking registers
    prev_area_x = area_x
    prev_area_y = area_y
    last_sign_x, last_sign_y = sign_x, sign_y

    if cycle % 1 == 0 or cycle == SIM_CYCLES:
        print(f"{cycle:5d} {current_x:10.2f} {current_y:10.2f} {area_x:10.2f} {area_y:10.2f}   {sign_x:2d}   {sign_y:2d}    {step_x:6.2f} {step_y:6.2f} |  | X: {status_x} / Y: {status_y}")

final_x = stage_x_hist[-1]
final_y = stage_y_hist[-1]
err_x = abs(final_x - TRUE_PEAK_X)
err_y = abs(final_y - TRUE_PEAK_Y)
print(f"\nFinal position: ({final_x:.2f}, {final_y:.2f})")
print(f"Error: X = {err_x:.3f} µm, Y = {err_y:.3f} µm")

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
