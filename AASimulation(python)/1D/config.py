import numpy as np

# ==========================================
# 8-BIT QUANTIZATION CONFIGURATION
# ==========================================
BITS = 8                        # number of bits (signed or unsigned)
MOTOR_COMMAND_SIGNED = True     # True = signed (-128..127), False = unsigned (0..255)

# The full-scale range in µm is automatically computed:
if MOTOR_COMMAND_SIGNED:
    MAX_CODE = 2**(BITS-1) - 1   # e.g., 127
    MIN_CODE = -MAX_CODE - 1                   # e.g., -128 (if 8-bit signed)
else:
    MAX_CODE = 2**BITS - 1       # e.g., 255
    MIN_CODE = 0

ENABLE_BIT_LOG = True          # Use 8-bit log lookup table (instead of np.log)


# ==========================================
# SYSTEM PARAMETERS & CONFIGURATION
# ==========================================
# Gaussian
dx_sensitivity      = 20
db_drop             = 10
linear_transmission = 10**(-db_drop / 10)
sigma               = np.sqrt(-(dx_sensitivity**2) / (2 * np.log(linear_transmission)))
T_MIN = 0.1  # Desired minimum transmission for booting ASIC
offset_bound = sigma * np.sqrt(-2 * np.log(T_MIN))
UPPER_BOUND = offset_bound
LOWER_BOUND = -offset_bound
INITIAL_OFFSET_BOUNDS = (LOWER_BOUND, UPPER_BOUND)

# XY Stage
"""
# Fine adjustment - need to amp the small difference in peak region for normalization
DAC_MAX_VOLTAGE = 5.0                        # V
PIEZO_SENSITIVITY_UM_PER_V = 0.025           # 25 nm/V = 0.025 µm/V
VOLTS_PER_COUNT = DAC_MAX_VOLTAGE / MAX_CODE # V/count
MOTOR_GEAR_RATIO = (VOLTS_PER_COUNT * PIEZO_SENSITIVITY_UM_PER_V) # 25 nm/V = 0.025 µm/V
"""

MOTOR_GEAR_RATIO = offset_bound / MAX_CODE # Assume unlimited resolution for coarse adjustment

ENABLE_MOTOR_ERRORS = True
BACKLASH_UM = 0.195
MIN_MOVE_UM = 0.195           # minimum movement in μm
STEP_ERROR_PERCENT = 0.07   # ±7% step error



MIN_STEP              = max(1, int(np.ceil(max(BACKLASH_UM, MIN_MOVE_UM) / MOTOR_GEAR_RATIO)))
MAX_STEP              = MAX_CODE
TIMEOUT = int(np.ceil(offset_bound / (MIN_STEP * MOTOR_GEAR_RATIO))) * 4

# Old hard code
#MIN_STEP              = 3
#MAX_STEP              = 10
#TIMEOUT = 100
#MOTOR_GEAR_RATIO      = 1.8             # Gear ratio in response to control signal in μm

# MEMs
VIBRATION_SPAN        = 5
MAX_ASYMMETRIC_SKEW   = 0.0273

# Alignment
T_ALIGN = 0.99  # Desired minimum transmission for alignment
ALIGNMENT_THRESHOLD = sigma * np.sqrt(-2 * np.log(T_ALIGN)) # Precision in um for stop iterating algorithm

# ==========================================
# SIGNAL ERROR INJECTION CONFIGURATION
# ==========================================
ENABLE_SIGNAL_ERRORS = True
ERROR_LEVEL = 0.05

# Analog domain errors
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

# ==========================================
# VOLTAGE-TO-TIME CONVERSION (8-bit)
# ==========================================
ENABLE_VTT_ERRORS = True
VTT_VREF = 2.0
VTT_OFFSET_LSB = 1.5
VTT_GAIN_ERROR = 0.02
VTT_CLOCK_JITTER_NS = 1
VTT_NONLINEARITY_LSB = 0.5