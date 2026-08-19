v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 350 -590 390 -590 {lab=clk}
N 390 -250 420 -250 {lab=d}
N 640 -680 670 -680 {lab=Qb}
N 640 -680 640 -630 {lab=Qb}
N 640 -630 860 -530 {lab=Qb}
N 860 -530 860 -480 {lab=Qb}
N 860 -700 860 -650 {lab=Q}
N 640 -550 860 -650 {lab=Q}
N 640 -550 640 -500 {lab=Q}
N 640 -500 670 -500 {lab=Q}
N 860 -480 920 -480 {lab=Qb}
N 860 -700 920 -700 {lab=Q}
N 390 -700 390 -460 {lab=clk}
N 410 -480 430 -480 {lab=#net1}
N 410 -540 410 -480 {lab=#net1}
N 410 -560 590 -640 {lab=#net1}
N 410 -560 410 -540 {lab=#net1}
N 590 -720 590 -640 {lab=#net1}
N 410 -790 590 -870 {lab=#net2}
N 410 -790 410 -740 {lab=#net2}
N 590 -920 590 -870 {lab=#net2}
N 590 -790 590 -720 {lab=#net1}
N 410 -850 590 -790 {lab=#net1}
N 410 -900 410 -850 {lab=#net1}
N 410 -900 430 -900 {lab=#net1}
N 390 -700 430 -700 {lab=clk}
N 390 -460 430 -460 {lab=clk}
N 290 -920 430 -920 {lab=#net3}
N 290 -440 430 -440 {lab=#net3}
N 410 -440 410 -390 {lab=#net3}
N 410 -390 570 -310 {lab=#net3}
N 570 -310 570 -270 {lab=#net3}
N 410 -290 420 -290 {lab=#net4}
N 410 -350 410 -290 {lab=#net4}
N 410 -350 570 -420 {lab=#net4}
N 570 -460 570 -420 {lab=#net4}
N 410 -740 430 -740 {lab=#net2}
N 790 -700 860 -700 {lab=Q}
N 790 -480 860 -480 {lab=Qb}
N 550 -920 590 -920 {lab=#net2}
N 540 -270 570 -270 {lab=#net3}
N 550 -720 590 -720 {lab=#net1}
N 590 -700 670 -700 {lab=#net1}
N 645 -720 670 -720 {lab=setb}
N 645 -1020 645 -720 {lab=setb}
N 385 -1020 645 -1020 {lab=setb}
N 385 -940 430 -940 {lab=setb}
N 270 -940 385 -940 {lab=setb}
N 265 -720 430 -720 {lab=resetb}
N 265 -720 265 -180 {lab=resetb}
N 250 -180 265 -180 {lab=resetb}
N 265 -270 420 -270 {lab=resetb}
N 645 -460 670 -460 {lab=resetb}
N 265 -180 645 -180 {lab=resetb}
N 290 -920 290 -440 {lab=#net3}
N 385 -1020 385 -940 {lab=setb}
N 645 -460 645 -180 {lab=resetb}
N 550 -460 605 -460 {lab=#net4}
N 605 -480 605 -460 {lab=#net4}
N 605 -480 670 -480 {lab=#net4}
C {lab_pin.sym} 470 -510 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 710 -530 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 710 -750 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 470 -770 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 470 -410 0 0 {name=p5 sig_type=std_logic lab=vss}
C {lab_pin.sym} 710 -430 0 0 {name=p6 sig_type=std_logic lab=vss}
C {lab_pin.sym} 710 -650 0 0 {name=p9 sig_type=std_logic lab=vss}
C {lab_pin.sym} 470 -670 0 0 {name=p10 sig_type=std_logic lab=vss}
C {iopin.sym} 740 -860 2 0 {name=p11 lab=vdd}
C {iopin.sym} 740 -830 2 0 {name=p12 lab=vss}
C {iopin.sym} 920 -700 2 1 {name=p13 lab=Q}
C {iopin.sym} 920 -480 2 1 {name=p14 lab=Qb}
C {iopin.sym} 390 -250 2 0 {name=p15 lab=d}
C {iopin.sym} 350 -590 2 0 {name=p16 lab=clk}
C {lab_pin.sym} 470 -970 0 0 {name=p17 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 470 -870 0 0 {name=p18 sig_type=std_logic lab=vss}
C {lab_pin.sym} 460 -320 0 0 {name=p19 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 460 -220 0 0 {name=p20 sig_type=std_logic lab=vss}
C {iopin.sym} 250 -180 2 0 {name=p7 lab=resetb}
C {iopin.sym} 270 -940 2 0 {name=p8 lab=setb}
C {Analog/schematics/1_readout/slopedetector/dffrs/nand3.sym} 290 -750 0 0 {name=x7}
C {Analog/schematics/1_readout/slopedetector/dffrs/nand3.sym} 290 -550 0 0 {name=x1}
C {Analog/schematics/1_readout/slopedetector/dffrs/nand3.sym} 290 -290 0 0 {name=x2}
C {Analog/schematics/1_readout/slopedetector/dffrs/nand3.sym} 280 -100 0 0 {name=x3}
C {Analog/schematics/1_readout/slopedetector/dffrs/nand3.sym} 530 -310 0 0 {name=x4}
C {Analog/schematics/1_readout/slopedetector/dffrs/nand3.sym} 530 -530 0 0 {name=x5}
