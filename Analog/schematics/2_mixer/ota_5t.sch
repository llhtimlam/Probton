v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {DUMMIES} 1150 -600 0 0 0.4 0.4 {}
T {5T OTA} 460 -610 0 0 0.4 0.4 {}
N 390 -380 390 -350 {
lab=Vmirror}
N 610 -380 610 -350 {
lab=Vout_5tota}
N 650 -320 730 -320 {
lab=Vin_m_5tota}
N 390 -530 390 -470 {
lab=Vdd_3v3}
N 610 -530 610 -470 {
lab=Vdd_3v3}
N 390 -530 610 -530 {
lab=Vdd_3v3}
N 210 -530 390 -530 {
lab=Vdd_3v3}
N 390 -290 390 -220 {
lab=Ibias_30uA_nmos}
N 610 -290 610 -220 {
lab=Ibias_30uA_nmos}
N 500 -220 610 -220 {
lab=Ibias_30uA_nmos}
N 500 -220 500 -140 {
lab=Ibias_30uA_nmos}
N 610 -380 730 -380 {
lab=Vout_5tota}
N 730 -320 730 -260 {
lab=Vin_m_5tota}
N 220 -260 730 -260 {
lab=Vin_m_5tota}
N 470 -440 570 -440 {
lab=Vmirror}
N 390 -380 470 -380 {
lab=Vmirror}
N 470 -440 470 -380 {
lab=Vmirror}
N 610 -440 640 -440 {
lab=Vdd_3v3}
N 580 -320 610 -320 {
lab=VSS}
N 390 -320 420 -320 {
lab=VSS}
N 360 -440 390 -440 {
lab=Vdd_3v3}
N 220 -320 350 -320 {
lab=Vin_p_5tota}
N 390 -220 500 -220 {
lab=Ibias_30uA_nmos}
N 610 -410 610 -380 {
lab=Vout_5tota}
N 390 -410 390 -380 {
lab=Vmirror}
N 430 -440 470 -440 {
lab=Vmirror}
N 1050 -290 1080 -290 {lab=VSS}
N 1120 -260 1120 -220 {lab=VSS}
N 1120 -290 1150 -290 {lab=VSS}
N 1150 -290 1150 -250 {lab=VSS}
N 1120 -250 1150 -250 {lab=VSS}
N 1120 -340 1120 -320 {lab=Vmirror}
N 1370 -340 1370 -320 {lab=Vout_5tota}
N 1310 -290 1330 -290 {lab=VSS}
N 1370 -290 1400 -290 {lab=VSS}
N 1400 -290 1400 -250 {lab=VSS}
N 1370 -250 1400 -250 {lab=VSS}
N 1370 -260 1370 -220 {lab=VSS}
N 1120 -440 1120 -420 {lab=Vmirror}
N 1370 -440 1370 -420 {lab=Vout_5tota}
N 1370 -470 1400 -470 {lab=Vdd_3v3}
N 1400 -510 1400 -470 {lab=Vdd_3v3}
N 1370 -510 1400 -510 {lab=Vdd_3v3}
N 1370 -530 1370 -500 {lab=Vdd_3v3}
N 1300 -470 1330 -470 {lab=Vdd_3v3}
N 1120 -470 1150 -470 {lab=Vdd_3v3}
N 1150 -510 1150 -470 {lab=Vdd_3v3}
N 1120 -510 1150 -510 {lab=Vdd_3v3}
N 1120 -530 1120 -500 {lab=Vdd_3v3}
N 1050 -470 1080 -470 {lab=Vdd_3v3}
C {symbols/nfet_03v3.sym} 370 -320 0 0 {name=Mnmos_amp_p
L=0.28u
W=6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 630 -320 0 1 {name=Mnmos_amp_n
L=0.28u
W=6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {ipin.sym} 210 -530 0 0 {name=p1 lab=Vdd_3v3}
C {ipin.sym} 220 -320 0 0 {name=p2 lab=Vin_p_5tota
}
C {ipin.sym} 220 -260 0 0 {name=p3 lab=Vin_m_5tota
}
C {opin.sym} 730 -380 0 0 {name=p4 lab=Vout_5tota}
C {iopin.sym} 500 -140 1 0 {name=p5 lab=Ibias_30uA_nmos}
C {symbols/pfet_03v3.sym} 410 -440 0 1 {name=Mpmos_cs_p
L=0.28u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 590 -440 0 0 {name=Mpmos_cs_n
L=0.28u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 360 -440 0 0 {name=p6 sig_type=std_logic lab=Vdd_3v3}
C {ipin.sym} 220 -140 0 0 {name=p7 lab=VSS}
C {lab_pin.sym} 580 -320 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 420 -320 0 1 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 640 -440 0 1 {name=p10 sig_type=std_logic lab=Vdd_3v3}
C {symbols/pfet_03v3.sym} 1100 -470 0 0 {name=M1
L=0.28u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 1350 -470 0 0 {name=M2
L=0.28u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 1100 -290 0 0 {name=M3
L=0.28u
W=6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 1350 -290 0 0 {name=M4
L=0.28u
W=6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 1120 -530 0 0 {name=p11 sig_type=std_logic lab=Vdd_3v3}
C {lab_pin.sym} 1050 -470 0 0 {name=p12 sig_type=std_logic lab=Vdd_3v3}
C {lab_pin.sym} 1300 -470 0 0 {name=p13 sig_type=std_logic lab=Vdd_3v3}
C {lab_pin.sym} 1370 -530 0 0 {name=p14 sig_type=std_logic lab=Vdd_3v3}
C {lab_pin.sym} 1120 -420 0 0 {name=p15 sig_type=std_logic lab=Vmirror}
C {lab_pin.sym} 1370 -420 0 0 {name=p16 sig_type=std_logic lab=Vout_5tota}
C {lab_pin.sym} 1120 -340 0 0 {name=p17 sig_type=std_logic lab=Vmirror}
C {lab_pin.sym} 1370 -340 0 0 {name=p18 sig_type=std_logic lab=Vout_5tota}
C {lab_pin.sym} 1050 -290 0 0 {name=p19 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1310 -290 0 0 {name=p20 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1120 -220 0 0 {name=p21 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1370 -220 0 0 {name=p22 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 390 -390 0 0 {name=p23 sig_type=std_logic lab=Vmirror}
