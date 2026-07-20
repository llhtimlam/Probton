v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 110 -400 110 -380 {
lab=GND}
N 110 -500 110 -460 {
lab=VSS}
N 190 -400 190 -380 {
lab=GND}
N 110 -380 110 -360 {
lab=GND}
N 190 -500 190 -460 {
lab=VDD}
N 110 -380 190 -380 {
lab=GND}
N 270 -500 270 -460 {
lab=VDD}
N 270 -400 270 -380 {
lab=Ib}
N 270 -380 270 -360 {
lab=Ib}
N 270 -40 340 -40 {lab=V_BP}
N 280 -40 280 0 {lab=V_BP}
N 280 280 280 300 {lab=GND}
N 430 -90 430 -40 {lab=V_BP}
N 450 -90 490 -90 {lab=V_BP}
N 700 -10 700 100 {lab=V_BP}
N 450 100 700 100 {lab=V_BP}
N 430 -40 430 100 {lab=V_BP}
N 430 100 450 100 {lab=V_BP}
N 340 -40 430 -40 {lab=V_BP}
N 430 -90 450 -90 {lab=V_BP}
N 850 -210 850 -50 {lab=V_BP}
N 430 -210 850 -210 {lab=V_BP}
N 430 -210 430 -90 {lab=V_BP}
N 630 -50 650 -50 {lab=V_LP}
N 650 -50 650 30 {lab=V_LP}
N 280 0 280 220 {lab=V_BP}
N 650 30 650 160 {lab=V_LP}
N 80 160 650 160 {lab=V_LP}
N 80 0 80 160 {lab=V_LP}
N 80 0 120 0 {lab=V_LP}
N 650 280 650 300 {lab=GND}
N 650 160 650 220 {lab=V_LP}
N -30 -80 -30 -40 {lab=#net1}
N -30 -80 120 -80 {lab=#net1}
N -30 20 -30 60 {lab=GND}
N 360 -380 360 -360 {
lab=GND}
N 360 -460 360 -440 {
lab=VCM}
C {devices/isource.sym} 270 -430 0 0 {name=I0 value=600n}
C {devices/vsource.sym} 110 -430 0 0 {name=V0 value=0 savecurrent=false}
C {devices/gnd.sym} 110 -360 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 190 -430 0 0 {name=V2 value=\{vdd\} savecurrent=false}
C {devices/lab_wire.sym} 110 -500 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 270 -360 2 0 {name=p8 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} 190 -500 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 270 -500 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {devices/code_shown.sym} 490 -480 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false
value="
.param vdd=3.3
.param vcm=1.65

.control

    ac dec 50 10k 2Meg
    plot vdb(v_bp)
    plot vdb(v_lp)

.endc
"}
C {devices/code_shown.sym} -1270 -430 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="

.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
* .lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"
}
C {symbols/cap_mim_analog.sym} 280 250 0 0 {name=C1
W=42.74u
L=42.74u
model=cap_mim_2f0_m3m4_noshield
spiceprefix=X
m=1}
C {devices/gnd.sym} 280 300 0 0 {name=l1 lab=GND}
C {ota5t.sym} 550 -50 0 0 {name=x2}
C {devices/lab_wire.sym} 540 -110 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 480 -50 0 0 {name=p4 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} 540 10 2 1 {name=p10 sig_type=std_logic lab=VSS}
C {ota5t.sym} 190 -40 0 0 {name=x1}
C {devices/lab_wire.sym} 180 -100 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 120 -40 0 0 {name=p7 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} 180 20 2 1 {name=p9 sig_type=std_logic lab=VSS}
C {ota5t.sym} 770 -50 0 0 {name=x3}
C {devices/lab_wire.sym} 760 -110 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 700 -50 0 0 {name=p13 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} 760 10 2 1 {name=p14 sig_type=std_logic lab=VSS}
C {symbols/cap_mim_analog.sym} 650 250 0 0 {name=C2
W=42.74u
L=42.74u
model=cap_mim_2f0_m3m4_noshield
spiceprefix=X
m=1}
C {devices/gnd.sym} 650 300 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 360 -40 0 0 {name=p16 sig_type=std_logic lab=V_BP}
C {devices/vsource.sym} -30 -10 0 0 {name=V1 value="dc \{vcm\} ac 1" savecurrent=false}
C {devices/gnd.sym} -30 60 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 360 -410 0 0 {name=Vcm value=\{vcm\} savecurrent=false}
C {devices/gnd.sym} 360 -360 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 360 -460 0 0 {name=p17 sig_type=std_logic lab=VCM}
C {devices/lab_wire.sym} 480 -10 0 0 {name=p18 sig_type=std_logic lab=VCM}
C {devices/lab_wire.sym} 700 -90 0 0 {name=p11 sig_type=std_logic lab=VCM}
C {lab_wire.sym} 650 -10 0 0 {name=p15 sig_type=std_logic lab=V_LP}
