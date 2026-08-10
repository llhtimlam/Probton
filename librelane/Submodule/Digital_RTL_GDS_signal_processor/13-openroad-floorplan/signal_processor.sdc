###############################################################################
# Created by write_sdc
###############################################################################
current_design signal_processor
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 200.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {comp_raw}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {latch_phase270}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {latch_phase90}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst_n}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {soft_rst_n}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {dir}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {jitter_flag}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {latch_phase270_ack}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {latch_phase90_ack}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {move_en}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {phase_state[0]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {phase_state[1]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {votes_in_phase[0]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {votes_in_phase[1]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {votes_in_phase[2]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {votes_in_phase[3]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {votes_out_phase[0]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {votes_out_phase[1]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {votes_out_phase[2]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {votes_out_phase[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {dir}]
set_load -pin_load 0.0729 [get_ports {jitter_flag}]
set_load -pin_load 0.0729 [get_ports {latch_phase270_ack}]
set_load -pin_load 0.0729 [get_ports {latch_phase90_ack}]
set_load -pin_load 0.0729 [get_ports {move_en}]
set_load -pin_load 0.0729 [get_ports {phase_state[1]}]
set_load -pin_load 0.0729 [get_ports {phase_state[0]}]
set_load -pin_load 0.0729 [get_ports {votes_in_phase[3]}]
set_load -pin_load 0.0729 [get_ports {votes_in_phase[2]}]
set_load -pin_load 0.0729 [get_ports {votes_in_phase[1]}]
set_load -pin_load 0.0729 [get_ports {votes_in_phase[0]}]
set_load -pin_load 0.0729 [get_ports {votes_out_phase[3]}]
set_load -pin_load 0.0729 [get_ports {votes_out_phase[2]}]
set_load -pin_load 0.0729 [get_ports {votes_out_phase[1]}]
set_load -pin_load 0.0729 [get_ports {votes_out_phase[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {comp_raw}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {latch_phase270}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {latch_phase90}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst_n}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {soft_rst_n}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition 3.0000 [current_design]
set_max_capacitance 0.2000 [current_design]
set_max_fanout 10.0000 [current_design]
