v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {VSS} -810 600 0 0 0.4 0.4 {}
T {VDD_3v3} -840 -620 0 0 0.4 0.4 {}
T {VSS} -300 540 1 0 0.4 0.4 {}
T {VSS} -210 540 1 0 0.4 0.4 {}
T {VSS} -610 540 1 0 0.4 0.4 {}
T {VSS} -940 540 1 0 0.4 0.4 {}
T {VSS} -1210 540 1 0 0.4 0.4 {}
T {VSS} -1120 -460 1 0 0.4 0.4 {}
T {VDD_3v3} -1200 -580 1 0 0.4 0.4 {}
T {VDD_3v3} -930 -580 1 0 0.4 0.4 {}
T {VDD_3v3} -600 -580 1 0 0.4 0.4 {}
T {VDD_3v3} -290 -580 1 0 0.4 0.4 {}
T {Vbp} -870 -220 0 0 0.4 0.4 {}
T {Vbp} -440 -90 0 0 0.4 0.4 {}
T {Vbp} -850 180 1 0 0.4 0.4 {}
T {Vbp} -520 -110 1 0 0.4 0.4 {}
T {read_en} -1190 140 1 0 0.4 0.4 {}
T {analog_readout_output} -1000 70 1 0 0.4 0.4 {}
T {analog_readout_output} -360 350 2 0 0.4 0.4 {}
T {VSS} -850 540 1 0 0.4 0.4 {}
T {VSS} -1330 -460 1 0 0.4 0.4 {}
T {VSS} -1350 540 1 0 0.4 0.4 {}
N -1150 -60 -1030 -60 {lab=#net2}
N -1100 -220 -1100 -60 {lab=#net2}
N -1120 -220 -1100 -220 {lab=#net2}
N -1150 -470 -1150 -240 {lab=VSS}
N -330 -590 -330 -80 {lab=VDD_3v3}
N -970 -590 -970 -80 {lab=VDD_3v3}
N -1240 -590 -1240 -120 {lab=VDD_3v3}
N -1220 -10 -1220 230 {lab=read_en}
N -1340 -60 -1300 -60 {lab=Ibias_tia_105uA}
N -1420 -20 -1300 -20 {lab=analog_readout_input}
N -1240 -0 -1240 590 {lab=VSS}
N -970 40 -970 590 {lab=VSS}
N -330 40 -330 590 {lab=VSS}
N -550 -270 -550 -120 {lab=#net3}
N -550 -120 -550 -60 {lab=#net3}
N -740 -270 -700 -270 {lab=Ibias_bp_4u89A}
N -420 -20 -390 -20 {lab=Ibias_bp_4u89A}
N -1070 -20 -1030 -20 {lab=Ibias_bp_4u89A}
N -720 -310 -700 -310 {lab=Vcm_bp_2v2}
N -720 20 -390 20 {lab=Vcm_bp_2v2}
N -720 -310 -720 40 {lab=Vcm_bp_2v2}
N -880 -230 -700 -230 {lab=#net3}
N -880 -60 -390 -60 {lab=#net3}
N -1030 320 -240 320 {lab=analog_readout_output}
N -240 -20 -240 320 {lab=analog_readout_output}
N -1030 20 -1030 320 {lab=analog_readout_output}
N -240 320 -240 380 {lab=analog_readout_output}
N -240 440 -240 590 {lab=VSS}
N -640 -210 -640 590 {lab=VSS}
N -640 -590 -640 -330 {lab=VDD_3v3}
N -880 -230 -880 380 {lab=#net3}
N -880 440 -880 590 {lab=VSS}
N -1420 -590 -330 -590 {lab=VDD_3v3}
N -1420 590 -240 590 {lab=VSS}
N -1360 -470 -1360 590 {lab=VSS}
N -1320 -100 -1300 -100 {lab=Vcm_tia_1v5}
N -1380 -220 -1180 -220 {lab=analog_readout_input}
N -1380 -220 -1380 -20 {lab=analog_readout_input}
N -1360 -470 -1150 -470 {lab=VSS}
N -240 -20 -200 -20 {lab=analog_readout_output}
N -1420 230 -1220 230 {lab=read_en}
C {lab_pin.sym} -1420 590 2 1 {name=p2 sig_type=std_logic lab=VSS}
C {Analog/schematics/1_readout/tia/B18_TIA_OTA.sym} -1290 0 0 0 {name=readout_tia_ota}
C {Analog/schematics/1_readout/bpf/B18_BPF_OTA.sym} -1030 40 0 0 {name=readout_bpf_1st_ota}
C {Analog/schematics/1_readout/bpf/B18_BPF_OTA.sym} -390 40 0 0 {name=readout_bpf_2nd_ota}
C {symbols/cap_mim_2f0fF.sym} -880 410 0 0 {name="=10pF"
W=70.71u
L=70.71u
model=cap_mim_2f0fF
spiceprefix=c
m=1}
C {symbols/cap_mim_2f0fF.sym} -240 410 0 0 {name="=10pF_"
W=70.71u
L=70.71u
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/ppolyf_u_3k.sym} -1150 -220 3 1 {name="=30kΩ"
W=1u
L=10u
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {lab_pin.sym} -420 -20 2 1 {name=p22 sig_type=std_logic lab=Ibias_bp_4u89A}
C {lab_pin.sym} -720 40 1 1 {name=p24 sig_type=std_logic lab=Vcm_bp_2v2}
C {lab_pin.sym} -1320 -100 1 0 {name=p20 sig_type=std_logic lab=Vcm_tia_1v5}
C {lab_pin.sym} -1340 -60 1 0 {name=p25 sig_type=std_logic lab=Ibias_tia_105uA}
C {lab_pin.sym} -1420 -20 2 1 {name=p26 sig_type=std_logic lab=analog_readout_input}
C {lab_pin.sym} -1420 -590 2 1 {name=p27 sig_type=std_logic lab=VDD_3v3}
C {Analog/schematics/1_readout/bpf/B18_BPF_OTA.sym} -700 -210 0 0 {name=readout_bpf_2nd_ota_}
C {lab_pin.sym} -740 -270 2 1 {name=p1 sig_type=std_logic lab=Ibias_bp_4u89A}
C {lab_pin.sym} -1070 -20 1 1 {name=p23 sig_type=std_logic lab=Ibias_bp_4u89A}
C {lab_pin.sym} -210 -20 2 0 {name=p10 sig_type=std_logic lab=analog_readout_output}
C {lab_pin.sym} -1420 230 2 1 {name=p3 sig_type=std_logic lab=read_en}
