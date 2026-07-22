v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -150 -230 -40 -230 {lab=in_p}
N 210 -250 250 -250 {lab=#net1}
N 150 -390 250 -390 {lab=#net1}
N 140 -390 150 -390 {lab=#net1}
N -90 -270 -40 -270 {lab=in_n}
N 110 -390 140 -390 {lab=#net1}
N -90 -390 50 -390 {lab=in_n}
N -90 -490 50 -490 {lab=in_n}
N -90 -490 -90 -390 {lab=in_n}
N -90 -390 -90 -270 {lab=in_n}
N 110 -490 250 -490 {lab=#net1}
N 630 -290 680 -290 {lab=#net2}
N 250 -250 280 -250 {lab=#net1}
N 630 -440 630 -290 {lab=#net2}
N 400 -250 440 -250 {lab=#net3}
N 440 -230 440 -220 {lab=#net3}
N 440 -250 440 -230 {lab=#net3}
N 440 -250 520 -250 {lab=#net3}
N 520 -250 520 -230 {lab=#net3}
N 520 -170 520 -140 {lab=vss}
N 440 -140 520 -140 {lab=vss}
N 440 -160 440 -140 {lab=vss}
N 250 -250 250 -90 {lab=#net1}
N 250 -90 960 -90 {lab=#net1}
N 960 -140 960 -90 {lab=#net1}
N 960 -170 960 -140 {lab=#net1}
N 250 -490 250 -250 {lab=#net1}
N 480 -140 480 -30 {lab=vss}
N 520 -250 680 -250 {lab=#net3}
N 930 -270 1050 -270 {lab=out}
N 960 -270 960 -230 {lab=out}
N 960 -440 960 -270 {lab=out}
N 820 -440 960 -440 {lab=out}
N 630 -440 760 -440 {lab=#net2}
N 630 -290 630 -70 {lab=#net2}
N 630 -10 630 20 {lab=vss}
N 650 -190 680 -190 {lab=i_bias}
N 650 -170 680 -170 {lab=vdd}
N 650 -150 680 -150 {lab=vss}
N -80 -170 -40 -170 {lab=i_bias}
N -80 -150 -40 -150 {lab=vdd}
N -80 -130 -40 -130 {lab=vss}
N -150 -270 -90 -270 {lab=in_n}
C {core_analog/ota_5t/ota_5t.sym} -20 -340 0 0 {name=x1}
C {symbols/cap_pmos_03v3.sym} 80 -490 3 0 {name=C1
W=1e-12
L=1e-12
model=cap_pmos_03v3
spiceprefix=X
m=1}
C {symbols/rm1.sym} 80 -390 3 0 {name=R1
W=0.6e-6
L=0.6e-6
model=rm1
spiceprefix=X
m=1}
C {core_analog/ota_5t/ota_5t.sym} 700 -360 0 0 {name=x2}
C {symbols/rm1.sym} 310 -250 3 0 {name=R2
W=0.6e-6
L=0.6e-6
model=rm1
spiceprefix=X
m=1}
C {symbols/rm1.sym} 790 -440 3 0 {name=R3
W=0.6e-6
L=0.6e-6
model=rm1
spiceprefix=X
m=1}
C {symbols/rm1.sym} 630 -40 0 0 {name=R4
W=0.6e-6
L=0.6e-6
model=rm1
spiceprefix=X
m=1}
C {symbols/cap_pmos_03v3.sym} 440 -190 2 0 {name=C2
W=1e-12
L=1e-12
model=cap_pmos_03v3
spiceprefix=X
m=1}
C {symbols/rm1.sym} 520 -200 0 0 {name=R5
W=0.6e-6
L=0.6e-6
model=rm1
spiceprefix=X
m=1}
C {symbols/cap_pmos_03v3.sym} 370 -250 3 0 {name=C3
W=1e-12
L=1e-12
model=cap_pmos_03v3
spiceprefix=X
m=1}
C {symbols/rm1.sym} 960 -200 0 0 {name=R6
W=0.6e-6
L=0.6e-6
model=rm1
spiceprefix=X
m=1}
C {lab_wire.sym} -70 -230 0 0 {name=p1 sig_type=std_logic lab=in_p
}
C {lab_wire.sym} -60 -170 0 0 {name=p2 sig_type=std_logic lab=i_bias}
C {lab_wire.sym} -60 -150 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -60 -130 0 0 {name=p4 sig_type=std_logic lab=vss}
C {lab_wire.sym} 660 -190 0 0 {name=p5 sig_type=std_logic lab=i_bias}
C {lab_wire.sym} 660 -170 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {lab_wire.sym} 660 -150 0 0 {name=p7 sig_type=std_logic lab=vss}
C {lab_wire.sym} 1020 -270 0 0 {name=p8 sig_type=std_logic lab=out}
C {lab_wire.sym} -120 -270 0 0 {name=p9 sig_type=std_logic lab=in_n}
C {lab_wire.sym} 480 -50 0 0 {name=p10 sig_type=std_logic lab=vss}
C {lab_wire.sym} 630 10 0 0 {name=p11 sig_type=std_logic lab=vss}
