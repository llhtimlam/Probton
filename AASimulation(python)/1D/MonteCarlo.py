# monte_carlo.py
import numpy as np
import matplotlib.pyplot as plt
import AASimulation
import config

MONTE_CARLO_RUNS = 1000

# Storage
conv_delta_list = []
amp_errors = []
conv_area_list = []
area_errors = []

print(f"Running {MONTE_CARLO_RUNS} simulations...")
for i in range(MONTE_CARLO_RUNS):
    if (i+1) % 100 == 0:
        print(f"  {i+1}/{MONTE_CARLO_RUNS} completed")
    cd, ea, ca, er = AASimulation.run_AA(plotting=False, verbose=False)
    conv_delta_list.append(cd)
    amp_errors.append(ea)
    conv_area_list.append(ca)
    area_errors.append(er)

# Statistics
amp_mean = np.mean(amp_errors)
amp_std = np.std(amp_errors)
amp_median = np.median(amp_errors)
amp_95 = np.percentile(amp_errors, 95)
amp_max = np.max(amp_errors)
area_mean = np.mean(area_errors)
area_std = np.std(area_errors)
area_median = np.median(area_errors)
area_95 = np.percentile(area_errors, 95)
area_max = np.max(area_errors)
conv_delta_mean = np.mean(conv_delta_list)
conv_delta_std = np.std(conv_delta_list)
conv_area_mean = np.mean(conv_area_list)
conv_area_std = np.std(conv_area_list)

# Print results
print("\n" + "="*60)
print(f"MONTE CARLO RESULTS ({MONTE_CARLO_RUNS} runs)")
print("="*60)
print("\nAmplitude method:")
print(f"  Mean error: {amp_mean:.3f} µm")
print(f"  Std dev:    {amp_std:.3f} µm")
print(f"  Median:     {amp_median:.3f} µm")
print(f"  95th %ile:  {amp_95:.3f} µm")
print(f"  Max error:  {amp_max:.3f} µm")
print(f"  Converged in {conv_delta_mean:.1f} ± {conv_delta_std:.1f} steps")
print("\nArea method:")
print(f"  Mean error: {area_mean:.3f} µm")
print(f"  Std dev:    {area_std:.3f} µm")
print(f"  Median:     {area_median:.3f} µm")
print(f"  95th %ile:  {area_95:.3f} µm")
print(f"  Max error:  {area_max:.3f} µm")
print(f"  Converged in {conv_area_mean:.1f} ± {conv_area_std:.1f} steps")

# Create the figure
fig, ax = plt.subplots(figsize=(12, 7))

# Histogram of errors – use a reasonable x‑limit (e.g., up to 95th percentile + margin)
max_hist = max(amp_95, area_95) * 1.2
bins = np.linspace(0, max_hist, 50)
ax.hist(amp_errors, bins=bins, density=True, histtype='step', linewidth=2, color='#2eb82e', label='Amplitude method')
ax.hist(area_errors, bins=bins, density=True, histtype='step', linewidth=2, color='#8a2be2', label='Area method', linestyle='--')
ax.set_xlim(0, max_hist)
ax.set_xlabel('Alignment error (µm)', fontsize=11)
ax.set_ylabel('Probability density', fontsize=11)
ax.set_title(f'Monte Carlo Results ({MONTE_CARLO_RUNS} runs)', fontsize=12, fontweight='bold')
ax.grid(True, linestyle=':', alpha=0.5)
ax.legend(loc='upper right')

# Statistics box
stat_text = (
    f"STATISTICS (Amplitude / Area)\n"
    f"Mean error (µm):    {amp_mean:.3f}  |  {area_mean:.3f}\n"
    f"Std dev (µm):       {amp_std:.3f}  |  {area_std:.3f}\n"
    f"Median (µm):        {amp_median:.3f}  |  {area_median:.3f}\n"
    f"95th percentile:    {amp_95:.3f}  |  {area_95:.3f}\n"
    f"Max error (µm):     {amp_max:.3f}  |  {area_max:.3f}\n"
    f"Convergence steps:  {conv_delta_mean:.1f}±{conv_delta_std:.1f}  |  {conv_area_mean:.1f}±{conv_area_std:.1f}"
)
props = dict(boxstyle='round,pad=0.5', facecolor='#f7fff2', edgecolor='#4da61a', alpha=0.95)
ax.text(0.98, 0.98, stat_text, transform=ax.transAxes, fontsize=9,
        verticalalignment='top', horizontalalignment='right', bbox=props, fontfamily='monospace')

# Add a vertical line at the maximum observed error
ax.axvline(amp_max, color='#2eb82e', linestyle='--', alpha=0.5, label=f'Amplitude max = {amp_max:.2f} µm')
ax.axvline(area_max, color='#8a2be2', linestyle='--', alpha=0.5, label=f'Area max = {area_max:.2f} µm')
ax.legend()

plt.tight_layout()
plt.show()