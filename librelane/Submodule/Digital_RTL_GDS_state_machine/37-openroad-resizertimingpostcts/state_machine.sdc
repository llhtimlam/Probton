###############################################################################
# Created by write_sdc
###############################################################################
current_design state_machine
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 200.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {boot_complete}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {cal_done}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {cal_timeout}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {cfg_done}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {phase_offset_imported}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst_n}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {soft_rst}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {cal_start}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {read_en}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state_o[0]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state_o[1]}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state_o[2]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {cal_start}]
set_load -pin_load 0.0729 [get_ports {read_en}]
set_load -pin_load 0.0729 [get_ports {state_o[2]}]
set_load -pin_load 0.0729 [get_ports {state_o[1]}]
set_load -pin_load 0.0729 [get_ports {state_o[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {boot_complete}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cal_done}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cal_timeout}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cfg_done}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {phase_offset_imported}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst_n}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {soft_rst}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition 3.0000 [current_design]
set_max_capacitance 0.2000 [current_design]
set_max_fanout 10.0000 [current_design]
