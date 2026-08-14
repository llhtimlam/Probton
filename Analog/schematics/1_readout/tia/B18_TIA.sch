v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 660 210 680 210 {
lab=Vout}
N 590 260 590 270 {lab=VSS}
N 470 250 510 250 {lab=#net1}
N 610 90 680 90 {lab=Vout}
N 470 90 550 90 {lab=#net1}
N 680 90 680 210 {lab=Vout}
N 470 90 470 250 {lab=#net1}
N 380 60 400 60 {lab=VDD}
N 380 320 400 320 {lab=VSS}
C {devices/lab_wire.sym} 570 150 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 570 270 2 1 {name=p9 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 590 270 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 580 110 2 1 {name=p31 sig_type=std_logic lab=VSS}
C {/workspace/Probton/Analog/schematics/1_readout/tia/B18_TIA_OTA.sym} 520 270 0 0 {name=x4}
C {iopin.sym} 380 60 0 1 {name=p1 lab=VDD}
C {iopin.sym} 380 320 0 1 {name=p4 lab=VSS}
C {ipin.sym} 510 170 0 0 {name=p3 lab=Vp}
C {ipin.sym} 510 210 0 0 {name=p5 lab=Ib}
C {opin.sym} 680 210 0 0 {name=p6 lab=Vout}
C {symbols/ppolyf_u_1k.sym} 580 90 3 0 {name=R1
W=1e-6
L=30e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
