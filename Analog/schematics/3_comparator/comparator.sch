v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 110 -270 130 -270 {lab=IN_P}
N 110 -240 130 -240 {lab=Clk}
N 70 -210 90 -210 {lab=IN_N}
N 360 -230 380 -230 {lab=OUT2}
N 360 -250 380 -250 {lab=OUT1}
N 380 -230 400 -230 {lab=OUT2}
N 380 -250 400 -250 {lab=OUT1}
N 430 -340 480 -340 {lab=OUT1}
N 430 -340 430 -250 {lab=OUT1}
N 400 -250 430 -250 {lab=OUT1}
N 430 -150 480 -150 {lab=OUT2}
N 430 -230 430 -150 {lab=OUT2}
N 400 -230 430 -230 {lab=OUT2}
N 630 -340 650 -340 {lab=INV1}
N 630 -150 650 -150 {lab=INV2}
N 560 -240 560 -230 {lab=VDD_3V3}
N 560 -260 560 -250 {lab=VSS}
N 540 -440 560 -440 {lab=VDD_3V3}
N 560 -440 560 -420 {lab=VDD_3V3}
N 540 -240 560 -240 {lab=VDD_3V3}
N 660 -340 710 -340 {lab=INV1}
N 720 -340 720 -250 {lab=INV1}
N 840 -360 840 -310 {lab=VDD_3V3}
N 840 -170 840 -120 {lab=VSS}
N 960 -250 1050 -250 {lab=VOUT1}
N 960 -230 1020 -230 {lab=VOUT2}
N 710 -340 720 -340 {lab=INV1}
N 720 -230 720 -150 {lab=INV2}
N 690 -150 720 -150 {lab=INV2}
N 1520 -230 1580 -230 {lab=Comp_Out}
N 650 -150 690 -150 {lab=INV2}
N 650 -340 660 -340 {lab=INV1}
N 720 -250 780 -250 {lab=INV1}
N 720 -230 780 -230 {lab=INV2}
N 1440 -230 1460 -230 {lab=Comp_Out}
N 1350 -330 1370 -330 {lab=VDD_3V3}
N 1370 -330 1370 -310 {lab=VDD_3V3}
N 1470 -230 1520 -230 {lab=Comp_Out}
N 1460 -230 1470 -230 {lab=Comp_Out}
N 90 -210 130 -210 {lab=IN_N}
N 70 -270 110 -270 {lab=IN_P}
N 1270 -230 1290 -230 {lab=#net1}
N 1180 -330 1200 -330 {lab=VDD_3V3}
N 1200 -330 1200 -310 {lab=VDD_3V3}
N 1020 -230 1120 -230 {lab=VOUT2}
N -130 -310 -110 -310 {lab=Clk}
N -130 -270 -110 -270 {lab=VDD_3V3}
N -130 -230 -110 -230 {lab=VSS}
N -130 -190 -110 -190 {lab=IN_P}
N -130 -150 -110 -150 {lab=IN_N}
N 190 -180 190 -140 {lab=VSS}
N 560 -70 560 -30 {lab=VSS}
N 1200 -150 1200 -110 {lab=VSS}
N 1370 -150 1370 -110 {lab=VSS}
N -170 -100 -150 -100 {lab=Comp_Out}
C {lab_pin.sym} 70 -210 0 0 {name=p1 sig_type=std_logic lab=IN_N}
C {lab_pin.sym} 70 -270 0 0 {name=p2 sig_type=std_logic lab=IN_P}
C {lab_pin.sym} 110 -240 0 0 {name=p3 sig_type=std_logic lab=Clk}
C {lab_pin.sym} 190 -300 0 0 {name=p13 sig_type=std_logic lab=VDD_3V3}
C {lab_pin.sym} 720 -340 3 1 {name=p14 sig_type=std_logic lab=INV1}
C {lab_pin.sym} 720 -150 1 1 {name=p15 sig_type=std_logic lab=INV2}
C {lab_pin.sym} 540 -240 0 0 {name=p5 sig_type=std_logic lab=VDD_3V3}
C {lab_pin.sym} 540 -440 0 0 {name=p9 sig_type=std_logic lab=VDD_3V3}
C {lab_pin.sym} 430 -280 2 1 {name=p16 sig_type=std_logic lab=OUT1
}
C {lab_pin.sym} 430 -200 2 1 {name=p17 sig_type=std_logic lab=OUT2}
C {lab_pin.sym} 840 -360 0 0 {name=p6 sig_type=std_logic lab=VDD_3V3}
C {lab_pin.sym} 1000 -250 3 1 {name=p12 sig_type=std_logic lab=VOUT1}
C {lab_pin.sym} 1000 -230 1 1 {name=p18 sig_type=std_logic lab=VOUT2}
C {lab_pin.sym} 1580 -230 0 1 {name=p19 sig_type=std_logic lab=Comp_Out}
C {lab_pin.sym} 1350 -330 0 0 {name=p22 sig_type=std_logic lab=VDD_3V3}
C {noconn.sym} 1050 -250 2 0 {name=l15}
C {Analog/schematics/3_comparator/strongArmLatch.sym} 270 -250 0 0 {name=x1}
C {Analog/schematics/3_comparator/inv.sym} 480 -420 0 0 {name=xinv1}
C {Analog/schematics/3_comparator/inv.sym} 480 -230 0 0 {name=xinv2}
C {Analog/schematics/3_comparator/rslatch.sym} 880 -230 0 0 {name=x2}
C {Analog/schematics/3_comparator/inv.sym} 1120 -310 0 0 {name=xinv3}
C {Analog/schematics/3_comparator/inv.sym} 1290 -310 0 0 {name=xinv4}
C {lab_pin.sym} 1180 -330 0 0 {name=p11 sig_type=std_logic lab=VDD_3V3}
C {ipin.sym} -130 -310 0 0 {name=p4 lab=Clk}
C {iopin.sym} -130 -270 2 0 {name=p7 lab=VDD_3V3}
C {iopin.sym} -130 -230 2 0 {name=p8 lab=VSS}
C {ipin.sym} -130 -190 0 0 {name=p10 lab=IN_P}
C {ipin.sym} -130 -150 0 0 {name=p20 lab=IN_N}
C {lab_pin.sym} 190 -140 0 0 {name=p21 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 560 -250 0 1 {name=p23 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 560 -30 0 0 {name=p24 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 840 -120 0 0 {name=p25 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1200 -110 0 0 {name=p26 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1370 -110 0 0 {name=p27 sig_type=std_logic lab=VSS}
C {opin.sym} -150 -100 0 0 {name=p28 lab=Comp_Out}
