v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 390 -380 390 -350 {
lab=#net1}
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
N 730 -320 730 -260 {
lab=Vin_m_5tota}
N 220 -260 730 -260 {
lab=Vin_m_5tota}
N 470 -440 570 -440 {
lab=#net1}
N 390 -380 470 -380 {
lab=#net1}
N 470 -440 470 -380 {
lab=#net1}
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
lab=#net1}
N 430 -440 470 -440 {
lab=#net1}
N 170 -440 190 -440 {lab=#net2}
N 130 -380 390 -380 {lab=#net1}
N 130 -410 130 -380 {lab=#net1}
N 130 -490 130 -470 {lab=#net3}
N 870 -440 940 -440 {lab=Vdd_3v3}
N 810 -440 830 -440 {lab=#net4}
N 50 -440 130 -440 {lab=Vdd_3v3}
N 870 -490 870 -470 {lab=#net5}
N 870 -410 870 -380 {lab=Vout_5tota}
N 610 -380 970 -380 {lab=Vout_5tota}
N 390 -160 390 -140 {lab=#net6}
N 330 -190 350 -190 {lab=#net7}
N 650 -190 670 -190 {lab=#net8}
N 610 -160 610 -140 {lab=#net9}
N 390 -190 440 -190 {lab=VSS}
N 560 -190 610 -190 {lab=VSS}
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
C {opin.sym} 970 -380 0 0 {name=p4 lab=Vout_5tota}
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
C {symbols/pfet_03v3.sym} 150 -440 0 1 {name=Mpmos_cs_p_dummy
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
C {lab_pin.sym} 940 -440 0 1 {name=p11 sig_type=std_logic lab=Vdd_3v3}
C {symbols/pfet_03v3.sym} 850 -440 0 0 {name=Mpmos_cs_n_dummy
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
C {lab_pin.sym} 50 -440 0 0 {name=p12 sig_type=std_logic lab=Vdd_3v3}
C {symbols/nfet_03v3.sym} 370 -190 0 0 {name=Mnmos_amp_p_dummy
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
C {symbols/nfet_03v3.sym} 630 -190 0 1 {name=Mnmos_amp_n_dummy
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
C {lab_pin.sym} 560 -190 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 440 -190 0 1 {name=p14 sig_type=std_logic lab=VSS}
