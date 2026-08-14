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
x1=-2706535.1
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
x2=-2306535.1
y2=20}
N 700 -870 800 -870 {
lab=V_RF_b}
N 700 -890 800 -890 {
lab=V_RF}
N 890 -780 890 -700 {
lab=V_LO}
N 910 -780 910 -700 {
lab=V_LO_b}
N 1120 -940 1120 -890 {
lab=V_out_p}
N 1120 -870 1120 -820 {
lab=V_out_n}
N 1230 -840 1230 -760 {lab=#net1}
N 1410 -870 1510 -870 {lab=Vif}
N 330 -1180 330 -1160 {
lab=GND}
N 330 -1260 330 -1240 {lab=V_LO}
N 410 -1180 410 -1160 {
lab=GND}
N 410 -1260 410 -1240 {
lab=V_LO_b}
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
C {ipin.sym} 890 -700 1 1 {name=p1 lab=V_LO}
C {ipin.sym} 910 -700 1 1 {name=p2 lab=V_LO_b
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
C {lab_wire.sym} 330 -1260 0 0 {name=p8 sig_type=std_logic lab=V_LO}
C {lab_wire.sym} 410 -1260 0 0 {name=p9 sig_type=std_logic lab=V_LO_b
}
C {lab_wire.sym} 480 -1260 0 0 {name=p10 sig_type=std_logic lab=V_RF}
C {lab_wire.sym} 550 -1260 0 0 {name=p11 sig_type=std_logic lab=V_RF_b}
C {vdd.sym} 330 -1080 0 0 {name=l8 lab=VDD}
C {vsource.sym} 330 -1040 0 0 {name=V_PWR value=3.3 savecurrent=true}
C {vsource.sym} 330 -1210 0 0 {name=V_LO
* value="pulse(0 1.5 0 1p 1p 0.25n 0.5n)"
value="sin( 1 1 1 0 )"
savecurrent=true
hide_texts=true}
C {vsource.sym} 410 -1210 0 0 {name=V_LO_b
* value="pulse(0 1.5 0 1p 1p 0.25n 0.5n)"
value="sin( 1 1 1 0 )"
savecurrent=true
hide_texts=true}
C {vsource.sym} 480 -1210 0 0 {name=V_RF
value="sin( 1 1 1 0 )"
savecurrent=true
hide_texts=true}
C {vsource.sym} 550 -1210 0 0 {name=V_RF_b
value="sin( 1 1 1 0 0 180 )"
savecurrent=true
hide_texts=true}
C {gnd.sym} 330 -990 0 0 {name=l7 lab=GND}
C {gnd.sym} 330 -1160 0 0 {name=l1 lab=GND}
C {gnd.sym} 410 -1160 0 0 {name=l2 lab=GND}
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

    * Set frequency and amplitude variables to proper values from within the control sequence
    * sine-wave LO
    * set cm_lo = 0.5
    * set freq_lo = 2.50G 
    * set amp_lo = 0.5
    * alter @V_LO[sin] = [ $cm_lo $amp_lo $freq_lo 0 ]
    * alter @V_LO_b[sin] = [ $cm_lo $amp_lo $freq_lo 0 0 180 ]

    set freq_lo = 156k
    set cm_lo = 1.8
    set amp_lo = 0.4

    set cm_rf  = 1.2
    set freq_rf = 156k
    * set freq_rf = 10.7Meg
    set amp_rf  = 0.1

    * set the parameters to the voltage sources
    * alter @V_LO[pulse] = [ 2 2.5 0 0.5p 0.5p 5n 10n ]
    * alter @V_LO_b[pulse] = [ 2 2.5 5n 0.5p 0.5p 5n 10n]
    alter @V_LO[sin] = [ $cm_lo $amp_lo $freq_lo 0 ]
    alter @V_LO_b[sin] = [ $cm_lo $amp_lo $freq_lo 0 0 180 ]
    alter @V_RF[sin] = [ $cm_rf $amp_rf $freq_rf 0 ]
    alter @V_RF_b[sin] = [ $cm_rf $amp_rf $freq_rf 0 0 180 ]

    save all
    
    tran 400p 2m

    let if_out = v(v_out_p) - v(v_out_n)
    let vlo = v(v_lo) - v(v_lo_b)
    let vrf = v(v_rf) - v(v_rf_b)

    plot vlo vrf v(if_out) v(vif) ylimit -1 3.3

    linearize v(vif) vlo vrf

    fft v(vif) vlo vrf

    let vlo_db = db(mag(vlo))
    let vrf_db = db(mag(vrf))
    let vif_db = db(mag(v(vif)))
    
    plot vlo_db vrf_db vif_db xlimit 0 400k

    write /workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb.raw

.endc
"}
C {devices/launcher.sym} 377.5 -1462.5 2 1 {name=h2
descr="Run ngSpice simulation (ctrl+left-click)" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 380 -1420 0 0 {name=h1
descr="Load ngSpice waveforms (ctrl+left-click)" 
tclcommand="xschem raw_read /workspace/Analog/schematics/2_mixer/simulation_files/mixer_tb.raw tran"
}
C {Analog/schematics/2_mixer/gilbert_mixer.sym} 900 -880 0 0 {name=x1}
C {Analog/schematics/2_mixer/ota_5t.sym} 1250 -820 0 0 {name=x2}
