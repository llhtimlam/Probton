v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Simple CMOS Inverter} 270 -630 0 0 0.4 0.4 {}
T {A} 55 -74 0 0 0.2 0.2 {}
T {Y} 145 -64 0 1 0.2 0.2 {}
T {VDD} 94 -115 1 0 0.2 0.2 {}
T {VSS} 66 -25 3 0 0.2 0.2 {}
T {DUMMIES} 740 -590 0 0 0.4 0.4 {}
N 270 -430 330 -430 {lab=vi}
N 270 -430 270 -270 {lab=vi}
N 270 -270 330 -270 {lab=vi}
N 240 -350 270 -350 {lab=vi}
N 370 -400 370 -300 {lab=vo}
N 370 -350 490 -350 {lab=vo}
N 370 -520 370 -460 {lab=vdd}
N 370 -430 400 -430 {lab=vdd}
N 400 -490 400 -430 {lab=vdd}
N 370 -490 400 -490 {lab=vdd}
N 370 -240 370 -200 {lab=vss}
N 370 -270 400 -270 {lab=vss}
N 400 -270 400 -210 {lab=vss}
N 370 -210 400 -210 {lab=vss}
N 710 -490 710 -460 {lab=vdd}
N 710 -430 740 -430 {lab=vdd}
N 740 -470 740 -430 {lab=vdd}
N 710 -470 740 -470 {lab=vdd}
N 850 -430 910 -430 {lab=vdd}
N 850 -400 850 -370 {lab=vo}
N 710 -220 710 -190 {lab=vss}
N 710 -250 740 -250 {lab=vss}
N 740 -250 740 -210 {lab=vss}
N 710 -210 740 -210 {lab=vss}
N 850 -310 850 -280 {lab=vo}
N 850 -250 910 -250 {lab=vss}
N 650 -430 670 -430 {lab=vdd}
N 790 -430 810 -430 {lab=vdd}
N 650 -250 670 -250 {lab=vss}
N 790 -250 810 -250 {lab=vss}
N 710 -300 710 -280 {lab=vss}
N 850 -220 850 -200 {lab=vss}
N 850 -480 850 -460 {lab=vdd}
N 710 -400 710 -380 {lab=vdd}
C {devices/title.sym} 170 -50 0 0 {name=l1 author="M. Koefinger"}
C {symbols/nfet_03v3.sym} 350 -270 0 0 {name=M1
L=0.28u
W=0.4u
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
C {symbols/pfet_03v3.sym} 350 -430 0 0 {name=M2
L=0.28u
W=1u
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
C {devices/iopin.sym} 370 -520 3 0 {name=p1 lab=vdd}
C {devices/iopin.sym} 370 -200 1 0 {name=p2 lab=vss}
C {devices/ipin.sym} 240 -350 0 0 {name=p3 lab=vi}
C {devices/opin.sym} 490 -350 0 0 {name=p4 lab=vo}
C {symbols/pfet_03v3.sym} 690 -430 0 0 {name=M3
L=0.28u
W=1u
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
C {symbols/pfet_03v3.sym} 830 -430 0 0 {name=M4
L=0.28u
W=1u
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
C {lab_pin.sym} 710 -490 0 0 {name=p9 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 910 -430 0 1 {name=p5 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 850 -370 0 0 {name=p6 sig_type=std_logic lab=vo}
C {symbols/nfet_03v3.sym} 690 -250 0 0 {name=M5
L=0.28u
W=0.4u
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
C {symbols/nfet_03v3.sym} 830 -250 0 0 {name=M6
L=0.28u
W=0.4u
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
C {lab_pin.sym} 710 -190 0 0 {name=p7 sig_type=std_logic lab=vss}
C {lab_pin.sym} 850 -310 0 0 {name=p8 sig_type=std_logic lab=vo}
C {lab_pin.sym} 910 -250 0 1 {name=p10 sig_type=std_logic lab=vss}
C {lab_pin.sym} 650 -430 0 0 {name=p11 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 790 -430 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 650 -250 0 0 {name=p13 sig_type=std_logic lab=vss}
C {lab_pin.sym} 790 -250 0 0 {name=p14 sig_type=std_logic lab=vss}
C {lab_pin.sym} 710 -380 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 850 -480 0 0 {name=p16 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 710 -300 0 0 {name=p17 sig_type=std_logic lab=vss}
C {lab_pin.sym} 850 -200 0 0 {name=p18 sig_type=std_logic lab=vss}
