v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 260 -400 260 -360 {lab=VDD}
N 260 -400 520 -400 {lab=VDD}
N 410 -440 410 -400 {lab=VDD}
N 260 -120 260 -80 {lab=VSS}
N 260 -80 520 -80 {lab=VSS}
N 520 -120 520 -80 {lab=VSS}
N 400 -80 400 -40 {lab=VSS}
N 260 -300 260 -180 {lab=Vout1}
N 520 -300 520 -180 {lab=Vout2}
N 250 -330 260 -330 {lab=VDD}
N 250 -360 250 -330 {lab=VDD}
N 250 -360 260 -360 {lab=VDD}
N 260 -150 270 -150 {lab=VSS}
N 270 -150 270 -120 {lab=VSS}
N 260 -120 270 -120 {lab=VSS}
N 510 -150 520 -150 {lab=VSS}
N 510 -150 510 -120 {lab=VSS}
N 510 -120 520 -120 {lab=VSS}
N 520 -400 520 -360 {lab=VDD}
N 520 -360 530 -360 {lab=VDD}
N 530 -360 530 -330 {lab=VDD}
N 520 -330 530 -330 {lab=VDD}
N 300 -330 340 -330 {lab=Vout2}
N 340 -330 340 -280 {lab=Vout2}
N 340 -280 520 -280 {lab=Vout2}
N 440 -330 480 -330 {lab=Vout1}
N 260 -270 440 -270 {lab=Vout1}
N 440 -330 440 -270 {lab=Vout1}
N 200 -150 220 -150 {lab=Vin1}
N 560 -150 580 -150 {lab=Vin2}
N 520 -240 580 -240 {lab=Vout2}
N 200 -240 260 -240 {lab=Vout1}
C {symbols/nfet_03v3.sym} 240 -150 0 0 {name=M1
L=0.4u
W=1u
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
C {symbols/nfet_03v3.sym} 540 -150 0 1 {name=M2
L=0.4u
W=1u
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
C {symbols/pfet_03v3.sym} 280 -330 0 1 {name=M3
L=0.4u
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
C {symbols/pfet_03v3.sym} 500 -330 0 0 {name=M4
L=0.4u
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
C {iopin.sym} 410 -440 2 0 {name=p4 lab=VDD}
C {iopin.sym} 400 -40 2 0 {name=p5 lab=VSS}
C {iopin.sym} 200 -150 2 0 {name=p1 lab=Vin1}
C {iopin.sym} 580 -150 2 1 {name=p2 lab=Vin2}
C {iopin.sym} 200 -240 2 0 {name=p3 lab=Vout1}
C {iopin.sym} 580 -240 2 1 {name=p6 lab=Vout2}
