v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 870 -1590 1670 -1190 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-1927451.3
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
y1=-300
autoload=1
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb.raw
sim_type=sp
color="4 5 6"
node="vif_db; vif_db -1 *
vlo_db; vlo_db -1 *
vrf_db; vrf_db -1 *"
x2=1.4573959e+08
y2=20}
B 2 1700 -1590 2500 -1190 {flags=graph
y1=-1
y2=4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.00059122292
x2=0.00059157572
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb_tran.raw
color="4 5 6 10 8"
node="vrf
vlo
vif
if_out
dc_val"
sim_type=tran
hilight_wave=-1}
B 2 1700 -1160 2500 -760 {flags=graph
y1=2.0432093
y2=2.5424544
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.00059122292
x2=0.00059157572
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb_tran.raw
color="4 5 6 8"
node="vif
v_out_p
v_out_n
dc_val"
sim_type=tran
hilight_wave=-1}
N 700 -870 800 -870 {
lab=V_RF_b}
N 700 -890 800 -890 {
lab=V_RF}
N 1120 -940 1120 -890 {
lab=V_out_p}
N 1120 -870 1120 -820 {
lab=V_out_n}
N 1230 -840 1230 -760 {lab=#net1}
N 1410 -870 1510 -870 {lab=Vif}
N 480 -1180 480 -1160 {
lab=GND}
N 480 -1260 480 -1240 {
lab=V_RF}
N 550 -1180 550 -1160 {
lab=GND}
N 550 -1260 550 -1240 {
lab=V_RF_b}
N 330 -1010 330 -990 {
lab=GND}
N 330 -1080 330 -1070 {
lab=VDD}
N 330 -720 330 -670 {
lab=GND}
N 330 -670 380 -670 {
lab=GND}
N 380 -670 380 -650 {
lab=GND}
N 330 -820 330 -780 {
lab=I_bias_pos}
N 380 -670 430 -670 {
lab=GND}
N 430 -720 430 -670 {
lab=GND}
N 430 -820 430 -780 {
lab=I_bias_neg}
N 450 -1010 450 -990 {
lab=GND}
N 450 -1100 450 -1070 {lab=VSS}
N 790 -980 860 -980 {lab=VDD}
N 880 -1010 880 -980 {lab=GND}
N 920 -1050 920 -980 {lab=I_bias_neg}
N 940 -1050 940 -980 {lab=I_bias_pos}
N 1120 -890 1230 -890 {lab=V_out_p}
N 1120 -870 1230 -870 {lab=V_out_n}
N 1310 -950 1310 -920 {lab=VDD}
N 1000 -890 1120 -890 {lab=V_out_p}
N 1000 -870 1120 -870 {lab=V_out_n}
N -60 -990 -40 -990 {
lab=Vout_TIA}
N -130 -940 -130 -930 {lab=VSS}
N -250 -950 -210 -950 {lab=#net2}
N -270 -950 -250 -950 {lab=#net2}
N -110 -1110 -40 -1110 {lab=Vout_TIA}
N -250 -1110 -170 -1110 {lab=#net2}
N -40 -1110 -40 -990 {lab=Vout_TIA}
N -250 -1110 -250 -950 {lab=#net2}
N -290 -870 -290 -850 {lab=GND}
N -250 -950 -250 -930 {lab=#net2}
N -290 -950 -290 -930 {lab=#net2}
N -250 -870 -250 -850 {lab=GND}
N -270 -850 -250 -850 {lab=GND}
N -290 -850 -270 -850 {lab=GND}
N -290 -950 -270 -950 {lab=#net2}
N -40 -990 30 -990 {lab=Vout_TIA}
N -190 -710 -190 -670 {
lab=VDD}
N -190 -610 -190 -590 {
lab=Ib}
N -190 -590 -190 -570 {
lab=Ib}
N -120 -600 -120 -580 {
lab=GND}
N -120 -710 -120 -660 {lab=Vp}
N -120 -580 -120 -570 {lab=GND}
N -40 -990 -10 -860 {lab=Vout_TIA}
N 30 -990 890 -780 {lab=Vout_TIA}
N 170 -860 910 -780 {lab=V_LO_b}
C {code.sym} 520 -740 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical

"
}
C {ipin.sym} 700 -890 0 0 {name=p3 lab=V_RF}
C {ipin.sym} 700 -870 2 1 {name=p4 lab=V_RF_b
}
C {opin.sym} 1120 -940 3 0 {name=p5 lab=V_out_p}
C {opin.sym} 1120 -820 1 0 {name=p7 lab=V_out_n}
C {gnd.sym} 880 -1010 2 0 {name=l11 lab=GND}
C {lab_pin.sym} 940 -1050 1 0 {name=p6 sig_type=std_logic lab=I_bias_pos}
C {lab_pin.sym} 920 -1050 1 0 {name=p12 sig_type=std_logic lab=I_bias_neg}
C {vdd.sym} 790 -980 0 0 {name=l5 lab=VDD
}
C {vdd.sym} 1310 -950 0 0 {name=l10 lab=VDD}
C {lab_wire.sym} 1310 -820 3 0 {name=p17 sig_type=std_logic lab=VSS}
C {isource.sym} 1230 -730 0 0 {name=I2 value=30u}
C {gnd.sym} 1230 -700 0 0 {name=l13 lab=GND}
C {lab_wire.sym} 1510 -870 0 1 {name=p18 sig_type=std_logic lab=Vif}
C {lab_wire.sym} 480 -1260 0 0 {name=p10 sig_type=std_logic lab=V_RF}
C {lab_wire.sym} 550 -1260 0 0 {name=p11 sig_type=std_logic lab=V_RF_b}
C {vdd.sym} 330 -1080 0 0 {name=l8 lab=VDD}
C {vsource.sym} 330 -1040 0 0 {name=V_PWR value=3.3 savecurrent=true}
C {gnd.sym} 330 -990 0 0 {name=l7 lab=GND}
C {gnd.sym} 480 -1160 0 0 {name=l3 lab=GND}
C {gnd.sym} 550 -1160 0 0 {name=l4 lab=GND}
C {isource.sym} 330 -750 0 0 {name=I0 value=50u}
C {isource.sym} 430 -750 0 0 {name=I1 value=50u}
C {gnd.sym} 380 -650 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 330 -820 3 1 {name=p13 sig_type=std_logic lab=I_bias_pos}
C {lab_pin.sym} 430 -820 3 1 {name=p14 sig_type=std_logic lab=I_bias_neg}
C {vsource.sym} 450 -1040 0 0 {name=V_PWR1 value=0 savecurrent=true}
C {gnd.sym} 450 -990 0 0 {name=l12 lab=GND}
C {lab_wire.sym} 450 -1100 0 0 {name=p15 sig_type=std_logic lab=VSS}
C {code.sym} 645 -735 0 0 {name=SPICE only_toplevel=true 
value="
    * let sets vectors to a plot, while set sets a variable, globally accessible in .control
    .control
    .param vcm=1.5

    .param Ax=1u Ay=1u
    .param fx=156000 fy=108000
    .param w=9.319812u
    .param X0=0u Y0=0u
    .param Idc_setpoint=40u

    Bipd net1 0 I = \{Idc_setpoint * exp(-(((Ax*sin(2*pi*fx*time)-X0)**2 + (Ay*sin(2*pi*fy*time)-Y0)**2)/(2*w*w)))\}


    save all
    op
    
    tran 1n 2m
    plot v(Vout_TIA)

    let if_out = v(v_out_p) - v(v_out_n)
    let dc_val = mean(if_out)
    let vlo = v(Vout_TIA) - v(v_lo_b)
    let vrf = v(v_rf) - v(v_rf_b)

    plot vlo vrf v(if_out) v(vif) ylimit -1 3.3

    write /workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb_tran.raw

    linearize v(vif) vlo vrf

    fft v(vif) vlo vrf

    let vlo_db = db(mag(vlo))
    let vrf_db = db(mag(vrf))
    let vif_db = db(mag(v(vif)))
    
    plot vlo_db vrf_db vif_db xlimit 0 300Meg

    write /workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb.raw

.endc
"}
C {devices/launcher.sym} 377.5 -1462.5 2 1 {name=h2
descr="Run ngSpice simulation (ctrl+left-click)" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 380 -1420 0 0 {name=h1
descr="Load ngSpice waveforms (ctrl+left-click)" 
tclcommand="xschem raw_read /workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb.raw
xschem raw_read /workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb_tran.raw"
}
C {Analog/schematics/2_mixer/gilbert_mixer.sym} 900 -880 0 0 {name=x1}
C {Analog/schematics/2_mixer/ota_5t.sym} 1250 -820 0 0 {name=x2}
C {bsource.sym} 480 -1210 0 0 {name=B1 VAR=V FUNC="\{(((time / 200n) - floor(time / 200n)) < ((128 + floor(127 * sin(2 * pi * 156k * (floor(time / 200n) * 200n)) + 0.5)) / 255.0)) ? 3.3 : 0\}" m=1}
C {bsource.sym} 550 -1210 0 0 {name=B2 VAR=V FUNC="3.3 - V(v_rf)" m=1
lab=v_rf_b}
C {devices/lab_wire.sym} -150 -1050 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} -210 -1030 0 0 {name=p19 sig_type=std_logic lab=Vp}
C {devices/lab_wire.sym} -210 -990 0 0 {name=p20 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} -40 -990 0 1 {name=p21 sig_type=std_logic lab=Vout_TIA}
C {devices/lab_wire.sym} -150 -930 2 1 {name=p22 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} -130 -930 2 0 {name=p23 sig_type=std_logic lab=VSS}
C {isource.sym} -290 -900 0 1 {name=I3 value="dc 5u ac 1"}
C {devices/capa.sym} -250 -900 0 0 {name=C2
m=1
value=3.5p}
C {devices/gnd.sym} -290 -850 0 0 {name=l9 lab=GND}
C {symbols/ppolyf_u_3k.sym} -140 -1110 3 0 {name=R1
W=1e-6
L=10e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {devices/lab_wire.sym} -140 -1090 2 1 {name=p31 sig_type=std_logic lab=VSS}
C {Analog/schematics/1_readout/tia/B18_TIA_OTA.sym} -200 -930 0 0 {name=x4}
C {devices/isource.sym} -190 -640 0 0 {name=I4 value=105u}
C {devices/lab_wire.sym} -190 -570 2 0 {name=p25 sig_type=std_logic lab=Ib}
C {devices/vsource.sym} -120 -630 0 0 {name=Vcm value=\{vcm\} savecurrent=false}
C {devices/gnd.sym} -120 -570 0 0 {name=l15 lab=GND}
C {devices/lab_wire.sym} -120 -710 0 0 {name=p26 sig_type=std_logic lab=Vp}
C {devices/lab_wire.sym} -190 -710 0 0 {name=p28 sig_type=std_logic lab=VDD}
C {Analog/schematics/1_readout/slopedetector/inverter/inv1u05u.sym} 70 -860 0 0 {name=x3}
C {vdd.sym} 70 -920 0 0 {name=l17 lab=VDD
}
C {gnd.sym} 70 -800 0 0 {name=l18 lab=GND}
C {lab_pin.sym} 170 -860 1 0 {name=p24 sig_type=std_logic lab=V_LO_b}
