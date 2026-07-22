import os
import subprocess

def run_ngspice(netlist, sim_dir):
    #create the directory
    os.makedirs(sim_dir, exist_ok=True)

    with open(f"{sim_dir}/netlist.spice", "w") as f:
        f.write(netlist)
    print(f"Running ngspice in {sim_dir}")
    # run ngspice and save the output to a file
    result = subprocess.run(
        ["/foss/tools/ngspice/bin/ngspice", "-b", f"{sim_dir}/netlist.spice"], 
        capture_output=True, 
        text=True
    )

    # check if the result contains the word "Error"

    with open(f"{sim_dir}/ngspice.log", "w") as f:
        f.write(result.stdout)
        f.write(result.stderr)

    # assert if the log file contains the word "Error"

    assert "Error" not in result.stdout+result.stderr

#======================================================
# Testbench Main
#======================================================
def netlist_test_bench(netlist_file):
    with open(netlist_file, "r") as f:
        return f.read()

#======================================================
# PVT Header
#======================================================
def netlist_pvt_header(corner="typical", vdda=3.3, i_bias=50e-6):
    netlist = ""
    netlist += netlist_model(corner)
    netlist += netlist_power(vdda=vdda)
    netlist += netlist_bias(i_bias=i_bias)
    return netlist

def netlist_model(corner="typical"):

    return f"""
    * ---------------- Model ----------------
    .include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
    .lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice {corner}
    """
def netlist_power(vdda=3.3):
    return f"""
    * ---------------- Power Supplies ----------------
    V_vssa vssa GND 0
    V_vdda vdda vssa {vdda}
    """

def netlist_bias(i_bias=50e-6):
    return f"""
    * ---------------- Bias Current ----------------
    I_bias vdda i_bias {i_bias}
    """

#======================================================
# Testbench Wiring and Stimulus
#======================================================

def netlist_feedback_unity():
    return f"""
    *-------Feedback Connections ---------
    V-jumper_fb out in_n 0
    V-jumper_in in in_p 0
    """

def netlist_optimizer_params(w_dp, w_cm, w_tail, l_val=1.0):
    """
    Translates Python variables into SPICE .param declarations.
    """
    return f"""
* -------*
.param W_DP={w_dp}u
.param W_CM={w_cm}u
.param W_TAIL={w_tail}u
.param L_VAL={l_val}u
"""
import pandas as pd

def extract_mosfets_from_op(filename):
    """
    Parses the ngspice op file by specifically searching for the BSIM4v5 block.
    """
    mosfet_data = {}
    
    with open(filename, 'r') as f:
        lines = f.readlines()
        
    in_bsim_block = False
    
    for line in lines:
        line_clean = line.strip()
        
        # Trigger: We found the MOSFET section
        if "BSIM4v5" in line:
            in_bsim_block = True
            continue
            
        # Stop condition: We hit another section or empty space
        if in_bsim_block and (not line_clean or "Capacitor" in line or "Inductor" in line):
            in_bsim_block = False
            continue
            
        if in_bsim_block:
            # Skip lines that are just whitespace
            if not line_clean:
                continue
            
            # Split by whitespace, ignoring the first label (the parameter name)
            parts = line.split()
            key = parts[0]
            values = parts[1:]
            
            # Initialize list for this parameter if not exists
            if key not in mosfet_data:
                mosfet_data[key] = []
            
            mosfet_data[key].extend(values)

    # Convert to DataFrame
    df = pd.DataFrame(mosfet_data)
    
    # Ensure numeric columns (where possible)
    for col in df.columns:
        if col != 'device' and col != 'model':
            df[col] = pd.to_numeric(df[col], errors='coerce')
            
    return df





def run_optimized_ota_sim(w_dp, w_cm, w_tail, sim_dir, netlist_file):
    """
    Stitches together the parameterized netlist and runs ngspice.
    """
    netlist = ""
    
    netlist += netlist_pvt_header()

    # 1. Inject the dynamic parameters
    netlist += netlist_optimizer_params(w_dp, w_cm, w_tail, l_val=1.0)
    
    # 2. Add your open-loop AC testbench (or closed loop, depending on your goal)
    netlist += netlist_feedback_open_loop()
    
    # 3. Add the core parameterized OTA circuit
    # (Assuming you have a function that reads your .spice file)
    with open(netlist_file, 'r') as f:
        netlist += f.read()
        
    # 4. Add simulation commands (AC sweep and OP save)
    # Ensure this writes op.log to the sim_dir!
    netlist += netlist_sim_op(filename=f"{sim_dir}/op.log")
    
    # 5. Run the simulation
    # (Replace run_ngspice with whatever your actual run command is named)
    run_ngspice(netlist, sim_dir)


def netlist_feedback_open_loop():
    return f"""
    *--------------- Open-loop AC feedback
    *L_break closes the loop at DC for biasing, opens it at AC
    L_break out in_n 1T

    *C_ac provides an AC ground to the inverting pin
    C_ac in_n vssa 1T

    * Connect stimulus to non-inverting pin
    V_jumper_in in in_p 0
    """




def netlist_stimulus_dc(vin_dc=1.65):
    return f"""
    * ---------------- Stimulus ----------------
    V_src in vssa {vin_dc}
    """
def netlist_stimulus_ac(vin_dc=1.65):
    return f"""
    * ---------------- Stimulus ----------------
    V_src in vssa {vin_dc} AC 1
    """
def netlist_stimulus_sin(vin_dc=1.65, freq=1e6, amp=100e-3, t_delay=0, theta=0, phase=0):
    return f"""
    * ---------------- Stimulus ----------------
    V_src in vssa SIN({vin_dc} {amp} {freq}, {t_delay}, {theta}, {phase})
    """
#======================================================
# Simulation Control Blocks
#======================================================
def netlist_sim_op(filename="op.log"):
    return f"""
    * ---------------- Simulation DC operating point ----------------
    .control
    OP
    show all > {filename}
    .endc

    """

def netlist_sim_dc(start=0, stop=3.3, step=0.01, filename="results.raw"):
    return f"""
    * ---------------- Simulation DC sweep ----------------
    .control
    save all
    DC V_src {start} {stop} {step}
    write {filename}
    .endc

    """

def netlist_sim_ac(start=1e3, stop=10e9, dec=10, filename="results.raw"):
    return f"""
    * ---------------- Simulation AC sweep ----------------
    .control
    save all
    AC DEC {dec} {start} {stop}
    write {filename}
    .endc
    """

def netlist_sim_tran(start=0, stop=10e-6, step=1e-9, filename="results.raw"):
    return f"""
    * ---------------- Simulation Transient ----------------
    .control
    save all
    * TRAN Tstep Tstop [Tstart] [Tmaxstep] [UIC]
    TRAN {step} {stop} {start}

    write {filename}
    .endc
    """
