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

 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _18_ (.I(soft_rst),
    .ZN(_03_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _19_ (.I(state_o[1]),
    .ZN(_04_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _20_ (.I(cfg_done),
    .ZN(_05_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _21_ (.A1(state_o[0]),
    .A2(_04_),
    .A3(state_o[2]),
    .ZN(cal_start));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _22_ (.A1(state_o[1]),
    .A2(state_o[2]),
    .Z(_06_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _23_ (.A1(state_o[1]),
    .A2(state_o[2]),
    .ZN(_07_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _24_ (.A1(state_o[0]),
    .A2(_06_),
    .A3(_07_),
    .ZN(read_en));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _25_ (.A1(cal_timeout),
    .A2(cal_done),
    .ZN(_08_));
 gf180mcu_fd_sc_mcu7t5v0__or4_1 _26_ (.A1(state_o[0]),
    .A2(_04_),
    .A3(state_o[2]),
    .A4(_08_),
    .Z(_09_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _27_ (.A1(state_o[0]),
    .A2(boot_complete),
    .B(_07_),
    .ZN(_10_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _28_ (.A1(state_o[0]),
    .A2(_07_),
    .Z(_11_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _29_ (.A1(_09_),
    .A2(_10_),
    .B1(_11_),
    .B2(_05_),
    .ZN(_12_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _30_ (.A1(state_o[0]),
    .A2(_12_),
    .B(_03_),
    .ZN(_13_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _31_ (.A1(state_o[0]),
    .A2(_12_),
    .B(_13_),
    .ZN(_00_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _32_ (.A1(state_o[1]),
    .A2(_12_),
    .ZN(_14_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _33_ (.A1(phase_offset_imported),
    .A2(_11_),
    .ZN(_15_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _34_ (.A1(cal_start),
    .A2(_11_),
    .B(_15_),
    .ZN(_16_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _35_ (.A1(_12_),
    .A2(_16_),
    .B(_14_),
    .C(soft_rst),
    .ZN(_01_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _36_ (.A1(state_o[2]),
    .A2(_12_),
    .ZN(_17_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _37_ (.A1(_12_),
    .A2(_15_),
    .B(_17_),
    .C(soft_rst),
    .ZN(_02_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _38_ (.D(_00_),
    .RN(rst_n),
    .CLK(clk),
    .Q(state_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _39_ (.D(_01_),
    .RN(rst_n),
    .CLK(clk),
    .Q(state_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _40_ (.D(_02_),
    .RN(rst_n),
    .CLK(clk),
    .Q(state_o[2]));
endmodule
