v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -160 -410 70 -410 {lab=vdd}
N -50 -470 -50 -410 {lab=vdd}
N 70 -410 150 -410 {lab=vdd}
N 150 -410 150 -380 {lab=vdd}
N 70 -380 150 -380 {lab=vdd}
N -240 -410 -160 -410 {lab=vdd}
N -240 -410 -240 -380 {lab=vdd}
N -240 -380 -160 -380 {lab=vdd}
N -40 -30 -20 -30 {lab=0}
N -20 -30 -20 10 {lab=0}
N -40 10 -20 10 {lab=0}
N -40 0 -40 10 {lab=0}
N -40 10 -40 30 {lab=0}
N -40 20 -40 30 {lab=0}
N 70 -350 70 -240 {lab=vout}
N -160 -180 70 -180 {lab=#net1}
N -40 -180 -40 -60 {lab=#net1}
N -140 30 -40 30 {lab=0}
N -100 -30 -80 -30 {lab=vbias}
N -160 -210 -150 -210 {lab=0}
N -150 -210 -150 30 {lab=0}
N -150 30 -140 30 {lab=0}
N 60 -210 70 -210 {lab=0}
N 60 -210 60 30 {lab=0}
N -40 30 60 30 {lab=0}
N -120 -380 30 -380 {lab=#net2}
N -160 -350 -160 -240 {lab=#net2}
N -230 -210 -200 -210 {lab=vinp}
N 110 -210 150 -210 {lab=vinn}
N 70 -290 130 -290 {lab=vout}
N -160 -320 -90 -320 {lab=#net2}
N -90 -380 -90 -320 {lab=#net2}
N -260 -10 -230 -10 {lab=0}
N -230 -70 -100 -30 {lab=vbias}
N -420 -260 -360 -170 {lab=0}
N -360 -230 -230 -210 {lab=vinp}
N -130 -440 -80 -490 {lab=0}
N -130 -500 -50 -500 {lab=vdd}
N -50 -500 -50 -470 {lab=vdd}
N 130 -290 240 -290 {lab=vout}
N 240 -290 310 -290 {lab=vout}
N 240 -230 310 -230 {lab=vinn}
N 150 -210 240 -230 {lab=vinn}
N 110 -170 190 -170 {lab=vinn}
N 150 -210 150 -170 {lab=vinn}
N 110 -110 190 -110 {lab=0}
N 150 -110 150 -100 {lab=0}
N -40 30 -40 40 {lab=0}
C {symbols/pfet_03v3.sym} -140 -380 0 1 {name=M1
L=4u
W=9u
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
C {symbols/nfet_03v3.sym} -60 -30 0 0 {name=M3
W=6u
L=2u
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
C {symbols/pfet_03v3.sym} 50 -380 0 0 {name=M2
L=4u
W=9u
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
C {symbols/nfet_03v3.sym} -180 -210 0 0 {name=M4
L=1.5u
W=4.5u
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
C {symbols/nfet_03v3.sym} 90 -210 0 1 {name=M5
L=1.5u
W=4.5u
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
C {ipin.sym} -100 -30 0 0 {name=p3 lab=vbias}
C {iopin.sym} -50 -470 0 0 {name=p5 lab=vdd}
C {ipin.sym} -230 -210 0 0 {name=p1 lab=vinp}
C {ipin.sym} 150 -210 0 1 {name=p2 lab=vinn}
C {opin.sym} 130 -290 0 0 {name=p4 lab=vout}
C {vsource.sym} -130 -470 0 0 {name=V1 value=3.3 savecurrent=false}
C {vsource.sym} -230 -40 0 0 {name=V2 value=0.75 savecurrent=false}
C {vsource.sym} -360 -200 0 0 {name=V3 value="dc 1.65" savecurrent=false}
C {capa.sym} 310 -260 0 0 {name=C1
m=1
value=30pf
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 150 -100 0 0 {name=l2 lab=0}
C {gnd.sym} -80 -490 0 0 {name=l3 lab=0}
C {gnd.sym} -420 -260 0 0 {name=l4 lab=0}
C {gnd.sym} -260 -10 0 0 {name=l5 lab=0}
C {res.sym} 240 -260 0 0 {name=R1
value=13.3k
footprint=1206
device=resistor
m=1}
C {isource.sym} 110 -140 0 0 {name=I0 value="sine(0 50u 10Meg)"}
C {code_shown.sym} 200 -490 0 0 {name=s2 only_toplevel=false value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/smbb000149.ngspice typical 
.control
tran 0.1n 5us
plot v(vout)
.endc"}
C {capa.sym} 190 -140 0 0 {name=C2
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -40 40 0 0 {name=l1 lab=0}
