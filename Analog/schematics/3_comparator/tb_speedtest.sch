v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 60 -1220 860 -820 {flags=graph
y1=0
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.3980291e-07
x2=2.7468392e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="comp_out
vout1
vout2
clk
in_p
in_n"
color="4 6 5 8 17 21"
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=0}
B 2 900 -1220 1700 -820 {flags=graph
y1=-0.1
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.3980291e-07
x2=2.7468392e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="comp_out
clk
in_p
in_n"
color="4 6 5 10"
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=0}
B 2 1720 -1220 2520 -820 {flags=graph
y1=0
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.3980291e-07
x2=2.7468392e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout1
vout2
clk
in_p
in_n"
color="4 6 5 8 21"
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=1}
T {Change Output Capacitance for Finding Speed of Comparator
Input Capacitance from Digital Blocks: ~5p
Capacitance from PADframe and package: ~5p
Breadboard Adjacent Traces: ~3pF
Potential Test for Max Robustness: ~10p} 900 -760 0 0 0.4 0.4 {}
T {Change Output Capacitance for Finding Speed of Comparator:

Input Capacitance from Digital Blocks: ~5p
Potential Test for Max Robustness: ~10p} 1480 -130 0 0 0.4 0.4 {}
N 450 -570 510 -570 {lab=#net1
spice_ignore=true}
N 160 -420 210 -420 {lab=#net1}
N 160 -280 210 -280 {lab=#net2}
N 160 -170 210 -170 {lab=#net3}
N 570 -300 590 -300 {lab=IN_P}
N 570 -270 590 -270 {lab=CLK}
N 530 -240 550 -240 {lab=IN_N}
N 820 -260 840 -260 {lab=OUT2}
N 820 -280 840 -280 {lab=OUT1}
N 840 -260 860 -260 {lab=OUT2}
N 840 -280 860 -280 {lab=OUT1}
N 890 -370 940 -370 {lab=OUT1}
N 890 -370 890 -280 {lab=OUT1}
N 860 -280 890 -280 {lab=OUT1}
N 890 -180 940 -180 {lab=OUT2}
N 890 -260 890 -180 {lab=OUT2}
N 860 -260 890 -260 {lab=OUT2}
N 1090 -370 1110 -370 {lab=INV1}
N 1090 -180 1110 -180 {lab=INV2}
N 1020 -270 1020 -260 {lab=VDD_3V3}
N 1020 -290 1020 -280 {lab=GND}
N 1000 -470 1020 -470 {lab=VDD_3V3}
N 1020 -470 1020 -450 {lab=VDD_3V3}
N 1000 -270 1020 -270 {lab=VDD_3V3}
N 1020 -100 1020 -80 {lab=GND}
N 1120 -370 1170 -370 {lab=INV1}
N 1180 -370 1180 -280 {lab=INV1}
N 1300 -390 1300 -340 {lab=VDD_3V3}
N 1300 -200 1300 -150 {lab=GND}
N 1420 -280 1510 -280 {lab=VOUT1}
N 1420 -260 1480 -260 {lab=VOUT2}
N 1170 -370 1180 -370 {lab=INV1}
N 1180 -260 1180 -180 {lab=INV2}
N 1150 -180 1180 -180 {lab=INV2}
N 1980 -260 2040 -260 {lab=Comp_Out}
N 1110 -180 1150 -180 {lab=INV2}
N 1110 -370 1120 -370 {lab=INV1}
N 1180 -280 1240 -280 {lab=INV1}
N 1180 -260 1240 -260 {lab=INV2}
N 1900 -260 1920 -260 {lab=Comp_Out}
N 1830 -180 1830 -170 {lab=GND}
N 1810 -360 1830 -360 {lab=VDD_3V3}
N 1830 -360 1830 -340 {lab=VDD_3V3}
N 1930 -260 1980 -260 {lab=Comp_Out}
N 1920 -260 1930 -260 {lab=Comp_Out}
N 550 -240 590 -240 {lab=IN_N}
N 530 -300 570 -300 {lab=IN_P}
N 540 -320 540 -300 {lab=IN_P}
N 540 -240 540 -220 {lab=IN_N}
N 1730 -260 1750 -260 {lab=#net4}
N 1660 -180 1660 -170 {lab=GND}
N 1640 -360 1660 -360 {lab=VDD_3V3}
N 1660 -360 1660 -340 {lab=VDD_3V3}
N 1480 -260 1580 -260 {lab=VOUT2}
C {code_shown.sym} 130 -760 0 0 {name=NGSPICE only_toplevel=true value=
".save all
.save @m.x1.xm11.m0[id]
.probe v(x1.Vp) v(x1.Vq)
.probe v(INV1) v(INV2)
.control
tran 100p 10u
write tb_speedtest.raw
quit
.endc"}
C {vsource.sym} 160 -390 0 0 {name=V1 value=1.235 savecurrent=false}
C {vsource.sym} 160 -530 0 0 {name=V2 value=
"SIN(1.65 1.65 1meg 0.5n)"
savecurrent=false
}
C {lab_pin.sym} 160 -560 0 0 {name=p7 sig_type=std_logic lab=IN_P
}
C {lab_pin.sym} 270 -420 0 1 {name=p8 sig_type=std_logic lab=IN_N}
C {vsource.sym} 160 -250 0 0 {name=V3 value=3.3 savecurrent=false}
C {lab_pin.sym} 270 -280 0 1 {name=p10 sig_type=std_logic lab=VDD_3V3}
C {gnd.sym} 160 -360 0 0 {name=l2 lab=GND}
C {gnd.sym} 160 -500 0 0 {name=l3 lab=GND
}
C {gnd.sym} 160 -220 0 0 {name=l4 lab=GND}
C {devices/launcher.sym} 500 -720 0 0 {name=h3
descr="save, netlist & simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"}
C {vsource.sym} 450 -540 0 0 {name=V5 value=
"1.236"
savecurrent=false
spice_ignore=true}
C {lab_pin.sym} 570 -570 0 1 {name=p4 sig_type=std_logic lab=IN_P
spice_ignore=true}
C {launcher.sym} 500 -675 0 0 {name=h5 
descr="load ngspice waves" 
tclcommand="
xschem raw_read $netlist_dir/tb_speedtest.raw tran; xschem redraw
"
}
C {vsource.sym} 160 -140 0 0 {name=V6 value="PULSE(0 3.3 0.5n 100p 100p 100.1n 200n 100)" savecurrent=false}
C {lab_pin.sym} 270 -170 0 1 {name=p20 sig_type=std_logic lab=CLK}
C {gnd.sym} 160 -110 0 0 {name=l14 lab=GND}
C {res.sym} 540 -570 1 0 {name=R1
value=50
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {res.sym} 240 -420 1 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {res.sym} 240 -280 1 0 {name=R3
value=50
footprint=1206
device=resistor
m=1}
C {res.sym} 240 -170 1 0 {name=R4
value=50
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 530 -240 0 0 {name=p1 sig_type=std_logic lab=IN_N}
C {lab_pin.sym} 530 -300 0 0 {name=p2 sig_type=std_logic lab=IN_P}
C {lab_pin.sym} 570 -270 0 0 {name=p3 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 650 -330 0 0 {name=p13 sig_type=std_logic lab=VDD_3V3}
C {lab_pin.sym} 1180 -370 3 1 {name=p14 sig_type=std_logic lab=INV1}
C {lab_pin.sym} 1180 -180 1 1 {name=p15 sig_type=std_logic lab=INV2}
C {capa.sym} 1970 -230 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 650 -210 0 0 {name=l6 lab=GND}
C {gnd.sym} 1970 -200 0 0 {name=l8 lab=GND}
C {lab_pin.sym} 1000 -270 0 0 {name=p5 sig_type=std_logic lab=VDD_3V3}
C {lab_pin.sym} 1000 -470 0 0 {name=p9 sig_type=std_logic lab=VDD_3V3}
C {gnd.sym} 1020 -280 3 0 {name=l9 lab=GND}
C {gnd.sym} 1020 -80 0 0 {name=l12 lab=GND}
C {lab_pin.sym} 890 -310 2 1 {name=p16 sig_type=std_logic lab=OUT1
}
C {lab_pin.sym} 890 -230 2 1 {name=p17 sig_type=std_logic lab=OUT2}
C {gnd.sym} 1300 -150 0 0 {name=l10 lab=GND}
C {lab_pin.sym} 1300 -390 0 0 {name=p6 sig_type=std_logic lab=VDD_3V3}
C {lab_pin.sym} 1460 -280 3 1 {name=p12 sig_type=std_logic lab=VOUT1}
C {lab_pin.sym} 1460 -260 1 1 {name=p18 sig_type=std_logic lab=VOUT2}
C {lab_pin.sym} 2040 -260 0 1 {name=p19 sig_type=std_logic lab=Comp_Out}
C {lab_pin.sym} 1810 -360 0 0 {name=p22 sig_type=std_logic lab=VDD_3V3}
C {gnd.sym} 1830 -170 3 0 {name=l11 lab=GND}
C {noconn.sym} 1510 -280 2 0 {name=l15}
C {capa.sym} 540 -350 2 0 {name=C3
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 540 -380 2 0 {name=l7 lab=GND}
C {capa.sym} 540 -190 0 0 {name=C2
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 540 -160 0 0 {name=l1 lab=GND}
C {comparator/strongArmLatch.sym} 730 -280 0 0 {name=x1}
C {comparator/inv.sym} 940 -450 0 0 {name=xinv1}
C {comparator/inv.sym} 940 -260 0 0 {name=xinv2}
C {comparator/rslatch.sym} 1340 -260 0 0 {name=x2}
C {gnd.sym} 450 -510 0 0 {name=l5 lab=GND
spice_ignore=true}
C {comparator/inv.sym} 1580 -340 0 0 {name=xinv3}
C {comparator/inv.sym} 1750 -340 0 0 {name=xinv4}
C {lab_pin.sym} 1640 -360 0 0 {name=p11 sig_type=std_logic lab=VDD_3V3}
C {gnd.sym} 1660 -170 3 0 {name=l13 lab=GND}
C {code.sym} 720 -590 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical

"
}
