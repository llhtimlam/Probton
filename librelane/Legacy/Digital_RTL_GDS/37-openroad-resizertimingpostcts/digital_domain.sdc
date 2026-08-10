###############################################################################
# Created by write_sdc
###############################################################################
current_design digital_domain
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 200.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {comp_x}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {comp_y}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst_n}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_cs_n}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_mosi}]
set_input_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_sclk}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {dir_x}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {dir_y}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {mems_drv_x}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {mems_drv_y}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {move_en_x}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {move_en_y}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {read_en}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ref_wave_x}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ref_wave_y}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_miso}]
set_output_delay 40.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_miso_oe}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {dir_x}]
set_load -pin_load 0.0729 [get_ports {dir_y}]
set_load -pin_load 0.0729 [get_ports {mems_drv_x}]
set_load -pin_load 0.0729 [get_ports {mems_drv_y}]
set_load -pin_load 0.0729 [get_ports {move_en_x}]
set_load -pin_load 0.0729 [get_ports {move_en_y}]
set_load -pin_load 0.0729 [get_ports {read_en}]
set_load -pin_load 0.0729 [get_ports {ref_wave_x}]
set_load -pin_load 0.0729 [get_ports {ref_wave_y}]
set_load -pin_load 0.0729 [get_ports {spi_miso}]
set_load -pin_load 0.0729 [get_ports {spi_miso_oe}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {comp_x}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {comp_y}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst_n}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {spi_cs_n}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {spi_mosi}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {spi_sclk}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition 3.0000 [current_design]
set_max_capacitance 0.2000 [current_design]
set_max_fanout 10.0000 [current_design]
