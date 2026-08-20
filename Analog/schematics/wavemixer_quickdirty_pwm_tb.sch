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
x1=-3.5698384e+08
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
x2=-2.093168e+08
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
N 470 -100 470 -80 {
lab=GND}
N 470 -180 470 -160 {
lab=V_RF}
N 470 60 470 80 {
lab=GND}
N 470 -20 470 0 {
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
N 470 -420 470 -400 {
lab=GND}
N 470 -500 470 -480 {
lab=V_lo}
N 470 -270 470 -250 {
lab=GND}
N 470 -350 470 -330 {
lab=V_lo_b}
N 890 -780 890 -720 {lab=V_lo}
N 910 -780 910 -720 {lab=V_lo_b}
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
C {lab_wire.sym} 470 -180 0 0 {name=p10 sig_type=std_logic lab=V_RF}
C {lab_wire.sym} 470 -20 0 0 {name=p11 sig_type=std_logic lab=V_RF_b}
C {vdd.sym} 330 -1080 0 0 {name=l8 lab=VDD}
C {vsource.sym} 330 -1040 0 0 {name=V_PWR value=3.3 savecurrent=true}
C {gnd.sym} 330 -990 0 0 {name=l7 lab=GND}
C {gnd.sym} 470 -80 0 0 {name=l3 lab=GND}
C {gnd.sym} 470 80 0 0 {name=l4 lab=GND}
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
.control
    save all
    op
    
    tran 1n 2m
    plot v(v_lo) xlimit 0 100u
    plot v(v_lo_b) xlimit 0 100u
    * plot v(v_rf) xlimit 0 100u
    * plot v(v_rf_b) xlimit 0 100u

    let if_out = v(v_out_p) - v(v_out_n)
    let dc_val = mean(if_out)
    let vlo = v(v_lo) - v(v_lo_b)
    let vrf = v(v_rf) - v(v_rf_b)

    plot vlo vrf v(if_out) v(vif) ylimit -1 3.3
    plot vlo vrf v(if_out) v(vif) xlimit 0 100u ylimit -1 3.3
    plot v(if_out) v(vif) ylimit -1 3.3
    plot v(if_out) v(vif) xlimit 0 100u ylimit -1 3.3

    write /workspace/Analog/schematics/2_mixer/simulation_files/1_tb_tran.raw

    linearize v(vif) vlo vrf

    fft v(vif) vlo vrf

    let vlo_db = db(mag(vlo))
    let vrf_db = db(mag(vrf))
    let vif_db = db(mag(v(vif)))
    
    plot vlo_db vrf_db vif_db xlimit 0 300Meg

    write /workspace/Analog/schematics/2_mixer/simulation_files/2_tb.raw

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
C {bsource.sym} 470 -130 0 0 {name=B1 VAR=V FUNC="\{(((time / 200n) - floor(time / 200n)) < ((128 + floor(127 * sin(2 * pi * 156k * (floor(time / 200n) * 200n)) + 0.5)) / 255.0)) ? 3.3 : 0\}" m=1}
C {bsource.sym} 470 30 0 0 {name=B2 VAR=V FUNC="3.3 - V(V_RF)" m=1
lab=v_rf_b}
C {lab_wire.sym} 470 -500 0 0 {name=p1 sig_type=std_logic lab=V_lo}
C {lab_wire.sym} 470 -350 0 0 {name=p2 sig_type=std_logic lab=V_lo_b}
C {gnd.sym} 470 -400 0 0 {name=l1 lab=GND}
C {gnd.sym} 470 -250 0 0 {name=l2 lab=GND}
C {bsource.sym} 470 -450 0 0 {name=B3 VAR=V FUNC="\{1.8 + 200m * exp(-(((1u*sin(2*pi*156k*time)-0)**2 + (1u*sin(2*pi*108k*time)-0)**2)/(2*9.319812u*9.319812u)))\}" m=1}
C {bsource.sym} 470 -300 0 0 {name=B4 VAR=V FUNC="\{1.8 + 200m * exp(-(((1u*sin(2*pi*156k*time+0.5*pi)-0)**2 + (1u*sin(2*pi*108k*time+0.5*pi)-0)**2)/(2*9.319812u*9.319812u)))\}" m=1
lab=v_lo_b}
C {lab_wire.sym} 890 -720 3 0 {name=p8 sig_type=std_logic lab=V_lo}
C {lab_wire.sym} 910 -720 3 0 {name=p9 sig_type=std_logic lab=V_lo_b}
