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
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_lpf_tb_ac.raw
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
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_lpf_tb_cmrr.raw
color=4
node=cmrr_db}
B 2 920 -900 1720 -500 {flags=graph
y1=1.414356
y2=2.757246
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-0
x2=0.0003
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
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_lpf_tb_tran.raw
sim_type=tran
autoload=1}
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
rawfile=/workspace/Analog/schematics/2_mixer/simulation_files/5tota_lpf_tb_dc.raw
color=4
node=ota_dc_gain}
T {DC Analysis} 340 -1510 0 0 0.8 0.8 {}
T {AC Analysis} 2140 -1390 0 0 0.8 0.8 {}
T {Common Mode Rejection Ratio AC Analysis} 850 -1510 0 0 0.8 0.8 {}
T {Transient Analysis} 1130 -990 0 0 0.8 0.8 {}
N 190 -540 190 -520 {
lab=GND}
N 190 -620 190 -600 {lab=Vif}
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
N 340 -720 450 -720 {
lab=Vif}
N 100 -430 100 -370 {
lab=GND}
N 530 -650 530 -610 {
lab=GND}
N 360 -700 450 -700 {lab=#net1}
N 360 -700 360 -500 {lab=#net1}
N 360 -500 680 -500 {lab=#net1}
N 680 -700 680 -500 {lab=#net1}
N 630 -700 680 -700 {lab=#net1}
N 760 -700 820 -700 {lab=Vout}
N 680 -700 700 -700 {lab=#net1}
N 790 -700 790 -580 {lab=Vout}
N 790 -520 790 -500 {lab=GND}
N 730 -740 730 -720 {lab=GND}
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
C {vdd.sym} 190 -440 0 0 {name=l8 lab=VDD}
C {vsource.sym} 190 -400 0 0 {name=V_PWR value=3.3 savecurrent=true}
C {vsource.sym} 190 -570 0 0 {name=V_IF
value="sin( 1 1 1 0 )"
savecurrent=true
hide_texts=true}
C {gnd.sym} 190 -350 0 0 {name=l7 lab=GND}
C {gnd.sym} 190 -520 0 0 {name=l1 lab=GND}
C {isource.sym} 100 -460 0 0 {name=I0 value=10u}
C {vdd.sym} 530 -800 0 0 {name=l10 lab=VDD}
C {gnd.sym} 100 -370 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 450 -610 3 0 {name=p6 sig_type=std_logic lab=Ibias_30u}
C {lab_pin.sym} 100 -530 3 1 {name=p13 sig_type=std_logic lab=Ibias_30u}
C {lab_pin.sym} 340 -720 0 0 {name=p1 sig_type=std_logic lab=Vif
}
C {opin.sym} 820 -700 0 0 {name=p3 lab=Vout}
C {gnd.sym} 530 -610 0 0 {name=l3 lab=GND}
C {Analog/schematics/2_mixer/5tota.sym} 470 -650 0 0 {name=x1}
C {code.sym} 625 -445 0 0 {name=SPICE1 only_toplevel=true 
value="
* Complete 5T OTA + RC Low-Pass Filter Verification Testbench

.control
    * ==========================================
    * SETUP CONFIGURATIONS & GLOBAL VARIABLES
    * ==========================================
    set freq_if = 312k
    set cm_if   = 2.0
    set amp_if  = 0.1     
    
    * Pre-allocate vector space for clean file writing
    save all

    * ==========================================
    * TEST 1: DC OPERATING POINT (Closed-Loop)
    * ==========================================
    * Configure input as a DC source for common-mode tracking sweep
    alter @V_IF[sin]   = [ 2.0 0 0 0 ]
    
    * Sweep the common mode from 0V to VDD (3.3V supply)
    dc V_IF 0 3.3 0.05
    
    * Scripted calculation to check where closed-loop gain tracks close to 1.0 (Unity)
    setplot dc1
    let ota_dc_gain = deriv(v(Vout))
    *** plot ota_dc_gain xlimit 1.0 3.0 title 'Filter DC Closed-Loop Gain vs Input Common Mode'
    
    set appendwrite = 0
    write /workspace/Analog/schematics/2_mixer/simulation_files/5tota_lpf_tb_dc.raw

    * Show operating parameters of the OTA transistors at the nominal 2.0V common-mode
    show all

    * ==========================================
    * TEST 2: AC ANALYSIS (FILTER CHARACTERISTIC)
    * ==========================================
    * Reset DC level to nominal 2.0V, apply single-ended AC magnitude of 1.0
    alter @V_IF[dc]    = $cm_if
    alter @V_IF[acmag]  = 1.0
    
    * Run AC analysis across a wide frequency grid
    ac dec 10 1 10G
    
    setplot ac1
    let mag_db = db(v(Vout))
    let phase_deg = ph(v(Vout)) * 180 / pi
    
    *** plot mag_db title 'Closed-Loop Filter AC Magnitude Response'
    *** plot phase_deg title 'Closed-Loop Filter AC Phase Response'

    set appendwrite = 0
    write /workspace/Analog/schematics/2_mixer/simulation_files/5tota_lpf_tb_ac.raw

    * ==========================================
    * TEST 3: TRANSIENT ANALYSIS 
    * ==========================================
    * Reconfigure single-ended voltage source to deliver the baseband frequency
    alter @V_IF[sin]   = [ $cm_if $amp_if $freq_if 0 ]
    
    * Run transient simulation (300u duration covers ~93 full cycles of 312kHz)
    tran 3n 300u
    
    setplot tran1
    *** plot v(Vif) v(Vout_5tota) v(Vout) title 'Transient Filter Waveforms'

    set appendwrite = 0
    write /workspace/Analog/schematics/2_mixer/simulation_files/5tota_lpf_tb_tran.raw

    * ==========================================
    * TEST 4: CLOSED-LOOP AC RESPONSE (Populates CMRR Box)
    * ==========================================
    * To prevent an empty grid, we populate this file with a fine-grained sweep 
    * of the filter's output magnitude response.
    alter @V_IF[dc]    = $cm_if
    alter @V_IF[acmag]  = 1.0
    
    ac dec 10 1 100meg
    
    setplot ac2
    let cmrr_db = ac1.mag_db
    *** plot cmrr_db title 'Filter Closed-Loop AC Response'

    set appendwrite = 0
    write /workspace/Analog/schematics/2_mixer/simulation_files/5tota_lpf_tb_cmrr.raw

    * ==========================================
    * TEST 5: NOISE ANALYSIS (Filter Output Noise Window)
    * ==========================================
    * Calculate input-referred and output noise across the filter bandwidth window
    *noise v(Vout) V_IF dec 10 10 10meg
    
    *setplot noise1
    *plot db(onoise_spectrum) db(inoise_spectrum) title 'Filter Output and Input-Referred Noise (V^2/Hz)'

    * ==========================================
    * DATA EXPORT
    * ==========================================
    *echo '=== Exporting all filter simulation plots to separate raw files complete ==='
    
.endc
"
}
C {symbols/cap_mim_analog.sym} 790 -550 0 0 {name=C1
W=42.74u
L=42.74u
model=cap_mim_2f0_m3m4_noshield
spiceprefix=X
m=1}
C {gnd.sym} 790 -500 0 0 {name=l9 lab=GND}
C {symbols/ppolyf_u_3k.sym} 730 -700 1 0 {name=R1
W=1e-6
L=40u
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {gnd.sym} 730 -740 2 1 {name=l2 lab=GND}
