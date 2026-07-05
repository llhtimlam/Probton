# monte_carlo_2D.py
import numpy as np
import matplotlib.pyplot as plt
from AASimulation_2D import run_AA_2D
from AASimulation_2DSimplified import run_AA_2D_simplified
from config2D import MONTE_CARLO_RUNS

# ==============================================
# SELECT WHICH METHODS TO RUN
# ==============================================
RUN_SIGNBIT = True    # Set to False to skip Sign‑bit method
RUN_LOGAREA = True    # Set to False to skip Log‑area method

# ==============================================

def run_method(func, method_name):
    """Run Monte Carlo for one method, return error arrays and readouts."""
    err_rad = []
    readouts = []
    conv_both = 0

    for i in range(MONTE_CARLO_RUNS):
        if (i+1) % 100 == 0:
            print(f"  {i+1}/{MONTE_CARLO_RUNS} completed")
        cvg_x, cvg_y, fx, fy, ex, ey, rd = func(plotting=False, verbose=False)
        err_rad.append(np.sqrt(ex**2 + ey**2))
        readouts.append(rd)
        if cvg_x and cvg_y:
            conv_both += 1

    return {
        'err_rad': np.array(err_rad),
        'readouts': np.array(readouts),
        'conv_both': conv_both,
    }

def compute_stats(arr):
    return {
        'mean': np.mean(arr),
        'std': np.std(arr),
        'median': np.median(arr),
        'p95': np.percentile(arr, 95),
        'max': np.max(arr),
    }

# ----------------------------------------------------------------------
# Run selected methods
# ----------------------------------------------------------------------
print(f"Running {MONTE_CARLO_RUNS} simulations...")

stats = {}

if RUN_SIGNBIT:
    print("\nSign-bit method:")
    signbit = run_method(run_AA_2D_simplified, "Sign-bit")
    stats['sign'] = {
        'rad': compute_stats(signbit['err_rad']),
        'readouts': compute_stats(signbit['readouts']),
        'conv_both': signbit['conv_both'],
        'err_rad': signbit['err_rad'],
    }
else:
    stats['sign'] = None

if RUN_LOGAREA:
    print("\nLog-area method:")
    logarea = run_method(run_AA_2D, "Log-area")
    stats['log'] = {
        'rad': compute_stats(logarea['err_rad']),
        'readouts': compute_stats(logarea['readouts']),
        'conv_both': logarea['conv_both'],
        'err_rad': logarea['err_rad'],
    }
else:
    stats['log'] = None

# ----------------------------------------------------------------------
# Print summary
# ----------------------------------------------------------------------
print("\n" + "="*60)
print(f"MONTE CARLO RESULTS ({MONTE_CARLO_RUNS} runs)")
print("="*60)

if stats['sign'] is not None:
    s = stats['sign']
    print("\nSign-bit method:")
    print(f"  Radial error (mean±std): {s['rad']['mean']:.3f} ± {s['rad']['std']:.3f} µm")
    print(f"  Median:   {s['rad']['median']:.3f} µm, 95%: {s['rad']['p95']:.3f} µm, Max: {s['rad']['max']:.3f} µm")
    print(f"  Steps to converge: {s['readouts']['mean']:.1f} ± {s['readouts']['std']:.1f}")
    print(f"  Both axes converged: {s['conv_both']}/{MONTE_CARLO_RUNS} ({s['conv_both']/MONTE_CARLO_RUNS*100:.1f}%)")

if stats['log'] is not None:
    s = stats['log']
    print("\nLog-area method:")
    print(f"  Radial error (mean±std): {s['rad']['mean']:.3f} ± {s['rad']['std']:.3f} µm")
    print(f"  Median:   {s['rad']['median']:.3f} µm, 95%: {s['rad']['p95']:.3f} µm, Max: {s['rad']['max']:.3f} µm")
    print(f"  Steps to converge: {s['readouts']['mean']:.1f} ± {s['readouts']['std']:.1f}")
    print(f"  Both axes converged: {s['conv_both']}/{MONTE_CARLO_RUNS} ({s['conv_both']/MONTE_CARLO_RUNS*100:.1f}%)")

# ----------------------------------------------------------------------
# Plot histogram
# ----------------------------------------------------------------------
fig, ax = plt.subplots(figsize=(12, 7))

colors = {'sign': '#2eb82e', 'log': '#8a2be2'}
labels = {'sign': 'Sign-bit method', 'log': 'Log-area method'}
linestyles = {'sign': '-', 'log': '--'}

max_rad = 0
for key in ['sign', 'log']:
    if stats[key] is not None:
        max_rad = max(max_rad, stats[key]['rad']['p95'])

if max_rad == 0:
    print("No data to plot. Exiting.")
    plt.close()
    exit()

max_rad *= 1.2
bins = np.linspace(0, max_rad, 50)

for key in ['sign', 'log']:
    if stats[key] is not None:
        ax.hist(stats[key]['err_rad'], bins=bins, density=True, histtype='step',
                linewidth=2, color=colors[key], label=labels[key], linestyle=linestyles[key])

ax.set_xlim(0, max_rad)
ax.set_xlabel('Radial alignment error (µm)', fontsize=11)
ax.set_ylabel('Probability density', fontsize=11)
ax.set_title(f'Monte Carlo Results ({MONTE_CARLO_RUNS} runs)', fontsize=12, fontweight='bold')
ax.grid(True, linestyle=':', alpha=0.5)
ax.legend(loc='upper right')

# Build statistics box dynamically
stat_text = "STATISTICS\n"
for key in ['sign', 'log']:
    if stats[key] is not None:
        s = stats[key]
        label = "Sign‑bit" if key == 'sign' else "Log‑area"
        stat_text += f"\n{label}:\n"
        stat_text += f"  Radial mean (µm):   {s['rad']['mean']:.3f}\n"
        stat_text += f"  Radial std (µm):    {s['rad']['std']:.3f}\n"
        stat_text += f"  Radial Median (µm): {s['rad']['median']:.3f}\n"
        stat_text += f"  Radial 95% (µm):    {s['rad']['p95']:.3f}\n"
        stat_text += f"  Steps:              {s['readouts']['mean']:.1f}±{s['readouts']['std']:.1f}\n"
        stat_text += f"  Both converged:     {s['conv_both']/MONTE_CARLO_RUNS*100:.1f}%\n"

props = dict(boxstyle='round,pad=0.5', facecolor='#f7fff2', edgecolor='#4da61a', alpha=0.95)
ax.text(0.98, 0.98, stat_text, transform=ax.transAxes, fontsize=9,
        verticalalignment='top', horizontalalignment='right', bbox=props, fontfamily='monospace')

# Add Median Error Vertical Lines
for key in ['sign', 'log']:
    if stats[key] is not None:
        median_err = stats[key]['rad']['median']
        ax.axvline(median_err, color=colors[key], linestyle=':', linewidth=2, alpha=0.8,
                   label=f'{labels[key]} median = {median_err:.2f} µm')
        
# Add Max Error Vertical Lines
for key in ['sign', 'log']:
    if stats[key] is not None:
        max_err = stats[key]['rad']['max']
        ax.axvline(max_err, color=colors[key], linestyle='--', alpha=0.5,
                   label=f'{labels[key]} max = {max_err:.2f} µm')

ax.legend()

plt.tight_layout()
plt.show()