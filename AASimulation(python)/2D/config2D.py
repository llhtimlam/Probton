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
SIM_CYCLES    = 1000        # Total iterations for global stage sweeps
SAMPLE_RATE   = 2000        # Internal ADC sensor collection clock rate (Hz)
DURATION      = 10.0        # Readout duration per cycle step window (seconds)
NOISE_SIGMA   = 0.01        # White Gaussian sensor baseline noise standard deviation

# Target alignment peak coordinate destination
TRUE_PEAK_X   = 0.0
TRUE_PEAK_Y   = 0.0

# Random initial offset positions anchored inside your calculated optical boot limits
START_X       = np.random.uniform(LOWER_BOUND, UPPER_BOUND)
START_Y       = np.random.uniform(LOWER_BOUND, UPPER_BOUND)

# ======================== STAGE & MOTOR PARAMETERS ============================  
MAX_STEP = 0.375            # Maximum allowable step (µm)
MIN_STEP = MAX_STEP / 256  # Minimum allowable step (µm)

ENABLE_MOTOR_ERRORS = True
BACKLASH_UM = 0.195
MIN_MOVE_UM = 0.195
STEP_ERROR_PERCENT = 0.07   # ±7%

# ======================== MEMS DITHER PARAMETERS ============================
MEMS_AMP_X = 5.0           # X‑axis dither amplitude (µm)
MEMS_AMP_Y = 5.0           # Y‑axis dither amplitude (µm)
FX = 300                   # X MEMS frequency (Hz)
FY = 400                   # Y MEMS frequency (Hz)

# ======================== ALGORITHM PARAMETERS ============================
ENABLE_BIT_LOG = True      # Use 8‑bit lookup table for log
BITS = 8                   # Number of bits for area quantisation

LEVELS = [64.0, 32.0, 16.0, 8.0, 4.0, 2.0, 1.0]   # Multi‑scale step multipliers
MAX_REFINE_ITERATIONS = 200# Safety limit for refinement loop
CONVERGENCE_THRESHOLD = 4  # Sign stay 0 for number of consecutive flips to converge
SIGN_STUCK_LIMIT = 4       # if sign stuck in one side after converge, force damped step to nudge

# ======================== ANALOG SIGNAL ERRORS ============================
ENABLE_SIGNAL_ERRORS = True
ERROR_LEVEL = 0.05

ENABLE_WHITE_NOISE = True
WHITE_NOISE_LEVEL = 0.2

ENABLE_SHOT_NOISE = True
SHOT_NOISE_LEVEL = 0.15

ENABLE_SINE_RIPPLE = True
SINE_RIPPLE_AMPLITUDE = 0.1
SINE_RIPPLE_FREQ = 5

ENABLE_OFFSET_DRIFT = True
OFFSET_DRIFT = 0.05

ENABLE_SPIKE_NOISE = True
SPIKE_RATE = 0.1
SPIKE_AMPLITUDE = 0.5

# ======================== VOLTAGE‑TO‑TIME CONVERSION (8‑bit) =============
ENABLE_VTT_ERRORS = True
VTT_VREF = 2.0
VTT_OFFSET_LSB = 1.5
VTT_GAIN_ERROR = 0.02
VTT_CLOCK_JITTER_NS = 1
VTT_NONLINEARITY_LSB = 0.5

# ======================== MONTE CARLO SETTINGS ============================
MONTE_CARLO_RUNS = 5000    # Number of independent simulations