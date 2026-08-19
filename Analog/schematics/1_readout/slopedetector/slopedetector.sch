v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 200 -1270 1000 -870 {flags=graph
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
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
hilight_wave=0
y1=-0.1}
B 2 1010 -1270 1810 -870 {flags=graph
y1=-0.1
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="comp_out
clk
in_p"
color="4 6 5"
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=0}
B 2 1010 -850 1810 -450 {flags=graph
y1=0
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="clk
in_p
in_p2"
color="4 6 5"
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=-1
rawfile=/workspace/Analog/schematics/1_readout/slopedetector/slopedetector.raw}
B 2 1910 -850 2710 -450 {flags=graph
y1=0
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="in_p
in_p2
slope
comp_out_ref
comp_out"
color="4 5 6 9 10"
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=2
rawfile=/workspace/Analog/schematics/1_readout/slopedetector/slopedetector.raw}
B 2 1910 -1270 2710 -870 {flags=graph
y1=0
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="clk
slope"
color="9 7"
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=-1
rawfile=/workspace/Analog/schematics/1_readout/slopedetector/slopedetector.raw}
B 2 2730 -850 3530 -450 {flags=graph
y1=0
y2=3.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="in_p
in_p2
slope
comp_out_ref
comp_out
slope2"
color="4 5 6 9 10 12"
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=2
rawfile=/workspace/Analog/schematics/1_readout/slopedetector/slopedetector.raw}
N 1880 -220 1900 -220 {lab=IN_P
}
N 1880 -180 1900 -180 {lab=CLK
}
N 1840 -140 1860 -140 {lab=IN_N
}
N 1860 -140 1900 -140 {lab=IN_N
}
N 1840 -220 1880 -220 {lab=IN_P
}
N 1400 -240 1400 -220 {lab=#net1
spice_ignore=true}
N 1980 -280 1980 -250 {lab=GND
}
N 1980 -110 1980 -80 {lab=VDD_3V3
}
N 2150 -180 2210 -180 {lab=Comp_Out_REF
}
N 2100 -180 2150 -180 {lab=Comp_Out_REF
}
N 210 -460 260 -460 {lab=#net1}
N 210 -320 260 -320 {lab=#net2}
N 210 -210 260 -210 {lab=#net3}
N 770 -220 820 -220 {lab=IN_P
spice_ignore=true}
N 920 -360 1010 -360 {lab=IN_P
spice_ignore=true}
N 1330 -220 1390 -220 {lab=#net1
spice_ignore=true}
N 1070 -360 1330 -360 {lab=#net1
spice_ignore=true}
N 1330 -360 1330 -220 {lab=#net1
spice_ignore=true}
N 820 -220 920 -220 {lab=IN_P
spice_ignore=true}
N 920 -360 920 -220 {lab=IN_P
spice_ignore=true}
N 920 90 920 130 {
lab=VDD}
N 920 190 920 210 {
lab=Ib}
N 920 210 920 230 {
lab=Ib}
N 1620 -160 1620 -140 {lab=GND
spice_ignore=true}
N 1640 -170 1640 -140 {lab=GND
spice_ignore=true}
N 1710 -220 1840 -220 {lab=IN_P2
spice_ignore=true}
N 1540 -220 1560 -220 {lab=Ib
spice_ignore=true}
N 1540 -180 1560 -180 {lab=IN_P2
spice_ignore=true}
N 1540 -180 1540 -110 {lab=IN_P2
spice_ignore=true}
N 1540 -110 1740 -110 {lab=IN_P2
spice_ignore=true}
N 1740 -220 1740 -110 {lab=IN_P2
spice_ignore=true}
N 1460 -260 1560 -260 {lab=#net1
spice_ignore=true}
N 1460 -260 1460 -220 {lab=#net1
spice_ignore=true}
N 1390 -220 1460 -220 {lab=#net1
spice_ignore=true}
N 1250 150 1360 150 {lab=IN_P
spice_ignore=true}
N 1510 150 1600 150 {lab=Comp_Out
spice_ignore=true}
N 1650 150 1710 150 {lab=Comp_Out
spice_ignore=true}
N 1600 150 1650 150 {lab=Comp_Out
spice_ignore=true}
N 1440 40 1440 70 {lab=VDD_3V3
spice_ignore=true}
N 1440 230 1440 260 {lab=GND
spice_ignore=true}
N 3060 -280 3110 -280 {lab=Slope2
}
N 1990 150 2010 150 {lab=IN_P2
}
N 1990 190 2010 190 {lab=CLK
}
N 1950 230 1970 230 {lab=IN_N
}
N 1970 230 2010 230 {lab=IN_N
}
N 1950 150 1990 150 {lab=IN_P2
}
N 2090 90 2090 120 {lab=GND
}
N 2090 260 2090 290 {lab=VDD_3V3
}
N 2260 190 2320 190 {lab=Comp_Out
}
N 2210 190 2260 190 {lab=Comp_Out
}
C {code.sym} 170 -50 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical

"
}
C {devices/launcher.sym} 397.5 -22.5 2 1 {name=h2
descr="Run ngSpice simulation (ctrl+left-click)" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 400 20 0 0 {name=h1
descr="Load ngSpice waveforms (ctrl+left-click)" 
tclcommand="xschem raw_read /workspace/Analog/schematics/1_readout/slopedetector/slopedetector.raw tran; xschem redraw"
}
C {lab_pin.sym} 1880 -180 0 0 {name=p24 sig_type=std_logic lab=CLK
}
C {capa.sym} 1400 -270 2 0 {name=C4
m=1
value=2p
footprint=1206
device="ceramic capacitor"
spice_ignore=true}
C {gnd.sym} 1400 -300 2 0 {name=l16 lab=GND
spice_ignore=true}
C {Analog/schematics/3_comparator/comparator.sym} 1860 -380 2 1 {name=x1
}
C {gnd.sym} 1980 -280 2 1 {name=l18 lab=GND
}
C {lab_pin.sym} 1980 -80 1 1 {name=p25 sig_type=std_logic lab=VDD_3V3
}
C {capa.sym} 2140 -150 0 0 {name=C6
m=1
value=5p
footprint=1206
device="ceramic capacitor"
}
C {gnd.sym} 2140 -120 0 0 {name=l19 lab=GND
}
C {lab_pin.sym} 2320 190 0 1 {name=p26 sig_type=std_logic lab=Comp_Out
}
C {code_shown.sym} 180 -820 0 0 {name=NGSPICE only_toplevel=true value=
"
.control
tran 1n 10u
save all
save @m.x1.xm11.m0[id]
probe v(x1.Vp) v(x1.Vq)
probe v(INV1) v(INV2)
write /workspace/Analog/schematics/1_readout/slopedetector/slopedetector.raw
quit
.endc"}
C {vsource.sym} 210 -430 0 0 {name=V1 value=1.65 savecurrent=false}
C {vsource.sym} 210 -570 0 0 {name=V2 value=
"SIN(1.65 1.65 156k 0.5n)"
savecurrent=false
}
C {lab_pin.sym} 210 -600 0 0 {name=p16 sig_type=std_logic lab=IN_P
}
C {lab_pin.sym} 320 -460 0 1 {name=p19 sig_type=std_logic lab=IN_N}
C {vsource.sym} 210 -290 0 0 {name=V3 value=3.3 savecurrent=false}
C {lab_pin.sym} 320 -320 0 1 {name=p20 sig_type=std_logic lab=VDD_3V3}
C {gnd.sym} 210 -400 0 0 {name=l9 lab=GND}
C {gnd.sym} 210 -540 0 0 {name=l14 lab=GND
}
C {gnd.sym} 210 -260 0 0 {name=l15 lab=GND}
C {vsource.sym} 210 -180 0 0 {name=V6 value="PULSE(0 3.3 0.5n 100p 100p 100.1n 200n 100)" savecurrent=false}
C {lab_pin.sym} 320 -210 0 1 {name=p22 sig_type=std_logic lab=CLK}
C {gnd.sym} 210 -150 0 0 {name=l20 lab=GND}
C {res.sym} 290 -460 1 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {res.sym} 290 -320 1 0 {name=R3
value=50
footprint=1206
device=resistor
m=1}
C {res.sym} 290 -210 1 0 {name=R4
value=50
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 770 -220 0 0 {name=p21 sig_type=std_logic lab=IN_P
spice_ignore=true}
C {capa.sym} 750 -330 3 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"
}
C {res.sym} 1040 -360 1 0 {name=R5
value=50k
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {Analog/schematics/1_readout/tia/B18_TIA_OTA.sym} 1570 -160 0 0 {name=x2
spice_ignore=true}
C {devices/isource.sym} 920 160 0 0 {name=I0 value=100u}
C {devices/lab_wire.sym} 920 230 2 0 {name=p8 sig_type=std_logic lab=Ib}
C {devices/lab_wire.sym} 920 90 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {gnd.sym} 1620 -140 0 1 {name=l1 lab=GND
spice_ignore=true}
C {gnd.sym} 1640 -140 0 0 {name=l2 lab=GND
spice_ignore=true}
C {devices/lab_wire.sym} 1540 -220 2 1 {name=p2 sig_type=std_logic lab=Ib
spice_ignore=true}
C {lab_pin.sym} 1250 150 0 0 {name=p3 sig_type=std_logic lab=IN_P
spice_ignore=true}
C {Analog/schematics/3_comparator/inv.sym} 1360 70 0 0 {name=xinv1
spice_ignore=true}
C {capa.sym} 1640 180 0 0 {name=C2
m=1
value=5p
footprint=1206
device="ceramic capacitor"
spice_ignore=true}
C {gnd.sym} 1640 210 0 0 {name=l3 lab=GND
spice_ignore=true}
C {lab_pin.sym} 1710 150 0 1 {name=p4 sig_type=std_logic lab=Comp_Out
spice_ignore=true}
C {lab_pin.sym} 1440 40 3 1 {name=p5 sig_type=std_logic lab=VDD_3V3
spice_ignore=true}
C {gnd.sym} 1440 260 0 1 {name=l4 lab=GND
spice_ignore=true}
C {lab_pin.sym} 1870 -220 1 0 {name=p7 sig_type=std_logic lab=IN_P
}
C {lab_pin.sym} 1840 -140 0 0 {name=p9 sig_type=std_logic lab=IN_N}
C {Analog/schematics/1_readout/slopedetector/dff_risingedge/dff_rising.sym} 2940 -190 0 0 {name=x3
}
C {lab_pin.sym} 3000 -330 3 1 {name=p10 sig_type=std_logic lab=VDD_3V3
}
C {gnd.sym} 3000 -190 0 1 {name=l5 lab=GND
}
C {lab_pin.sym} 3110 -280 0 1 {name=p11 sig_type=std_logic lab=Slope2
}
C {vsource.sym} 520 -570 0 0 {name=V4 value=
"SIN(1.65 1.65 156k 0.5u)"
savecurrent=false
}
C {lab_pin.sym} 520 -600 0 0 {name=p12 sig_type=std_logic lab=IN_P2
}
C {gnd.sym} 520 -540 0 0 {name=l6 lab=GND
}
C {lab_pin.sym} 1990 190 0 0 {name=p1 sig_type=std_logic lab=CLK
}
C {Analog/schematics/3_comparator/comparator.sym} 1970 -10 2 1 {name=x4
}
C {gnd.sym} 2090 90 2 1 {name=l7 lab=GND
}
C {lab_pin.sym} 2090 290 1 1 {name=p13 sig_type=std_logic lab=VDD_3V3
}
C {capa.sym} 2250 220 0 0 {name=C3
m=1
value=5p
footprint=1206
device="ceramic capacitor"
}
C {gnd.sym} 2250 250 0 0 {name=l8 lab=GND
}
C {lab_pin.sym} 2210 -180 0 1 {name=p14 sig_type=std_logic lab=Comp_Out_REF
}
C {lab_pin.sym} 1980 150 1 0 {name=p15 sig_type=std_logic lab=IN_P2
}
C {lab_pin.sym} 1950 230 0 0 {name=p17 sig_type=std_logic lab=IN_N}
C {lab_pin.sym} 2940 -280 0 0 {name=p18 sig_type=std_logic lab=Comp_Out
}
C {lab_pin.sym} 2940 -240 0 0 {name=p23 sig_type=std_logic lab=Comp_Out_REF
}
C {Analog/schematics/1_readout/slopedetector/xnor/asc_XNOR.sym} 2670 0 0 0 {name=x5}
C {lab_pin.sym} 2570 20 0 0 {name=p27 sig_type=std_logic lab=Comp_Out_REF
}
C {lab_pin.sym} 2570 -20 0 0 {name=p28 sig_type=std_logic lab=Comp_Out
}
C {lab_pin.sym} 2790 0 0 1 {name=p29 sig_type=std_logic lab=Slope
}
C {lab_pin.sym} 2670 -80 3 1 {name=p30 sig_type=std_logic lab=VDD_3V3
}
C {gnd.sym} 2670 80 0 0 {name=l10 lab=GND
}
