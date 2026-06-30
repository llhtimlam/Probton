# monte_carlo_2D.py
import numpy as np
import matplotlib.pyplot as plt
from AASimulation_2D import run_AA_2D
from AASimulation_2DSimplified import run_AA_2D_simplified
from config2D import SIM_CYCLES

MONTE_CARLO_RUNS = 1000

def run_method(func, method_name):
    """Run Monte Carlo for one method, return error arrays and readouts."""
    err_x = []
    err_y = []
    readouts = []
    conv_x = []
    conv_y = []

    for i in range(MONTE_CARLO_RUNS):
        if (i+1) % 100 == 0:
            print(f"  {i+1}/{MONTE_CARLO_RUNS} completed")
        cvg_x, cvg_y, fx, fy, ex, ey, rd = func(plotting=False, verbose=False)
        err_x.append(ex)
        err_y.append(ey)
        readouts.append(rd)
        conv_x.append(cvg_x)
        conv_y.append(cvg_y)

    err_rad = np.sqrt(np.array(err_x)**2 + np.array(err_y)**2)

    return {
        'err_rad': err_rad,
        'readouts': np.array(readouts),
        'conv_both': sum(1 for cx, cy in zip(conv_x, conv_y) if cx and cy),  # both converged
    }

def compute_stats(arr):
    return {
        'mean': np.mean(arr),
        'std': np.std(arr),
        'median': np.median(arr),
        'p95': np.percentile(arr, 95),
        'max': np.max(arr),
    }

# Run simulations
print(f"Running {MONTE_CARLO_RUNS} simulations...")
print("\nSign-bit method:")
signbit = run_method(run_AA_2D_simplified, "Sign-bit")
print("\nLog-area method:")
logarea = run_method(run_AA_2D, "Log-area")

# Compute statistics
stats_sign = {
    'rad': compute_stats(signbit['err_rad']),
    'readouts': compute_stats(signbit['readouts']),
    'conv_both': signbit['conv_both'],
}
stats_log = {
    'rad': compute_stats(logarea['err_rad']),
    'readouts': compute_stats(logarea['readouts']),
    'conv_both': logarea['conv_both'],
}

# ----------------------------------------------------------------------
# Print summary
# ----------------------------------------------------------------------
print("\n" + "="*60)
print(f"MONTE CARLO RESULTS ({MONTE_CARLO_RUNS} runs)")
print("="*60)

print("\nSign-bit method:")
print(f"  Radial error (mean±std): {stats_sign['rad']['mean']:.3f} ± {stats_sign['rad']['std']:.3f} µm")
print(f"  Median:   {stats_sign['rad']['median']:.3f} µm, 95%: {stats_sign['rad']['p95']:.3f} µm, Max: {stats_sign['rad']['max']:.3f} µm")
print(f"  Steps to converge: {stats_sign['readouts']['mean']:.1f} ± {stats_sign['readouts']['std']:.1f}")
print(f"  Both axes converged: {stats_sign['conv_both']}/{MONTE_CARLO_RUNS} ({stats_sign['conv_both']/MONTE_CARLO_RUNS*100:.1f}%)")

print("\nLog-area method:")
print(f"  Radial error (mean±std): {stats_log['rad']['mean']:.3f} ± {stats_log['rad']['std']:.3f} µm")
print(f"  Median:   {stats_log['rad']['median']:.3f} µm, 95%: {stats_log['rad']['p95']:.3f} µm, Max: {stats_log['rad']['max']:.3f} µm")
print(f"  Steps to converge: {stats_log['readouts']['mean']:.1f} ± {stats_log['readouts']['std']:.1f}")
print(f"  Both axes converged: {stats_log['conv_both']}/{MONTE_CARLO_RUNS} ({stats_log['conv_both']/MONTE_CARLO_RUNS*100:.1f}%)")

# ----------------------------------------------------------------------
# Plot histogram of radial errors
# ----------------------------------------------------------------------
fig, ax = plt.subplots(figsize=(12, 7))

max_rad = max(stats_sign['rad']['p95'], stats_log['rad']['p95']) * 1.2
bins = np.linspace(0, max_rad, 50)

ax.hist(signbit['err_rad'], bins=bins, density=True, histtype='step',
        linewidth=2, color='#2eb82e', label='Sign-bit method')
ax.hist(logarea['err_rad'], bins=bins, density=True, histtype='step',
        linewidth=2, color='#8a2be2', label='Log-area method', linestyle='--')
ax.set_xlim(0, max_rad)
ax.set_xlabel('Radial alignment error (µm)', fontsize=11)
ax.set_ylabel('Probability density', fontsize=11)
ax.set_title(f'Monte Carlo Results ({MONTE_CARLO_RUNS} runs)', fontsize=12, fontweight='bold')
ax.grid(True, linestyle=':', alpha=0.5)
ax.legend(loc='upper right')

# Statistics box
stat_text = (
    f"STATISTICS (Sign‑bit / Log‑area)\n"
    f"Radial mean (µm):      {stats_sign['rad']['mean']:.3f}  |  {stats_log['rad']['mean']:.3f}\n"
    f"Radial std (µm):       {stats_sign['rad']['std']:.3f}  |  {stats_log['rad']['std']:.3f}\n"
    f"Radial median (µm):    {stats_sign['rad']['median']:.3f}  |  {stats_log['rad']['median']:.3f}\n"
    f"Radial 95% (µm):       {stats_sign['rad']['p95']:.3f}  |  {stats_log['rad']['p95']:.3f}\n"
    f"Radial max (µm):       {stats_sign['rad']['max']:.3f}  |  {stats_log['rad']['max']:.3f}\n"
    f"Steps (mean±std):      {stats_sign['readouts']['mean']:.1f}±{stats_sign['readouts']['std']:.1f}  |  {stats_log['readouts']['mean']:.1f}±{stats_log['readouts']['std']:.1f}\n"
    f"Both converged:        {stats_sign['conv_both']/MONTE_CARLO_RUNS*100:.1f}%  |  {stats_log['conv_both']/MONTE_CARLO_RUNS*100:.1f}%"
)
props = dict(boxstyle='round,pad=0.5', facecolor='#f7fff2', edgecolor='#4da61a', alpha=0.95)
ax.text(0.98, 0.98, stat_text, transform=ax.transAxes, fontsize=9,
        verticalalignment='top', horizontalalignment='right', bbox=props, fontfamily='monospace')

# Vertical lines for max radial errors
ax.axvline(stats_sign['rad']['max'], color='#2eb82e', linestyle='--', alpha=0.5,
           label=f'Sign-bit max = {stats_sign["rad"]["max"]:.2f} µm')
ax.axvline(stats_log['rad']['max'], color='#8a2be2', linestyle='--', alpha=0.5,
           label=f'Log-area max = {stats_log["rad"]["max"]:.2f} µm')
ax.legend()

plt.tight_layout()
plt.show()