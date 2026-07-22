from fixture import *


# get the testbench directory and name
script_path = os.path.abspath(__file__)
TB_DIR = os.path.dirname(script_path)
TB_NAME = os.path.basename(TB_DIR)
NETLIST_FILE = f"{TB_DIR}/{TB_NAME}.spice"

DEF_W_DP = 6.0
DEF_W_CM = 6.0
DEF_W_TAIL = 6.0
DEF_L = 1.0


def test_op():
    sim_dir = f"/foss/designs/simulations/{TB_NAME}/test_op"
    
    # 1. Ensure the simulation directory exists
    if not os.path.exists(sim_dir):
        os.makedirs(sim_dir)

    netlist = ""
    netlist += netlist_pvt_header()
    netlist += netlist_optimizer_params(DEF_W_DP, DEF_W_CM, DEF_W_TAIL, l_val = DEF_L) 
    netlist += netlist_feedback_unity()
    netlist += netlist_stimulus_dc(vin_dc=1.65)
    netlist += netlist_sim_op(filename=f"{sim_dir}/op.log")
    
    netlist += netlist_test_bench(NETLIST_FILE)

    # 2. Run the simulation
    run_ngspice(netlist, sim_dir)
    
    # 3. Verify it exists
    log_path = f"{sim_dir}/op.log"
    assert os.path.exists(log_path), f"Simulation failed! Log file not found at {log_path}"

    # 4. Now parse the data safely
    df = extract_mosfets_from_op(log_path)
    
    # 5. Check if parsing worked
    if df is not None and not df.empty:
        print("Simulation successful and data parsed!")
        print(df[['device', 'id', 'vdsat']])
    else:
        print("Warning: Parsed DataFrame is empty. Check your BSIM4v5 section in the log.")


def test_dc():
    sim_dir = f"/foss/designs/simulations/{TB_NAME}/test_dc"
    netlist = ""
    netlist += netlist_pvt_header()

    netlist += netlist_optimizer_params(DEF_W_DP, DEF_W_CM, DEF_W_TAIL, l_val = DEF_L) 

    netlist += netlist_feedback_unity()
    netlist += netlist_stimulus_dc()
    netlist += netlist_sim_dc(filename=f"{sim_dir}/results.raw")
    
    # read main netlist 
    netlist += netlist_test_bench(NETLIST_FILE)

    run_ngspice(netlist, sim_dir)
    assert os.path.exists(f"{sim_dir}/results.raw")

def test_ac():
    sim_dir = f"/foss/designs/simulations/{TB_NAME}/test_ac"
    netlist = ""
    netlist += netlist_pvt_header()
    netlist += netlist_optimizer_params(DEF_W_DP, DEF_W_CM, DEF_W_TAIL, l_val = DEF_L) 

    
    netlist += netlist_feedback_open_loop()
    netlist += netlist_stimulus_ac()
    netlist += netlist_sim_ac(filename=f"{sim_dir}/results.raw")
    
    # read main netlist 
    netlist += netlist_test_bench(NETLIST_FILE)

    run_ngspice(netlist, sim_dir)
    assert os.path.exists(f"{sim_dir}/results.raw")

def test_tran():
    sim_dir = f"/foss/designs/simulations/{TB_NAME}/test_tran"
    netlist = ""

    netlist += netlist_pvt_header()
    netlist += netlist_optimizer_params(DEF_W_DP, DEF_W_CM, DEF_W_TAIL, l_val = DEF_L) 

    netlist += netlist_feedback_unity()
    netlist += netlist_stimulus_sin()
    netlist += netlist_sim_tran(filename=f"{sim_dir}/results.raw")

    # read main netlist 
    netlist += netlist_test_bench(NETLIST_FILE)

    run_ngspice(netlist, sim_dir)
    assert os.path.exists(f"{sim_dir}/results.raw")


if __name__ == "__main__":
    
    test_op()
    test_dc()
    test_ac()
    test_tran()
