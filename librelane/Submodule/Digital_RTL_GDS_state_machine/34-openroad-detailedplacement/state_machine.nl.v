module state_machine (boot_complete,
    cal_done,
    cal_start,
    cal_timeout,
    cfg_done,
    clk,
    phase_offset_imported,
    read_en,
    rst_n,
    soft_rst,
    state_o);
 input boot_complete;
 input cal_done;
 output cal_start;
 input cal_timeout;
 input cfg_done;
 input clk;
 input phase_offset_imported;
 output read_en;
 input rst_n;
 input soft_rst;
 output [2:0] state_o;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire net1;
 wire net2;
 wire net8;
 wire net3;
 wire net4;
 wire net5;
 wire net9;
 wire net6;
 wire net7;
 wire net10;
 wire net11;
 wire net12;
 wire net13;

 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Left_10 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Right_0 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Left_11 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Right_1 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Left_12 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Right_2 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Left_13 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Right_3 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Left_14 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Right_4 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Left_15 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Right_5 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Left_16 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Right_6 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Left_17 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Right_7 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Left_18 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Right_8 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Left_19 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Right_9 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_20 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_21 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_22 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_23 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_24 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_25 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_26 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_27 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_28 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_29 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_30 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_31 ();
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _18_ (.I(net7),
    .ZN(_03_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _19_ (.I(net11),
    .ZN(_04_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _20_ (.I(net4),
    .ZN(_05_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_2 _21_ (.A1(net10),
    .A2(_04_),
    .A3(net12),
    .ZN(net8));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _22_ (.A1(net11),
    .A2(net12),
    .Z(_06_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _23_ (.A1(net11),
    .A2(net12),
    .ZN(_07_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _24_ (.A1(net10),
    .A2(_06_),
    .A3(_07_),
    .ZN(net9));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _25_ (.A1(net3),
    .A2(net2),
    .ZN(_08_));
 gf180mcu_fd_sc_mcu7t5v0__or4_1 _26_ (.A1(net10),
    .A2(_04_),
    .A3(net12),
    .A4(_08_),
    .Z(_09_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _27_ (.A1(net10),
    .A2(net1),
    .B(_07_),
    .ZN(_10_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _28_ (.A1(net10),
    .A2(_07_),
    .Z(_11_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_2 _29_ (.A1(_09_),
    .A2(_10_),
    .B1(_11_),
    .B2(_05_),
    .ZN(_12_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _30_ (.A1(net10),
    .A2(net13),
    .B(_03_),
    .ZN(_13_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _31_ (.A1(net10),
    .A2(net13),
    .B(_13_),
    .ZN(_00_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _32_ (.A1(net11),
    .A2(net13),
    .ZN(_14_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _33_ (.A1(net5),
    .A2(_11_),
    .ZN(_15_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _34_ (.A1(net8),
    .A2(_11_),
    .B(_15_),
    .ZN(_16_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _35_ (.A1(net13),
    .A2(_16_),
    .B(_14_),
    .C(net7),
    .ZN(_01_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _36_ (.A1(net12),
    .A2(net13),
    .ZN(_17_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _37_ (.A1(_12_),
    .A2(_15_),
    .B(_17_),
    .C(net7),
    .ZN(_02_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _38_ (.D(_00_),
    .RN(net6),
    .CLK(clk),
    .Q(net10));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _39_ (.D(_01_),
    .RN(net6),
    .CLK(clk),
    .Q(net11));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _40_ (.D(_02_),
    .RN(net6),
    .CLK(clk),
    .Q(net12));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input1 (.I(boot_complete),
    .Z(net1));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input2 (.I(cal_done),
    .Z(net2));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input3 (.I(cal_timeout),
    .Z(net3));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input4 (.I(cfg_done),
    .Z(net4));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input5 (.I(phase_offset_imported),
    .Z(net5));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input6 (.I(rst_n),
    .Z(net6));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input7 (.I(soft_rst),
    .Z(net7));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 load_slew13 (.I(_12_),
    .Z(net13));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output10 (.I(net10),
    .Z(state_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output11 (.I(net11),
    .Z(state_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output12 (.I(net12),
    .Z(state_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output8 (.I(net8),
    .Z(cal_start));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output9 (.I(net9),
    .Z(read_en));
endmodule
