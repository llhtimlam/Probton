v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 120 -290 240 -290 {
lab=vrf}
N 440 -470 530 -470 {
lab=vlo_b}
N 860 -470 930 -470 {
lab=vlo}
N 160 -380 480 -380 {lab=vlo_b}
N 480 -470 480 -380 {
lab=vlo_b}
N 240 -290 330 -290 {
lab=vrf}
N 290 -350 400 -350 {
lab=#net1}
N 290 -400 290 -350 {
lab=#net1}
N 610 -350 710 -350 {
lab=rf_diff_pair_neg_input}
N 710 -400 710 -350 {
lab=rf_diff_pair_neg_input}
N 120 -185 570 -185 {
lab=vrf_b}
N 710 -290 710 -200 {
lab=vrf_b}
N 670 -290 710 -290 {
lab=vrf_b}
N 110 -290 120 -290 {
lab=vrf}
N 110 -185 120 -185 {
lab=vrf_b}
N 180 -540 180 -530 {
lab=Vout_p}
N 800 -540 800 -530 {
lab=Vout_n}
N 800 -610 800 -540 {
lab=Vout_n}
N 180 -690 180 -540 {
lab=Vout_p}
N 800 -690 800 -610 {
lab=Vout_n}
N 420 -610 590 -530 {
lab=Vout_p}
N 550 -610 670 -610 {
lab=Vout_n}
N 380 -530 550 -610 {
lab=Vout_n}
N 610 -350 610 -320 {
lab=rf_diff_pair_neg_input}
N 630 -440 710 -440 {
lab=rf_diff_pair_neg_input}
N 590 -530 590 -500 {
lab=Vout_p}
N 800 -530 800 -500 {
lab=Vout_n}
N 380 -530 380 -500 {
lab=Vout_n}
N 180 -530 180 -500 {
lab=Vout_p}
N 420 -470 440 -470 {
lab=vlo_b}
N 530 -470 550 -470 {
lab=vlo_b}
N 840 -470 860 -470 {
lab=vlo}
N 710 -440 710 -400 {
lab=rf_diff_pair_neg_input}
N 250 -440 330 -440 {
lab=#net1}
N 290 -440 290 -400 {
lab=#net1}
N 400 -350 400 -320 {
lab=#net1}
N 330 -290 350 -290 {
lab=vrf}
N 650 -290 670 -290 {
lab=vrf_b}
N 490 -290 570 -290 {
lab=VSS}
N 180 -470 380 -470 {
lab=VSS}
N 630 -470 710 -470 {
lab=VSS}
N 710 -200 710 -185 {
lab=vrf_b}
N 400 -260 400 -110 {
lab=Ibias_p_50uA}
N 610 -260 610 -110 {
lab=Ibias_n_50uA}
N 330 -440 380 -440 {lab=#net1}
N 180 -440 250 -440 {lab=#net1}
N 180 -610 340 -610 {lab=Vout_p}
N 340 -610 420 -610 {lab=Vout_p}
N 710 -440 800 -440 {lab=rf_diff_pair_neg_input}
N 590 -440 630 -440 {lab=rf_diff_pair_neg_input}
N 710 -470 800 -470 {lab=VSS}
N 590 -470 630 -470 {lab=VSS}
N 670 -610 800 -610 {lab=Vout_n}
N 110 -470 140 -470 {lab=vlo}
N 110 -380 160 -380 {lab=vlo_b}
N 350 -290 360 -290 {lab=vrf}
N 570 -290 610 -290 {lab=VSS}
N 400 -290 490 -290 {lab=VSS}
N 570 -185 710 -185 {lab=vrf_b}
N 200 -830 360 -830 {lab=VSS
}
N 500 -830 500 -810 {lab=VSS
}
N 180 -930 180 -860 {lab=VDD_3v3
}
N 800 -930 800 -860 {lab=VDD_3v3
}
N 180 -930 380 -930 {lab=VDD_3v3
}
N 500 -950 500 -930 {lab=VDD_3v3
}
N 800 -800 800 -690 {lab=Vout_n}
N 180 -800 180 -690 {lab=Vout_p}
N 380 -930 800 -930 {lab=VDD_3v3}
N 360 -830 780 -830 {lab=VSS}
N 800 -720 840 -720 {lab=Vout_n}
N 180 -720 240 -720 {lab=Vout_p}
C {ipin.sym} 110 -470 0 0 {name=p1 lab=vlo}
C {ipin.sym} 110 -380 0 0 {name=p2 lab=vlo_b
}
C {ipin.sym} 110 -290 0 0 {name=p3 lab=vrf}
C {ipin.sym} 110 -185 2 1 {name=p4 lab=vrf_b
}
C {opin.sym} 240 -720 0 0 {name=p5 lab=Vout_p}
C {opin.sym} 840 -720 0 0 {name=p7 lab=Vout_n}
C {lab_wire.sym} 930 -470 0 1 {name=p6 sig_type=std_logic lab=vlo}
C {symbols/nfet_03v3.sym} 160 -470 0 0 {name=M_dp_lo_pos
L=0.28u
W=20u
nf=5
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
C {symbols/nfet_03v3.sym} 400 -470 0 1 {name=M_dp_lo_neg
L=0.28u
W=20u
nf=5
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
C {symbols/nfet_03v3.sym} 570 -470 0 0 {name=M_dp_lo_b_pos
L=0.28u
W=20u
nf=5
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
C {symbols/nfet_03v3.sym} 820 -470 0 1 {name=M_dp_lo_b_neg
L=0.28u
W=20u
nf=5
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
C {symbols/nfet_03v3.sym} 380 -290 0 0 {name=M_rf_pos
L=0.28u
W=10u
nf=5
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
C {symbols/nfet_03v3.sym} 630 -290 0 1 {name=M_rf_neg
L=0.28u
W=10u
nf=5
m=1
hide_texts=false
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {lab_wire.sym} 530 -290 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 280 -470 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 700 -470 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {iopin.sym} 610 -110 1 0 {name=p8 lab=Ibias_n_50uA}
C {iopin.sym} 400 -110 1 0 {name=p9 lab=Ibias_p_50uA}
C {iopin.sym} 200 -90 2 0 {name=p11 lab=VSS}
C {lab_wire.sym} 710 -370 0 0 {name=p15 sig_type=std_logic lab=rf_diff_pair_neg_input hide_texts=true
}
C {iopin.sym} 200 -50 2 0 {name=p16 lab=VDD_3v3}
C {symbols/ppolyf_u_1k.sym} 180 -830 0 1 {name=R_load_2
W=1e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1
}
C {symbols/ppolyf_u_1k.sym} 800 -830 0 0 {name=R_load_1
W=1e-6
L=20e-6
model=ppolyf_u_1k
spiceprefix=X
m=1
}
C {lab_wire.sym} 500 -810 3 0 {name=p17 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 500 -950 0 0 {name=p10 sig_type=std_logic lab=VDD_3v3
}
