v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 350 -430 350 -350 {
lab=#net1}
N 390 -460 470 -460 {
lab=#net1}
N 410 -460 410 -410 {
lab=#net1}
N 350 -410 410 -410 {
lab=#net1}
N 550 -430 550 -350 {
lab=Vout}
N 350 -290 350 -260 {
lab=#net2}
N 350 -260 430 -260 {
lab=#net2}
N 450 -260 450 -230 {
lab=#net2}
N 430 -260 510 -260 {
lab=#net2}
N 550 -290 550 -260 {
lab=#net2}
N 290 -200 390 -200 {
lab=Ib}
N 250 -250 310 -250 {
lab=Ib}
N 310 -250 310 -200 {
lab=Ib}
N 250 -170 250 -150 {
lab=VSS}
N 450 -170 450 -150 {
lab=VSS}
N 350 -510 350 -490 {
lab=VDD}
N 550 -510 550 -490 {
lab=VDD}
N 230 -80 510 -80 {
lab=VSS}
N 250 -150 250 -130 {
lab=VSS}
N 450 -150 450 -130 {
lab=VSS}
N 230 -530 510 -530 {
lab=VDD}
N 550 -530 550 -510 {
lab=VDD}
N 350 -530 350 -510 {
lab=VDD}
N 250 -270 250 -230 {
lab=Ib}
N 350 -320 360 -320 {
lab=VSS}
N 550 -460 560 -460 {
lab=VDD}
N 340 -460 350 -460 {
lab=VDD}
N 540 -320 550 -320 {
lab=VSS}
N 450 -200 460 -200 {
lab=VSS}
N 240 -200 250 -200 {
lab=VSS}
N 550 -390 580 -390 {
lab=Vout}
N 360 -110 360 -80 {lab=VSS}
N 360 -200 360 -170 {lab=Ib}
N 250 -130 250 -80 {lab=VSS}
N 450 -130 450 -80 {lab=VSS}
N 450 -200 460 -200 {lab=VSS}
N 360 -140 370 -140 {lab=VSS}
N 510 -530 550 -530 {lab=VDD}
N 510 -260 550 -260 {lab=#net2}
N 470 -460 510 -460 {lab=#net1}
N 510 -80 550 -80 {lab=VSS}
N 390 -200 410 -200 {lab=Ib}
C {devices/ipin.sym} 310 -320 0 0 {name=p1 lab=Vp}
C {devices/ipin.sym} 590 -320 0 1 {name=p2 lab=Vn}
C {devices/opin.sym} 580 -390 0 0 {name=p3 lab=Vout
}
C {devices/iopin.sym} 230 -530 0 1 {name=p4 lab=VDD}
C {devices/iopin.sym} 240 -80 2 0 {name=p5 lab=VSS}
C {devices/ipin.sym} 250 -270 1 0 {name=p6 lab=Ib}
C {devices/lab_wire.sym} 360 -320 0 1 {name=p7 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 560 -460 0 1 {name=p9 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 340 -460 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 540 -320 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 460 -200 0 1 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 240 -200 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {symbols/pfet_03v3.sym} 530 -460 0 0 {name=MP_MIR_NEG
L=0.7u
W=1.62u
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
C {symbols/pfet_03v3.sym} 370 -460 0 1 {name=MP_MIR_POS
L=0.7u
W=1.62u
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
C {symbols/nfet_03v3.sym} 330 -320 0 0 {name=MN_IN_POS
L=0.7u
W=0.42u
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
C {symbols/nfet_03v3.sym} 570 -320 0 1 {name=MN_IN_NEG
L=0.7u
W=0.42u
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
C {symbols/nfet_03v3.sym} 430 -200 0 0 {name=MN_TAIL
L=0.7u
W=0.83u
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
C {symbols/nfet_03v3.sym} 270 -200 0 1 {name=MN_TAILMIR
L=0.7u
W=0.83u
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
C {symbols/nfet_03v3.sym} 340 -140 0 0 {name=MN_SWITCH
L=0.5u
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
C {devices/ipin.sym} 320 -140 0 0 {name=p20 lab=en_b}
C {devices/lab_wire.sym} 370 -140 0 1 {name=p21 sig_type=std_logic lab=VSS}
