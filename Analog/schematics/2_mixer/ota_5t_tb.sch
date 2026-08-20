v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1850 -1310 2650 -910 {flags=graph,unlocked
y1=-25
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=1
logy=0
rainbow=1
sim_type=ac
autoload=1
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_ac.raw
color=4
node=re(mag_db)
y2=30}
B 2 920 -1430 1720 -1030 {flags=graph,unlocked
y1=-0.1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=8
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=1
logy=0
rainbow=1
sim_type=ac
autoload=1
y2=200
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_cmrr.raw
color=4
node=cmrr_db}
B 2 920 -900 1720 -500 {flags=graph
y1=1.106235
y2=2.893305
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=4.1868121e-05
x2=5.031237e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vif
vout
vif_b"
color="4 5 6"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_tran.raw
sim_type=tran
autoload=1
hilight_wave=-1}
B 2 1850 -900 2650 -500 {flags=graph
y1=-200
y2=0
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
node=re(phase_deg)
color=4
dataset=-1
unitx=1
logx=1
logy=0
autoload=1
sim_type=ac
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_ac.raw}
B 2 60 -1430 860 -1030 {flags=graph
y1=0
y2=20
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=3.3
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
sim_type=dc
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_dc.raw
color=4
node=ota_dc_gain}
B 2 1570 -440 2370 -40 {flags=graph
y1=-0.1
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=4.1868121e-05
x2=5.031237e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="in_p
gain"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_tran.raw
sim_type=tran
autoload=1
hilight_wave=1}
T {DC Analysis} 340 -1510 0 0 0.8 0.8 {}
T {AC Analysis} 2140 -1390 0 0 0.8 0.8 {}
T {Common Mode Rejection Ratio AC Analysis} 850 -1510 0 0 0.8 0.8 {}
T {Transient Analysis} 1130 -990 0 0 0.8 0.8 {}
N 190 -540 190 -520 {
lab=GND}
N 190 -620 190 -600 {lab=Vif}
N 270 -540 270 -520 {
lab=GND}
N 270 -620 270 -600 {
lab=Vif_b}
N 190 -370 190 -350 {
lab=GND}
N 190 -440 190 -430 {
lab=VDD}
N 450 -670 450 -610 {
lab=Ibias_30u}
N 100 -530 100 -490 {
lab=Ibias_30u}
N 530 -800 530 -750 {
lab=VDD}
N 340 -700 450 -700 {
lab=Vif_b}
N 340 -720 450 -720 {
lab=Vif}
N 630 -700 740 -700 {
lab=Vout}
N 100 -430 100 -370 {
lab=GND}
N 530 -650 530 -610 {
lab=GND}
N 1150 -220 1150 -160 {
lab=Ibias_30u
}
N 1230 -350 1230 -300 {
lab=VDD
}
N 1040 -250 1150 -250 {
lab=#net1
}
N 1040 -270 1150 -270 {
lab=GND
}
N 1330 -250 1440 -250 {
lab=Gain
}
N 1230 -200 1230 -160 {
lab=GND
}
N 870 -250 920 -250 {lab=IN_P
}
N 980 -250 1040 -250 {lab=#net1
}
N 1010 -420 1010 -250 {lab=#net1
}
N 1010 -420 1290 -420 {lab=#net1
}
N 1350 -420 1370 -420 {lab=Gain
}
N 1370 -420 1370 -250 {lab=Gain
}
N 900 110 900 150 {
lab=VDD}
N 900 210 900 230 {
lab=Ib}
N 900 230 900 250 {
lab=Ib}
N 1180 170 1260 170 {lab=#net1
spice_ignore=true}
N 1230 170 1230 300 {lab=#net1
spice_ignore=true}
N 1230 300 1300 300 {lab=#net1
spice_ignore=true}
N 1360 300 1460 300 {lab=Gain
spice_ignore=true}
N 1460 130 1460 300 {lab=Gain
spice_ignore=true}
N 1410 130 1460 130 {lab=Gain
spice_ignore=true}
N 1460 130 1520 130 {lab=Gain
spice_ignore=true}
N 1080 170 1120 170 {lab=IN_P
spice_ignore=true}
N 1230 90 1260 90 {lab=GND
spice_ignore=true}
N 1510 130 1510 200 {lab=Gain
spice_ignore=true}
N 1390 -250 1390 -180 {lab=Gain
}
C {code.sym} 490 -450 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical

"
}
C {devices/launcher.sym} 137.5 -932.5 2 1 {name=h2
descr="Run ngSpice simulation (ctrl+left-click)" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 140 -890 0 0 {name=h1
descr="Load ngSpice waveforms (ctrl+left-click)" 
tclcommand="

xschem raw_read /workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_cmrr.raw
xschem raw_read /workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_dc.raw
xschem raw_read /workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_ac.raw
xschem raw_read /workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_tran.raw

"
}
C {lab_wire.sym} 190 -620 0 0 {name=p8 sig_type=std_logic lab=Vif}
C {lab_wire.sym} 270 -620 0 0 {name=p9 sig_type=std_logic lab=Vif_b
}
C {vdd.sym} 190 -440 0 0 {name=l8 lab=VDD}
C {vsource.sym} 190 -400 0 0 {name=V_PWR value=3.3 savecurrent=true}
C {vsource.sym} 190 -570 0 0 {name=V_IF
value="sin( 1 1 1 0 )"
savecurrent=true
hide_texts=true}
C {vsource.sym} 270 -570 0 0 {name=V_IF_b
value="sin( 1 1 1 0 )"
savecurrent=true
hide_texts=true}
C {gnd.sym} 190 -350 0 0 {name=l7 lab=GND}
C {gnd.sym} 190 -520 0 0 {name=l1 lab=GND}
C {gnd.sym} 270 -520 0 0 {name=l2 lab=GND}
C {isource.sym} 100 -460 0 0 {name=I0 value=30u}
C {vdd.sym} 530 -800 0 0 {name=l10 lab=VDD}
C {gnd.sym} 100 -370 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 450 -610 3 0 {name=p6 sig_type=std_logic lab=Ibias_30u}
C {lab_pin.sym} 100 -530 3 1 {name=p13 sig_type=std_logic lab=Ibias_30u}
C {lab_pin.sym} 340 -720 0 0 {name=p1 sig_type=std_logic lab=Vif
}
C {lab_pin.sym} 340 -700 0 0 {name=p2 sig_type=std_logic lab=Vif_b
}
C {opin.sym} 740 -700 0 0 {name=p3 lab=Vout}
C {gnd.sym} 530 -610 0 0 {name=l3 lab=GND}
C {code.sym} 625 -445 0 0 {name=SPICE1 only_toplevel=true 
value="
* Complete 5T OTA Verification Testbench for Gilbert Cell Interface

.control
    * ==========================================
    * SETUP CONFIGURATIONS & GLOBAL VARIABLES
    * ==========================================
    set freq_if = 312k
    set cm_if   = 2.0
    set amp_if  = 0.005
    
    * Pre-allocate vector space for clean file writing
    save all

    * ==========================================
    * TEST 1: DC OPERATING POINT & ICMR SWEEP
    * ==========================================
    *echo '=== Running Test 1: DC Input Common-Mode Range Sweep ==='
    
    * Configure inputs as matched DC sources for common-mode sweep
    alter @V_IF[sin]   = [ 2.0 0 0 0 ]
    alter @V_IF_b[sin] = [ 2.0 0 0 0 ]
    
    * Sweep the common mode from 0V to VDD (assuming 3.3V supply)
    dc V_IF 0 3.3 0.05
    
    * Scripted calculation to check where Gain remains flat
    setplot dc1
    let ota_dc_gain = deriv(v(Vout))
    *** plot ota_dc_gain xlimit 1.0 3.0 title 'OTA Gain vs Input Common Mode (ICMR)'
    
    set appendwrite = 0
    write /workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_dc.raw

    * Show operating parameters of the OTA transistors at the nominal 2.0V common-mode
    *echo 'Transistor operating regions at nominal 2.0V common mode:'
    show all

    * ==========================================
    * TEST 2: AC ANALYSIS (GAIN, BW, PHASE MARGIN)
    * ==========================================
    *echo '=== Running Test 2: AC Open-Loop Analysis ==='
    
    * Reset DC levels to nominal Gilbert cell output, apply differential AC magnitudes
    alter @V_IF[dc]    = $cm_if
    alter @V_IF_b[dc]  = $cm_if
    alter @V_IF[acmag]  = 0.5
    alter @V_IF_b[acmag] = -0.5
    
    * Run AC analysis across a wide frequency grid
    ac dec 10 1 10G
    
    setplot ac1
    let mag_db = db(v(Vout))
    let phase_deg = ph(v(Vout)) * 180 / pi
    
    *** plot mag_db title 'OTA Open-Loop AC Magnitude'
    *** plot phase_deg title 'OTA Open-Loop AC Phase'

    set appendwrite = 0
    write /workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_ac.raw

    * ==========================================
    * TEST 3: TRANSIENT ANALYSIS WITH REAL MIXER INPUTS
    * ==========================================
    *echo '=== Running Test 3: Transient Response ==='
    
    * Reconfigure voltage sources to deliver the 180-degree out-of-phase mixing product
    alter @V_IF[sin]   = [ $cm_if $amp_if $freq_if 0 ]
    alter @V_IF_b[sin] = [ $cm_if $amp_if $freq_if 0 0 180 ]
    
    * Run transient simulation (300u duration covers ~93 full cycles of 312kHz)
    tran 3n 300u
    
    setplot tran1
    *** plot v(Vif) v(Vif_b) v(Vout) title 'Transient Mixer-to-OTA Tracking Waveforms'

    set appendwrite = 0
    write /workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_tran.raw

    * ==========================================
    * TEST 4: COMMON-MODE REJECTION RATIO (CMRR)
    * ==========================================
    *echo '=== Running Test 4: CMRR Analysis ==='
    
    * Force inputs to be perfectly in-phase (Common Mode AC perturbation)
    alter @V_IF[acmag]   = 1.0
    alter @V_IF_b[acmag] = 1.0
    
    ac dec 10 1 100meg
    
    setplot ac2
    let cm_gain_db = db(v(Vout))
    * Subtract common-mode gain from the previously stored differential gain vector
    let cmrr_db = ac1.mag_db - cm_gain_db
    
    *** plot cmrr_db title 'Common-Mode Rejection Ratio (CMRR) vs Frequency'

    set appendwrite = 0
    write /workspace/Analog/schematics/2_mixer/simulation_files/5tota_tb_cmrr.raw

    * ==========================================
    * TEST 5: NOISE ANALYSIS
    * ==========================================
    *echo '=== Running Test 5: Noise Analysis ==='
    
    * Reset inputs back to clean DC biasing for quiet noise observation
    *alter @V_IF[acmag]   = 0
    *alter @V_IF_b[acmag] = 0
    
    * Calculate input-referred and output noise across the IF baseband window
    *noise v(Vout) V_IF dec 10 10 1meg
    
    *setplot noise1
    *plot db(onoise_spectrum) db(inoise_spectrum) title 'Output and Input-Referred Noise (V^2/Hz)'

    * ==========================================
    * DATA EXPORT
    * ==========================================
    *echo '=== Exporting all simulation plots to raw file ==='
    
.endc
"}
C {Analog/schematics/2_mixer/ota_5t.sym} 470 -650 0 0 {name=x1}
C {vdd.sym} 1230 -350 0 0 {name=l4 lab=VDD
}
C {lab_pin.sym} 1150 -160 3 0 {name=p4 sig_type=std_logic lab=Ibias_30u
}
C {gnd.sym} 1230 -160 0 0 {name=l5 lab=GND
}
C {Analog/schematics/2_mixer/ota_5t.sym} 1170 -200 0 0 {name=x2
}
C {gnd.sym} 1040 -270 2 0 {name=l9 lab=GND
}
C {lab_pin.sym} 1440 -250 0 1 {name=p5 sig_type=std_logic lab=Gain
}
C {res.sym} 950 -250 1 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1
}
C {res.sym} 1320 -420 1 0 {name=R2
value=10k
footprint=1206
device=resistor
m=1
}
C {vsource.sym} 640 -160 0 0 {name=V2 value=
"SIN(1.65 1.65 200k 0n)"
savecurrent=false
}
C {lab_pin.sym} 640 -190 0 0 {name=p16 sig_type=std_logic lab=IN_P
}
C {gnd.sym} 640 -130 0 0 {name=l14 lab=GND
}
C {lab_pin.sym} 870 -250 0 0 {name=p7 sig_type=std_logic lab=IN_P
}
C {Analog/schematics/1_readout/tia/B18_TIA_OTA.sym} 1270 190 0 0 {name=x3
spice_ignore=true}
C {devices/isource.sym} 900 180 0 0 {name=I1 value=100u}
C {devices/lab_wire.sym} 900 250 2 0 {name=p10 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} 900 110 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 1260 130 2 1 {name=p12 sig_type=std_logic lab=Ib
spice_ignore=true}
C {gnd.sym} 1320 190 0 0 {name=l11 lab=GND
spice_ignore=true}
C {gnd.sym} 1340 180 0 0 {name=l12 lab=GND
spice_ignore=true}
C {vdd.sym} 1320 70 0 0 {name=l13 lab=VDD
spice_ignore=true}
C {res.sym} 1150 170 1 0 {name=R3
value=50k
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {res.sym} 1330 300 1 0 {name=R4
value=50k
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {gnd.sym} 1230 90 2 0 {name=l15 lab=GND
spice_ignore=true}
C {lab_pin.sym} 1080 170 0 0 {name=p14 sig_type=std_logic lab=IN_P
spice_ignore=true}
C {lab_pin.sym} 1520 130 0 1 {name=p15 sig_type=std_logic lab=Gain
spice_ignore=true}
C {devices/capa.sym} 1510 230 0 0 {name=C1
m=1
value=2p
spice_ignore=true}
C {devices/gnd.sym} 1510 260 0 0 {name=l16 lab=GND
spice_ignore=true}
C {devices/capa.sym} 1390 -150 0 0 {name=C2
m=1
value=2p
}
C {devices/gnd.sym} 1390 -120 0 0 {name=l17 lab=GND
}
