v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 880 -620 1680 -220 {flags=graph,unlocked
y1=-0.1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.00012050699
x2=0.00012895124
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
rainbow=1
color=4
node=vout
sim_type=tran
autoload=1
y2=3.5
rawfile=$netlist_dir/5tota_tb.raw}
B 2 880 -1040 1680 -640 {flags=graph,unlocked
y1=-0.1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.00011694073
x2=0.00013064681
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
rainbow=1
color=4
node=vif
sim_type=tran
autoload=1
y2=3.5}
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
N 450 -670 450 -630 {
lab=Ibias_30u}
N 450 -630 450 -610 {
lab=Ibias_30u}
N 100 -390 100 -370 {
lab=GND}
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
N 100 -430 100 -390 {
lab=GND}
N 530 -650 530 -610 {
lab=GND}
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
C {code.sym} 325 -225 0 0 {name=SPICE only_toplevel=true 
value="
* let sets vectors to a plot, while set sets a variable, globally accessible in .control
.control

    * Set frequency and amplitude variables to proper values from within the control sequence
    * sine-wave L

    set freq_if = 312k
    set cm_if = 2
    set amp_if = 0.2

    * set the parameters to the voltage sources
    alter @V_IF[sin] = [ $cm_if $amp_if $freq_if 0 ]
    alter @V_IF_b[sin] = [ $cm_if $amp_if $freq_if 0 0 180 ]

    save all
    
    * operating point
    op
    show

    set appendwrite

    * Transient analysis to observe mixing operation
    tran 3n 300u
    write 5tota_tb.raw


.endc
"

* Complete 5T OTA Verification Testbench for Gilbert Cell Interface

.control
    * ==========================================
    * SETUP CONFIGURATIONS & GLOBAL VARIABLES
    * ==========================================
    set freq_if = 312k
    set cm_if   = 2.0
    set amp_if  = 0.2
    
    * Pre-allocate vector space for clean file writing
    save all

    * ==========================================
    * TEST 1: DC OPERATING POINT & ICMR SWEEP
    * ==========================================
    echo "=== Running Test 1: DC Input Common-Mode Range Sweep ==="
    
    * Configure inputs as matched DC sources for common-mode sweep
    alter @V_IF[sin]   = [ 2.0 0 0 0 ]
    alter @V_IF_b[sin] = [ 2.0 0 0 0 ]
    
    * Sweep the common mode from 0V to VDD (assuming 3.3V supply)
    dc V_IF 0 3.3 0.05
    
    * Scripted calculation to check where Gain remains flat
    setplot dc1
    let ota_dc_gain = deriv(v(OUT))
    plot ota_dc_gain xlimit 1.0 3.0 title "OTA Gain vs Input Common Mode (ICMR)"
    
    * Show operating parameters of the OTA transistors at the nominal 2.0V common-mode
    echo "Transistor operating regions at nominal 2.0V common mode:"
    show all

    * ==========================================
    * TEST 2: AC ANALYSIS (GAIN, BW, PHASE MARGIN)
    * ==========================================
    echo "=== Running Test 2: AC Open-Loop Analysis ==="
    
    * Reset DC levels to nominal Gilbert cell output, apply differential AC magnitudes
    alter @V_IF[dc]    = $cm_if
    alter @V_IF_b[dc]  = $cm_if
    alter @V_IF[acmag]  = 0.5
    alter @V_IF_b[acmag] = -0.5
    
    * Run AC analysis across a wide frequency grid
    ac dec 10 1 100meg
    
    setplot ac1
    let mag_db = db(v(OUT))
    let phase_deg = ph(v(OUT)) * 180 / pi
    
    plot mag_db phase_deg title "OTA Open-Loop AC Response"

    * ==========================================
    * TEST 3: TRANSIENT ANALYSIS WITH REAL MIXER INPUTS
    * ==========================================
    echo "=== Running Test 3: Transient Response ==="
    
    * Reconfigure voltage sources to deliver the 180-degree out-of-phase mixing product
    alter @V_IF[sin]   = [ $cm_if $amp_if $freq_if 0 ]
    alter @V_IF_b[sin] = [ $cm_if $amp_if $freq_if 0 0 180 ]
    
    * Run transient simulation (300u duration covers ~93 full cycles of 312kHz)
    tran 3n 300u
    
    setplot tran1
    plot v(IN_P) v(IN_N) v(OUT) title "Transient Mixer-to-OTA Tracking Waveforms"

    * ==========================================
    * TEST 4: COMMON-MODE REJECTION RATIO (CMRR)
    * ==========================================
    echo "=== Running Test 4: CMRR Analysis ==="
    
    * Force inputs to be perfectly in-phase (Common Mode AC perturbation)
    alter @V_IF[acmag]   = 1.0
    alter @V_IF_b[acmag] = 1.0
    
    ac dec 10 1 100meg
    
    setplot ac2
    let cm_gain_db = db(v(OUT))
    * Subtract common-mode gain from the previously stored differential gain vector
    let cmrr_db = ac1.mag_db - cm_gain_db
    
    plot cmrr_db title "Common-Mode Rejection Ratio (CMRR) vs Frequency"

    * ==========================================
    * TEST 5: NOISE ANALYSIS
    * ==========================================
    echo "=== Running Test 5: Noise Analysis ==="
    
    * Reset inputs back to clean DC biasing for quiet noise observation
    alter @V_IF[acmag]   = 0
    alter @V_IF_b[acmag] = 0
    
    * Calculate input-referred and output noise across the IF baseband window
    noise v(OUT) V_IF dec 10 10 1meg
    
    setplot noise1
    plot db(onoise_spectrum) db(inoise_spectrum) title "Output and Input-Referred Noise (V^2/Hz)"

    * ==========================================
    * DATA EXPORT
    * ==========================================
    echo "=== Exporting all simulation plots to raw file ==="
    set appendwrite = 0
    write 5tota_tb.raw
    
.endc
spice_ignore=true}
C {devices/launcher.sym} 927.5 -152.5 2 1 {name=h2
descr="Run ngSpice simulation (ctrl+left-click)" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 930 -100 0 0 {name=h1
descr="Load ngSpice waveforms (ctrl+left-click)" 
tclcommand="xschem raw_read $netlist_dir/5tota_tb.raw tran"
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
C {isource.sym} 100 -460 0 0 {name=I0 value=10u}
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
C {5tota/5tota.sym} 470 -650 0 0 {name=x1}
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
    plot ota_dc_gain xlimit 1.0 3.0 title 'OTA Gain vs Input Common Mode (ICMR)'
    
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
    
    plot mag_db title 'OTA Open-Loop AC Magnitude'
    plot phase_deg title 'OTA Open-Loop AC Phase'

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
    plot v(Vif) v(Vif_b) v(Vout) title 'Transient Mixer-to-OTA Tracking Waveforms'

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
    
    plot cmrr_db title 'Common-Mode Rejection Ratio (CMRR) vs Frequency'

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
    set appendwrite = 0
    write 5tota_tb.raw
    
.endc
"}
