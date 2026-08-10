set ::env(PDN_CFG) /usr/local/lib/python3.12/dist-packages/librelane/scripts/openroad/common/pdn_cfg.tcl
set ::env(STEP_ID) OpenROAD.GeneratePDN
set ::env(TECH_LEF) /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/techlef/gf180mcu_fd_sc_mcu7t5v0__nom.tlef
set ::env(MACRO_LEFS) ""
set ::env(PAD_CELL_LIBRARY) gf180mcu_fd_io
set ::env(VDD_PIN) VDD
set ::env(GND_PIN) VSS
set ::env(TECH_LEFS) "\"nom_*\" /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/techlef/gf180mcu_fd_sc_mcu7t5v0__nom.tlef \"min_*\" /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/techlef/gf180mcu_fd_sc_mcu7t5v0__min.tlef \"max_*\" /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/techlef/gf180mcu_fd_sc_mcu7t5v0__max.tlef"
set ::env(PRIMARY_GDSII_STREAMOUT_TOOL) magic
set ::env(DEFAULT_CORNER) nom_tt_025C_5v00
set ::env(STA_CORNERS) "nom_tt_025C_5v00 nom_ss_125C_4v50 nom_ff_n40C_5v50 min_tt_025C_5v00 min_ss_125C_4v50 min_ff_n40C_5v50 max_tt_025C_5v00 max_ss_125C_4v50 max_ff_n40C_5v50"
set ::env(RT_MIN_LAYER) Metal2
set ::env(RT_MAX_LAYER) Metal5
set ::env(SCL_GROUND_PINS) "VSS VPW"
set ::env(SCL_POWER_PINS) "VDD VNW"
set ::env(TRISTATE_CELLS) "\"gf180mcu_fd_sc_mcu7t5v0__bufz*\""
set ::env(FILL_CELLS) "\"gf180mcu_fd_sc_mcu7t5v0__fill_*\""
set ::env(DECAP_CELLS) "\"gf180mcu_fd_sc_mcu7t5v0__fillcap_*\""
set ::env(CELL_LIBS) "\"*_tt_025C_5v00\" \"/workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/lib/gf180mcu_fd_sc_mcu7t5v0__tt_025C_5v00.lib /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lib/gf180mcu_fd_io__tt_025C_5v00.lib /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lib/gf180mcu_ws_io__tt_025C_5v00.lib\" \"*_ff_n40C_5v50\" \"/workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/lib/gf180mcu_fd_sc_mcu7t5v0__ff_n40C_5v50.lib /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lib/gf180mcu_fd_io__ff_n40C_5v50.lib /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lib/gf180mcu_ws_io__ff_n40C_5v50.lib\" \"*_ss_125C_4v50\" \"/workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/lib/gf180mcu_fd_sc_mcu7t5v0__ss_125C_4v50.lib /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lib/gf180mcu_fd_io__ss_125C_4v50.lib /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lib/gf180mcu_ws_io__ss_125C_4v50.lib\""
set ::env(CELL_LEFS) /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/lef/gf180mcu_fd_sc_mcu7t5v0.lef
set ::env(CELL_GDS) /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/gds/gf180mcu_fd_sc_mcu7t5v0.gds
set ::env(CELL_VERILOG_MODELS) /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/verilog/gf180mcu_fd_sc_mcu7t5v0.v
set ::env(CELL_SPICE_MODELS) /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
set ::env(CELL_CDLS) /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/cdl/gf180mcu_fd_sc_mcu7t5v0.cdl
set ::env(SYNTH_EXCLUDED_CELL_FILE) /workspace/gf180mcu/gf180mcuD/libs.tech/librelane/gf180mcu_fd_sc_mcu7t5v0/synth_exclude.cells
set ::env(PNR_EXCLUDED_CELL_FILE) /workspace/gf180mcu/gf180mcuD/libs.tech/librelane/gf180mcu_fd_sc_mcu7t5v0/pnr_exclude.cells
set ::env(OUTPUT_CAP_LOAD) 72.91
set ::env(MAX_FANOUT_CONSTRAINT) 10
set ::env(MAX_TRANSITION_CONSTRAINT) 3
set ::env(MAX_CAPACITANCE_CONSTRAINT) 0.2
set ::env(CLOCK_UNCERTAINTY_CONSTRAINT) 0.25
set ::env(CLOCK_TRANSITION_CONSTRAINT) 0.15
set ::env(TIME_DERATING_CONSTRAINT) 5
set ::env(IO_DELAY_CONSTRAINT) 20
set ::env(SYNTH_DRIVING_CELL) gf180mcu_fd_sc_mcu7t5v0__inv_1/ZN
set ::env(SYNTH_CLK_DRIVING_CELL) gf180mcu_fd_sc_mcu7t5v0__inv_4/ZN
set ::env(SYNTH_TIEHI_CELL) gf180mcu_fd_sc_mcu7t5v0__tieh/Z
set ::env(SYNTH_TIELO_CELL) gf180mcu_fd_sc_mcu7t5v0__tiel/ZN
set ::env(SYNTH_BUFFER_CELL) gf180mcu_fd_sc_mcu7t5v0__buf_1/I/Z
set ::env(PLACE_SITE) GF018hv5v_mcu_sc7
set ::env(CELL_PAD_EXCLUDE) "gf180mcu_fd_sc_mcu7t5v0__filltie \"gf180mcu_fd_sc_mcu7t5v0__fill_*\" gf180mcu_fd_sc_mcu7t5v0__endcap"
set ::env(DIODE_CELL) gf180mcu_fd_sc_mcu7t5v0__antenna/I
set ::env(WELLTAP_CELL) gf180mcu_fd_sc_mcu7t5v0__filltie
set ::env(ENDCAP_CELL) gf180mcu_fd_sc_mcu7t5v0__endcap
set ::env(DESIGN_NAME) chip_core
set ::env(CLOCK_PERIOD) 200
set ::env(CLOCK_PORT) clk
set ::env(CLOCK_NET) clk
set ::env(VDD_NETS) VDD
set ::env(GND_NETS) VSS
set ::env(DIE_AREA) "0 0.0 1117.5 558.75"
set ::env(FALLBACK_SDC) /usr/local/lib/python3.12/dist-packages/librelane/scripts/base.sdc
set ::env(PAD_LIBS) ""
set ::env(PAD_LEFS) "/workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_ef_io__bi_t.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__asig_5p0.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__bi_24t.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__bi_t.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__brk2.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__brk5.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__cor.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__dvdd.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__dvss.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill1.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill10.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill5.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fillnc.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__in_c.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__in_s.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_ws_io__dvdd.lef /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/lef/gf180mcu_ws_io__dvss.lef"
set ::env(PAD_GDS) "/workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/gds/gf180mcu_fd_io.gds /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/gds/gf180mcu_ef_io.gds /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/gds/gf180mcu_ws_io.gds"
set ::env(PAD_VERILOG_MODELS) "/workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/verilog/gf180mcu_ef_io__blackbox.v /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/verilog/gf180mcu_fd_io__blackbox.v /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/verilog/gf180mcu_ws_io__blackbox.v"
set ::env(PAD_SPICE_MODELS) "/workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/spice/gf180mcu_ef_io.spice /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/spice/gf180mcu_ws_io.spice"
set ::env(PAD_CDLS) /workspace/gf180mcu/gf180mcuD/libs.ref/gf180mcu_fd_io/cdl/gf180mcu_fd_io.cdl
set ::env(PAD_CORNER) gf180mcu_fd_io__cor
set ::env(PAD_FILLERS) "gf180mcu_fd_io__fill10 gf180mcu_fd_io__fill5 gf180mcu_fd_io__fill1 gf180mcu_fd_io__fillnc"
set ::env(PAD_SITE_NAME) GF_IO_Site
set ::env(PAD_CORNER_SITE_NAME) GF_COR_Site
set ::env(PAD_FAKE_SITES) "GF_IO_Site \"0.1 355\" GF_COR_Site \"355 355\""
set ::env(PAD_PLACE_IO_TERMINALS) "gf180mcu_fd_io__asig_5p0/ASIG5V gf180mcu_fd_io__bi_24t/PAD gf180mcu_fd_io__bi_t/PAD gf180mcu_fd_io__in_c/PAD gf180mcu_fd_io__in_s/PAD gf180mcu_fd_io__dvss/DVSS gf180mcu_fd_io__dvdd/DVDD gf180mcu_ws_io__dvss/DVSS gf180mcu_ws_io__dvdd/DVDD"
set ::env(PAD_EDGE_SPACING) 26
set ::env(PAD_ROTATION_HORIZONTAL) R0
set ::env(PAD_ROTATION_VERTICAL) R0
set ::env(PAD_ROTATION_CORNER) R0
set ::env(SET_RC_VERBOSE) 0
set ::env(LAYERS_RC) "\"*\" \"Metal2 \\\"res 0.000385861 cap 0.000135357\\\" Metal3 \\\"res 0.000206673 cap 0.000146141\\\" Metal4 \\\"res 0.000168609 cap 0.000150688\\\" Metal5 \\\"res 0.0000792778 cap 0.000155595\\\"\""
set ::env(VIAS_R) "\"*\" \"Via1 \\\"res 4.23\\\" Via2 \\\"res 4.23\\\" Via3 \\\"res 4.23\\\" Via4 \\\"res 4.23\\\"\" \"max_*\" \"Via1 \\\"res 16.845\\\" Via2 \\\"res 16.845\\\" Via3 \\\"res 16.845\\\" Via4 \\\"res 16.845\\\"\""
set ::env(SIGNAL_WIRE_RC_LAYERS) "Metal2 Metal3 Metal4"
set ::env(CLOCK_WIRE_RC_LAYERS) "Metal2 Metal3 Metal4"
set ::env(PDN_CONNECT_MACROS_TO_GRID) 1
set ::env(PDN_ENABLE_GLOBAL_CONNECTIONS) 1
set ::env(DEDUPLICATE_CORNERS) 0
set ::env(PDN_SKIPTRIM) 0
set ::env(PDN_CORE_RING) 0
set ::env(PDN_ENABLE_RAILS) 1
set ::env(PDN_HORIZONTAL_HALO) 10
set ::env(PDN_VERTICAL_HALO) 10
set ::env(PDN_MULTILAYER) 1
set ::env(PDN_RAIL_OFFSET) 0
set ::env(PDN_VWIDTH) 1.6
set ::env(PDN_HWIDTH) 1.6
set ::env(PDN_VSPACING) 1.7
set ::env(PDN_HSPACING) 1.7
set ::env(PDN_VPITCH) 153.6
set ::env(PDN_HPITCH) 153.18
set ::env(PDN_VOFFSET) 16.32
set ::env(PDN_HOFFSET) 16.65
set ::env(PDN_CORE_RING_VWIDTH) 1.6
set ::env(PDN_CORE_RING_HWIDTH) 1.6
set ::env(PDN_CORE_RING_VSPACING) 1.7
set ::env(PDN_CORE_RING_HSPACING) 1.7
set ::env(PDN_CORE_RING_VOFFSET) 6
set ::env(PDN_CORE_RING_HOFFSET) 6
set ::env(PDN_CORE_RING_CONNECT_TO_PADS) 0
set ::env(PDN_CORE_RING_ALLOW_OUT_OF_DIE) 1
set ::env(PDN_RAIL_LAYER) Metal1
set ::env(PDN_RAIL_WIDTH) 0.6
set ::env(PDN_HORIZONTAL_LAYER) Metal5
set ::env(PDN_VERTICAL_LAYER) Metal4
set ::env(PDN_EXTEND_TO) core_ring
set ::env(PDN_ENABLE_PINS) 1
set ::env(CURRENT_ODB) /workspace/librelane/runs/RUN_2026-08-09_19-31-35/20-odb-addpdnobstructions/chip_core.odb
set ::env(SAVE_ODB) /workspace/librelane/runs/RUN_2026-08-09_19-31-35/21-openroad-generatepdn/chip_core.odb
set ::env(SAVE_DEF) /workspace/librelane/runs/RUN_2026-08-09_19-31-35/21-openroad-generatepdn/chip_core.def
set ::env(SAVE_SDC) /workspace/librelane/runs/RUN_2026-08-09_19-31-35/21-openroad-generatepdn/chip_core.sdc
set ::env(SAVE_NL) /workspace/librelane/runs/RUN_2026-08-09_19-31-35/21-openroad-generatepdn/chip_core.nl.v
set ::env(SAVE_PNL) /workspace/librelane/runs/RUN_2026-08-09_19-31-35/21-openroad-generatepdn/chip_core.pnl.v
