v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 2430 30 2430 560 {}
N 2300 240 2320 240 {
lab=Vout_TIA}
N 2120 770 2120 790 {
lab=GND}
N 2120 670 2120 710 {
lab=VSS}
N 2200 770 2200 790 {
lab=GND}
N 2120 790 2120 810 {
lab=GND}
N 2200 670 2200 710 {
lab=VDD}
N 2120 790 2200 790 {
lab=GND}
N 2280 670 2280 710 {
lab=VDD}
N 2280 770 2280 790 {
lab=Ib}
N 2280 790 2280 810 {
lab=Ib}
N 2350 780 2350 800 {
lab=GND}
N 2230 290 2230 300 {lab=VSS}
N 2350 670 2350 720 {lab=Vp}
N 2350 800 2350 810 {lab=GND}
N 2110 280 2150 280 {lab=#net1}
N 2090 280 2110 280 {lab=#net1}
N 2250 120 2320 120 {lab=Vout_TIA}
N 2110 120 2190 120 {lab=#net1}
N 2320 120 2320 240 {lab=Vout_TIA}
N 2110 120 2110 280 {lab=#net1}
N 2680 280 2680 320 {lab=V_BP}
N 2680 600 2680 620 {lab=GND}
N 2730 230 2730 280 {lab=V_BP}
N 3000 310 3000 420 {lab=V_BP}
N 2750 420 3000 420 {lab=V_BP}
N 2730 280 2730 420 {lab=V_BP}
N 2730 420 2750 420 {lab=V_BP}
N 2730 230 2750 230 {lab=V_BP}
N 3150 110 3150 270 {lab=V_BP}
N 2730 110 3150 110 {lab=V_BP}
N 2730 110 2730 230 {lab=V_BP}
N 2930 270 2950 270 {lab=V_LP}
N 2950 270 2950 350 {lab=V_LP}
N 2680 320 2680 540 {lab=V_BP}
N 2950 350 2950 480 {lab=V_LP}
N 2490 320 2530 320 {lab=V_LP}
N 2950 600 2950 620 {lab=GND}
N 2950 480 2950 540 {lab=V_LP}
N 2490 320 2490 440 {lab=V_LP}
N 2490 440 2950 440 {lab=V_LP}
N 2070 360 2070 380 {lab=GND}
N 2110 280 2110 300 {lab=#net1}
N 2070 280 2070 300 {lab=#net1}
N 2420 780 2420 800 {
lab=GND}
N 2420 670 2420 720 {lab=Vcm_bp}
N 2420 800 2420 810 {lab=GND}
N 2500 670 2500 710 {
lab=VDD}
N 2500 770 2500 790 {
lab=Ib_bp}
N 2500 790 2500 810 {
lab=Ib_bp}
N 2750 230 2780 230 {lab=V_BP}
N 2680 280 2730 280 {lab=V_BP}
N 2110 360 2110 380 {lab=GND}
N 2090 380 2110 380 {lab=GND}
N 2070 380 2090 380 {lab=GND}
N 2070 280 2090 280 {lab=#net1}
N 2320 240 2390 240 {lab=Vout_TIA}
N 2450 240 2530 240 {lab=Vout_TIA}
N 2390 240 2450 240 {lab=Vout_TIA}
C {devices/isource.sym} 2280 740 0 0 {name=I0 value=105u}
C {devices/lab_wire.sym} 2210 180 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 2150 200 0 0 {name=p3 sig_type=std_logic lab=Vp}
C {devices/lab_wire.sym} 2150 240 0 0 {name=p7 sig_type=std_logic lab=Ib}
C {devices/code_shown.sym} 3310 80 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false
value="
.param vdd=3.3
.param vcm=1.5

.param Ax=1u Ay=1u
.param fx=300.406 fy=400.543
.param w=9.319812u
.param X0=9.3u Y0=9.3u
.param Idc_setpoint=40u

Bipd net1 0 I = \{Idc_setpoint * exp(-(((Ax*sin(2*pi*fx*time)-X0)**2 + (Ay*sin(2*pi*fy*time)-Y0)**2)/(2*w*w)))\}

.tran 10u 20m

.control

* Case 0: Both X & Y off-peak
* Expect: Both fx (300.406Hz) and fy (400.543Hz) present together,
* plus sum/difference intermodulation content (fx+fy, fy-fx)
alterparam X0=9.3u
alterparam Y0=9.3u
alterparam Idc_setpoint=30u
reset
run
plot v(Vout_TIA) v(V_LP)

* Case 1: Near-converged 
* Expect high DC (~45uA, near Iceil), small modulation depth
* on both fx and fy
alterparam X0=0.3u
alterparam Y0=0.3u
alterparam Idc_setpoint=45u
reset
run
plot v(Vout_TIA) v(V_LP)

* Case 2: X-axis only, Y at peak
* Expect dominant fx = 300.406Hz ONLY.
* Y0=0 sits at the flat top of the Gaussian in Y, so fy should be negligible/absent
alterparam X0=9.3u
alterparam Y0=0
alterparam Idc_setpoint=20u
reset
run
plot v(Vout_TIA) v(V_LP)

* Case 3: Headroom stress 
* Same axis-isolation expectation as Case 2 (fx=300.406Hz dominant,
* fy negligible), but DC is pushed toward  measured ~50uA
* compression edge, testing headroom
alterparam X0=9.3u
alterparam Y0=0
alterparam Idc_setpoint=40u
reset
run
plot v(Vout_TIA) v(V_LP)

* Case 4: Y-axis only, X at peak
* Expect dominant fy = 400.543Hz , fx negligible --
* mirrors Case 2.
alterparam X0=0
alterparam Y0=9.3u
alterparam Idc_setpoint=20u
reset
run
plot v(Vout_TIA) v(V_LP)

* Case 5: Perfectly aligned (both axes at peak)
alterparam X0=0u
alterparam Y0=0u
alterparam Idc_setpoint=45u
reset
run
plot v(Vout_TIA) v(V_LP)

.endc
.end
"}
C {devices/lab_wire.sym} 2320 240 0 1 {name=p11 sig_type=std_logic lab=Vout_TIA}
C {devices/vsource.sym} 2120 740 0 0 {name=V0 value=0 savecurrent=false}
C {devices/gnd.sym} 2120 810 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 2200 740 0 0 {name=V2 value=\{vdd\} savecurrent=false}
C {devices/lab_wire.sym} 2120 670 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 2280 810 2 0 {name=p8 sig_type=std_logic lab=Ib}
C {devices/vsource.sym} 2350 750 0 0 {name=Vcm value=\{vcm\} savecurrent=false}
C {devices/gnd.sym} 2350 810 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 2350 670 0 0 {name=p12 sig_type=std_logic lab=Vp}
C {devices/lab_wire.sym} 2200 670 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 2280 670 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 2210 300 2 1 {name=p9 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 2230 300 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {isource.sym} 2070 330 0 1 {name=I1 value="dc 5u ac 1"}
C {devices/capa.sym} 2110 330 0 0 {name=C2
m=1
value=3.5p}
C {devices/gnd.sym} 2070 380 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} 3250 -160 0 0 {name=MODELS1 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
"}
C {devices/gnd.sym} 2680 620 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 2840 210 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 2840 330 2 1 {name=p14 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 2590 220 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 2590 340 2 1 {name=p17 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 3060 210 0 0 {name=p18 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 3060 330 2 1 {name=p20 sig_type=std_logic lab=VSS}
C {devices/gnd.sym} 2950 620 0 0 {name=l5 lab=GND}
C {lab_wire.sym} 2680 480 0 0 {name=p21 sig_type=std_logic lab=V_BP}
C {lab_wire.sym} 2950 470 0 0 {name=p24 sig_type=std_logic lab=V_LP}
C {devices/vsource.sym} 2420 750 0 0 {name=Vcm1 value=2.2 savecurrent=false}
C {devices/gnd.sym} 2420 810 0 0 {name=l2 lab=GND
value=1.65}
C {devices/lab_wire.sym} 2420 670 0 0 {name=p22 sig_type=std_logic lab=Vcm_bp
value=1.65}
C {devices/isource.sym} 2500 740 0 0 {name=I2 value=4.89u}
C {devices/lab_wire.sym} 2500 810 2 0 {name=p26 sig_type=std_logic lab=Ib_bp
value=600n}
C {devices/lab_wire.sym} 2500 670 0 0 {name=p27 sig_type=std_logic lab=VDD
value=600n}
C {devices/lab_wire.sym} 2530 280 0 0 {name=p28 sig_type=std_logic lab=Ib_bp
value=600n}
C {devices/lab_wire.sym} 2780 270 0 0 {name=p13 sig_type=std_logic lab=Ib_bp
value=600n}
C {devices/lab_wire.sym} 3000 270 0 0 {name=p16 sig_type=std_logic lab=Ib_bp
value=600n}
C {devices/lab_wire.sym} 3000 230 0 0 {name=p19 sig_type=std_logic lab=Vcm_bp
value=1.65}
C {devices/lab_wire.sym} 2780 310 0 0 {name=p23 sig_type=std_logic lab=Vcm_bp
value=1.65}
C {symbols/ppolyf_u_3k.sym} 2220 120 3 0 {name=R1
W=1e-6
L=10e-6
model=ppolyf_u_3k
spiceprefix=X
m=1}
C {devices/lab_wire.sym} 2220 140 2 1 {name=p31 sig_type=std_logic lab=VSS}
C {symbols/cap_mim_2f0fF.sym} 2680 570 0 0 {name=C4
W=70.71e-6
L=70.71e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} 2950 570 0 0 {name=C1
W=70.71e-6
L=70.71e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {bpf/B18_BPF_OTA.sym} 2530 340 0 0 {name=x1}
C {bpf/B18_BPF_OTA.sym} 2780 330 0 0 {name=x2}
C {bpf/B18_BPF_OTA.sym} 3000 330 0 0 {name=x3}
C {tia/B18_TIA_OTA.sym} 2160 300 0 0 {name=x4}
