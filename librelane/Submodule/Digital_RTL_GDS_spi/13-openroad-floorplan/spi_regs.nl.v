module spi_regs (boot_complete,
    cal_dir_x,
    cal_dir_y,
    cal_done_x,
    cal_done_y,
    cal_timeout_x,
    cal_timeout_y,
    cfg_done,
    clk,
    jitter_flag_x,
    jitter_flag_y,
    latch_error_x,
    latch_error_y,
    phase_offset_imported,
    rst_n,
    soft_rst,
    spi_cs_n,
    spi_miso,
    spi_miso_oe,
    spi_mosi,
    spi_sclk,
    cal_phase0_offset_x,
    cal_phase0_offset_y,
    cal_phase270_offset_x,
    cal_phase270_offset_y,
    cal_phase90_offset_x,
    cal_phase90_offset_y,
    cfg_f_MEMS_fcw_x,
    cfg_f_MEMS_fcw_y,
    cfg_phase0_offset_x,
    cfg_phase0_offset_y,
    cfg_phase270_offset_x,
    cfg_phase270_offset_y,
    cfg_phase90_offset_x,
    cfg_phase90_offset_y,
    delay_wave_cycle_x,
    delay_wave_cycle_y,
    phase_state_x,
    phase_state_y,
    raw_edge1_x,
    raw_edge1_y,
    raw_edge2_x,
    raw_edge2_y,
    raw_edge3_x,
    raw_edge3_y,
    state_o,
    votes_in_phase_x,
    votes_in_phase_y,
    votes_out_phase_x,
    votes_out_phase_y);
 output boot_complete;
 input cal_dir_x;
 input cal_dir_y;
 input cal_done_x;
 input cal_done_y;
 input cal_timeout_x;
 input cal_timeout_y;
 output cfg_done;
 input clk;
 input jitter_flag_x;
 input jitter_flag_y;
 input latch_error_x;
 input latch_error_y;
 output phase_offset_imported;
 input rst_n;
 output soft_rst;
 input spi_cs_n;
 output spi_miso;
 output spi_miso_oe;
 input spi_mosi;
 input spi_sclk;
 input [20:0] cal_phase0_offset_x;
 input [20:0] cal_phase0_offset_y;
 input [20:0] cal_phase270_offset_x;
 input [20:0] cal_phase270_offset_y;
 input [20:0] cal_phase90_offset_x;
 input [20:0] cal_phase90_offset_y;
 output [15:0] cfg_f_MEMS_fcw_x;
 output [15:0] cfg_f_MEMS_fcw_y;
 output [20:0] cfg_phase0_offset_x;
 output [20:0] cfg_phase0_offset_y;
 output [20:0] cfg_phase270_offset_x;
 output [20:0] cfg_phase270_offset_y;
 output [20:0] cfg_phase90_offset_x;
 output [20:0] cfg_phase90_offset_y;
 input [7:0] delay_wave_cycle_x;
 input [7:0] delay_wave_cycle_y;
 input [1:0] phase_state_x;
 input [1:0] phase_state_y;
 input [20:0] raw_edge1_x;
 input [20:0] raw_edge1_y;
 input [20:0] raw_edge2_x;
 input [20:0] raw_edge2_y;
 input [20:0] raw_edge3_x;
 input [20:0] raw_edge3_y;
 input [2:0] state_o;
 input [3:0] votes_in_phase_x;
 input [3:0] votes_in_phase_y;
 input [3:0] votes_out_phase_x;
 input [3:0] votes_out_phase_y;

 wire _0000_;
 wire _0001_;
 wire _0002_;
 wire _0003_;
 wire _0004_;
 wire _0005_;
 wire _0006_;
 wire _0007_;
 wire _0008_;
 wire _0009_;
 wire _0010_;
 wire _0011_;
 wire _0012_;
 wire _0013_;
 wire _0014_;
 wire _0015_;
 wire _0016_;
 wire _0017_;
 wire _0018_;
 wire _0019_;
 wire _0020_;
 wire _0021_;
 wire _0022_;
 wire _0023_;
 wire _0024_;
 wire _0025_;
 wire _0026_;
 wire _0027_;
 wire _0028_;
 wire _0029_;
 wire _0030_;
 wire _0031_;
 wire _0032_;
 wire _0033_;
 wire _0034_;
 wire _0035_;
 wire _0036_;
 wire _0037_;
 wire _0038_;
 wire _0039_;
 wire _0040_;
 wire _0041_;
 wire _0042_;
 wire _0043_;
 wire _0044_;
 wire _0045_;
 wire _0046_;
 wire _0047_;
 wire _0048_;
 wire _0049_;
 wire _0050_;
 wire _0051_;
 wire _0052_;
 wire _0053_;
 wire _0054_;
 wire _0055_;
 wire _0056_;
 wire _0057_;
 wire _0058_;
 wire _0059_;
 wire _0060_;
 wire _0061_;
 wire _0062_;
 wire _0063_;
 wire _0064_;
 wire _0065_;
 wire _0066_;
 wire _0067_;
 wire _0068_;
 wire _0069_;
 wire _0070_;
 wire _0071_;
 wire _0072_;
 wire _0073_;
 wire _0074_;
 wire _0075_;
 wire _0076_;
 wire _0077_;
 wire _0078_;
 wire _0079_;
 wire _0080_;
 wire _0081_;
 wire _0082_;
 wire _0083_;
 wire _0084_;
 wire _0085_;
 wire _0086_;
 wire _0087_;
 wire _0088_;
 wire _0089_;
 wire _0090_;
 wire _0091_;
 wire _0092_;
 wire _0093_;
 wire _0094_;
 wire _0095_;
 wire _0096_;
 wire _0097_;
 wire _0098_;
 wire _0099_;
 wire _0100_;
 wire _0101_;
 wire _0102_;
 wire _0103_;
 wire _0104_;
 wire _0105_;
 wire _0106_;
 wire _0107_;
 wire _0108_;
 wire _0109_;
 wire _0110_;
 wire _0111_;
 wire _0112_;
 wire _0113_;
 wire _0114_;
 wire _0115_;
 wire _0116_;
 wire _0117_;
 wire _0118_;
 wire _0119_;
 wire _0120_;
 wire _0121_;
 wire _0122_;
 wire _0123_;
 wire _0124_;
 wire _0125_;
 wire _0126_;
 wire _0127_;
 wire _0128_;
 wire _0129_;
 wire _0130_;
 wire _0131_;
 wire _0132_;
 wire _0133_;
 wire _0134_;
 wire _0135_;
 wire _0136_;
 wire _0137_;
 wire _0138_;
 wire _0139_;
 wire _0140_;
 wire _0141_;
 wire _0142_;
 wire _0143_;
 wire _0144_;
 wire _0145_;
 wire _0146_;
 wire _0147_;
 wire _0148_;
 wire _0149_;
 wire _0150_;
 wire _0151_;
 wire _0152_;
 wire _0153_;
 wire _0154_;
 wire _0155_;
 wire _0156_;
 wire _0157_;
 wire _0158_;
 wire _0159_;
 wire _0160_;
 wire _0161_;
 wire _0162_;
 wire _0163_;
 wire _0164_;
 wire _0165_;
 wire _0166_;
 wire _0167_;
 wire _0168_;
 wire _0169_;
 wire _0170_;
 wire _0171_;
 wire _0172_;
 wire _0173_;
 wire _0174_;
 wire _0175_;
 wire _0176_;
 wire _0177_;
 wire _0178_;
 wire _0179_;
 wire _0180_;
 wire _0181_;
 wire _0182_;
 wire _0183_;
 wire _0184_;
 wire _0185_;
 wire _0186_;
 wire _0187_;
 wire _0188_;
 wire _0189_;
 wire _0190_;
 wire _0191_;
 wire _0192_;
 wire _0193_;
 wire _0194_;
 wire _0195_;
 wire _0196_;
 wire _0197_;
 wire _0198_;
 wire _0199_;
 wire _0200_;
 wire _0201_;
 wire _0202_;
 wire _0203_;
 wire _0204_;
 wire _0205_;
 wire _0206_;
 wire _0207_;
 wire _0208_;
 wire _0209_;
 wire _0210_;
 wire _0211_;
 wire _0212_;
 wire _0213_;
 wire _0214_;
 wire _0215_;
 wire _0216_;
 wire _0217_;
 wire _0218_;
 wire _0219_;
 wire _0220_;
 wire _0221_;
 wire _0222_;
 wire _0223_;
 wire _0224_;
 wire _0225_;
 wire _0226_;
 wire _0227_;
 wire _0228_;
 wire _0229_;
 wire _0230_;
 wire _0231_;
 wire _0232_;
 wire _0233_;
 wire _0234_;
 wire _0235_;
 wire _0236_;
 wire _0237_;
 wire _0238_;
 wire _0239_;
 wire _0240_;
 wire _0241_;
 wire _0242_;
 wire _0243_;
 wire _0244_;
 wire _0245_;
 wire _0246_;
 wire _0247_;
 wire _0248_;
 wire _0249_;
 wire _0250_;
 wire _0251_;
 wire _0252_;
 wire _0253_;
 wire _0254_;
 wire _0255_;
 wire _0256_;
 wire _0257_;
 wire _0258_;
 wire _0259_;
 wire _0260_;
 wire _0261_;
 wire _0262_;
 wire _0263_;
 wire _0264_;
 wire _0265_;
 wire _0266_;
 wire _0267_;
 wire _0268_;
 wire _0269_;
 wire _0270_;
 wire _0271_;
 wire _0272_;
 wire _0273_;
 wire _0274_;
 wire _0275_;
 wire _0276_;
 wire _0277_;
 wire _0278_;
 wire _0279_;
 wire _0280_;
 wire _0281_;
 wire _0282_;
 wire _0283_;
 wire _0284_;
 wire _0285_;
 wire _0286_;
 wire _0287_;
 wire _0288_;
 wire _0289_;
 wire _0290_;
 wire _0291_;
 wire _0292_;
 wire _0293_;
 wire _0294_;
 wire _0295_;
 wire _0296_;
 wire _0297_;
 wire _0298_;
 wire _0299_;
 wire _0300_;
 wire _0301_;
 wire _0302_;
 wire _0303_;
 wire _0304_;
 wire _0305_;
 wire _0306_;
 wire _0307_;
 wire _0308_;
 wire _0309_;
 wire _0310_;
 wire _0311_;
 wire _0312_;
 wire _0313_;
 wire _0314_;
 wire _0315_;
 wire _0316_;
 wire _0317_;
 wire _0318_;
 wire _0319_;
 wire _0320_;
 wire _0321_;
 wire _0322_;
 wire _0323_;
 wire _0324_;
 wire _0325_;
 wire _0326_;
 wire _0327_;
 wire _0328_;
 wire _0329_;
 wire _0330_;
 wire _0331_;
 wire _0332_;
 wire _0333_;
 wire _0334_;
 wire _0335_;
 wire _0336_;
 wire _0337_;
 wire _0338_;
 wire _0339_;
 wire _0340_;
 wire _0341_;
 wire _0342_;
 wire _0343_;
 wire _0344_;
 wire _0345_;
 wire _0346_;
 wire _0347_;
 wire _0348_;
 wire _0349_;
 wire _0350_;
 wire _0351_;
 wire _0352_;
 wire _0353_;
 wire _0354_;
 wire _0355_;
 wire _0356_;
 wire _0357_;
 wire _0358_;
 wire _0359_;
 wire _0360_;
 wire _0361_;
 wire _0362_;
 wire _0363_;
 wire _0364_;
 wire _0365_;
 wire _0366_;
 wire _0367_;
 wire _0368_;
 wire _0369_;
 wire _0370_;
 wire _0371_;
 wire _0372_;
 wire _0373_;
 wire _0374_;
 wire _0375_;
 wire _0376_;
 wire _0377_;
 wire _0378_;
 wire _0379_;
 wire _0380_;
 wire _0381_;
 wire _0382_;
 wire _0383_;
 wire _0384_;
 wire _0385_;
 wire _0386_;
 wire _0387_;
 wire _0388_;
 wire _0389_;
 wire _0390_;
 wire _0391_;
 wire _0392_;
 wire _0393_;
 wire _0394_;
 wire _0395_;
 wire _0396_;
 wire _0397_;
 wire _0398_;
 wire _0399_;
 wire _0400_;
 wire _0401_;
 wire _0402_;
 wire _0403_;
 wire _0404_;
 wire _0405_;
 wire _0406_;
 wire _0407_;
 wire _0408_;
 wire _0409_;
 wire _0410_;
 wire _0411_;
 wire _0412_;
 wire _0413_;
 wire _0414_;
 wire _0415_;
 wire _0416_;
 wire _0417_;
 wire _0418_;
 wire _0419_;
 wire _0420_;
 wire _0421_;
 wire _0422_;
 wire _0423_;
 wire _0424_;
 wire _0425_;
 wire _0426_;
 wire _0427_;
 wire _0428_;
 wire _0429_;
 wire _0430_;
 wire _0431_;
 wire _0432_;
 wire _0433_;
 wire _0434_;
 wire _0435_;
 wire _0436_;
 wire _0437_;
 wire _0438_;
 wire _0439_;
 wire _0440_;
 wire _0441_;
 wire _0442_;
 wire _0443_;
 wire _0444_;
 wire _0445_;
 wire _0446_;
 wire _0447_;
 wire _0448_;
 wire _0449_;
 wire _0450_;
 wire _0451_;
 wire _0452_;
 wire _0453_;
 wire _0454_;
 wire _0455_;
 wire _0456_;
 wire _0457_;
 wire _0458_;
 wire _0459_;
 wire _0460_;
 wire _0461_;
 wire _0462_;
 wire _0463_;
 wire _0464_;
 wire _0465_;
 wire _0466_;
 wire _0467_;
 wire _0468_;
 wire _0469_;
 wire _0470_;
 wire _0471_;
 wire _0472_;
 wire _0473_;
 wire _0474_;
 wire _0475_;
 wire _0476_;
 wire _0477_;
 wire _0478_;
 wire _0479_;
 wire _0480_;
 wire _0481_;
 wire _0482_;
 wire _0483_;
 wire _0484_;
 wire _0485_;
 wire _0486_;
 wire _0487_;
 wire _0488_;
 wire _0489_;
 wire _0490_;
 wire _0491_;
 wire _0492_;
 wire _0493_;
 wire _0494_;
 wire _0495_;
 wire _0496_;
 wire _0497_;
 wire _0498_;
 wire _0499_;
 wire _0500_;
 wire _0501_;
 wire _0502_;
 wire _0503_;
 wire _0504_;
 wire _0505_;
 wire _0506_;
 wire _0507_;
 wire _0508_;
 wire _0509_;
 wire _0510_;
 wire _0511_;
 wire _0512_;
 wire _0513_;
 wire _0514_;
 wire _0515_;
 wire _0516_;
 wire _0517_;
 wire _0518_;
 wire _0519_;
 wire _0520_;
 wire _0521_;
 wire _0522_;
 wire _0523_;
 wire _0524_;
 wire _0525_;
 wire _0526_;
 wire _0527_;
 wire _0528_;
 wire _0529_;
 wire _0530_;
 wire _0531_;
 wire _0532_;
 wire _0533_;
 wire _0534_;
 wire _0535_;
 wire _0536_;
 wire _0537_;
 wire _0538_;
 wire _0539_;
 wire _0540_;
 wire _0541_;
 wire _0542_;
 wire _0543_;
 wire _0544_;
 wire _0545_;
 wire _0546_;
 wire _0547_;
 wire _0548_;
 wire _0549_;
 wire _0550_;
 wire _0551_;
 wire _0552_;
 wire _0553_;
 wire _0554_;
 wire _0555_;
 wire _0556_;
 wire _0557_;
 wire _0558_;
 wire _0559_;
 wire _0560_;
 wire _0561_;
 wire _0562_;
 wire _0563_;
 wire _0564_;
 wire _0565_;
 wire _0566_;
 wire _0567_;
 wire _0568_;
 wire _0569_;
 wire _0570_;
 wire _0571_;
 wire _0572_;
 wire _0573_;
 wire _0574_;
 wire _0575_;
 wire _0576_;
 wire _0577_;
 wire _0578_;
 wire _0579_;
 wire _0580_;
 wire _0581_;
 wire _0582_;
 wire _0583_;
 wire _0584_;
 wire _0585_;
 wire _0586_;
 wire _0587_;
 wire _0588_;
 wire _0589_;
 wire _0590_;
 wire _0591_;
 wire _0592_;
 wire _0593_;
 wire _0594_;
 wire _0595_;
 wire _0596_;
 wire _0597_;
 wire _0598_;
 wire _0599_;
 wire _0600_;
 wire _0601_;
 wire _0602_;
 wire _0603_;
 wire _0604_;
 wire _0605_;
 wire _0606_;
 wire _0607_;
 wire _0608_;
 wire _0609_;
 wire _0610_;
 wire _0611_;
 wire _0612_;
 wire _0613_;
 wire _0614_;
 wire _0615_;
 wire _0616_;
 wire _0617_;
 wire _0618_;
 wire _0619_;
 wire _0620_;
 wire _0621_;
 wire _0622_;
 wire _0623_;
 wire _0624_;
 wire _0625_;
 wire _0626_;
 wire _0627_;
 wire _0628_;
 wire _0629_;
 wire _0630_;
 wire _0631_;
 wire _0632_;
 wire _0633_;
 wire _0634_;
 wire _0635_;
 wire _0636_;
 wire _0637_;
 wire _0638_;
 wire _0639_;
 wire _0640_;
 wire _0641_;
 wire _0642_;
 wire _0643_;
 wire _0644_;
 wire _0645_;
 wire _0646_;
 wire _0647_;
 wire _0648_;
 wire _0649_;
 wire _0650_;
 wire _0651_;
 wire _0652_;
 wire _0653_;
 wire _0654_;
 wire _0655_;
 wire _0656_;
 wire _0657_;
 wire _0658_;
 wire _0659_;
 wire _0660_;
 wire _0661_;
 wire _0662_;
 wire _0663_;
 wire _0664_;
 wire _0665_;
 wire _0666_;
 wire _0667_;
 wire _0668_;
 wire _0669_;
 wire _0670_;
 wire _0671_;
 wire _0672_;
 wire _0673_;
 wire _0674_;
 wire _0675_;
 wire _0676_;
 wire _0677_;
 wire _0678_;
 wire _0679_;
 wire _0680_;
 wire _0681_;
 wire _0682_;
 wire _0683_;
 wire _0684_;
 wire _0685_;
 wire _0686_;
 wire _0687_;
 wire _0688_;
 wire _0689_;
 wire _0690_;
 wire _0691_;
 wire _0692_;
 wire _0693_;
 wire _0694_;
 wire _0695_;
 wire _0696_;
 wire _0697_;
 wire _0698_;
 wire _0699_;
 wire _0700_;
 wire _0701_;
 wire _0702_;
 wire _0703_;
 wire _0704_;
 wire _0705_;
 wire _0706_;
 wire _0707_;
 wire _0708_;
 wire _0709_;
 wire _0710_;
 wire _0711_;
 wire _0712_;
 wire _0713_;
 wire _0714_;
 wire _0715_;
 wire _0716_;
 wire _0717_;
 wire _0718_;
 wire _0719_;
 wire _0720_;
 wire _0721_;
 wire _0722_;
 wire _0723_;
 wire _0724_;
 wire _0725_;
 wire _0726_;
 wire _0727_;
 wire _0728_;
 wire _0729_;
 wire _0730_;
 wire _0731_;
 wire _0732_;
 wire _0733_;
 wire \bit_cnt[0] ;
 wire \bit_cnt[1] ;
 wire \bit_cnt[2] ;
 wire cs_n_sync;
 wire \cs_sync[0] ;
 wire \mosi_sync[0] ;
 wire \mosi_sync[1] ;
 wire \reg_wr_addr[0] ;
 wire \reg_wr_addr[1] ;
 wire \reg_wr_addr[2] ;
 wire \reg_wr_addr[3] ;
 wire \reg_wr_addr[4] ;
 wire \reg_wr_addr[5] ;
 wire \reg_wr_addr[6] ;
 wire \reg_wr_data[0] ;
 wire \reg_wr_data[1] ;
 wire \reg_wr_data[2] ;
 wire \reg_wr_data[3] ;
 wire \reg_wr_data[4] ;
 wire \reg_wr_data[5] ;
 wire \reg_wr_data[6] ;
 wire \reg_wr_data[7] ;
 wire reg_wr_en;
 wire rw_n;
 wire \rx_shift[0] ;
 wire \rx_shift[1] ;
 wire \rx_shift[2] ;
 wire \rx_shift[3] ;
 wire \rx_shift[4] ;
 wire \rx_shift[5] ;
 wire \rx_shift[6] ;
 wire sclk_d;
 wire \sclk_sync[0] ;
 wire \sclk_sync[1] ;
 wire \spi_addr[0] ;
 wire \spi_addr[1] ;
 wire \spi_addr[2] ;
 wire \spi_addr[3] ;
 wire \spi_addr[4] ;
 wire \spi_addr[5] ;
 wire \spi_addr[6] ;
 wire spi_state;
 wire \tx_shift[0] ;
 wire \tx_shift[1] ;
 wire \tx_shift[2] ;
 wire \tx_shift[3] ;
 wire \tx_shift[4] ;
 wire \tx_shift[5] ;
 wire \tx_shift[6] ;

 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0734_ (.I(\reg_wr_addr[0] ),
    .ZN(_0488_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0735_ (.I(\reg_wr_addr[2] ),
    .ZN(_0489_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0736_ (.I(\reg_wr_data[3] ),
    .ZN(_0490_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0737_ (.I(\sclk_sync[1] ),
    .ZN(_0491_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0738_ (.I(cs_n_sync),
    .ZN(_0002_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0739_ (.I(spi_state),
    .ZN(_0492_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0740_ (.I(\spi_addr[1] ),
    .ZN(_0493_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0741_ (.I(\spi_addr[0] ),
    .ZN(_0494_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0742_ (.I(\spi_addr[2] ),
    .ZN(_0495_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0743_ (.I(\spi_addr[3] ),
    .ZN(_0496_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0744_ (.I(\spi_addr[5] ),
    .ZN(_0497_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0745_ (.I(\spi_addr[6] ),
    .ZN(_0498_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0746_ (.I(\tx_shift[3] ),
    .ZN(_0499_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0747_ (.A1(\reg_wr_addr[5] ),
    .A2(\reg_wr_addr[6] ),
    .ZN(_0500_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0748_ (.A1(\reg_wr_addr[4] ),
    .A2(_0500_),
    .ZN(_0501_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _0749_ (.A1(\reg_wr_addr[4] ),
    .A2(reg_wr_en),
    .A3(_0500_),
    .Z(_0502_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0750_ (.A1(\reg_wr_addr[0] ),
    .A2(\reg_wr_addr[1] ),
    .ZN(_0503_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0751_ (.A1(\reg_wr_addr[3] ),
    .A2(_0489_),
    .ZN(_0504_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0752_ (.A1(\reg_wr_addr[3] ),
    .A2(_0503_),
    .ZN(_0505_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0753_ (.A1(\reg_wr_addr[2] ),
    .A2(_0502_),
    .A3(_0505_),
    .ZN(_0506_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0754_ (.A1(_0490_),
    .A2(_0506_),
    .ZN(_0001_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0755_ (.A1(\bit_cnt[2] ),
    .A2(\bit_cnt[0] ),
    .A3(\bit_cnt[1] ),
    .ZN(_0507_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _0756_ (.A1(_0491_),
    .A2(sclk_d),
    .A3(cs_n_sync),
    .ZN(_0508_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0757_ (.A1(\bit_cnt[2] ),
    .A2(\bit_cnt[0] ),
    .A3(\bit_cnt[1] ),
    .A4(_0508_),
    .ZN(_0509_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0758_ (.I(_0509_),
    .ZN(_0510_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0759_ (.A1(_0492_),
    .A2(_0509_),
    .ZN(_0511_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0760_ (.A1(spi_state),
    .A2(_0510_),
    .ZN(_0512_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0761_ (.A1(rw_n),
    .A2(_0511_),
    .ZN(_0513_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0762_ (.I(_0513_),
    .ZN(_0000_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0763_ (.A1(_0488_),
    .A2(\reg_wr_addr[1] ),
    .ZN(_0514_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0764_ (.A1(_0502_),
    .A2(_0504_),
    .A3(_0514_),
    .ZN(_0515_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0765_ (.A1(cfg_phase270_offset_y[11]),
    .A2(_0515_),
    .ZN(_0516_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0766_ (.A1(_0490_),
    .A2(_0515_),
    .B(_0516_),
    .ZN(_0003_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0767_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_phase270_offset_y[12]),
    .S(_0515_),
    .Z(_0004_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0768_ (.I0(\reg_wr_data[5] ),
    .I1(cfg_phase270_offset_y[13]),
    .S(_0515_),
    .Z(_0005_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0769_ (.I0(\reg_wr_data[6] ),
    .I1(cfg_phase270_offset_y[14]),
    .S(_0515_),
    .Z(_0006_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0770_ (.I0(\reg_wr_data[7] ),
    .I1(cfg_phase270_offset_y[15]),
    .S(_0515_),
    .Z(_0007_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _0771_ (.A1(_0488_),
    .A2(\reg_wr_addr[1] ),
    .Z(_0517_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0772_ (.A1(_0502_),
    .A2(_0504_),
    .A3(_0517_),
    .ZN(_0518_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0773_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_phase270_offset_y[16]),
    .S(_0518_),
    .Z(_0008_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0774_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_phase270_offset_y[17]),
    .S(_0518_),
    .Z(_0009_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0775_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_phase270_offset_y[18]),
    .S(_0518_),
    .Z(_0010_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0776_ (.A1(cfg_phase270_offset_y[19]),
    .A2(_0518_),
    .ZN(_0519_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0777_ (.A1(_0490_),
    .A2(_0518_),
    .B(_0519_),
    .ZN(_0011_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0778_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_phase270_offset_y[20]),
    .S(_0518_),
    .Z(_0012_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0779_ (.I0(\reg_wr_data[0] ),
    .I1(boot_complete),
    .S(_0506_),
    .Z(_0013_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0780_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_done),
    .S(_0506_),
    .Z(_0014_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0781_ (.I0(\reg_wr_data[2] ),
    .I1(phase_offset_imported),
    .S(_0506_),
    .Z(_0015_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0782_ (.A1(cs_n_sync),
    .A2(_0492_),
    .B(_0509_),
    .ZN(_0016_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0783_ (.A1(_0491_),
    .A2(sclk_d),
    .B(_0002_),
    .ZN(_0520_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0784_ (.I(_0520_),
    .ZN(_0521_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0785_ (.A1(\bit_cnt[0] ),
    .A2(_0508_),
    .ZN(_0522_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _0786_ (.A1(\bit_cnt[0] ),
    .A2(_0520_),
    .B(_0522_),
    .ZN(_0017_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _0787_ (.A1(\bit_cnt[0] ),
    .A2(\bit_cnt[1] ),
    .Z(_0523_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0788_ (.A1(\bit_cnt[1] ),
    .A2(_0521_),
    .B1(_0523_),
    .B2(_0508_),
    .ZN(_0524_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0789_ (.I(_0524_),
    .ZN(_0018_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0790_ (.A1(\bit_cnt[2] ),
    .A2(_0521_),
    .ZN(_0525_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _0791_ (.A1(\bit_cnt[0] ),
    .A2(\bit_cnt[1] ),
    .B(\bit_cnt[2] ),
    .ZN(_0526_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0792_ (.A1(_0507_),
    .A2(_0508_),
    .ZN(_0527_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0793_ (.A1(_0526_),
    .A2(_0527_),
    .B(_0525_),
    .ZN(_0019_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0794_ (.A1(spi_state),
    .A2(_0509_),
    .ZN(_0528_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0795_ (.A1(_0492_),
    .A2(_0510_),
    .ZN(_0529_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0796_ (.I0(rw_n),
    .I1(\rx_shift[6] ),
    .S(_0528_),
    .Z(_0020_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0797_ (.A1(\spi_addr[0] ),
    .A2(_0509_),
    .B1(_0528_),
    .B2(\mosi_sync[1] ),
    .ZN(_0530_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0798_ (.A1(\spi_addr[0] ),
    .A2(_0512_),
    .B(_0530_),
    .ZN(_0021_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _0799_ (.A1(\spi_addr[1] ),
    .A2(\spi_addr[0] ),
    .Z(_0531_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0800_ (.A1(\spi_addr[1] ),
    .A2(_0509_),
    .B1(_0511_),
    .B2(_0531_),
    .C1(_0528_),
    .C2(\rx_shift[0] ),
    .ZN(_0532_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0801_ (.I(_0532_),
    .ZN(_0022_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0802_ (.A1(\rx_shift[1] ),
    .A2(_0528_),
    .ZN(_0533_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _0803_ (.A1(\spi_addr[1] ),
    .A2(\spi_addr[0] ),
    .Z(_0534_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _0804_ (.A1(_0493_),
    .A2(_0494_),
    .A3(_0509_),
    .ZN(_0535_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _0805_ (.A1(\spi_addr[2] ),
    .A2(_0535_),
    .B(_0528_),
    .ZN(_0536_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0806_ (.A1(\spi_addr[2] ),
    .A2(_0535_),
    .B(_0536_),
    .ZN(_0537_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0807_ (.A1(_0533_),
    .A2(_0537_),
    .ZN(_0023_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0808_ (.A1(\spi_addr[2] ),
    .A2(_0496_),
    .A3(_0534_),
    .ZN(_0538_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0809_ (.A1(\rx_shift[2] ),
    .A2(_0528_),
    .B1(_0536_),
    .B2(\spi_addr[3] ),
    .ZN(_0539_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0810_ (.A1(_0512_),
    .A2(_0538_),
    .B(_0539_),
    .ZN(_0024_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0811_ (.A1(\rx_shift[3] ),
    .A2(_0528_),
    .ZN(_0540_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _0812_ (.A1(\spi_addr[2] ),
    .A2(\spi_addr[3] ),
    .Z(_0541_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0813_ (.A1(_0534_),
    .A2(_0541_),
    .ZN(_0542_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0814_ (.A1(_0509_),
    .A2(_0542_),
    .ZN(_0543_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0815_ (.A1(\spi_addr[4] ),
    .A2(_0543_),
    .ZN(_0544_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0816_ (.A1(_0529_),
    .A2(_0544_),
    .ZN(_0545_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0817_ (.A1(\spi_addr[4] ),
    .A2(_0543_),
    .ZN(_0546_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _0818_ (.A1(_0545_),
    .A2(_0546_),
    .B(_0540_),
    .ZN(_0025_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0819_ (.A1(spi_state),
    .A2(\spi_addr[5] ),
    .A3(\spi_addr[4] ),
    .A4(_0543_),
    .ZN(_0547_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _0820_ (.A1(\rx_shift[4] ),
    .A2(_0529_),
    .B1(_0545_),
    .B2(\spi_addr[5] ),
    .C(_0547_),
    .ZN(_0548_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _0821_ (.I(_0548_),
    .ZN(_0026_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _0822_ (.A1(_0497_),
    .A2(_0544_),
    .B(_0529_),
    .C(\spi_addr[6] ),
    .ZN(_0549_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0823_ (.A1(\spi_addr[5] ),
    .A2(\spi_addr[4] ),
    .A3(_0498_),
    .ZN(_0550_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0824_ (.A1(_0542_),
    .A2(_0550_),
    .ZN(_0551_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0825_ (.A1(\rx_shift[5] ),
    .A2(_0528_),
    .B1(_0551_),
    .B2(_0511_),
    .ZN(_0552_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0826_ (.A1(_0549_),
    .A2(_0552_),
    .ZN(_0027_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0827_ (.I0(\rx_shift[0] ),
    .I1(\mosi_sync[1] ),
    .S(_0508_),
    .Z(_0028_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0828_ (.I0(\rx_shift[1] ),
    .I1(\rx_shift[0] ),
    .S(_0508_),
    .Z(_0029_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0829_ (.I0(\rx_shift[2] ),
    .I1(\rx_shift[1] ),
    .S(_0508_),
    .Z(_0030_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0830_ (.I0(\rx_shift[3] ),
    .I1(\rx_shift[2] ),
    .S(_0508_),
    .Z(_0031_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0831_ (.I0(\rx_shift[4] ),
    .I1(\rx_shift[3] ),
    .S(_0508_),
    .Z(_0032_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0832_ (.I0(\rx_shift[5] ),
    .I1(\rx_shift[4] ),
    .S(_0508_),
    .Z(_0033_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _0833_ (.I0(\rx_shift[6] ),
    .I1(\rx_shift[5] ),
    .S(_0508_),
    .Z(_0034_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0834_ (.A1(_0491_),
    .A2(sclk_d),
    .A3(_0002_),
    .ZN(_0553_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0835_ (.A1(\tx_shift[0] ),
    .A2(_0553_),
    .ZN(_0554_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0836_ (.A1(\spi_addr[1] ),
    .A2(\spi_addr[0] ),
    .ZN(_0555_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0837_ (.A1(\spi_addr[2] ),
    .A2(_0496_),
    .A3(_0555_),
    .ZN(_0556_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _0838_ (.A1(\spi_addr[5] ),
    .A2(\spi_addr[4] ),
    .A3(\spi_addr[6] ),
    .Z(_0557_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0839_ (.A1(_0556_),
    .A2(_0557_),
    .ZN(_0558_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _0840_ (.A1(\spi_addr[5] ),
    .A2(\spi_addr[4] ),
    .A3(_0498_),
    .Z(_0559_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0841_ (.A1(\spi_addr[1] ),
    .A2(_0494_),
    .A3(\spi_addr[2] ),
    .A4(_0496_),
    .ZN(_0560_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0842_ (.A1(_0559_),
    .A2(_0560_),
    .ZN(_0561_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _0843_ (.A1(_0497_),
    .A2(\spi_addr[4] ),
    .A3(\spi_addr[6] ),
    .Z(_0562_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0844_ (.A1(_0493_),
    .A2(\spi_addr[0] ),
    .A3(\spi_addr[2] ),
    .A4(_0496_),
    .ZN(_0563_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0845_ (.A1(_0562_),
    .A2(_0563_),
    .ZN(_0564_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0846_ (.A1(\spi_addr[2] ),
    .A2(\spi_addr[3] ),
    .ZN(_0565_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0847_ (.A1(\spi_addr[1] ),
    .A2(_0494_),
    .A3(_0565_),
    .ZN(_0566_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0848_ (.A1(_0557_),
    .A2(_0566_),
    .ZN(_0567_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0849_ (.A1(_0557_),
    .A2(_0563_),
    .ZN(_0568_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0850_ (.A1(_0562_),
    .A2(_0566_),
    .ZN(_0569_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0851_ (.A1(_0495_),
    .A2(\spi_addr[3] ),
    .A3(_0534_),
    .ZN(_0570_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0852_ (.A1(_0559_),
    .A2(_0570_),
    .ZN(_0571_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0853_ (.A1(_0497_),
    .A2(\spi_addr[4] ),
    .A3(_0498_),
    .ZN(_0572_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0854_ (.A1(_0560_),
    .A2(_0572_),
    .ZN(_0573_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0855_ (.A1(_0534_),
    .A2(_0565_),
    .ZN(_0574_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0856_ (.A1(_0572_),
    .A2(_0574_),
    .ZN(_0575_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0857_ (.A1(_0563_),
    .A2(_0572_),
    .ZN(_0576_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0858_ (.A1(_0557_),
    .A2(_0560_),
    .ZN(_0577_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0859_ (.A1(\spi_addr[1] ),
    .A2(_0494_),
    .A3(_0541_),
    .ZN(_0578_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0860_ (.A1(_0550_),
    .A2(_0578_),
    .ZN(_0579_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0861_ (.A1(cfg_phase0_offset_x[8]),
    .A2(_0577_),
    .B1(_0579_),
    .B2(cal_phase0_offset_y[8]),
    .ZN(_0580_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0862_ (.A1(_0493_),
    .A2(\spi_addr[0] ),
    .A3(_0565_),
    .ZN(_0581_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0863_ (.A1(_0572_),
    .A2(_0581_),
    .ZN(_0582_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0864_ (.A1(_0550_),
    .A2(_0581_),
    .ZN(_0583_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0865_ (.A1(_0538_),
    .A2(_0557_),
    .ZN(_0584_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0866_ (.A1(_0557_),
    .A2(_0581_),
    .ZN(_0585_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0867_ (.A1(_0556_),
    .A2(_0559_),
    .ZN(_0586_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0868_ (.A1(_0559_),
    .A2(_0574_),
    .ZN(_0587_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0869_ (.A1(_0560_),
    .A2(_0562_),
    .ZN(_0588_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0870_ (.A1(_0541_),
    .A2(_0555_),
    .ZN(_0589_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0871_ (.A1(_0562_),
    .A2(_0589_),
    .ZN(_0590_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0872_ (.A1(_0493_),
    .A2(\spi_addr[0] ),
    .A3(_0541_),
    .ZN(_0591_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0873_ (.A1(_0557_),
    .A2(_0591_),
    .ZN(_0592_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0874_ (.A1(_0550_),
    .A2(_0574_),
    .ZN(_0593_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0875_ (.A1(_0562_),
    .A2(_0591_),
    .ZN(_0594_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0876_ (.A1(_0557_),
    .A2(_0589_),
    .ZN(_0595_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0877_ (.A1(_0538_),
    .A2(_0559_),
    .ZN(_0596_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0878_ (.A1(_0538_),
    .A2(_0550_),
    .ZN(_0597_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0879_ (.A1(_0550_),
    .A2(_0566_),
    .ZN(_0598_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0880_ (.A1(_0550_),
    .A2(_0560_),
    .ZN(_0599_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0881_ (.A1(_0555_),
    .A2(_0565_),
    .ZN(_0600_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0882_ (.A1(_0559_),
    .A2(_0600_),
    .ZN(_0601_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0883_ (.A1(_0495_),
    .A2(\spi_addr[3] ),
    .A3(_0555_),
    .ZN(_0602_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0884_ (.A1(_0559_),
    .A2(_0602_),
    .ZN(_0603_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0885_ (.A1(_0550_),
    .A2(_0556_),
    .ZN(_0604_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0886_ (.A1(_0562_),
    .A2(_0600_),
    .ZN(_0605_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0887_ (.A1(_0542_),
    .A2(_0562_),
    .ZN(_0606_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0888_ (.A1(_0493_),
    .A2(\spi_addr[0] ),
    .A3(_0495_),
    .A4(\spi_addr[3] ),
    .ZN(_0607_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0889_ (.A1(_0562_),
    .A2(_0607_),
    .ZN(_0608_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0890_ (.A1(_0559_),
    .A2(_0589_),
    .ZN(_0609_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0891_ (.A1(_0538_),
    .A2(_0572_),
    .ZN(_0610_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0892_ (.A1(_0557_),
    .A2(_0602_),
    .ZN(_0611_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0893_ (.A1(_0538_),
    .A2(_0562_),
    .ZN(_0612_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0894_ (.A1(_0559_),
    .A2(_0566_),
    .ZN(_0613_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0895_ (.A1(_0562_),
    .A2(_0574_),
    .ZN(_0614_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0896_ (.A1(_0559_),
    .A2(_0607_),
    .ZN(_0615_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0897_ (.A1(_0559_),
    .A2(_0591_),
    .ZN(_0616_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0898_ (.A1(_0557_),
    .A2(_0574_),
    .ZN(_0617_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0899_ (.A1(\spi_addr[1] ),
    .A2(_0494_),
    .A3(_0495_),
    .A4(\spi_addr[3] ),
    .ZN(_0618_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0900_ (.A1(_0550_),
    .A2(_0618_),
    .ZN(_0619_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0901_ (.A1(_0550_),
    .A2(_0600_),
    .ZN(_0620_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0902_ (.A1(_0550_),
    .A2(_0602_),
    .ZN(_0621_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0903_ (.A1(_0550_),
    .A2(_0607_),
    .ZN(_0622_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0904_ (.A1(_0559_),
    .A2(_0618_),
    .ZN(_0623_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0905_ (.A1(_0562_),
    .A2(_0578_),
    .ZN(_0624_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0906_ (.A1(_0550_),
    .A2(_0570_),
    .ZN(_0625_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0907_ (.A1(_0542_),
    .A2(_0557_),
    .ZN(_0626_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0908_ (.A1(_0557_),
    .A2(_0607_),
    .ZN(_0627_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0909_ (.A1(_0556_),
    .A2(_0562_),
    .ZN(_0628_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0910_ (.A1(_0566_),
    .A2(_0572_),
    .ZN(_0629_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0911_ (.A1(_0557_),
    .A2(_0578_),
    .ZN(_0630_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0912_ (.A1(_0562_),
    .A2(_0618_),
    .ZN(_0631_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0913_ (.A1(_0550_),
    .A2(_0589_),
    .ZN(_0632_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0914_ (.A1(_0557_),
    .A2(_0570_),
    .ZN(_0633_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0915_ (.A1(_0562_),
    .A2(_0570_),
    .ZN(_0634_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0916_ (.A1(_0557_),
    .A2(_0618_),
    .ZN(_0635_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0917_ (.A1(_0559_),
    .A2(_0581_),
    .ZN(_0636_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0918_ (.A1(_0556_),
    .A2(_0572_),
    .ZN(_0637_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0919_ (.A1(_0550_),
    .A2(_0563_),
    .ZN(_0638_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0920_ (.A1(_0562_),
    .A2(_0602_),
    .ZN(_0639_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0921_ (.A1(_0562_),
    .A2(_0581_),
    .ZN(_0640_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0922_ (.A1(_0559_),
    .A2(_0563_),
    .ZN(_0641_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0923_ (.A1(_0572_),
    .A2(_0600_),
    .ZN(_0642_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0924_ (.A1(_0550_),
    .A2(_0591_),
    .ZN(_0643_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0925_ (.A1(cal_phase90_offset_x[0]),
    .A2(_0597_),
    .B1(_0599_),
    .B2(cal_phase0_offset_x[16]),
    .ZN(_0644_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0926_ (.A1(cfg_f_MEMS_fcw_x[0]),
    .A2(_0585_),
    .B1(_0637_),
    .B2(cfg_phase270_offset_y[0]),
    .ZN(_0645_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0927_ (.A1(cfg_phase270_offset_x[16]),
    .A2(_0592_),
    .B1(_0604_),
    .B2(cal_phase0_offset_x[0]),
    .C1(cal_phase0_offset_x[8]),
    .C2(_0638_),
    .ZN(_0646_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0928_ (.A1(cal_dir_x),
    .A2(_0609_),
    .B1(_0639_),
    .B2(raw_edge3_x[0]),
    .ZN(_0647_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0929_ (.A1(cfg_phase90_offset_y[16]),
    .A2(_0575_),
    .B1(_0605_),
    .B2(delay_wave_cycle_x[0]),
    .C1(cal_phase90_offset_y[16]),
    .C2(_0613_),
    .ZN(_0648_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0930_ (.A1(cal_phase90_offset_x[16]),
    .A2(_0622_),
    .B1(_0636_),
    .B2(cal_phase90_offset_y[8]),
    .ZN(_0649_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0931_ (.A1(_0646_),
    .A2(_0647_),
    .A3(_0648_),
    .A4(_0649_),
    .ZN(_0650_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0932_ (.A1(cal_phase270_offset_y[0]),
    .A2(_0587_),
    .B1(_0590_),
    .B2(raw_edge1_y[8]),
    .C1(_0634_),
    .C2(raw_edge1_y[0]),
    .ZN(_0651_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0933_ (.A1(votes_in_phase_x[0]),
    .A2(_0603_),
    .B1(_0606_),
    .B2(raw_edge2_y[8]),
    .C1(_0608_),
    .C2(raw_edge3_x[8]),
    .ZN(_0652_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0934_ (.A1(cal_phase270_offset_x[16]),
    .A2(_0632_),
    .B1(_0642_),
    .B2(cfg_phase0_offset_y[16]),
    .C1(cfg_f_MEMS_fcw_y[0]),
    .C2(_0617_),
    .ZN(_0653_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0935_ (.A1(cfg_phase90_offset_y[0]),
    .A2(_0582_),
    .B1(_0630_),
    .B2(cfg_phase0_offset_y[0]),
    .C1(_0615_),
    .C2(votes_out_phase_x[0]),
    .ZN(_0654_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0936_ (.A1(_0651_),
    .A2(_0652_),
    .A3(_0653_),
    .A4(_0654_),
    .ZN(_0655_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _0937_ (.A1(_0650_),
    .A2(_0655_),
    .Z(_0656_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0938_ (.A1(raw_edge3_y[0]),
    .A2(_0583_),
    .B1(_0593_),
    .B2(raw_edge3_y[16]),
    .ZN(_0657_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0939_ (.A1(_0580_),
    .A2(_0644_),
    .A3(_0645_),
    .A4(_0657_),
    .ZN(_0658_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0940_ (.A1(cal_phase0_offset_y[16]),
    .A2(_0551_),
    .B1(_0558_),
    .B2(cfg_f_MEMS_fcw_y[8]),
    .C1(_0564_),
    .C2(raw_edge2_x[0]),
    .ZN(_0659_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0941_ (.A1(cfg_phase0_offset_x[16]),
    .A2(_0584_),
    .B1(_0598_),
    .B2(raw_edge3_y[8]),
    .ZN(_0660_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0942_ (.A1(jitter_flag_x),
    .A2(_0561_),
    .B1(_0588_),
    .B2(raw_edge2_x[8]),
    .ZN(_0661_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _0943_ (.A1(_0659_),
    .A2(_0660_),
    .A3(_0661_),
    .ZN(_0662_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0944_ (.A1(cfg_f_MEMS_fcw_x[8]),
    .A2(_0567_),
    .B1(_0619_),
    .B2(cal_phase270_offset_x[0]),
    .ZN(_0663_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0945_ (.A1(cfg_phase0_offset_x[0]),
    .A2(_0568_),
    .B1(_0631_),
    .B2(raw_edge3_x[16]),
    .ZN(_0664_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0946_ (.A1(raw_edge2_y[16]),
    .A2(_0620_),
    .B1(_0624_),
    .B2(raw_edge2_y[0]),
    .ZN(_0665_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0947_ (.A1(cfg_phase270_offset_y[8]),
    .A2(_0576_),
    .B1(_0628_),
    .B2(raw_edge1_x[16]),
    .ZN(_0666_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0948_ (.A1(_0663_),
    .A2(_0664_),
    .A3(_0665_),
    .A4(_0666_),
    .ZN(_0667_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0949_ (.A1(raw_edge1_x[0]),
    .A2(_0569_),
    .B1(_0595_),
    .B2(cfg_phase270_offset_x[8]),
    .ZN(_0668_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0950_ (.A1(raw_edge1_y[16]),
    .A2(_0594_),
    .B1(_0626_),
    .B2(cfg_phase0_offset_y[8]),
    .ZN(_0669_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0951_ (.A1(cal_phase270_offset_y[8]),
    .A2(_0586_),
    .B1(_0635_),
    .B2(cfg_phase90_offset_x[16]),
    .ZN(_0670_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0952_ (.A1(votes_out_phase_y[0]),
    .A2(_0571_),
    .B1(_0629_),
    .B2(cfg_phase90_offset_y[8]),
    .ZN(_0671_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0953_ (.A1(_0668_),
    .A2(_0669_),
    .A3(_0670_),
    .A4(_0671_),
    .ZN(_0672_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0954_ (.A1(phase_state_x[0]),
    .A2(_0596_),
    .B1(_0601_),
    .B2(cal_phase90_offset_y[0]),
    .ZN(_0673_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0955_ (.A1(delay_wave_cycle_y[0]),
    .A2(_0640_),
    .B1(_0643_),
    .B2(cal_phase0_offset_y[0]),
    .ZN(_0674_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0956_ (.A1(raw_edge1_x[8]),
    .A2(_0614_),
    .B1(_0641_),
    .B2(cal_phase270_offset_y[16]),
    .ZN(_0675_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0957_ (.A1(state_o[0]),
    .A2(_0616_),
    .B1(_0633_),
    .B2(cfg_phase270_offset_x[0]),
    .ZN(_0676_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0958_ (.A1(_0673_),
    .A2(_0674_),
    .A3(_0675_),
    .A4(_0676_),
    .ZN(_0677_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0959_ (.A1(boot_complete),
    .A2(_0610_),
    .B1(_0623_),
    .B2(votes_in_phase_y[0]),
    .ZN(_0678_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0960_ (.A1(cal_phase90_offset_x[8]),
    .A2(_0621_),
    .B1(_0625_),
    .B2(cal_phase270_offset_x[8]),
    .ZN(_0679_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0961_ (.A1(cfg_phase270_offset_y[16]),
    .A2(_0573_),
    .B1(_0611_),
    .B2(cfg_phase90_offset_x[0]),
    .ZN(_0680_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0962_ (.A1(raw_edge2_x[16]),
    .A2(_0612_),
    .B1(_0627_),
    .B2(cfg_phase90_offset_x[8]),
    .ZN(_0681_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0963_ (.A1(_0678_),
    .A2(_0679_),
    .A3(_0680_),
    .A4(_0681_),
    .ZN(_0682_));
 gf180mcu_fd_sc_mcu7t5v0__or4_1 _0964_ (.A1(_0667_),
    .A2(_0672_),
    .A3(_0677_),
    .A4(_0682_),
    .Z(_0683_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _0965_ (.A1(_0656_),
    .A2(_0658_),
    .A3(_0662_),
    .A4(_0683_),
    .ZN(_0684_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _0966_ (.A1(\bit_cnt[2] ),
    .A2(\bit_cnt[0] ),
    .A3(\bit_cnt[1] ),
    .ZN(_0685_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _0967_ (.A1(spi_state),
    .A2(_0685_),
    .Z(_0686_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0968_ (.A1(spi_state),
    .A2(_0685_),
    .ZN(_0687_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _0969_ (.A1(_0553_),
    .A2(_0684_),
    .A3(_0687_),
    .B(_0554_),
    .ZN(_0035_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0970_ (.A1(\tx_shift[1] ),
    .A2(_0553_),
    .ZN(_0688_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0971_ (.A1(cfg_phase270_offset_x[17]),
    .A2(_0592_),
    .B1(_0624_),
    .B2(raw_edge2_y[1]),
    .ZN(_0689_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0972_ (.A1(raw_edge1_y[17]),
    .A2(_0594_),
    .B1(_0634_),
    .B2(raw_edge1_y[1]),
    .C1(_0621_),
    .C2(cal_phase90_offset_x[9]),
    .ZN(_0690_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0973_ (.A1(cfg_phase270_offset_y[17]),
    .A2(_0573_),
    .B1(_0629_),
    .B2(cfg_phase90_offset_y[9]),
    .C1(_0583_),
    .C2(raw_edge3_y[1]),
    .ZN(_0691_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _0974_ (.A1(_0690_),
    .A2(_0691_),
    .ZN(_0692_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0975_ (.A1(cfg_f_MEMS_fcw_y[1]),
    .A2(_0617_),
    .B1(_0628_),
    .B2(raw_edge1_x[17]),
    .ZN(_0693_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0976_ (.A1(cfg_phase270_offset_y[9]),
    .A2(_0576_),
    .B1(_0613_),
    .B2(cal_phase90_offset_y[17]),
    .ZN(_0694_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0977_ (.A1(cal_phase270_offset_y[9]),
    .A2(_0586_),
    .B1(_0610_),
    .B2(cfg_done),
    .ZN(_0695_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0978_ (.A1(cal_phase270_offset_x[1]),
    .A2(_0619_),
    .B1(_0632_),
    .B2(cal_phase270_offset_x[17]),
    .ZN(_0696_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0979_ (.A1(_0693_),
    .A2(_0694_),
    .A3(_0695_),
    .A4(_0696_),
    .ZN(_0697_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0980_ (.A1(cfg_phase0_offset_x[1]),
    .A2(_0568_),
    .B1(_0620_),
    .B2(raw_edge2_y[17]),
    .ZN(_0698_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0981_ (.A1(cfg_phase270_offset_x[9]),
    .A2(_0595_),
    .B1(_0640_),
    .B2(delay_wave_cycle_y[1]),
    .ZN(_0699_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0982_ (.A1(votes_out_phase_x[1]),
    .A2(_0615_),
    .B1(_0641_),
    .B2(cal_phase270_offset_y[17]),
    .ZN(_0700_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0983_ (.A1(raw_edge3_y[9]),
    .A2(_0598_),
    .B1(_0626_),
    .B2(cfg_phase0_offset_y[9]),
    .ZN(_0701_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0984_ (.A1(_0698_),
    .A2(_0699_),
    .A3(_0700_),
    .A4(_0701_),
    .ZN(_0702_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _0985_ (.A1(_0692_),
    .A2(_0697_),
    .A3(_0702_),
    .ZN(_0703_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0986_ (.A1(cfg_phase90_offset_y[17]),
    .A2(_0575_),
    .B1(_0584_),
    .B2(cfg_phase0_offset_x[17]),
    .C1(_0597_),
    .C2(cal_phase90_offset_x[1]),
    .ZN(_0704_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0987_ (.A1(cfg_phase90_offset_x[1]),
    .A2(_0611_),
    .B1(_0633_),
    .B2(cfg_phase270_offset_x[1]),
    .ZN(_0705_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0988_ (.A1(cal_phase270_offset_x[9]),
    .A2(_0625_),
    .B1(_0639_),
    .B2(raw_edge3_x[1]),
    .C1(raw_edge1_x[9]),
    .C2(_0614_),
    .ZN(_0706_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0989_ (.A1(votes_in_phase_y[1]),
    .A2(_0623_),
    .B1(_0636_),
    .B2(cal_phase90_offset_y[9]),
    .ZN(_0707_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0990_ (.A1(_0704_),
    .A2(_0705_),
    .A3(_0706_),
    .A4(_0707_),
    .ZN(_0708_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0991_ (.A1(phase_state_x[1]),
    .A2(_0596_),
    .B1(_0630_),
    .B2(cfg_phase0_offset_y[1]),
    .C1(cfg_f_MEMS_fcw_x[9]),
    .C2(_0567_),
    .ZN(_0709_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _0992_ (.A1(cal_phase0_offset_x[17]),
    .A2(_0599_),
    .B1(_0627_),
    .B2(cfg_phase90_offset_x[9]),
    .C(_0687_),
    .ZN(_0710_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0993_ (.A1(raw_edge2_x[1]),
    .A2(_0564_),
    .B1(_0569_),
    .B2(raw_edge1_x[1]),
    .C1(_0582_),
    .C2(cfg_phase90_offset_y[1]),
    .ZN(_0711_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0994_ (.A1(cal_phase0_offset_y[17]),
    .A2(_0551_),
    .B1(_0622_),
    .B2(cal_phase90_offset_x[17]),
    .C1(_0631_),
    .C2(raw_edge3_x[17]),
    .ZN(_0712_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _0995_ (.A1(_0709_),
    .A2(_0710_),
    .A3(_0711_),
    .A4(_0712_),
    .ZN(_0713_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _0996_ (.A1(_0708_),
    .A2(_0713_),
    .ZN(_0714_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0997_ (.A1(cal_phase270_offset_y[1]),
    .A2(_0587_),
    .B1(_0593_),
    .B2(raw_edge3_y[17]),
    .C1(_0638_),
    .C2(cal_phase0_offset_x[9]),
    .ZN(_0715_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _0998_ (.A1(jitter_flag_y),
    .A2(_0561_),
    .B1(_0609_),
    .B2(cal_dir_y),
    .ZN(_0716_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _0999_ (.A1(votes_out_phase_y[1]),
    .A2(_0571_),
    .B1(_0635_),
    .B2(cfg_phase90_offset_x[17]),
    .C1(_0643_),
    .C2(cal_phase0_offset_y[1]),
    .ZN(_0717_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1000_ (.A1(delay_wave_cycle_x[1]),
    .A2(_0605_),
    .B1(_0616_),
    .B2(state_o[1]),
    .ZN(_0718_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1001_ (.A1(_0715_),
    .A2(_0716_),
    .A3(_0717_),
    .A4(_0718_),
    .ZN(_0719_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1002_ (.A1(cal_phase0_offset_y[9]),
    .A2(_0579_),
    .B1(_0612_),
    .B2(raw_edge2_x[17]),
    .ZN(_0720_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1003_ (.A1(cfg_f_MEMS_fcw_x[1]),
    .A2(_0585_),
    .B1(_0637_),
    .B2(cfg_phase270_offset_y[1]),
    .ZN(_0721_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1004_ (.A1(cfg_f_MEMS_fcw_y[9]),
    .A2(_0558_),
    .B1(_0608_),
    .B2(raw_edge3_x[9]),
    .ZN(_0722_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1005_ (.A1(_0689_),
    .A2(_0720_),
    .A3(_0721_),
    .A4(_0722_),
    .ZN(_0723_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1006_ (.A1(cal_phase90_offset_y[1]),
    .A2(_0601_),
    .B1(_0604_),
    .B2(cal_phase0_offset_x[1]),
    .ZN(_0724_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1007_ (.A1(votes_in_phase_x[1]),
    .A2(_0603_),
    .B1(_0606_),
    .B2(raw_edge2_y[9]),
    .ZN(_0725_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1008_ (.A1(cfg_phase0_offset_x[9]),
    .A2(_0577_),
    .B1(_0590_),
    .B2(raw_edge1_y[9]),
    .ZN(_0726_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1009_ (.A1(raw_edge2_x[9]),
    .A2(_0588_),
    .B1(_0642_),
    .B2(cfg_phase0_offset_y[17]),
    .ZN(_0727_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1010_ (.A1(_0724_),
    .A2(_0725_),
    .A3(_0726_),
    .A4(_0727_),
    .ZN(_0728_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1011_ (.A1(_0719_),
    .A2(_0723_),
    .A3(_0728_),
    .ZN(_0729_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1012_ (.A1(_0703_),
    .A2(_0714_),
    .A3(_0729_),
    .Z(_0730_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1013_ (.A1(\tx_shift[0] ),
    .A2(_0686_),
    .ZN(_0731_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1014_ (.A1(_0553_),
    .A2(_0730_),
    .A3(_0731_),
    .B(_0688_),
    .ZN(_0036_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1015_ (.A1(\tx_shift[2] ),
    .A2(_0553_),
    .ZN(_0732_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1016_ (.A1(cfg_phase0_offset_x[2]),
    .A2(_0568_),
    .B1(_0621_),
    .B2(cal_phase90_offset_x[10]),
    .ZN(_0733_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1017_ (.A1(delay_wave_cycle_x[2]),
    .A2(_0605_),
    .ZN(_0206_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1018_ (.A1(cfg_phase90_offset_y[18]),
    .A2(_0575_),
    .ZN(_0207_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1019_ (.A1(cal_phase270_offset_x[10]),
    .A2(_0625_),
    .ZN(_0208_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1020_ (.A1(cfg_phase270_offset_y[10]),
    .A2(_0576_),
    .B1(_0585_),
    .B2(cfg_f_MEMS_fcw_x[2]),
    .C1(_0642_),
    .C2(cfg_phase0_offset_y[18]),
    .ZN(_0209_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1021_ (.A1(raw_edge1_x[10]),
    .A2(_0614_),
    .B1(_0619_),
    .B2(cal_phase270_offset_x[2]),
    .C(_0687_),
    .ZN(_0210_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1022_ (.A1(_0209_),
    .A2(_0210_),
    .ZN(_0211_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1023_ (.A1(cal_phase90_offset_y[18]),
    .A2(_0613_),
    .B1(_0631_),
    .B2(raw_edge3_x[18]),
    .C1(_0640_),
    .C2(delay_wave_cycle_y[2]),
    .ZN(_0212_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1024_ (.A1(votes_out_phase_x[2]),
    .A2(_0615_),
    .B1(_0627_),
    .B2(cfg_phase90_offset_x[10]),
    .ZN(_0213_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1025_ (.A1(cfg_f_MEMS_fcw_x[10]),
    .A2(_0567_),
    .B1(_0616_),
    .B2(state_o[2]),
    .ZN(_0214_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1026_ (.A1(_0206_),
    .A2(_0212_),
    .A3(_0213_),
    .A4(_0214_),
    .ZN(_0215_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1027_ (.A1(cfg_phase0_offset_x[10]),
    .A2(_0577_),
    .B1(_0579_),
    .B2(cal_phase0_offset_y[10]),
    .ZN(_0216_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1028_ (.A1(cal_phase0_offset_x[18]),
    .A2(_0599_),
    .B1(_0635_),
    .B2(cfg_phase90_offset_x[18]),
    .ZN(_0217_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1029_ (.A1(cal_phase270_offset_y[2]),
    .A2(_0587_),
    .B1(_0637_),
    .B2(cfg_phase270_offset_y[2]),
    .ZN(_0218_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1030_ (.A1(_0207_),
    .A2(_0217_),
    .A3(_0218_),
    .Z(_0219_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1031_ (.A1(raw_edge1_x[2]),
    .A2(_0569_),
    .B1(_0643_),
    .B2(cal_phase0_offset_y[2]),
    .ZN(_0220_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1032_ (.A1(cfg_phase90_offset_x[2]),
    .A2(_0611_),
    .B1(_0630_),
    .B2(cfg_phase0_offset_y[2]),
    .ZN(_0221_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1033_ (.A1(raw_edge2_y[10]),
    .A2(_0606_),
    .B1(_0622_),
    .B2(cal_phase90_offset_x[18]),
    .ZN(_0222_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1034_ (.A1(cal_phase0_offset_y[18]),
    .A2(_0551_),
    .B1(_0617_),
    .B2(cfg_f_MEMS_fcw_y[2]),
    .ZN(_0223_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1035_ (.A1(_0220_),
    .A2(_0221_),
    .A3(_0222_),
    .A4(_0223_),
    .Z(_0224_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1036_ (.A1(phase_state_y[0]),
    .A2(_0596_),
    .B1(_0597_),
    .B2(cal_phase90_offset_x[2]),
    .ZN(_0225_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1037_ (.A1(cfg_phase90_offset_y[2]),
    .A2(_0582_),
    .B1(_0603_),
    .B2(votes_in_phase_x[2]),
    .ZN(_0226_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1038_ (.A1(cal_phase90_offset_y[2]),
    .A2(_0601_),
    .B1(_0632_),
    .B2(cal_phase270_offset_x[18]),
    .ZN(_0227_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1039_ (.A1(cfg_phase0_offset_x[18]),
    .A2(_0584_),
    .B1(_0623_),
    .B2(votes_in_phase_y[2]),
    .ZN(_0228_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1040_ (.A1(_0225_),
    .A2(_0226_),
    .A3(_0227_),
    .A4(_0228_),
    .Z(_0229_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1041_ (.A1(_0216_),
    .A2(_0219_),
    .A3(_0224_),
    .A4(_0229_),
    .ZN(_0230_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1042_ (.A1(raw_edge2_x[10]),
    .A2(_0588_),
    .B1(_0638_),
    .B2(cal_phase0_offset_x[10]),
    .ZN(_0231_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1043_ (.A1(raw_edge1_y[18]),
    .A2(_0594_),
    .B1(_0598_),
    .B2(raw_edge3_y[10]),
    .ZN(_0232_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1044_ (.A1(raw_edge3_y[2]),
    .A2(_0583_),
    .B1(_0590_),
    .B2(raw_edge1_y[10]),
    .C1(_0592_),
    .C2(cfg_phase270_offset_x[18]),
    .ZN(_0233_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1045_ (.A1(_0208_),
    .A2(_0231_),
    .A3(_0232_),
    .A4(_0233_),
    .ZN(_0234_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1046_ (.A1(raw_edge3_y[18]),
    .A2(_0593_),
    .B1(_0633_),
    .B2(cfg_phase270_offset_x[2]),
    .C1(_0636_),
    .C2(cal_phase90_offset_y[10]),
    .ZN(_0235_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1047_ (.A1(raw_edge2_x[2]),
    .A2(_0564_),
    .B1(_0610_),
    .B2(phase_offset_imported),
    .C1(cfg_f_MEMS_fcw_y[10]),
    .C2(_0558_),
    .ZN(_0236_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1048_ (.A1(cfg_phase270_offset_y[18]),
    .A2(_0573_),
    .B1(_0595_),
    .B2(cfg_phase270_offset_x[10]),
    .ZN(_0237_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1049_ (.A1(_0235_),
    .A2(_0236_),
    .A3(_0237_),
    .ZN(_0238_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1050_ (.A1(raw_edge3_x[10]),
    .A2(_0608_),
    .B1(_0629_),
    .B2(cfg_phase90_offset_y[10]),
    .ZN(_0239_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1051_ (.A1(cal_phase0_offset_x[2]),
    .A2(_0604_),
    .B1(_0628_),
    .B2(raw_edge1_x[18]),
    .ZN(_0240_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1052_ (.A1(cal_timeout_x),
    .A2(_0609_),
    .B1(_0626_),
    .B2(cfg_phase0_offset_y[10]),
    .ZN(_0241_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1053_ (.A1(_0733_),
    .A2(_0239_),
    .A3(_0240_),
    .A4(_0241_),
    .ZN(_0242_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1054_ (.A1(votes_out_phase_y[2]),
    .A2(_0571_),
    .B1(_0620_),
    .B2(raw_edge2_y[18]),
    .ZN(_0243_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1055_ (.A1(raw_edge2_x[18]),
    .A2(_0612_),
    .B1(_0624_),
    .B2(raw_edge2_y[2]),
    .ZN(_0244_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1056_ (.A1(cal_phase270_offset_y[10]),
    .A2(_0586_),
    .B1(_0641_),
    .B2(cal_phase270_offset_y[18]),
    .ZN(_0245_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1057_ (.A1(raw_edge1_y[2]),
    .A2(_0634_),
    .B1(_0639_),
    .B2(raw_edge3_x[2]),
    .ZN(_0246_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1058_ (.A1(_0243_),
    .A2(_0244_),
    .A3(_0245_),
    .A4(_0246_),
    .ZN(_0247_));
 gf180mcu_fd_sc_mcu7t5v0__or4_1 _1059_ (.A1(_0234_),
    .A2(_0238_),
    .A3(_0242_),
    .A4(_0247_),
    .Z(_0248_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1060_ (.A1(_0211_),
    .A2(_0215_),
    .A3(_0230_),
    .A4(_0248_),
    .ZN(_0249_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1061_ (.A1(\tx_shift[1] ),
    .A2(_0686_),
    .ZN(_0250_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1062_ (.A1(_0553_),
    .A2(_0249_),
    .A3(_0250_),
    .B(_0732_),
    .ZN(_0037_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1063_ (.A1(\tx_shift[3] ),
    .A2(_0553_),
    .ZN(_0251_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1064_ (.A1(cfg_phase90_offset_y[19]),
    .A2(_0575_),
    .B(_0687_),
    .ZN(_0252_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1065_ (.A1(cal_phase270_offset_y[11]),
    .A2(_0586_),
    .B1(_0595_),
    .B2(cfg_phase270_offset_x[11]),
    .ZN(_0253_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1066_ (.A1(cal_phase270_offset_x[3]),
    .A2(_0619_),
    .B1(_0627_),
    .B2(cfg_phase90_offset_x[11]),
    .ZN(_0254_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1067_ (.A1(cfg_phase0_offset_x[11]),
    .A2(_0577_),
    .B1(_0608_),
    .B2(raw_edge3_x[11]),
    .ZN(_0255_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1068_ (.A1(raw_edge3_x[19]),
    .A2(_0631_),
    .B1(_0637_),
    .B2(cfg_phase270_offset_y[3]),
    .ZN(_0256_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1069_ (.A1(raw_edge2_x[3]),
    .A2(_0564_),
    .B1(_0610_),
    .B2(soft_rst),
    .ZN(_0257_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1070_ (.A1(cal_phase90_offset_x[3]),
    .A2(_0597_),
    .B1(_0614_),
    .B2(raw_edge1_x[11]),
    .ZN(_0258_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1071_ (.A1(cfg_f_MEMS_fcw_y[11]),
    .A2(_0558_),
    .B1(_0568_),
    .B2(cfg_phase0_offset_x[3]),
    .ZN(_0259_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1072_ (.A1(_0256_),
    .A2(_0257_),
    .A3(_0258_),
    .A4(_0259_),
    .ZN(_0260_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1073_ (.A1(cal_phase0_offset_x[3]),
    .A2(_0604_),
    .B1(_0635_),
    .B2(cfg_phase90_offset_x[19]),
    .ZN(_0261_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1074_ (.A1(cal_phase0_offset_y[3]),
    .A2(_0643_),
    .ZN(_0262_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1075_ (.A1(raw_edge1_x[3]),
    .A2(_0569_),
    .B1(_0587_),
    .B2(cal_phase270_offset_y[3]),
    .ZN(_0263_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1076_ (.A1(cfg_phase90_offset_y[3]),
    .A2(_0582_),
    .B1(_0601_),
    .B2(cal_phase90_offset_y[3]),
    .ZN(_0264_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1077_ (.A1(cfg_phase0_offset_x[19]),
    .A2(_0584_),
    .B1(_0634_),
    .B2(raw_edge1_y[3]),
    .ZN(_0265_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1078_ (.A1(votes_in_phase_x[3]),
    .A2(_0603_),
    .B1(_0612_),
    .B2(raw_edge2_x[19]),
    .ZN(_0266_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1079_ (.A1(cfg_phase0_offset_y[3]),
    .A2(_0630_),
    .B1(_0642_),
    .B2(cfg_phase0_offset_y[19]),
    .ZN(_0267_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1080_ (.A1(cal_phase90_offset_y[11]),
    .A2(_0636_),
    .B1(_0639_),
    .B2(raw_edge3_x[3]),
    .ZN(_0268_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1081_ (.A1(_0252_),
    .A2(_0266_),
    .A3(_0267_),
    .A4(_0268_),
    .ZN(_0269_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1082_ (.A1(cal_phase270_offset_x[19]),
    .A2(_0632_),
    .B1(_0638_),
    .B2(cal_phase0_offset_x[11]),
    .C1(raw_edge2_y[3]),
    .C2(_0624_),
    .ZN(_0270_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1083_ (.A1(votes_out_phase_y[3]),
    .A2(_0571_),
    .B1(_0609_),
    .B2(cal_timeout_y),
    .ZN(_0271_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1084_ (.A1(_0261_),
    .A2(_0262_),
    .A3(_0270_),
    .A4(_0271_),
    .ZN(_0272_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1085_ (.A1(_0269_),
    .A2(_0272_),
    .ZN(_0273_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1086_ (.A1(cfg_phase270_offset_y[19]),
    .A2(_0573_),
    .B1(_0629_),
    .B2(cfg_phase90_offset_y[11]),
    .ZN(_0274_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1087_ (.A1(cfg_phase90_offset_x[3]),
    .A2(_0611_),
    .B1(_0633_),
    .B2(cfg_phase270_offset_x[3]),
    .ZN(_0275_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1088_ (.A1(raw_edge1_y[11]),
    .A2(_0590_),
    .B1(_0593_),
    .B2(raw_edge3_y[19]),
    .ZN(_0276_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1089_ (.A1(_0274_),
    .A2(_0275_),
    .A3(_0276_),
    .ZN(_0277_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1090_ (.A1(cfg_f_MEMS_fcw_x[11]),
    .A2(_0567_),
    .B1(_0621_),
    .B2(cal_phase90_offset_x[11]),
    .C(_0277_),
    .ZN(_0278_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1091_ (.A1(cal_phase0_offset_y[19]),
    .A2(_0551_),
    .B1(_0583_),
    .B2(raw_edge3_y[3]),
    .ZN(_0279_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1092_ (.A1(cal_phase0_offset_x[19]),
    .A2(_0599_),
    .B1(_0622_),
    .B2(cal_phase90_offset_x[19]),
    .ZN(_0280_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1093_ (.A1(_0254_),
    .A2(_0264_),
    .A3(_0279_),
    .A4(_0280_),
    .ZN(_0281_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1094_ (.A1(raw_edge2_y[11]),
    .A2(_0606_),
    .B1(_0613_),
    .B2(cal_phase90_offset_y[19]),
    .ZN(_0282_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1095_ (.A1(_0255_),
    .A2(_0263_),
    .A3(_0265_),
    .A4(_0282_),
    .ZN(_0283_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1096_ (.A1(_0281_),
    .A2(_0283_),
    .ZN(_0284_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1097_ (.A1(raw_edge2_x[11]),
    .A2(_0588_),
    .B1(_0592_),
    .B2(cfg_phase270_offset_x[19]),
    .C1(_0605_),
    .C2(delay_wave_cycle_x[3]),
    .ZN(_0285_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1098_ (.A1(raw_edge1_y[19]),
    .A2(_0594_),
    .B1(_0626_),
    .B2(cfg_phase0_offset_y[11]),
    .C1(_0640_),
    .C2(delay_wave_cycle_y[3]),
    .ZN(_0286_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1099_ (.A1(votes_out_phase_x[3]),
    .A2(_0615_),
    .B1(_0641_),
    .B2(cal_phase270_offset_y[19]),
    .ZN(_0287_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1100_ (.A1(_0285_),
    .A2(_0286_),
    .A3(_0287_),
    .ZN(_0288_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1101_ (.A1(cal_phase270_offset_x[11]),
    .A2(_0625_),
    .B1(_0628_),
    .B2(raw_edge1_x[19]),
    .ZN(_0289_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1102_ (.A1(_0253_),
    .A2(_0289_),
    .ZN(_0290_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1103_ (.A1(cfg_phase270_offset_y[11]),
    .A2(_0576_),
    .B1(_0623_),
    .B2(votes_in_phase_y[3]),
    .ZN(_0291_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1104_ (.A1(cal_phase0_offset_y[11]),
    .A2(_0579_),
    .B1(_0620_),
    .B2(raw_edge2_y[19]),
    .ZN(_0292_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1105_ (.A1(phase_state_y[1]),
    .A2(_0596_),
    .B1(_0617_),
    .B2(cfg_f_MEMS_fcw_y[3]),
    .ZN(_0293_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1106_ (.A1(cfg_f_MEMS_fcw_x[3]),
    .A2(_0585_),
    .B1(_0598_),
    .B2(raw_edge3_y[11]),
    .ZN(_0294_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1107_ (.A1(_0291_),
    .A2(_0292_),
    .A3(_0293_),
    .A4(_0294_),
    .ZN(_0295_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1108_ (.A1(_0260_),
    .A2(_0288_),
    .A3(_0290_),
    .A4(_0295_),
    .ZN(_0296_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1109_ (.A1(_0273_),
    .A2(_0278_),
    .A3(_0284_),
    .A4(_0296_),
    .Z(_0297_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1110_ (.A1(\tx_shift[2] ),
    .A2(_0686_),
    .ZN(_0298_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1111_ (.A1(_0553_),
    .A2(_0297_),
    .A3(_0298_),
    .B(_0251_),
    .ZN(_0038_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1112_ (.A1(raw_edge2_y[20]),
    .A2(_0620_),
    .ZN(_0299_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1113_ (.A1(raw_edge3_y[20]),
    .A2(_0593_),
    .ZN(_0300_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1114_ (.A1(cfg_phase0_offset_x[12]),
    .A2(_0577_),
    .ZN(_0301_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1115_ (.A1(raw_edge1_y[12]),
    .A2(_0590_),
    .B1(_0628_),
    .B2(raw_edge1_x[20]),
    .C1(cfg_f_MEMS_fcw_y[12]),
    .C2(_0558_),
    .ZN(_0302_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1116_ (.A1(cal_phase90_offset_x[12]),
    .A2(_0621_),
    .B1(_0642_),
    .B2(cfg_phase0_offset_y[20]),
    .ZN(_0303_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1117_ (.A1(raw_edge2_y[4]),
    .A2(_0624_),
    .B1(_0635_),
    .B2(cfg_phase90_offset_x[20]),
    .ZN(_0304_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1118_ (.A1(_0300_),
    .A2(_0302_),
    .A3(_0303_),
    .A4(_0304_),
    .ZN(_0305_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1119_ (.A1(cfg_phase90_offset_y[4]),
    .A2(_0582_),
    .B1(_0627_),
    .B2(cfg_phase90_offset_x[12]),
    .C1(_0634_),
    .C2(raw_edge1_y[4]),
    .ZN(_0306_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1120_ (.A1(cal_phase0_offset_y[20]),
    .A2(_0551_),
    .B1(_0632_),
    .B2(cal_phase270_offset_x[20]),
    .ZN(_0307_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1121_ (.A1(cfg_f_MEMS_fcw_x[4]),
    .A2(_0585_),
    .B1(_0595_),
    .B2(cfg_phase270_offset_x[12]),
    .ZN(_0308_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1122_ (.A1(_0299_),
    .A2(_0306_),
    .A3(_0307_),
    .A4(_0308_),
    .ZN(_0309_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1123_ (.A1(cal_phase90_offset_y[4]),
    .A2(_0601_),
    .B1(_0625_),
    .B2(cal_phase270_offset_x[12]),
    .C1(_0640_),
    .C2(delay_wave_cycle_y[4]),
    .ZN(_0310_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1124_ (.A1(cal_phase90_offset_x[4]),
    .A2(_0597_),
    .B1(_0639_),
    .B2(raw_edge3_x[4]),
    .C1(cfg_phase0_offset_x[4]),
    .C2(_0568_),
    .ZN(_0311_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1125_ (.A1(raw_edge1_x[4]),
    .A2(_0569_),
    .B1(_0573_),
    .B2(cfg_phase270_offset_y[20]),
    .ZN(_0312_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1126_ (.A1(_0310_),
    .A2(_0311_),
    .A3(_0312_),
    .ZN(_0313_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1127_ (.A1(raw_edge3_x[20]),
    .A2(_0631_),
    .B1(_0637_),
    .B2(cfg_phase270_offset_y[4]),
    .C1(cfg_phase270_offset_x[20]),
    .C2(_0592_),
    .ZN(_0314_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1128_ (.A1(latch_error_x),
    .A2(_0609_),
    .B1(_0612_),
    .B2(raw_edge2_x[20]),
    .C1(_0641_),
    .C2(cal_phase270_offset_y[20]),
    .ZN(_0315_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1129_ (.A1(cal_phase0_offset_x[20]),
    .A2(_0599_),
    .B1(_0608_),
    .B2(raw_edge3_x[12]),
    .ZN(_0316_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1130_ (.A1(_0314_),
    .A2(_0315_),
    .A3(_0316_),
    .ZN(_0317_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1131_ (.A1(_0305_),
    .A2(_0309_),
    .A3(_0313_),
    .A4(_0317_),
    .ZN(_0318_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1132_ (.A1(cal_phase270_offset_y[4]),
    .A2(_0587_),
    .B1(_0638_),
    .B2(cal_phase0_offset_x[12]),
    .ZN(_0319_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1133_ (.A1(delay_wave_cycle_x[4]),
    .A2(_0605_),
    .B1(_0619_),
    .B2(cal_phase270_offset_x[4]),
    .ZN(_0320_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1134_ (.A1(raw_edge2_x[12]),
    .A2(_0588_),
    .B1(_0613_),
    .B2(cal_phase90_offset_y[20]),
    .ZN(_0321_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1135_ (.A1(cfg_phase90_offset_y[12]),
    .A2(_0629_),
    .B1(_0643_),
    .B2(cal_phase0_offset_y[4]),
    .ZN(_0322_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1136_ (.A1(raw_edge2_x[4]),
    .A2(_0564_),
    .B1(_0567_),
    .B2(cfg_f_MEMS_fcw_x[12]),
    .ZN(_0323_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1137_ (.A1(raw_edge1_y[20]),
    .A2(_0594_),
    .B1(_0622_),
    .B2(cal_phase90_offset_x[20]),
    .ZN(_0324_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1138_ (.A1(cal_phase0_offset_y[12]),
    .A2(_0579_),
    .B1(_0598_),
    .B2(raw_edge3_y[12]),
    .ZN(_0325_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1139_ (.A1(cfg_phase0_offset_y[12]),
    .A2(_0626_),
    .B1(_0633_),
    .B2(cfg_phase270_offset_x[4]),
    .ZN(_0326_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1140_ (.A1(cal_phase270_offset_y[12]),
    .A2(_0586_),
    .B1(_0604_),
    .B2(cal_phase0_offset_x[4]),
    .ZN(_0327_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1141_ (.A1(_0324_),
    .A2(_0325_),
    .A3(_0326_),
    .A4(_0327_),
    .ZN(_0328_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1142_ (.A1(raw_edge1_x[12]),
    .A2(_0614_),
    .B1(_0617_),
    .B2(cfg_f_MEMS_fcw_y[4]),
    .ZN(_0329_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1143_ (.A1(cfg_phase90_offset_y[20]),
    .A2(_0575_),
    .B1(_0630_),
    .B2(cfg_phase0_offset_y[4]),
    .ZN(_0330_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1144_ (.A1(_0686_),
    .A2(_0301_),
    .A3(_0329_),
    .A4(_0330_),
    .ZN(_0331_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1145_ (.A1(raw_edge3_y[4]),
    .A2(_0583_),
    .B1(_0611_),
    .B2(cfg_phase90_offset_x[4]),
    .ZN(_0332_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1146_ (.A1(_0319_),
    .A2(_0320_),
    .A3(_0321_),
    .A4(_0332_),
    .ZN(_0333_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1147_ (.A1(cfg_phase0_offset_x[20]),
    .A2(_0584_),
    .B1(_0636_),
    .B2(cal_phase90_offset_y[12]),
    .ZN(_0334_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1148_ (.A1(cfg_phase270_offset_y[12]),
    .A2(_0576_),
    .B1(_0606_),
    .B2(raw_edge2_y[12]),
    .ZN(_0335_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1149_ (.A1(_0322_),
    .A2(_0323_),
    .A3(_0334_),
    .A4(_0335_),
    .ZN(_0336_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1150_ (.A1(_0328_),
    .A2(_0331_),
    .A3(_0333_),
    .A4(_0336_),
    .ZN(_0337_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1151_ (.A1(_0499_),
    .A2(_0687_),
    .B1(_0318_),
    .B2(_0337_),
    .ZN(_0338_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1152_ (.I0(_0338_),
    .I1(\tx_shift[4] ),
    .S(_0553_),
    .Z(_0039_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1153_ (.A1(\tx_shift[5] ),
    .A2(_0553_),
    .ZN(_0339_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1154_ (.A1(cal_phase270_offset_x[13]),
    .A2(_0625_),
    .B1(_0639_),
    .B2(raw_edge3_x[5]),
    .ZN(_0340_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1155_ (.A1(latch_error_y),
    .A2(_0609_),
    .B1(_0626_),
    .B2(cfg_phase0_offset_y[13]),
    .ZN(_0341_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1156_ (.A1(cfg_f_MEMS_fcw_y[5]),
    .A2(_0617_),
    .B1(_0638_),
    .B2(cal_phase0_offset_x[13]),
    .ZN(_0342_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1157_ (.A1(cal_phase0_offset_y[13]),
    .A2(_0579_),
    .B1(_0643_),
    .B2(cal_phase0_offset_y[5]),
    .ZN(_0343_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1158_ (.A1(raw_edge2_x[5]),
    .A2(_0564_),
    .B1(_0576_),
    .B2(cfg_phase270_offset_y[13]),
    .ZN(_0344_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1159_ (.A1(cfg_phase90_offset_y[5]),
    .A2(_0582_),
    .B1(_0634_),
    .B2(raw_edge1_y[5]),
    .ZN(_0345_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1160_ (.A1(cfg_f_MEMS_fcw_y[13]),
    .A2(_0558_),
    .B1(_0629_),
    .B2(cfg_phase90_offset_y[13]),
    .ZN(_0346_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1161_ (.A1(cal_phase270_offset_y[13]),
    .A2(_0586_),
    .B1(_0624_),
    .B2(raw_edge2_y[5]),
    .ZN(_0347_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1162_ (.A1(_0345_),
    .A2(_0346_),
    .A3(_0347_),
    .ZN(_0348_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1163_ (.A1(cfg_phase0_offset_x[5]),
    .A2(_0568_),
    .B1(_0569_),
    .B2(raw_edge1_x[5]),
    .C(_0348_),
    .ZN(_0349_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1164_ (.A1(cal_phase270_offset_y[5]),
    .A2(_0587_),
    .B1(_0606_),
    .B2(raw_edge2_y[13]),
    .C1(cfg_f_MEMS_fcw_x[5]),
    .C2(_0585_),
    .ZN(_0350_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1165_ (.A1(cal_phase90_offset_y[5]),
    .A2(_0601_),
    .B1(_0633_),
    .B2(cfg_phase270_offset_x[5]),
    .ZN(_0351_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1166_ (.A1(_0350_),
    .A2(_0351_),
    .ZN(_0352_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1167_ (.A1(raw_edge3_y[5]),
    .A2(_0583_),
    .B1(_0588_),
    .B2(raw_edge2_x[13]),
    .C1(_0611_),
    .C2(cfg_phase90_offset_x[5]),
    .ZN(_0353_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1168_ (.A1(cfg_phase0_offset_x[13]),
    .A2(_0577_),
    .B1(_0637_),
    .B2(cfg_phase270_offset_y[5]),
    .ZN(_0354_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1169_ (.A1(cfg_f_MEMS_fcw_x[13]),
    .A2(_0567_),
    .B1(_0608_),
    .B2(raw_edge3_x[13]),
    .C1(cal_phase90_offset_y[13]),
    .C2(_0636_),
    .ZN(_0355_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1170_ (.A1(cal_phase90_offset_x[13]),
    .A2(_0621_),
    .B1(_0640_),
    .B2(delay_wave_cycle_y[5]),
    .C1(delay_wave_cycle_x[5]),
    .C2(_0605_),
    .ZN(_0356_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1171_ (.A1(_0353_),
    .A2(_0354_),
    .A3(_0355_),
    .A4(_0356_),
    .ZN(_0357_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1172_ (.A1(cal_phase270_offset_x[5]),
    .A2(_0619_),
    .B1(_0627_),
    .B2(cfg_phase90_offset_x[13]),
    .ZN(_0358_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1173_ (.A1(raw_edge3_y[13]),
    .A2(_0598_),
    .B1(_0604_),
    .B2(cal_phase0_offset_x[5]),
    .ZN(_0359_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1174_ (.A1(raw_edge1_y[13]),
    .A2(_0590_),
    .B1(_0614_),
    .B2(raw_edge1_x[13]),
    .ZN(_0360_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1175_ (.A1(_0342_),
    .A2(_0358_),
    .A3(_0359_),
    .A4(_0360_),
    .ZN(_0361_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1176_ (.A1(cfg_phase270_offset_x[13]),
    .A2(_0595_),
    .B1(_0597_),
    .B2(cal_phase90_offset_x[5]),
    .ZN(_0362_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1177_ (.A1(cfg_phase0_offset_y[5]),
    .A2(_0630_),
    .B(_0687_),
    .ZN(_0363_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1178_ (.A1(_0340_),
    .A2(_0341_),
    .A3(_0362_),
    .A4(_0363_),
    .ZN(_0364_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1179_ (.A1(_0352_),
    .A2(_0357_),
    .A3(_0361_),
    .A4(_0364_),
    .ZN(_0365_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1180_ (.A1(_0343_),
    .A2(_0344_),
    .A3(_0349_),
    .A4(_0365_),
    .Z(_0366_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1181_ (.A1(\tx_shift[4] ),
    .A2(_0686_),
    .ZN(_0367_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1182_ (.A1(_0553_),
    .A2(_0366_),
    .A3(_0367_),
    .B(_0339_),
    .ZN(_0040_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1183_ (.A1(\tx_shift[6] ),
    .A2(_0553_),
    .ZN(_0368_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1184_ (.A1(cal_phase0_offset_x[14]),
    .A2(_0638_),
    .ZN(_0369_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1185_ (.A1(cfg_f_MEMS_fcw_y[14]),
    .A2(_0558_),
    .B1(_0588_),
    .B2(raw_edge2_x[14]),
    .ZN(_0370_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1186_ (.A1(delay_wave_cycle_x[6]),
    .A2(_0605_),
    .ZN(_0371_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1187_ (.A1(cal_phase90_offset_x[6]),
    .A2(_0597_),
    .B1(_0614_),
    .B2(raw_edge1_x[14]),
    .C1(cfg_phase90_offset_y[6]),
    .C2(_0582_),
    .ZN(_0372_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1188_ (.A1(cal_phase90_offset_y[6]),
    .A2(_0601_),
    .B1(_0633_),
    .B2(cfg_phase270_offset_x[6]),
    .ZN(_0373_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1189_ (.A1(raw_edge1_x[6]),
    .A2(_0569_),
    .B1(_0640_),
    .B2(delay_wave_cycle_y[6]),
    .ZN(_0374_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1190_ (.A1(_0369_),
    .A2(_0372_),
    .A3(_0373_),
    .A4(_0374_),
    .ZN(_0375_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1191_ (.A1(raw_edge1_y[14]),
    .A2(_0590_),
    .B1(_0598_),
    .B2(raw_edge3_y[14]),
    .ZN(_0376_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1192_ (.A1(raw_edge2_y[6]),
    .A2(_0624_),
    .B1(_0625_),
    .B2(cal_phase270_offset_x[14]),
    .ZN(_0377_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1193_ (.A1(cfg_phase0_offset_x[14]),
    .A2(_0577_),
    .B1(_0606_),
    .B2(raw_edge2_y[14]),
    .ZN(_0378_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1194_ (.A1(cfg_f_MEMS_fcw_x[6]),
    .A2(_0585_),
    .B1(_0643_),
    .B2(cal_phase0_offset_y[6]),
    .ZN(_0379_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1195_ (.A1(cfg_phase270_offset_y[14]),
    .A2(_0576_),
    .B1(_0587_),
    .B2(cal_phase270_offset_y[6]),
    .ZN(_0380_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1196_ (.A1(_0376_),
    .A2(_0379_),
    .A3(_0380_),
    .ZN(_0381_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1197_ (.A1(cal_phase90_offset_y[14]),
    .A2(_0636_),
    .B1(_0639_),
    .B2(raw_edge3_x[6]),
    .C(_0381_),
    .ZN(_0382_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1198_ (.A1(cfg_f_MEMS_fcw_x[14]),
    .A2(_0567_),
    .B1(_0579_),
    .B2(cal_phase0_offset_y[14]),
    .ZN(_0383_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1199_ (.A1(cfg_phase0_offset_x[6]),
    .A2(_0568_),
    .B1(_0609_),
    .B2(cal_done_x),
    .ZN(_0384_));
 gf180mcu_fd_sc_mcu7t5v0__aoi222_1 _1200_ (.A1(cal_phase0_offset_x[6]),
    .A2(_0604_),
    .B1(_0617_),
    .B2(cfg_f_MEMS_fcw_y[6]),
    .C1(_0630_),
    .C2(cfg_phase0_offset_y[6]),
    .ZN(_0385_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1201_ (.A1(_0371_),
    .A2(_0383_),
    .A3(_0384_),
    .A4(_0385_),
    .ZN(_0386_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1202_ (.A1(cfg_phase270_offset_x[14]),
    .A2(_0595_),
    .B1(_0608_),
    .B2(raw_edge3_x[14]),
    .ZN(_0387_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1203_ (.A1(cfg_phase90_offset_x[6]),
    .A2(_0611_),
    .B1(_0619_),
    .B2(cal_phase270_offset_x[6]),
    .ZN(_0388_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1204_ (.A1(raw_edge3_y[6]),
    .A2(_0583_),
    .B1(_0586_),
    .B2(cal_phase270_offset_y[14]),
    .ZN(_0389_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1205_ (.A1(cfg_phase0_offset_y[14]),
    .A2(_0626_),
    .B1(_0634_),
    .B2(raw_edge1_y[6]),
    .ZN(_0390_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1206_ (.A1(_0370_),
    .A2(_0388_),
    .A3(_0389_),
    .A4(_0390_),
    .ZN(_0391_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1207_ (.A1(cfg_phase90_offset_y[14]),
    .A2(_0629_),
    .B(_0687_),
    .ZN(_0392_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1208_ (.A1(cal_phase90_offset_x[14]),
    .A2(_0621_),
    .B1(_0637_),
    .B2(cfg_phase270_offset_y[6]),
    .ZN(_0393_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1209_ (.A1(raw_edge2_x[6]),
    .A2(_0564_),
    .B1(_0627_),
    .B2(cfg_phase90_offset_x[14]),
    .ZN(_0394_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1210_ (.A1(_0387_),
    .A2(_0392_),
    .A3(_0393_),
    .A4(_0394_),
    .ZN(_0395_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1211_ (.A1(_0375_),
    .A2(_0386_),
    .A3(_0391_),
    .A4(_0395_),
    .ZN(_0396_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1212_ (.A1(_0377_),
    .A2(_0378_),
    .A3(_0382_),
    .A4(_0396_),
    .Z(_0397_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1213_ (.A1(\tx_shift[5] ),
    .A2(_0686_),
    .ZN(_0398_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1214_ (.A1(_0553_),
    .A2(_0397_),
    .A3(_0398_),
    .B(_0368_),
    .ZN(_0041_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1215_ (.A1(spi_miso),
    .A2(_0553_),
    .ZN(_0399_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1216_ (.A1(cfg_phase90_offset_y[7]),
    .A2(_0582_),
    .B1(_0627_),
    .B2(cfg_phase90_offset_x[15]),
    .ZN(_0400_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1217_ (.A1(cfg_phase270_offset_y[15]),
    .A2(_0576_),
    .B1(_0634_),
    .B2(raw_edge1_y[7]),
    .ZN(_0401_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1218_ (.A1(raw_edge2_x[15]),
    .A2(_0588_),
    .B1(_0633_),
    .B2(cfg_phase270_offset_x[7]),
    .ZN(_0402_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1219_ (.A1(cal_phase270_offset_y[15]),
    .A2(_0586_),
    .B1(_0626_),
    .B2(cfg_phase0_offset_y[15]),
    .ZN(_0403_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1220_ (.A1(cfg_f_MEMS_fcw_x[7]),
    .A2(_0585_),
    .B1(_0639_),
    .B2(raw_edge3_x[7]),
    .ZN(_0404_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1221_ (.A1(cal_phase270_offset_y[7]),
    .A2(_0587_),
    .B1(_0621_),
    .B2(cal_phase90_offset_x[15]),
    .ZN(_0405_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1222_ (.A1(cfg_f_MEMS_fcw_x[15]),
    .A2(_0567_),
    .B1(_0598_),
    .B2(raw_edge3_y[15]),
    .ZN(_0406_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1223_ (.A1(cfg_phase0_offset_x[15]),
    .A2(_0577_),
    .B1(_0609_),
    .B2(cal_done_y),
    .ZN(_0407_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1224_ (.A1(cfg_phase270_offset_x[15]),
    .A2(_0595_),
    .B1(_0637_),
    .B2(cfg_phase270_offset_y[7]),
    .ZN(_0408_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1225_ (.A1(_0406_),
    .A2(_0407_),
    .A3(_0408_),
    .ZN(_0409_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1226_ (.A1(raw_edge1_x[15]),
    .A2(_0614_),
    .B1(_0636_),
    .B2(cal_phase90_offset_y[15]),
    .C(_0409_),
    .ZN(_0410_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1227_ (.A1(cfg_f_MEMS_fcw_y[15]),
    .A2(_0558_),
    .B1(_0601_),
    .B2(cal_phase90_offset_y[7]),
    .ZN(_0411_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1228_ (.A1(raw_edge2_y[7]),
    .A2(_0624_),
    .B1(_0625_),
    .B2(cal_phase270_offset_x[15]),
    .ZN(_0412_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1229_ (.A1(cal_phase0_offset_y[15]),
    .A2(_0579_),
    .B1(_0611_),
    .B2(cfg_phase90_offset_x[7]),
    .ZN(_0413_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1230_ (.A1(cal_phase0_offset_x[7]),
    .A2(_0604_),
    .B1(_0608_),
    .B2(raw_edge3_x[15]),
    .ZN(_0414_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1231_ (.A1(cal_phase0_offset_x[15]),
    .A2(_0638_),
    .B1(_0643_),
    .B2(cal_phase0_offset_y[7]),
    .ZN(_0415_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1232_ (.A1(raw_edge2_x[7]),
    .A2(_0564_),
    .B1(_0583_),
    .B2(raw_edge3_y[7]),
    .ZN(_0416_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1233_ (.A1(_0404_),
    .A2(_0414_),
    .A3(_0415_),
    .A4(_0416_),
    .ZN(_0417_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1234_ (.A1(cal_phase90_offset_x[7]),
    .A2(_0597_),
    .B1(_0606_),
    .B2(raw_edge2_y[15]),
    .ZN(_0418_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1235_ (.A1(cfg_f_MEMS_fcw_y[7]),
    .A2(_0617_),
    .B(_0687_),
    .ZN(_0419_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1236_ (.A1(_0401_),
    .A2(_0411_),
    .A3(_0418_),
    .A4(_0419_),
    .ZN(_0420_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1237_ (.A1(raw_edge1_y[15]),
    .A2(_0590_),
    .B1(_0629_),
    .B2(cfg_phase90_offset_y[15]),
    .ZN(_0421_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1238_ (.A1(cfg_phase0_offset_x[7]),
    .A2(_0568_),
    .B1(_0605_),
    .B2(delay_wave_cycle_x[7]),
    .ZN(_0422_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1239_ (.A1(_0403_),
    .A2(_0412_),
    .A3(_0421_),
    .A4(_0422_),
    .ZN(_0423_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1240_ (.A1(cal_phase270_offset_x[7]),
    .A2(_0619_),
    .B1(_0630_),
    .B2(cfg_phase0_offset_y[7]),
    .ZN(_0424_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1241_ (.A1(raw_edge1_x[7]),
    .A2(_0569_),
    .B1(_0640_),
    .B2(delay_wave_cycle_y[7]),
    .ZN(_0425_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1242_ (.A1(_0402_),
    .A2(_0413_),
    .A3(_0424_),
    .A4(_0425_),
    .ZN(_0426_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1243_ (.A1(_0417_),
    .A2(_0420_),
    .A3(_0423_),
    .A4(_0426_),
    .ZN(_0427_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _1244_ (.A1(_0400_),
    .A2(_0405_),
    .A3(_0410_),
    .A4(_0427_),
    .Z(_0428_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1245_ (.A1(\tx_shift[6] ),
    .A2(_0686_),
    .ZN(_0429_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1246_ (.A1(_0553_),
    .A2(_0428_),
    .A3(_0429_),
    .B(_0399_),
    .ZN(_0042_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1247_ (.A1(\reg_wr_addr[0] ),
    .A2(_0513_),
    .ZN(_0430_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1248_ (.A1(_0494_),
    .A2(_0513_),
    .B(_0430_),
    .ZN(_0043_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1249_ (.A1(\reg_wr_addr[1] ),
    .A2(_0513_),
    .ZN(_0431_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1250_ (.A1(_0493_),
    .A2(_0513_),
    .B(_0431_),
    .ZN(_0044_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1251_ (.A1(\reg_wr_addr[2] ),
    .A2(_0513_),
    .ZN(_0432_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1252_ (.A1(_0495_),
    .A2(_0513_),
    .B(_0432_),
    .ZN(_0045_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1253_ (.A1(\reg_wr_addr[3] ),
    .A2(_0513_),
    .ZN(_0433_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1254_ (.A1(_0496_),
    .A2(_0513_),
    .B(_0433_),
    .ZN(_0046_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1255_ (.I0(\spi_addr[4] ),
    .I1(\reg_wr_addr[4] ),
    .S(_0513_),
    .Z(_0047_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1256_ (.A1(\reg_wr_addr[5] ),
    .A2(_0513_),
    .ZN(_0434_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1257_ (.A1(_0497_),
    .A2(_0513_),
    .B(_0434_),
    .ZN(_0048_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1258_ (.A1(\reg_wr_addr[6] ),
    .A2(_0513_),
    .ZN(_0435_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1259_ (.A1(_0498_),
    .A2(_0513_),
    .B(_0435_),
    .ZN(_0049_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1260_ (.I0(\mosi_sync[1] ),
    .I1(\reg_wr_data[0] ),
    .S(_0513_),
    .Z(_0050_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1261_ (.I0(\rx_shift[0] ),
    .I1(\reg_wr_data[1] ),
    .S(_0513_),
    .Z(_0051_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1262_ (.I0(\rx_shift[1] ),
    .I1(\reg_wr_data[2] ),
    .S(_0513_),
    .Z(_0052_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1263_ (.A1(\rx_shift[2] ),
    .A2(_0000_),
    .ZN(_0436_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1264_ (.A1(_0490_),
    .A2(_0000_),
    .B(_0436_),
    .ZN(_0053_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1265_ (.I0(\rx_shift[3] ),
    .I1(\reg_wr_data[4] ),
    .S(_0513_),
    .Z(_0054_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1266_ (.I0(\rx_shift[4] ),
    .I1(\reg_wr_data[5] ),
    .S(_0513_),
    .Z(_0055_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1267_ (.I0(\rx_shift[5] ),
    .I1(\reg_wr_data[6] ),
    .S(_0513_),
    .Z(_0056_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1268_ (.I0(\rx_shift[6] ),
    .I1(\reg_wr_data[7] ),
    .S(_0513_),
    .Z(_0057_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1269_ (.A1(\reg_wr_addr[3] ),
    .A2(\reg_wr_addr[2] ),
    .ZN(_0437_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1270_ (.A1(\reg_wr_addr[5] ),
    .A2(\reg_wr_addr[4] ),
    .A3(\reg_wr_addr[6] ),
    .ZN(_0438_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1271_ (.A1(reg_wr_en),
    .A2(_0438_),
    .ZN(_0439_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1272_ (.I(_0439_),
    .ZN(_0440_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1273_ (.A1(_0517_),
    .A2(_0437_),
    .A3(_0440_),
    .Z(_0441_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1274_ (.I0(cfg_f_MEMS_fcw_x[8]),
    .I1(\reg_wr_data[0] ),
    .S(_0441_),
    .Z(_0058_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1275_ (.I0(cfg_f_MEMS_fcw_x[9]),
    .I1(\reg_wr_data[1] ),
    .S(_0441_),
    .Z(_0059_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1276_ (.I0(cfg_f_MEMS_fcw_x[10]),
    .I1(\reg_wr_data[2] ),
    .S(_0441_),
    .Z(_0060_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1277_ (.A1(cfg_f_MEMS_fcw_x[11]),
    .A2(_0441_),
    .ZN(_0442_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1278_ (.A1(_0490_),
    .A2(_0441_),
    .B(_0442_),
    .ZN(_0061_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1279_ (.I0(cfg_f_MEMS_fcw_x[12]),
    .I1(\reg_wr_data[4] ),
    .S(_0441_),
    .Z(_0062_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1280_ (.I0(cfg_f_MEMS_fcw_x[13]),
    .I1(\reg_wr_data[5] ),
    .S(_0441_),
    .Z(_0063_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1281_ (.I0(cfg_f_MEMS_fcw_x[14]),
    .I1(\reg_wr_data[6] ),
    .S(_0441_),
    .Z(_0064_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1282_ (.I0(cfg_f_MEMS_fcw_x[15]),
    .I1(\reg_wr_data[7] ),
    .S(_0441_),
    .Z(_0065_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1283_ (.A1(_0514_),
    .A2(_0437_),
    .A3(_0440_),
    .Z(_0443_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1284_ (.I0(cfg_f_MEMS_fcw_x[0]),
    .I1(\reg_wr_data[0] ),
    .S(_0443_),
    .Z(_0066_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1285_ (.I0(cfg_f_MEMS_fcw_x[1]),
    .I1(\reg_wr_data[1] ),
    .S(_0443_),
    .Z(_0067_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1286_ (.I0(cfg_f_MEMS_fcw_x[2]),
    .I1(\reg_wr_data[2] ),
    .S(_0443_),
    .Z(_0068_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1287_ (.A1(cfg_f_MEMS_fcw_x[3]),
    .A2(_0443_),
    .ZN(_0444_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1288_ (.A1(_0490_),
    .A2(_0443_),
    .B(_0444_),
    .ZN(_0069_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1289_ (.I0(cfg_f_MEMS_fcw_x[4]),
    .I1(\reg_wr_data[4] ),
    .S(_0443_),
    .Z(_0070_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1290_ (.I0(cfg_f_MEMS_fcw_x[5]),
    .I1(\reg_wr_data[5] ),
    .S(_0443_),
    .Z(_0071_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1291_ (.I0(cfg_f_MEMS_fcw_x[6]),
    .I1(\reg_wr_data[6] ),
    .S(_0443_),
    .Z(_0072_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1292_ (.I0(cfg_f_MEMS_fcw_x[7]),
    .I1(\reg_wr_data[7] ),
    .S(_0443_),
    .Z(_0073_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1293_ (.A1(\reg_wr_addr[0] ),
    .A2(\reg_wr_addr[1] ),
    .ZN(_0445_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1294_ (.A1(_0504_),
    .A2(_0440_),
    .A3(_0445_),
    .Z(_0446_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1295_ (.I0(cfg_f_MEMS_fcw_y[8]),
    .I1(\reg_wr_data[0] ),
    .S(_0446_),
    .Z(_0074_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1296_ (.I0(cfg_f_MEMS_fcw_y[9]),
    .I1(\reg_wr_data[1] ),
    .S(_0446_),
    .Z(_0075_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1297_ (.I0(cfg_f_MEMS_fcw_y[10]),
    .I1(\reg_wr_data[2] ),
    .S(_0446_),
    .Z(_0076_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1298_ (.A1(cfg_f_MEMS_fcw_y[11]),
    .A2(_0446_),
    .ZN(_0447_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1299_ (.A1(_0490_),
    .A2(_0446_),
    .B(_0447_),
    .ZN(_0077_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1300_ (.I0(cfg_f_MEMS_fcw_y[12]),
    .I1(\reg_wr_data[4] ),
    .S(_0446_),
    .Z(_0078_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1301_ (.I0(cfg_f_MEMS_fcw_y[13]),
    .I1(\reg_wr_data[5] ),
    .S(_0446_),
    .Z(_0079_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1302_ (.I0(cfg_f_MEMS_fcw_y[14]),
    .I1(\reg_wr_data[6] ),
    .S(_0446_),
    .Z(_0080_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1303_ (.I0(cfg_f_MEMS_fcw_y[15]),
    .I1(\reg_wr_data[7] ),
    .S(_0446_),
    .Z(_0081_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1304_ (.A1(_0489_),
    .A2(_0505_),
    .A3(_0440_),
    .ZN(_0448_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1305_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_f_MEMS_fcw_y[0]),
    .S(_0448_),
    .Z(_0082_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1306_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_f_MEMS_fcw_y[1]),
    .S(_0448_),
    .Z(_0083_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1307_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_f_MEMS_fcw_y[2]),
    .S(_0448_),
    .Z(_0084_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1308_ (.A1(cfg_f_MEMS_fcw_y[3]),
    .A2(_0448_),
    .ZN(_0449_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1309_ (.A1(_0490_),
    .A2(_0448_),
    .B(_0449_),
    .ZN(_0085_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1310_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_f_MEMS_fcw_y[4]),
    .S(_0448_),
    .Z(_0086_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1311_ (.I0(\reg_wr_data[5] ),
    .I1(cfg_f_MEMS_fcw_y[5]),
    .S(_0448_),
    .Z(_0087_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1312_ (.I0(\reg_wr_data[6] ),
    .I1(cfg_f_MEMS_fcw_y[6]),
    .S(_0448_),
    .Z(_0088_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1313_ (.I0(\reg_wr_data[7] ),
    .I1(cfg_f_MEMS_fcw_y[7]),
    .S(_0448_),
    .Z(_0089_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1314_ (.A1(\reg_wr_addr[2] ),
    .A2(_0505_),
    .A3(_0440_),
    .ZN(_0450_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1315_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_phase0_offset_x[16]),
    .S(_0450_),
    .Z(_0090_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1316_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_phase0_offset_x[17]),
    .S(_0450_),
    .Z(_0091_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1317_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_phase0_offset_x[18]),
    .S(_0450_),
    .Z(_0092_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1318_ (.A1(cfg_phase0_offset_x[19]),
    .A2(_0450_),
    .ZN(_0451_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1319_ (.A1(_0490_),
    .A2(_0450_),
    .B(_0451_),
    .ZN(_0093_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1320_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_phase0_offset_x[20]),
    .S(_0450_),
    .Z(_0094_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1321_ (.A1(_0504_),
    .A2(_0514_),
    .A3(_0440_),
    .Z(_0452_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1322_ (.I0(cfg_phase0_offset_x[0]),
    .I1(\reg_wr_data[0] ),
    .S(_0452_),
    .Z(_0095_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1323_ (.I0(cfg_phase0_offset_x[1]),
    .I1(\reg_wr_data[1] ),
    .S(_0452_),
    .Z(_0096_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1324_ (.I0(cfg_phase0_offset_x[2]),
    .I1(\reg_wr_data[2] ),
    .S(_0452_),
    .Z(_0097_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1325_ (.A1(cfg_phase0_offset_x[3]),
    .A2(_0452_),
    .ZN(_0453_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1326_ (.A1(_0490_),
    .A2(_0452_),
    .B(_0453_),
    .ZN(_0098_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1327_ (.I0(cfg_phase0_offset_x[4]),
    .I1(\reg_wr_data[4] ),
    .S(_0452_),
    .Z(_0099_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1328_ (.I0(cfg_phase0_offset_x[5]),
    .I1(\reg_wr_data[5] ),
    .S(_0452_),
    .Z(_0100_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1329_ (.I0(cfg_phase0_offset_x[6]),
    .I1(\reg_wr_data[6] ),
    .S(_0452_),
    .Z(_0101_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1330_ (.I0(cfg_phase0_offset_x[7]),
    .I1(\reg_wr_data[7] ),
    .S(_0452_),
    .Z(_0102_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1331_ (.A1(_0504_),
    .A2(_0517_),
    .A3(_0440_),
    .Z(_0454_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1332_ (.I0(cfg_phase0_offset_x[8]),
    .I1(\reg_wr_data[0] ),
    .S(_0454_),
    .Z(_0103_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1333_ (.I0(cfg_phase0_offset_x[9]),
    .I1(\reg_wr_data[1] ),
    .S(_0454_),
    .Z(_0104_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1334_ (.I0(cfg_phase0_offset_x[10]),
    .I1(\reg_wr_data[2] ),
    .S(_0454_),
    .Z(_0105_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1335_ (.A1(cfg_phase0_offset_x[11]),
    .A2(_0454_),
    .ZN(_0455_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1336_ (.A1(_0490_),
    .A2(_0454_),
    .B(_0455_),
    .ZN(_0106_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1337_ (.I0(cfg_phase0_offset_x[12]),
    .I1(\reg_wr_data[4] ),
    .S(_0454_),
    .Z(_0107_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1338_ (.I0(cfg_phase0_offset_x[13]),
    .I1(\reg_wr_data[5] ),
    .S(_0454_),
    .Z(_0108_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1339_ (.I0(cfg_phase0_offset_x[14]),
    .I1(\reg_wr_data[6] ),
    .S(_0454_),
    .Z(_0109_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1340_ (.I0(cfg_phase0_offset_x[15]),
    .I1(\reg_wr_data[7] ),
    .S(_0454_),
    .Z(_0110_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1341_ (.A1(reg_wr_en),
    .A2(_0517_),
    .ZN(_0456_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1342_ (.A1(\reg_wr_addr[3] ),
    .A2(_0489_),
    .A3(_0438_),
    .ZN(_0457_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1343_ (.I(_0457_),
    .ZN(_0458_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1344_ (.A1(_0456_),
    .A2(_0457_),
    .ZN(_0459_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1345_ (.I0(cfg_phase90_offset_x[16]),
    .I1(\reg_wr_data[0] ),
    .S(_0459_),
    .Z(_0111_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1346_ (.I0(cfg_phase90_offset_x[17]),
    .I1(\reg_wr_data[1] ),
    .S(_0459_),
    .Z(_0112_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1347_ (.I0(cfg_phase90_offset_x[18]),
    .I1(\reg_wr_data[2] ),
    .S(_0459_),
    .Z(_0113_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1348_ (.A1(cfg_phase90_offset_x[19]),
    .A2(_0459_),
    .ZN(_0460_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1349_ (.A1(_0490_),
    .A2(_0459_),
    .B(_0460_),
    .ZN(_0114_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1350_ (.I0(cfg_phase90_offset_x[20]),
    .I1(\reg_wr_data[4] ),
    .S(_0459_),
    .Z(_0115_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1351_ (.A1(reg_wr_en),
    .A2(_0445_),
    .ZN(_0461_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1352_ (.A1(_0457_),
    .A2(_0461_),
    .ZN(_0462_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1353_ (.I0(cfg_phase90_offset_x[0]),
    .I1(\reg_wr_data[0] ),
    .S(_0462_),
    .Z(_0116_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1354_ (.I0(cfg_phase90_offset_x[1]),
    .I1(\reg_wr_data[1] ),
    .S(_0462_),
    .Z(_0117_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1355_ (.I0(cfg_phase90_offset_x[2]),
    .I1(\reg_wr_data[2] ),
    .S(_0462_),
    .Z(_0118_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1356_ (.A1(cfg_phase90_offset_x[3]),
    .A2(_0462_),
    .ZN(_0463_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1357_ (.A1(_0490_),
    .A2(_0462_),
    .B(_0463_),
    .ZN(_0119_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1358_ (.I0(cfg_phase90_offset_x[4]),
    .I1(\reg_wr_data[4] ),
    .S(_0462_),
    .Z(_0120_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1359_ (.I0(cfg_phase90_offset_x[5]),
    .I1(\reg_wr_data[5] ),
    .S(_0462_),
    .Z(_0121_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1360_ (.I0(cfg_phase90_offset_x[6]),
    .I1(\reg_wr_data[6] ),
    .S(_0462_),
    .Z(_0122_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1361_ (.I0(cfg_phase90_offset_x[7]),
    .I1(\reg_wr_data[7] ),
    .S(_0462_),
    .Z(_0123_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1362_ (.A1(reg_wr_en),
    .A2(_0514_),
    .ZN(_0464_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1363_ (.A1(_0457_),
    .A2(_0464_),
    .ZN(_0465_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1364_ (.I0(cfg_phase90_offset_x[8]),
    .I1(\reg_wr_data[0] ),
    .S(_0465_),
    .Z(_0124_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1365_ (.I0(cfg_phase90_offset_x[9]),
    .I1(\reg_wr_data[1] ),
    .S(_0465_),
    .Z(_0125_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1366_ (.I0(cfg_phase90_offset_x[10]),
    .I1(\reg_wr_data[2] ),
    .S(_0465_),
    .Z(_0126_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1367_ (.A1(cfg_phase90_offset_x[11]),
    .A2(_0465_),
    .ZN(_0466_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1368_ (.A1(_0490_),
    .A2(_0465_),
    .B(_0466_),
    .ZN(_0127_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1369_ (.I0(cfg_phase90_offset_x[12]),
    .I1(\reg_wr_data[4] ),
    .S(_0465_),
    .Z(_0128_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1370_ (.I0(cfg_phase90_offset_x[13]),
    .I1(\reg_wr_data[5] ),
    .S(_0465_),
    .Z(_0129_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1371_ (.I0(cfg_phase90_offset_x[14]),
    .I1(\reg_wr_data[6] ),
    .S(_0465_),
    .Z(_0130_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1372_ (.I0(cfg_phase90_offset_x[15]),
    .I1(\reg_wr_data[7] ),
    .S(_0465_),
    .Z(_0131_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1373_ (.A1(\reg_wr_addr[3] ),
    .A2(\reg_wr_addr[2] ),
    .A3(_0438_),
    .ZN(_0467_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1374_ (.I(_0467_),
    .ZN(_0468_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1375_ (.A1(_0464_),
    .A2(_0467_),
    .ZN(_0469_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1376_ (.I0(cfg_phase270_offset_x[16]),
    .I1(\reg_wr_data[0] ),
    .S(_0469_),
    .Z(_0132_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1377_ (.I0(cfg_phase270_offset_x[17]),
    .I1(\reg_wr_data[1] ),
    .S(_0469_),
    .Z(_0133_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1378_ (.I0(cfg_phase270_offset_x[18]),
    .I1(\reg_wr_data[2] ),
    .S(_0469_),
    .Z(_0134_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1379_ (.A1(cfg_phase270_offset_x[19]),
    .A2(_0469_),
    .ZN(_0470_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1380_ (.A1(_0490_),
    .A2(_0469_),
    .B(_0470_),
    .ZN(_0135_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1381_ (.I0(cfg_phase270_offset_x[20]),
    .I1(\reg_wr_data[4] ),
    .S(_0469_),
    .Z(_0136_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1382_ (.A1(\reg_wr_addr[0] ),
    .A2(\reg_wr_addr[1] ),
    .A3(reg_wr_en),
    .A4(_0458_),
    .ZN(_0471_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1383_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_phase270_offset_x[0]),
    .S(_0471_),
    .Z(_0137_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1384_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_phase270_offset_x[1]),
    .S(_0471_),
    .Z(_0138_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1385_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_phase270_offset_x[2]),
    .S(_0471_),
    .Z(_0139_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1386_ (.A1(cfg_phase270_offset_x[3]),
    .A2(_0471_),
    .ZN(_0472_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1387_ (.A1(_0490_),
    .A2(_0471_),
    .B(_0472_),
    .ZN(_0140_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1388_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_phase270_offset_x[4]),
    .S(_0471_),
    .Z(_0141_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1389_ (.I0(\reg_wr_data[5] ),
    .I1(cfg_phase270_offset_x[5]),
    .S(_0471_),
    .Z(_0142_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1390_ (.I0(\reg_wr_data[6] ),
    .I1(cfg_phase270_offset_x[6]),
    .S(_0471_),
    .Z(_0143_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1391_ (.I0(\reg_wr_data[7] ),
    .I1(cfg_phase270_offset_x[7]),
    .S(_0471_),
    .Z(_0144_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1392_ (.A1(_0461_),
    .A2(_0467_),
    .ZN(_0473_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1393_ (.I0(cfg_phase270_offset_x[8]),
    .I1(\reg_wr_data[0] ),
    .S(_0473_),
    .Z(_0145_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1394_ (.I0(cfg_phase270_offset_x[9]),
    .I1(\reg_wr_data[1] ),
    .S(_0473_),
    .Z(_0146_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1395_ (.I0(cfg_phase270_offset_x[10]),
    .I1(\reg_wr_data[2] ),
    .S(_0473_),
    .Z(_0147_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1396_ (.A1(cfg_phase270_offset_x[11]),
    .A2(_0473_),
    .ZN(_0474_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1397_ (.A1(_0490_),
    .A2(_0473_),
    .B(_0474_),
    .ZN(_0148_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1398_ (.I0(cfg_phase270_offset_x[12]),
    .I1(\reg_wr_data[4] ),
    .S(_0473_),
    .Z(_0149_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1399_ (.I0(cfg_phase270_offset_x[13]),
    .I1(\reg_wr_data[5] ),
    .S(_0473_),
    .Z(_0150_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1400_ (.I0(cfg_phase270_offset_x[14]),
    .I1(\reg_wr_data[6] ),
    .S(_0473_),
    .Z(_0151_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1401_ (.I0(cfg_phase270_offset_x[15]),
    .I1(\reg_wr_data[7] ),
    .S(_0473_),
    .Z(_0152_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _1402_ (.A1(\reg_wr_addr[3] ),
    .A2(\reg_wr_addr[2] ),
    .A3(_0501_),
    .A4(_0461_),
    .ZN(_0475_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1403_ (.I0(cfg_phase0_offset_y[16]),
    .I1(\reg_wr_data[0] ),
    .S(_0475_),
    .Z(_0153_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1404_ (.I0(cfg_phase0_offset_y[17]),
    .I1(\reg_wr_data[1] ),
    .S(_0475_),
    .Z(_0154_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1405_ (.I0(cfg_phase0_offset_y[18]),
    .I1(\reg_wr_data[2] ),
    .S(_0475_),
    .Z(_0155_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1406_ (.I0(cfg_phase0_offset_y[19]),
    .I1(\reg_wr_data[3] ),
    .S(_0475_),
    .Z(_0156_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1407_ (.I0(cfg_phase0_offset_y[20]),
    .I1(\reg_wr_data[4] ),
    .S(_0475_),
    .Z(_0157_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1408_ (.A1(_0456_),
    .A2(_0467_),
    .ZN(_0476_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1409_ (.I0(cfg_phase0_offset_y[0]),
    .I1(\reg_wr_data[0] ),
    .S(_0476_),
    .Z(_0158_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1410_ (.I0(cfg_phase0_offset_y[1]),
    .I1(\reg_wr_data[1] ),
    .S(_0476_),
    .Z(_0159_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1411_ (.I0(cfg_phase0_offset_y[2]),
    .I1(\reg_wr_data[2] ),
    .S(_0476_),
    .Z(_0160_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1412_ (.A1(cfg_phase0_offset_y[3]),
    .A2(_0476_),
    .ZN(_0477_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1413_ (.A1(_0490_),
    .A2(_0476_),
    .B(_0477_),
    .ZN(_0161_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1414_ (.I0(cfg_phase0_offset_y[4]),
    .I1(\reg_wr_data[4] ),
    .S(_0476_),
    .Z(_0162_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1415_ (.I0(cfg_phase0_offset_y[5]),
    .I1(\reg_wr_data[5] ),
    .S(_0476_),
    .Z(_0163_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1416_ (.I0(cfg_phase0_offset_y[6]),
    .I1(\reg_wr_data[6] ),
    .S(_0476_),
    .Z(_0164_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1417_ (.I0(cfg_phase0_offset_y[7]),
    .I1(\reg_wr_data[7] ),
    .S(_0476_),
    .Z(_0165_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _1418_ (.A1(\reg_wr_addr[0] ),
    .A2(\reg_wr_addr[1] ),
    .A3(reg_wr_en),
    .A4(_0468_),
    .ZN(_0478_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1419_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_phase0_offset_y[8]),
    .S(_0478_),
    .Z(_0166_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1420_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_phase0_offset_y[9]),
    .S(_0478_),
    .Z(_0167_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1421_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_phase0_offset_y[10]),
    .S(_0478_),
    .Z(_0168_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1422_ (.A1(cfg_phase0_offset_y[11]),
    .A2(_0478_),
    .ZN(_0479_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1423_ (.A1(_0490_),
    .A2(_0478_),
    .B(_0479_),
    .ZN(_0169_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1424_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_phase0_offset_y[12]),
    .S(_0478_),
    .Z(_0170_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1425_ (.I0(\reg_wr_data[5] ),
    .I1(cfg_phase0_offset_y[13]),
    .S(_0478_),
    .Z(_0171_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1426_ (.I0(\reg_wr_data[6] ),
    .I1(cfg_phase0_offset_y[14]),
    .S(_0478_),
    .Z(_0172_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1427_ (.I0(\reg_wr_data[7] ),
    .I1(cfg_phase0_offset_y[15]),
    .S(_0478_),
    .Z(_0173_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1428_ (.A1(_0489_),
    .A2(_0502_),
    .A3(_0505_),
    .Z(_0480_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1429_ (.I0(cfg_phase90_offset_y[16]),
    .I1(\reg_wr_data[0] ),
    .S(_0480_),
    .Z(_0174_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1430_ (.I0(cfg_phase90_offset_y[17]),
    .I1(\reg_wr_data[1] ),
    .S(_0480_),
    .Z(_0175_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1431_ (.I0(cfg_phase90_offset_y[18]),
    .I1(\reg_wr_data[2] ),
    .S(_0480_),
    .Z(_0176_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1432_ (.A1(cfg_phase90_offset_y[19]),
    .A2(_0480_),
    .ZN(_0481_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1433_ (.A1(_0490_),
    .A2(_0480_),
    .B(_0481_),
    .ZN(_0177_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1434_ (.I0(cfg_phase90_offset_y[20]),
    .I1(\reg_wr_data[4] ),
    .S(_0480_),
    .Z(_0178_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1435_ (.A1(_0502_),
    .A2(_0514_),
    .A3(_0437_),
    .ZN(_0482_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1436_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_phase90_offset_y[0]),
    .S(_0482_),
    .Z(_0179_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1437_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_phase90_offset_y[1]),
    .S(_0482_),
    .Z(_0180_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1438_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_phase90_offset_y[2]),
    .S(_0482_),
    .Z(_0181_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1439_ (.A1(cfg_phase90_offset_y[3]),
    .A2(_0482_),
    .ZN(_0483_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1440_ (.A1(_0490_),
    .A2(_0482_),
    .B(_0483_),
    .ZN(_0182_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1441_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_phase90_offset_y[4]),
    .S(_0482_),
    .Z(_0183_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1442_ (.I0(\reg_wr_data[5] ),
    .I1(cfg_phase90_offset_y[5]),
    .S(_0482_),
    .Z(_0184_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1443_ (.I0(\reg_wr_data[6] ),
    .I1(cfg_phase90_offset_y[6]),
    .S(_0482_),
    .Z(_0185_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1444_ (.I0(\reg_wr_data[7] ),
    .I1(cfg_phase90_offset_y[7]),
    .S(_0482_),
    .Z(_0186_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1445_ (.A1(_0502_),
    .A2(_0517_),
    .A3(_0437_),
    .ZN(_0484_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1446_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_phase90_offset_y[8]),
    .S(_0484_),
    .Z(_0187_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1447_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_phase90_offset_y[9]),
    .S(_0484_),
    .Z(_0188_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1448_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_phase90_offset_y[10]),
    .S(_0484_),
    .Z(_0189_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1449_ (.A1(cfg_phase90_offset_y[11]),
    .A2(_0484_),
    .ZN(_0485_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1450_ (.A1(_0490_),
    .A2(_0484_),
    .B(_0485_),
    .ZN(_0190_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1451_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_phase90_offset_y[12]),
    .S(_0484_),
    .Z(_0191_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1452_ (.I0(\reg_wr_data[5] ),
    .I1(cfg_phase90_offset_y[13]),
    .S(_0484_),
    .Z(_0192_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1453_ (.I0(\reg_wr_data[6] ),
    .I1(cfg_phase90_offset_y[14]),
    .S(_0484_),
    .Z(_0193_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1454_ (.I0(\reg_wr_data[7] ),
    .I1(cfg_phase90_offset_y[15]),
    .S(_0484_),
    .Z(_0194_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1455_ (.A1(_0502_),
    .A2(_0504_),
    .A3(_0445_),
    .ZN(_0486_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1456_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_phase270_offset_y[0]),
    .S(_0486_),
    .Z(_0195_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1457_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_phase270_offset_y[1]),
    .S(_0486_),
    .Z(_0196_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1458_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_phase270_offset_y[2]),
    .S(_0486_),
    .Z(_0197_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1459_ (.A1(cfg_phase270_offset_y[3]),
    .A2(_0486_),
    .ZN(_0487_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1460_ (.A1(_0490_),
    .A2(_0486_),
    .B(_0487_),
    .ZN(_0198_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1461_ (.I0(\reg_wr_data[4] ),
    .I1(cfg_phase270_offset_y[4]),
    .S(_0486_),
    .Z(_0199_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1462_ (.I0(\reg_wr_data[5] ),
    .I1(cfg_phase270_offset_y[5]),
    .S(_0486_),
    .Z(_0200_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1463_ (.I0(\reg_wr_data[6] ),
    .I1(cfg_phase270_offset_y[6]),
    .S(_0486_),
    .Z(_0201_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1464_ (.I0(\reg_wr_data[7] ),
    .I1(cfg_phase270_offset_y[7]),
    .S(_0486_),
    .Z(_0202_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1465_ (.I0(\reg_wr_data[0] ),
    .I1(cfg_phase270_offset_y[8]),
    .S(_0515_),
    .Z(_0203_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1466_ (.I0(\reg_wr_data[1] ),
    .I1(cfg_phase270_offset_y[9]),
    .S(_0515_),
    .Z(_0204_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _1467_ (.I0(\reg_wr_data[2] ),
    .I1(cfg_phase270_offset_y[10]),
    .S(_0515_),
    .Z(_0205_));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1468_ (.D(_0138_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1469_ (.D(_0139_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1470_ (.D(_0140_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1471_ (.D(_0141_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1472_ (.D(_0142_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1473_ (.D(_0143_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1474_ (.D(_0144_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1475_ (.D(_0145_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1476_ (.D(_0146_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1477_ (.D(_0147_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1478_ (.D(_0148_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1479_ (.D(_0149_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1480_ (.D(_0150_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1481_ (.D(_0151_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1482_ (.D(_0152_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1483_ (.D(_0153_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1484_ (.D(_0154_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1485_ (.D(_0155_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1486_ (.D(_0156_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1487_ (.D(_0157_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1488_ (.D(_0158_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1489_ (.D(_0159_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1490_ (.D(_0160_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1491_ (.D(_0161_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1492_ (.D(_0162_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1493_ (.D(_0163_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1494_ (.D(_0164_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1495_ (.D(_0165_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1496_ (.D(_0166_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1497_ (.D(_0167_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1498_ (.D(_0168_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1499_ (.D(_0169_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1500_ (.D(_0170_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1501_ (.D(_0171_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1502_ (.D(_0172_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1503_ (.D(_0173_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_y[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1504_ (.D(_0174_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1505_ (.D(_0175_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1506_ (.D(_0176_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1507_ (.D(_0177_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1508_ (.D(_0178_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1509_ (.D(_0179_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1510_ (.D(_0180_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1511_ (.D(_0181_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1512_ (.D(_0182_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1513_ (.D(_0183_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1514_ (.D(_0184_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1515_ (.D(_0185_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1516_ (.D(_0186_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1517_ (.D(_0187_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1518_ (.D(_0188_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1519_ (.D(_0189_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1520_ (.D(_0190_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1521_ (.D(_0191_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1522_ (.D(_0192_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1523_ (.D(_0193_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1524_ (.D(_0194_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_y[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1525_ (.D(_0195_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1526_ (.D(_0196_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1527_ (.D(_0197_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1528_ (.D(_0198_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1529_ (.D(_0199_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1530_ (.D(_0200_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1531_ (.D(_0201_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1532_ (.D(_0202_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1533_ (.D(_0203_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1534_ (.D(_0204_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1535_ (.D(_0205_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1536_ (.D(_0003_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1537_ (.D(_0004_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1538_ (.D(_0005_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1539_ (.D(_0006_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1540_ (.D(_0007_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1541_ (.D(_0008_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1542_ (.D(_0009_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1543_ (.D(_0010_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1544_ (.D(_0011_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1545_ (.D(_0012_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_y[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1546_ (.D(_0013_),
    .RN(rst_n),
    .CLK(clk),
    .Q(boot_complete));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1547_ (.D(_0014_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_done));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1548_ (.D(_0015_),
    .RN(rst_n),
    .CLK(clk),
    .Q(phase_offset_imported));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1549_ (.D(_0016_),
    .RN(rst_n),
    .CLK(clk),
    .Q(spi_state));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1550_ (.D(_0017_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\bit_cnt[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1551_ (.D(_0018_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\bit_cnt[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1552_ (.D(_0019_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\bit_cnt[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1553_ (.D(_0020_),
    .RN(rst_n),
    .CLK(clk),
    .Q(rw_n));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1554_ (.D(_0021_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\spi_addr[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1555_ (.D(_0022_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\spi_addr[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1556_ (.D(_0023_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\spi_addr[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1557_ (.D(_0024_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\spi_addr[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1558_ (.D(_0025_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\spi_addr[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1559_ (.D(_0026_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\spi_addr[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1560_ (.D(_0027_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\spi_addr[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1561_ (.D(_0028_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\rx_shift[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1562_ (.D(_0029_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\rx_shift[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1563_ (.D(_0030_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\rx_shift[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1564_ (.D(_0031_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\rx_shift[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1565_ (.D(_0032_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\rx_shift[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1566_ (.D(_0033_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\rx_shift[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1567_ (.D(_0034_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\rx_shift[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1568_ (.D(_0035_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\tx_shift[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1569_ (.D(_0036_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\tx_shift[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1570_ (.D(_0037_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\tx_shift[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1571_ (.D(_0038_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\tx_shift[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1572_ (.D(_0039_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\tx_shift[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1573_ (.D(_0040_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\tx_shift[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1574_ (.D(_0041_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\tx_shift[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1575_ (.D(_0042_),
    .RN(rst_n),
    .CLK(clk),
    .Q(spi_miso));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1576_ (.D(_0043_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_addr[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1577_ (.D(_0044_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_addr[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1578_ (.D(_0045_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_addr[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1579_ (.D(_0046_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_addr[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1580_ (.D(_0047_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_addr[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1581_ (.D(_0048_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_addr[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1582_ (.D(_0049_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_addr[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1583_ (.D(_0050_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_data[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1584_ (.D(_0051_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_data[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1585_ (.D(_0052_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_data[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1586_ (.D(_0053_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_data[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1587_ (.D(_0054_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_data[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1588_ (.D(_0055_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_data[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1589_ (.D(_0056_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_data[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1590_ (.D(_0057_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\reg_wr_data[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1591_ (.D(_0001_),
    .RN(rst_n),
    .CLK(clk),
    .Q(soft_rst));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1592_ (.D(_0002_),
    .RN(rst_n),
    .CLK(clk),
    .Q(spi_miso_oe));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1593_ (.D(_0000_),
    .RN(rst_n),
    .CLK(clk),
    .Q(reg_wr_en));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1594_ (.D(\sclk_sync[1] ),
    .RN(rst_n),
    .CLK(clk),
    .Q(sclk_d));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1595_ (.D(spi_cs_n),
    .SETN(rst_n),
    .CLK(clk),
    .Q(\cs_sync[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _1596_ (.D(\cs_sync[0] ),
    .SETN(rst_n),
    .CLK(clk),
    .Q(cs_n_sync));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1597_ (.D(spi_sclk),
    .RN(rst_n),
    .CLK(clk),
    .Q(\sclk_sync[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1598_ (.D(\sclk_sync[0] ),
    .RN(rst_n),
    .CLK(clk),
    .Q(\sclk_sync[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1599_ (.D(spi_mosi),
    .RN(rst_n),
    .CLK(clk),
    .Q(\mosi_sync[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1600_ (.D(\mosi_sync[0] ),
    .RN(rst_n),
    .CLK(clk),
    .Q(\mosi_sync[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1601_ (.D(_0058_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1602_ (.D(_0059_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1603_ (.D(_0060_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1604_ (.D(_0061_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1605_ (.D(_0062_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1606_ (.D(_0063_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1607_ (.D(_0064_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1608_ (.D(_0065_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1609_ (.D(_0066_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1610_ (.D(_0067_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1611_ (.D(_0068_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1612_ (.D(_0069_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1613_ (.D(_0070_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1614_ (.D(_0071_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1615_ (.D(_0072_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1616_ (.D(_0073_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_x[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1617_ (.D(_0074_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1618_ (.D(_0075_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1619_ (.D(_0076_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1620_ (.D(_0077_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1621_ (.D(_0078_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1622_ (.D(_0079_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1623_ (.D(_0080_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1624_ (.D(_0081_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1625_ (.D(_0082_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1626_ (.D(_0083_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1627_ (.D(_0084_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1628_ (.D(_0085_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1629_ (.D(_0086_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1630_ (.D(_0087_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1631_ (.D(_0088_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1632_ (.D(_0089_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_f_MEMS_fcw_y[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1633_ (.D(_0090_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1634_ (.D(_0091_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1635_ (.D(_0092_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1636_ (.D(_0093_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1637_ (.D(_0094_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1638_ (.D(_0095_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1639_ (.D(_0096_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1640_ (.D(_0097_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1641_ (.D(_0098_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1642_ (.D(_0099_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1643_ (.D(_0100_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1644_ (.D(_0101_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1645_ (.D(_0102_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1646_ (.D(_0103_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1647_ (.D(_0104_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1648_ (.D(_0105_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1649_ (.D(_0106_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1650_ (.D(_0107_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1651_ (.D(_0108_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1652_ (.D(_0109_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1653_ (.D(_0110_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase0_offset_x[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1654_ (.D(_0111_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1655_ (.D(_0112_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1656_ (.D(_0113_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1657_ (.D(_0114_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1658_ (.D(_0115_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1659_ (.D(_0116_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1660_ (.D(_0117_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1661_ (.D(_0118_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1662_ (.D(_0119_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1663_ (.D(_0120_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1664_ (.D(_0121_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1665_ (.D(_0122_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1666_ (.D(_0123_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1667_ (.D(_0124_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1668_ (.D(_0125_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1669_ (.D(_0126_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1670_ (.D(_0127_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1671_ (.D(_0128_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1672_ (.D(_0129_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1673_ (.D(_0130_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1674_ (.D(_0131_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase90_offset_x[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1675_ (.D(_0132_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1676_ (.D(_0133_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1677_ (.D(_0134_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1678_ (.D(_0135_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1679_ (.D(_0136_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _1680_ (.D(_0137_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cfg_phase270_offset_x[0]));
endmodule
