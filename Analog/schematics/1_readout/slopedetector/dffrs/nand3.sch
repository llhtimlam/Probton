v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 300 -350 390 -350 {lab=A}
N 300 -230 350 -230 {lab=B}
N 580 -420 640 -420 {lab=Z}
N 580 -540 580 -510 {lab=VDD}
N 430 -540 580 -540 {lab=VDD}
N 430 -540 430 -510 {lab=VDD}
N 430 -80 430 -50 {lab=VSS}
N 320 -30 430 -30 {lab=VSS}
N 430 -50 430 -30 {lab=VSS}
N 320 -540 430 -540 {lab=VDD}
N 430 -320 430 -260 {lab=#net1}
N 430 -450 430 -380 {lab=Z}
N 430 -420 580 -420 {lab=Z}
N 580 -450 580 -420 {lab=Z}
N 350 -230 390 -230 {lab=B}
N 540 -480 540 -440 {lab=A}
N 380 -440 540 -440 {lab=A}
N 380 -440 380 -350 {lab=A}
N 350 -480 350 -230 {lab=B}
N 350 -480 390 -480 {lab=B}
N 580 -540 740 -540 {lab=VDD}
N 740 -540 740 -510 {lab=VDD}
N 740 -450 740 -420 {lab=Z}
N 640 -420 740 -420 {lab=Z}
N 740 -420 820 -420 {lab=Z}
N 430 -200 430 -140 {lab=#net2}
N 300 -110 390 -110 {lab=C}
N 700 -480 700 -170 {lab=C}
N 350 -170 700 -170 {lab=C}
N 350 -170 350 -110 {lab=C}
C {lab_pin.sym} 430 -350 0 1 {name=l3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 430 -230 0 1 {name=l4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 430 -480 0 1 {name=l5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 580 -480 0 1 {name=l6 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 410 -350 0 0 {name=M1
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
C {symbols/nfet_03v3.sym} 410 -230 0 0 {name=M2
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
C {symbols/pfet_03v3.sym} 410 -480 0 0 {name=M3
L=0.4u
W=2.5u
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
C {symbols/pfet_03v3.sym} 560 -480 0 0 {name=M4
L=0.4u
W=2.5u
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
C {iopin.sym} 320 -540 2 0 {name=p4 lab=VDD}
C {iopin.sym} 320 -30 2 0 {name=p5 lab=VSS}
C {iopin.sym} 820 -420 2 1 {name=p2 lab=Z}
C {iopin.sym} 300 -350 2 0 {name=p1 lab=A}
C {iopin.sym} 300 -230 2 0 {name=p3 lab=B}
C {symbols/pfet_03v3.sym} 720 -480 0 0 {name=M5
L=0.4u
W=2.5u
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
C {lab_pin.sym} 740 -480 0 1 {name=l1 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 410 -110 0 0 {name=M6
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
C {iopin.sym} 300 -110 2 0 {name=p6 lab=C}
C {lab_pin.sym} 430 -110 0 1 {name=l2 sig_type=std_logic lab=VSS}
