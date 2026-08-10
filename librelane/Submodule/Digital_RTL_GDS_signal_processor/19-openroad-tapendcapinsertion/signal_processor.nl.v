module signal_processor (clk,
    comp_raw,
    dir,
    jitter_flag,
    latch_phase270,
    latch_phase270_ack,
    latch_phase90,
    latch_phase90_ack,
    move_en,
    rst_n,
    soft_rst_n,
    phase_state,
    votes_in_phase,
    votes_out_phase);
 input clk;
 input comp_raw;
 output dir;
 output jitter_flag;
 input latch_phase270;
 output latch_phase270_ack;
 input latch_phase90;
 output latch_phase90_ack;
 output move_en;
 input rst_n;
 input soft_rst_n;
 output [1:0] phase_state;
 output [3:0] votes_in_phase;
 output [3:0] votes_out_phase;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire \cnt_in[0] ;
 wire \cnt_in[1] ;
 wire \cnt_in[2] ;
 wire \cnt_in[3] ;
 wire \cnt_out[0] ;
 wire \cnt_out[1] ;
 wire \cnt_out[2] ;
 wire \cnt_out[3] ;
 wire \comp_pipe[0] ;
 wire \comp_pipe[1] ;
 wire \comp_pipe[2] ;
 wire \comp_pipe[3] ;
 wire \cycle_count[0] ;
 wire \cycle_count[1] ;
 wire \cycle_count[2] ;
 wire \cycle_count[3] ;
 wire \s270_pipe[0] ;
 wire \s270_pipe[1] ;
 wire \s270_pipe[2] ;
 wire \s270_pipe[3] ;
 wire s90;
 wire \s90_pipe[0] ;
 wire \s90_pipe[1] ;
 wire \s90_pipe[2] ;
 wire \s90_pipe[3] ;
 wire s90_valid;

 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Left_32 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Right_0 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_10_Left_42 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_10_Right_10 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_11_Left_43 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_11_Right_11 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_12_Left_44 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_12_Right_12 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_13_Left_45 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_13_Right_13 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_14_Left_46 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_14_Right_14 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_15_Left_47 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_15_Right_15 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_16_Left_48 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_16_Right_16 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_17_Left_49 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_17_Right_17 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_18_Left_50 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_18_Right_18 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_19_Left_51 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_19_Right_19 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Left_33 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Right_1 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_20_Left_52 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_20_Right_20 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_21_Left_53 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_21_Right_21 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_22_Left_54 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_22_Right_22 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_23_Left_55 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_23_Right_23 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_24_Left_56 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_24_Right_24 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_25_Left_57 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_25_Right_25 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_26_Left_58 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_26_Right_26 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_27_Left_59 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_27_Right_27 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_28_Left_60 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_28_Right_28 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_29_Left_61 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_29_Right_29 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Left_34 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Right_2 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_30_Left_62 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_30_Right_30 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_31_Left_63 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_31_Right_31 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Left_35 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Right_3 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Left_36 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Right_4 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Left_37 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Right_5 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Left_38 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Right_6 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Left_39 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Right_7 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Left_40 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Right_8 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Left_41 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Right_9 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_64 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_65 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_66 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_67 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_68 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_69 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_97 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_98 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_99 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_100 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_101 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_102 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_103 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_104 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_105 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_106 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_107 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_108 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_109 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_110 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_111 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_112 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_113 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_114 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_115 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_116 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_117 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_118 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_119 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_17_120 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_121 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_122 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_18_123 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_124 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_125 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_19_126 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_70 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_71 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_72 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_127 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_128 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_20_129 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_130 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_131 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_21_132 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_133 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_134 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_22_135 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_136 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_137 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_23_138 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_139 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_140 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_24_141 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_142 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_143 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_25_144 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_145 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_146 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_26_147 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_148 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_149 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_27_150 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_151 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_152 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_28_153 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_154 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_155 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_29_156 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_73 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_74 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_75 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_157 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_158 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_30_159 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_160 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_161 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_162 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_163 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_164 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_31_165 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_76 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_77 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_78 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_79 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_80 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_81 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_82 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_83 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_84 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_85 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_86 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_87 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_88 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_89 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_90 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_91 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_92 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_93 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_94 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_95 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_96 ();
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _108_ (.I(soft_rst_n),
    .ZN(_101_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _109_ (.I(\comp_pipe[3] ),
    .ZN(_102_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _110_ (.I(s90),
    .ZN(_103_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _111_ (.I(\cycle_count[1] ),
    .ZN(_104_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _112_ (.I(\cycle_count[2] ),
    .ZN(_105_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _113_ (.I(dir),
    .ZN(_106_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _114_ (.I(phase_state[1]),
    .ZN(_107_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _115_ (.A1(\s90_pipe[3] ),
    .A2(soft_rst_n),
    .Z(_005_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _116_ (.A1(soft_rst_n),
    .A2(latch_phase270),
    .Z(_006_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _117_ (.A1(soft_rst_n),
    .A2(\s270_pipe[0] ),
    .Z(_007_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _118_ (.A1(soft_rst_n),
    .A2(\s270_pipe[1] ),
    .Z(_008_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _119_ (.A1(soft_rst_n),
    .A2(\s270_pipe[2] ),
    .Z(_009_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _120_ (.A1(soft_rst_n),
    .A2(latch_phase90),
    .Z(_010_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _121_ (.A1(soft_rst_n),
    .A2(\s90_pipe[0] ),
    .Z(_011_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _122_ (.A1(soft_rst_n),
    .A2(\s90_pipe[1] ),
    .Z(_012_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _123_ (.A1(soft_rst_n),
    .A2(\s90_pipe[2] ),
    .Z(_013_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _124_ (.A1(soft_rst_n),
    .A2(comp_raw),
    .Z(_000_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _125_ (.A1(soft_rst_n),
    .A2(\comp_pipe[0] ),
    .Z(_001_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _126_ (.A1(soft_rst_n),
    .A2(\comp_pipe[1] ),
    .Z(_002_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _127_ (.A1(soft_rst_n),
    .A2(\comp_pipe[2] ),
    .Z(_003_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _128_ (.A1(soft_rst_n),
    .A2(\s270_pipe[3] ),
    .Z(_004_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _129_ (.A1(s90_valid),
    .A2(\s270_pipe[3] ),
    .Z(_041_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _130_ (.A1(s90_valid),
    .A2(\s270_pipe[3] ),
    .ZN(_042_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _131_ (.A1(\cycle_count[1] ),
    .A2(\cycle_count[2] ),
    .A3(\cycle_count[3] ),
    .ZN(_043_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _132_ (.A1(\cycle_count[0] ),
    .A2(_042_),
    .A3(_043_),
    .Z(_044_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _133_ (.I(_044_),
    .ZN(_045_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _134_ (.A1(soft_rst_n),
    .A2(_045_),
    .ZN(_046_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _135_ (.A1(_102_),
    .A2(s90),
    .A3(_042_),
    .ZN(_047_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _136_ (.A1(\comp_pipe[3] ),
    .A2(\cnt_out[0] ),
    .A3(_103_),
    .A4(_041_),
    .ZN(_048_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _137_ (.A1(\cnt_out[1] ),
    .A2(\cnt_out[0] ),
    .ZN(_049_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _138_ (.A1(_102_),
    .A2(s90),
    .A3(_042_),
    .A4(_049_),
    .ZN(_050_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _139_ (.A1(\cnt_out[2] ),
    .A2(_050_),
    .ZN(_051_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _140_ (.A1(\cnt_out[2] ),
    .A2(_050_),
    .Z(_052_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _141_ (.A1(\cnt_out[2] ),
    .A2(_050_),
    .ZN(_053_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _142_ (.A1(_101_),
    .A2(_045_),
    .ZN(_054_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _143_ (.A1(soft_rst_n),
    .A2(_044_),
    .ZN(_055_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _144_ (.A1(votes_out_phase[2]),
    .A2(_054_),
    .ZN(_056_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _145_ (.A1(_046_),
    .A2(_053_),
    .B(_056_),
    .ZN(_014_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _146_ (.A1(\cnt_out[3] ),
    .A2(_051_),
    .Z(_057_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _147_ (.A1(votes_out_phase[3]),
    .A2(_054_),
    .ZN(_058_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _148_ (.A1(_046_),
    .A2(_057_),
    .B(_058_),
    .ZN(_015_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _149_ (.A1(\s90_pipe[3] ),
    .A2(soft_rst_n),
    .A3(\comp_pipe[3] ),
    .ZN(_059_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _150_ (.A1(soft_rst_n),
    .A2(s90),
    .ZN(_060_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _151_ (.A1(\s90_pipe[3] ),
    .A2(_060_),
    .B(_059_),
    .ZN(_016_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _152_ (.A1(soft_rst_n),
    .A2(_042_),
    .ZN(_061_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _153_ (.A1(\s90_pipe[3] ),
    .A2(s90_valid),
    .ZN(_062_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _154_ (.A1(_061_),
    .A2(_062_),
    .ZN(_017_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _155_ (.A1(_102_),
    .A2(s90),
    .A3(_041_),
    .ZN(_063_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _156_ (.A1(_102_),
    .A2(s90),
    .A3(\cnt_in[0] ),
    .A4(_041_),
    .ZN(_064_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _157_ (.A1(\cnt_in[0] ),
    .A2(_063_),
    .ZN(_065_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _158_ (.A1(\cnt_in[0] ),
    .A2(_063_),
    .Z(_066_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _159_ (.A1(_055_),
    .A2(_066_),
    .ZN(_018_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _160_ (.A1(\cnt_in[0] ),
    .A2(\cnt_in[1] ),
    .ZN(_067_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _161_ (.A1(\comp_pipe[3] ),
    .A2(_103_),
    .A3(_042_),
    .A4(_067_),
    .ZN(_068_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _162_ (.A1(\cnt_in[1] ),
    .A2(_064_),
    .ZN(_069_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _163_ (.A1(\cnt_in[1] ),
    .A2(_064_),
    .Z(_070_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _164_ (.A1(_055_),
    .A2(_070_),
    .ZN(_019_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _165_ (.A1(\cnt_in[2] ),
    .A2(_068_),
    .ZN(_071_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _166_ (.A1(\cnt_in[2] ),
    .A2(_068_),
    .Z(_072_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _167_ (.A1(\cnt_in[2] ),
    .A2(_068_),
    .ZN(_073_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _168_ (.A1(_055_),
    .A2(_073_),
    .ZN(_020_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _169_ (.A1(\cnt_in[3] ),
    .A2(_071_),
    .Z(_074_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _170_ (.A1(_055_),
    .A2(_074_),
    .ZN(_021_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _171_ (.A1(\cnt_out[0] ),
    .A2(_047_),
    .Z(_075_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _172_ (.A1(\cnt_out[0] ),
    .A2(_047_),
    .ZN(_076_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _173_ (.A1(_055_),
    .A2(_076_),
    .ZN(_022_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _174_ (.A1(\cnt_out[1] ),
    .A2(_048_),
    .ZN(_077_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _175_ (.A1(\cnt_out[1] ),
    .A2(_048_),
    .Z(_078_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _176_ (.A1(_055_),
    .A2(_078_),
    .ZN(_023_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _177_ (.A1(_053_),
    .A2(_055_),
    .ZN(_024_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _178_ (.A1(_055_),
    .A2(_057_),
    .ZN(_025_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _179_ (.A1(soft_rst_n),
    .A2(\cycle_count[0] ),
    .A3(_042_),
    .ZN(_079_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _180_ (.A1(_041_),
    .A2(_054_),
    .ZN(_080_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _181_ (.A1(\cycle_count[0] ),
    .A2(_080_),
    .B(_079_),
    .ZN(_026_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _182_ (.A1(\cycle_count[0] ),
    .A2(_104_),
    .Z(_081_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _183_ (.A1(_104_),
    .A2(_061_),
    .B1(_080_),
    .B2(_081_),
    .ZN(_027_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _184_ (.A1(\cycle_count[0] ),
    .A2(\cycle_count[1] ),
    .A3(\cycle_count[2] ),
    .ZN(_082_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _185_ (.I(_082_),
    .ZN(_083_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _186_ (.A1(_054_),
    .A2(_082_),
    .ZN(_084_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _187_ (.A1(_055_),
    .A2(_083_),
    .B(_061_),
    .ZN(_085_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _188_ (.A1(soft_rst_n),
    .A2(\cycle_count[0] ),
    .A3(\cycle_count[1] ),
    .A4(_041_),
    .ZN(_086_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _189_ (.A1(_061_),
    .A2(_084_),
    .B1(_086_),
    .B2(_105_),
    .ZN(_028_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _190_ (.A1(\cycle_count[3] ),
    .A2(_085_),
    .ZN(_087_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _191_ (.A1(\cycle_count[3] ),
    .A2(_080_),
    .A3(_082_),
    .B(_087_),
    .ZN(_029_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _192_ (.A1(_065_),
    .A2(_069_),
    .B(_072_),
    .C(\cnt_in[3] ),
    .ZN(_088_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _193_ (.A1(_075_),
    .A2(_077_),
    .B(\cnt_out[3] ),
    .C(_052_),
    .ZN(_089_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _194_ (.A1(_088_),
    .A2(_089_),
    .Z(_090_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _195_ (.A1(_088_),
    .A2(_089_),
    .B(_044_),
    .ZN(_091_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _196_ (.A1(_101_),
    .A2(_106_),
    .A3(_091_),
    .B1(_088_),
    .B2(_046_),
    .ZN(_030_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _197_ (.A1(move_en),
    .A2(_054_),
    .ZN(_092_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _198_ (.A1(_046_),
    .A2(_090_),
    .B(_092_),
    .ZN(_031_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _199_ (.A1(jitter_flag),
    .A2(_045_),
    .ZN(_093_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _200_ (.A1(_101_),
    .A2(_091_),
    .A3(_093_),
    .ZN(_032_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _201_ (.A1(soft_rst_n),
    .A2(phase_state[0]),
    .A3(_042_),
    .ZN(_094_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _202_ (.A1(_101_),
    .A2(_102_),
    .A3(_042_),
    .B(_094_),
    .ZN(_033_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _203_ (.A1(_042_),
    .A2(_060_),
    .B1(_061_),
    .B2(_107_),
    .ZN(_034_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _204_ (.A1(votes_in_phase[0]),
    .A2(_054_),
    .ZN(_095_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _205_ (.A1(_046_),
    .A2(_066_),
    .B(_095_),
    .ZN(_035_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _206_ (.A1(votes_in_phase[1]),
    .A2(_054_),
    .ZN(_096_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _207_ (.A1(_046_),
    .A2(_070_),
    .B(_096_),
    .ZN(_036_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _208_ (.A1(votes_in_phase[2]),
    .A2(_054_),
    .ZN(_097_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _209_ (.A1(_046_),
    .A2(_073_),
    .B(_097_),
    .ZN(_037_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _210_ (.A1(votes_in_phase[3]),
    .A2(_054_),
    .ZN(_098_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _211_ (.A1(_046_),
    .A2(_074_),
    .B(_098_),
    .ZN(_038_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _212_ (.A1(votes_out_phase[0]),
    .A2(_054_),
    .ZN(_099_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _213_ (.A1(_046_),
    .A2(_076_),
    .B(_099_),
    .ZN(_039_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _214_ (.A1(votes_out_phase[1]),
    .A2(_054_),
    .ZN(_100_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _215_ (.A1(_046_),
    .A2(_078_),
    .B(_100_),
    .ZN(_040_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _216_ (.D(_030_),
    .RN(rst_n),
    .CLK(clk),
    .Q(dir));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _217_ (.D(_031_),
    .RN(rst_n),
    .CLK(clk),
    .Q(move_en));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _218_ (.D(_032_),
    .RN(rst_n),
    .CLK(clk),
    .Q(jitter_flag));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _219_ (.D(_033_),
    .RN(rst_n),
    .CLK(clk),
    .Q(phase_state[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _220_ (.D(_034_),
    .RN(rst_n),
    .CLK(clk),
    .Q(phase_state[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _221_ (.D(_035_),
    .RN(rst_n),
    .CLK(clk),
    .Q(votes_in_phase[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _222_ (.D(_036_),
    .RN(rst_n),
    .CLK(clk),
    .Q(votes_in_phase[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _223_ (.D(_037_),
    .RN(rst_n),
    .CLK(clk),
    .Q(votes_in_phase[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _224_ (.D(_038_),
    .RN(rst_n),
    .CLK(clk),
    .Q(votes_in_phase[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _225_ (.D(_039_),
    .RN(rst_n),
    .CLK(clk),
    .Q(votes_out_phase[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _226_ (.D(_040_),
    .RN(rst_n),
    .CLK(clk),
    .Q(votes_out_phase[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _227_ (.D(_014_),
    .RN(rst_n),
    .CLK(clk),
    .Q(votes_out_phase[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _228_ (.D(_015_),
    .RN(rst_n),
    .CLK(clk),
    .Q(votes_out_phase[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _229_ (.D(_016_),
    .RN(rst_n),
    .CLK(clk),
    .Q(s90));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _230_ (.D(_017_),
    .RN(rst_n),
    .CLK(clk),
    .Q(s90_valid));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _231_ (.D(_018_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cnt_in[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _232_ (.D(_019_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cnt_in[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _233_ (.D(_020_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cnt_in[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _234_ (.D(_021_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cnt_in[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _235_ (.D(_022_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cnt_out[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _236_ (.D(_023_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cnt_out[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _237_ (.D(_024_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cnt_out[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _238_ (.D(_025_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cnt_out[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _239_ (.D(_026_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cycle_count[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _240_ (.D(_027_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cycle_count[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _241_ (.D(_028_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cycle_count[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _242_ (.D(_029_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cycle_count[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _243_ (.D(_005_),
    .RN(rst_n),
    .CLK(clk),
    .Q(latch_phase90_ack));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _244_ (.D(_004_),
    .RN(rst_n),
    .CLK(clk),
    .Q(latch_phase270_ack));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _245_ (.D(_000_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\comp_pipe[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _246_ (.D(_001_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\comp_pipe[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _247_ (.D(_002_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\comp_pipe[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _248_ (.D(_003_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\comp_pipe[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _249_ (.D(_010_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\s90_pipe[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _250_ (.D(_011_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\s90_pipe[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _251_ (.D(_012_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\s90_pipe[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _252_ (.D(_013_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\s90_pipe[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _253_ (.D(_006_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\s270_pipe[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _254_ (.D(_007_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\s270_pipe[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _255_ (.D(_008_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\s270_pipe[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _256_ (.D(_009_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\s270_pipe[3] ));
endmodule
