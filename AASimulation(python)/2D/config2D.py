# config_2D.py
import numpy as np

# ======================== OPTICAL & SYSTEM PARAMETERS ============================
TRUE_PEAK_X = 0.0
TRUE_PEAK_Y = 0.0

dx_sensitivity      = 20
db_drop             = 10
linear_transmission = 10**(-db_drop / 10)

# Calculate Gaussian spatial variance factor (Replaces hardcoded BEAM_WIDTH)
sigma               = np.sqrt(-(dx_sensitivity**2) / (2 * np.log(linear_transmission)))
BEAM_WIDTH          = sigma  

# Calculate spatial bounds where ASIC successfully gets enough light to boot
T_MIN               = 0.1  # Minimum 10% transmission limit
offset_bound        = sigma * np.sqrt(-2 * np.log(T_MIN))
UPPER_BOUND         = offset_bound
LOWER_BOUND         = -offset_bound
INITIAL_OFFSET_BOUNDS = (LOWER_BOUND, UPPER_BOUND)

# ======================== RUNTIME ENVIRONMENT & SIMULATION TIMING ============================
SIM_CYCLES    = 100         # Total iterations for global stage sweeps
SAMPLE_RATE   = 2000        # Internal ADC sensor collection clock rate (Hz)
duration      = 0.1         # Readout duration per cycle step window (seconds)
NOISE_SIGMA   = 0.01        # White Gaussian sensor baseline noise standard deviation

# Target alignment peak coordinate destination
TRUE_PEAK_X   = 0.0
TRUE_PEAK_Y   = 0.0

# Random initial offset positions anchored inside your calculated optical boot limits
START_X       = np.random.uniform(LOWER_BOUND, UPPER_BOUND)
START_Y       = np.random.uniform(LOWER_BOUND, UPPER_BOUND)

NOISE_SIGMA = 0.01         # Standard deviation of additive white noise
SAMPLE_RATE = 2000         # ADC sample rate (Hz)
duration = 0.1             # Readout duration per cycle (seconds)

# ======================== STAGE & MOTOR PARAMETERS ============================
MIN_STEP = 0.0588 * 5      # Minimum allowable step (µm)
MAX_STEP = 0.375 * 5       # Maximum allowable step (µm)

# ======================== MEMS DITHER PARAMETERS ============================
MEMS_AMP_X = 5.0           # X‑axis dither amplitude (µm)
MEMS_AMP_Y = 5.0           # Y‑axis dither amplitude (µm)
FX = 300                   # X MEMS frequency (Hz)
FY = 400                   # Y MEMS frequency (Hz)

# ======================== ALGORITHM PARAMETERS ============================
ENABLE_BIT_LOG = True      # Use 8‑bit lookup table for log
BITS = 8                   # Number of bits for area quantisation
ENABLE_AREA_QUANT = False  # If True, quantise area before log

LEVELS = [4.0, 2.0, 1.0]   # Multi‑scale step multipliers
MAX_REFINE_ITERATIONS = 50 # Safety limit for refinement loop
CONVERGENCE_FLIPS = 6      # Required consecutive even flips to declare convergence

# ======================== MONTE CARLO SETTINGS ============================
MONTE_CARLO_RUNS = 1000    # Number of independent simulations