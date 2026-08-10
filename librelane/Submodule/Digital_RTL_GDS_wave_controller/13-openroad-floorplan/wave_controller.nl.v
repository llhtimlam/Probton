module wave_controller (cal_dir,
    cal_done,
    cal_start,
    cal_timeout,
    cfg_done,
    clk,
    comp,
    latch_error,
    latch_phase270,
    latch_phase270_ack,
    latch_phase90,
    latch_phase90_ack,
    mems_drv,
    ref_wave,
    rst_n,
    soft_rst_n,
    cal_phase0_offset,
    cal_phase270_offset,
    cal_phase90_offset,
    cfg_f_MEMS_fcw,
    cfg_phase0_offset,
    cfg_phase270_offset,
    cfg_phase90_offset,
    delay_wave_cycle,
    raw_edge1,
    raw_edge2,
    raw_edge3);
 output cal_dir;
 output cal_done;
 input cal_start;
 output cal_timeout;
 input cfg_done;
 input clk;
 input comp;
 output latch_error;
 output latch_phase270;
 input latch_phase270_ack;
 output latch_phase90;
 input latch_phase90_ack;
 output mems_drv;
 output ref_wave;
 input rst_n;
 input soft_rst_n;
 output [20:0] cal_phase0_offset;
 output [20:0] cal_phase270_offset;
 output [20:0] cal_phase90_offset;
 input [15:0] cfg_f_MEMS_fcw;
 input [20:0] cfg_phase0_offset;
 input [20:0] cfg_phase270_offset;
 input [20:0] cfg_phase90_offset;
 output [7:0] delay_wave_cycle;
 output [20:0] raw_edge1;
 output [20:0] raw_edge2;
 output [20:0] raw_edge3;

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
 wire _0734_;
 wire _0735_;
 wire _0736_;
 wire _0737_;
 wire _0738_;
 wire _0739_;
 wire _0740_;
 wire _0741_;
 wire _0742_;
 wire _0743_;
 wire _0744_;
 wire _0745_;
 wire _0746_;
 wire _0747_;
 wire _0748_;
 wire _0749_;
 wire _0750_;
 wire _0751_;
 wire _0752_;
 wire _0753_;
 wire _0754_;
 wire _0755_;
 wire _0756_;
 wire _0757_;
 wire _0758_;
 wire _0759_;
 wire _0760_;
 wire _0761_;
 wire _0762_;
 wire _0763_;
 wire _0764_;
 wire _0765_;
 wire _0766_;
 wire _0767_;
 wire _0768_;
 wire _0769_;
 wire _0770_;
 wire _0771_;
 wire _0772_;
 wire _0773_;
 wire _0774_;
 wire _0775_;
 wire _0776_;
 wire _0777_;
 wire _0778_;
 wire _0779_;
 wire _0780_;
 wire _0781_;
 wire _0782_;
 wire _0783_;
 wire _0784_;
 wire _0785_;
 wire _0786_;
 wire _0787_;
 wire _0788_;
 wire _0789_;
 wire _0790_;
 wire _0791_;
 wire _0792_;
 wire _0793_;
 wire _0794_;
 wire _0795_;
 wire _0796_;
 wire _0797_;
 wire _0798_;
 wire _0799_;
 wire _0800_;
 wire _0801_;
 wire _0802_;
 wire _0803_;
 wire _0804_;
 wire _0805_;
 wire _0806_;
 wire _0807_;
 wire _0808_;
 wire _0809_;
 wire _0810_;
 wire _0811_;
 wire _0812_;
 wire _0813_;
 wire _0814_;
 wire _0815_;
 wire _0816_;
 wire _0817_;
 wire _0818_;
 wire _0819_;
 wire _0820_;
 wire _0821_;
 wire _0822_;
 wire _0823_;
 wire _0824_;
 wire _0825_;
 wire _0826_;
 wire _0827_;
 wire _0828_;
 wire _0829_;
 wire _0830_;
 wire _0831_;
 wire _0832_;
 wire _0833_;
 wire _0834_;
 wire _0835_;
 wire _0836_;
 wire _0837_;
 wire _0838_;
 wire _0839_;
 wire _0840_;
 wire _0841_;
 wire _0842_;
 wire _0843_;
 wire _0844_;
 wire _0845_;
 wire _0846_;
 wire _0847_;
 wire _0848_;
 wire _0849_;
 wire _0850_;
 wire _0851_;
 wire _0852_;
 wire _0853_;
 wire _0854_;
 wire _0855_;
 wire _0856_;
 wire _0857_;
 wire _0858_;
 wire _0859_;
 wire _0860_;
 wire _0861_;
 wire _0862_;
 wire _0863_;
 wire _0864_;
 wire _0865_;
 wire _0866_;
 wire _0867_;
 wire _0868_;
 wire _0869_;
 wire _0870_;
 wire _0871_;
 wire _0872_;
 wire _0873_;
 wire _0874_;
 wire _0875_;
 wire _0876_;
 wire _0877_;
 wire _0878_;
 wire _0879_;
 wire _0880_;
 wire _0881_;
 wire _0882_;
 wire _0883_;
 wire _0884_;
 wire _0885_;
 wire _0886_;
 wire _0887_;
 wire _0888_;
 wire _0889_;
 wire _0890_;
 wire _0891_;
 wire _0892_;
 wire _0893_;
 wire _0894_;
 wire _0895_;
 wire _0896_;
 wire _0897_;
 wire _0898_;
 wire _0899_;
 wire _0900_;
 wire _0901_;
 wire _0902_;
 wire _0903_;
 wire _0904_;
 wire _0905_;
 wire _0906_;
 wire _0907_;
 wire _0908_;
 wire _0909_;
 wire _0910_;
 wire _0911_;
 wire _0912_;
 wire _0913_;
 wire _0914_;
 wire _0915_;
 wire _0916_;
 wire _0917_;
 wire _0918_;
 wire _0919_;
 wire _0920_;
 wire _0921_;
 wire _0922_;
 wire _0923_;
 wire _0924_;
 wire _0925_;
 wire _0926_;
 wire _0927_;
 wire _0928_;
 wire _0929_;
 wire _0930_;
 wire _0931_;
 wire _0932_;
 wire _0933_;
 wire _0934_;
 wire _0935_;
 wire _0936_;
 wire _0937_;
 wire _0938_;
 wire _0939_;
 wire _0940_;
 wire _0941_;
 wire _0942_;
 wire _0943_;
 wire _0944_;
 wire _0945_;
 wire _0946_;
 wire _0947_;
 wire _0948_;
 wire _0949_;
 wire _0950_;
 wire _0951_;
 wire _0952_;
 wire _0953_;
 wire _0954_;
 wire _0955_;
 wire _0956_;
 wire _0957_;
 wire _0958_;
 wire _0959_;
 wire _0960_;
 wire _0961_;
 wire _0962_;
 wire _0963_;
 wire _0964_;
 wire _0965_;
 wire _0966_;
 wire _0967_;
 wire _0968_;
 wire _0969_;
 wire _0970_;
 wire _0971_;
 wire _0972_;
 wire _0973_;
 wire _0974_;
 wire _0975_;
 wire _0976_;
 wire _0977_;
 wire _0978_;
 wire _0979_;
 wire _0980_;
 wire _0981_;
 wire _0982_;
 wire _0983_;
 wire _0984_;
 wire _0985_;
 wire _0986_;
 wire _0987_;
 wire _0988_;
 wire _0989_;
 wire _0990_;
 wire _0991_;
 wire _0992_;
 wire _0993_;
 wire _0994_;
 wire _0995_;
 wire _0996_;
 wire _0997_;
 wire _0998_;
 wire _0999_;
 wire _1000_;
 wire _1001_;
 wire _1002_;
 wire _1003_;
 wire _1004_;
 wire _1005_;
 wire _1006_;
 wire _1007_;
 wire _1008_;
 wire _1009_;
 wire _1010_;
 wire _1011_;
 wire _1012_;
 wire _1013_;
 wire _1014_;
 wire _1015_;
 wire _1016_;
 wire _1017_;
 wire _1018_;
 wire _1019_;
 wire _1020_;
 wire _1021_;
 wire _1022_;
 wire _1023_;
 wire _1024_;
 wire _1025_;
 wire _1026_;
 wire _1027_;
 wire _1028_;
 wire _1029_;
 wire _1030_;
 wire _1031_;
 wire _1032_;
 wire _1033_;
 wire _1034_;
 wire _1035_;
 wire _1036_;
 wire _1037_;
 wire _1038_;
 wire _1039_;
 wire _1040_;
 wire _1041_;
 wire _1042_;
 wire _1043_;
 wire _1044_;
 wire _1045_;
 wire _1046_;
 wire _1047_;
 wire _1048_;
 wire _1049_;
 wire _1050_;
 wire _1051_;
 wire _1052_;
 wire _1053_;
 wire _1054_;
 wire _1055_;
 wire _1056_;
 wire _1057_;
 wire _1058_;
 wire _1059_;
 wire _1060_;
 wire _1061_;
 wire _1062_;
 wire _1063_;
 wire _1064_;
 wire _1065_;
 wire _1066_;
 wire _1067_;
 wire _1068_;
 wire _1069_;
 wire _1070_;
 wire _1071_;
 wire _1072_;
 wire _1073_;
 wire _1074_;
 wire _1075_;
 wire _1076_;
 wire _1077_;
 wire _1078_;
 wire _1079_;
 wire _1080_;
 wire _1081_;
 wire _1082_;
 wire _1083_;
 wire _1084_;
 wire _1085_;
 wire _1086_;
 wire _1087_;
 wire _1088_;
 wire _1089_;
 wire _1090_;
 wire _1091_;
 wire _1092_;
 wire _1093_;
 wire _1094_;
 wire _1095_;
 wire _1096_;
 wire _1097_;
 wire _1098_;
 wire _1099_;
 wire _1100_;
 wire _1101_;
 wire _1102_;
 wire _1103_;
 wire _1104_;
 wire _1105_;
 wire _1106_;
 wire _1107_;
 wire _1108_;
 wire _1109_;
 wire _1110_;
 wire _1111_;
 wire _1112_;
 wire _1113_;
 wire _1114_;
 wire _1115_;
 wire _1116_;
 wire _1117_;
 wire _1118_;
 wire _1119_;
 wire _1120_;
 wire _1121_;
 wire _1122_;
 wire _1123_;
 wire _1124_;
 wire _1125_;
 wire _1126_;
 wire _1127_;
 wire _1128_;
 wire _1129_;
 wire _1130_;
 wire _1131_;
 wire _1132_;
 wire _1133_;
 wire _1134_;
 wire _1135_;
 wire _1136_;
 wire _1137_;
 wire _1138_;
 wire _1139_;
 wire _1140_;
 wire _1141_;
 wire _1142_;
 wire _1143_;
 wire _1144_;
 wire _1145_;
 wire _1146_;
 wire _1147_;
 wire _1148_;
 wire _1149_;
 wire _1150_;
 wire _1151_;
 wire _1152_;
 wire _1153_;
 wire _1154_;
 wire _1155_;
 wire _1156_;
 wire _1157_;
 wire _1158_;
 wire _1159_;
 wire _1160_;
 wire _1161_;
 wire _1162_;
 wire _1163_;
 wire _1164_;
 wire _1165_;
 wire _1166_;
 wire _1167_;
 wire _1168_;
 wire _1169_;
 wire _1170_;
 wire _1171_;
 wire _1172_;
 wire _1173_;
 wire _1174_;
 wire _1175_;
 wire _1176_;
 wire _1177_;
 wire _1178_;
 wire _1179_;
 wire _1180_;
 wire _1181_;
 wire _1182_;
 wire _1183_;
 wire _1184_;
 wire _1185_;
 wire _1186_;
 wire _1187_;
 wire _1188_;
 wire _1189_;
 wire _1190_;
 wire _1191_;
 wire _1192_;
 wire _1193_;
 wire _1194_;
 wire _1195_;
 wire _1196_;
 wire _1197_;
 wire _1198_;
 wire _1199_;
 wire _1200_;
 wire _1201_;
 wire _1202_;
 wire _1203_;
 wire _1204_;
 wire _1205_;
 wire _1206_;
 wire _1207_;
 wire _1208_;
 wire _1209_;
 wire _1210_;
 wire _1211_;
 wire _1212_;
 wire _1213_;
 wire _1214_;
 wire _1215_;
 wire _1216_;
 wire _1217_;
 wire _1218_;
 wire _1219_;
 wire _1220_;
 wire _1221_;
 wire _1222_;
 wire _1223_;
 wire _1224_;
 wire _1225_;
 wire _1226_;
 wire _1227_;
 wire _1228_;
 wire _1229_;
 wire _1230_;
 wire _1231_;
 wire _1232_;
 wire _1233_;
 wire _1234_;
 wire _1235_;
 wire _1236_;
 wire _1237_;
 wire _1238_;
 wire _1239_;
 wire _1240_;
 wire _1241_;
 wire _1242_;
 wire _1243_;
 wire _1244_;
 wire _1245_;
 wire _1246_;
 wire _1247_;
 wire _1248_;
 wire _1249_;
 wire _1250_;
 wire _1251_;
 wire _1252_;
 wire _1253_;
 wire _1254_;
 wire _1255_;
 wire _1256_;
 wire _1257_;
 wire _1258_;
 wire _1259_;
 wire _1260_;
 wire _1261_;
 wire _1262_;
 wire _1263_;
 wire _1264_;
 wire _1265_;
 wire _1266_;
 wire _1267_;
 wire _1268_;
 wire _1269_;
 wire _1270_;
 wire _1271_;
 wire _1272_;
 wire _1273_;
 wire _1274_;
 wire _1275_;
 wire _1276_;
 wire _1277_;
 wire _1278_;
 wire _1279_;
 wire _1280_;
 wire _1281_;
 wire _1282_;
 wire _1283_;
 wire _1284_;
 wire _1285_;
 wire _1286_;
 wire _1287_;
 wire _1288_;
 wire _1289_;
 wire _1290_;
 wire _1291_;
 wire _1292_;
 wire _1293_;
 wire _1294_;
 wire _1295_;
 wire _1296_;
 wire _1297_;
 wire _1298_;
 wire _1299_;
 wire _1300_;
 wire _1301_;
 wire _1302_;
 wire _1303_;
 wire _1304_;
 wire _1305_;
 wire _1306_;
 wire _1307_;
 wire _1308_;
 wire _1309_;
 wire _1310_;
 wire _1311_;
 wire _1312_;
 wire _1313_;
 wire _1314_;
 wire _1315_;
 wire _1316_;
 wire _1317_;
 wire _1318_;
 wire _1319_;
 wire _1320_;
 wire _1321_;
 wire _1322_;
 wire _1323_;
 wire _1324_;
 wire _1325_;
 wire _1326_;
 wire _1327_;
 wire _1328_;
 wire _1329_;
 wire _1330_;
 wire _1331_;
 wire _1332_;
 wire _1333_;
 wire _1334_;
 wire _1335_;
 wire _1336_;
 wire _1337_;
 wire _1338_;
 wire _1339_;
 wire _1340_;
 wire _1341_;
 wire _1342_;
 wire _1343_;
 wire _1344_;
 wire _1345_;
 wire _1346_;
 wire _1347_;
 wire _1348_;
 wire _1349_;
 wire _1350_;
 wire _1351_;
 wire _1352_;
 wire _1353_;
 wire _1354_;
 wire _1355_;
 wire _1356_;
 wire _1357_;
 wire _1358_;
 wire _1359_;
 wire _1360_;
 wire _1361_;
 wire _1362_;
 wire _1363_;
 wire _1364_;
 wire _1365_;
 wire _1366_;
 wire _1367_;
 wire _1368_;
 wire _1369_;
 wire _1370_;
 wire _1371_;
 wire _1372_;
 wire _1373_;
 wire _1374_;
 wire _1375_;
 wire _1376_;
 wire _1377_;
 wire _1378_;
 wire _1379_;
 wire _1380_;
 wire _1381_;
 wire _1382_;
 wire _1383_;
 wire _1384_;
 wire _1385_;
 wire _1386_;
 wire _1387_;
 wire _1388_;
 wire _1389_;
 wire _1390_;
 wire _1391_;
 wire _1392_;
 wire _1393_;
 wire _1394_;
 wire _1395_;
 wire _1396_;
 wire _1397_;
 wire _1398_;
 wire _1399_;
 wire _1400_;
 wire _1401_;
 wire _1402_;
 wire _1403_;
 wire _1404_;
 wire _1405_;
 wire _1406_;
 wire _1407_;
 wire _1408_;
 wire _1409_;
 wire _1410_;
 wire _1411_;
 wire _1412_;
 wire _1413_;
 wire _1414_;
 wire _1415_;
 wire _1416_;
 wire _1417_;
 wire _1418_;
 wire _1419_;
 wire _1420_;
 wire _1421_;
 wire _1422_;
 wire _1423_;
 wire _1424_;
 wire _1425_;
 wire _1426_;
 wire _1427_;
 wire _1428_;
 wire _1429_;
 wire _1430_;
 wire _1431_;
 wire _1432_;
 wire _1433_;
 wire _1434_;
 wire _1435_;
 wire _1436_;
 wire _1437_;
 wire _1438_;
 wire _1439_;
 wire _1440_;
 wire _1441_;
 wire _1442_;
 wire _1443_;
 wire _1444_;
 wire _1445_;
 wire _1446_;
 wire _1447_;
 wire _1448_;
 wire _1449_;
 wire _1450_;
 wire _1451_;
 wire _1452_;
 wire _1453_;
 wire _1454_;
 wire _1455_;
 wire _1456_;
 wire _1457_;
 wire _1458_;
 wire _1459_;
 wire _1460_;
 wire _1461_;
 wire _1462_;
 wire _1463_;
 wire _1464_;
 wire _1465_;
 wire _1466_;
 wire _1467_;
 wire _1468_;
 wire _1469_;
 wire _1470_;
 wire _1471_;
 wire _1472_;
 wire _1473_;
 wire _1474_;
 wire _1475_;
 wire _1476_;
 wire _1477_;
 wire _1478_;
 wire _1479_;
 wire _1480_;
 wire _1481_;
 wire _1482_;
 wire _1483_;
 wire _1484_;
 wire _1485_;
 wire _1486_;
 wire _1487_;
 wire _1488_;
 wire _1489_;
 wire _1490_;
 wire _1491_;
 wire _1492_;
 wire _1493_;
 wire _1494_;
 wire _1495_;
 wire _1496_;
 wire _1497_;
 wire _1498_;
 wire _1499_;
 wire _1500_;
 wire _1501_;
 wire _1502_;
 wire _1503_;
 wire _1504_;
 wire _1505_;
 wire _1506_;
 wire _1507_;
 wire _1508_;
 wire _1509_;
 wire _1510_;
 wire _1511_;
 wire _1512_;
 wire _1513_;
 wire _1514_;
 wire _1515_;
 wire _1516_;
 wire _1517_;
 wire _1518_;
 wire _1519_;
 wire _1520_;
 wire _1521_;
 wire _1522_;
 wire _1523_;
 wire _1524_;
 wire _1525_;
 wire _1526_;
 wire _1527_;
 wire _1528_;
 wire _1529_;
 wire _1530_;
 wire _1531_;
 wire _1532_;
 wire _1533_;
 wire _1534_;
 wire _1535_;
 wire _1536_;
 wire _1537_;
 wire _1538_;
 wire _1539_;
 wire _1540_;
 wire _1541_;
 wire _1542_;
 wire _1543_;
 wire _1544_;
 wire _1545_;
 wire _1546_;
 wire _1547_;
 wire _1548_;
 wire _1549_;
 wire _1550_;
 wire _1551_;
 wire _1552_;
 wire _1553_;
 wire _1554_;
 wire _1555_;
 wire _1556_;
 wire _1557_;
 wire _1558_;
 wire _1559_;
 wire _1560_;
 wire _1561_;
 wire _1562_;
 wire _1563_;
 wire _1564_;
 wire _1565_;
 wire _1566_;
 wire _1567_;
 wire _1568_;
 wire _1569_;
 wire _1570_;
 wire _1571_;
 wire _1572_;
 wire _1573_;
 wire _1574_;
 wire _1575_;
 wire _1576_;
 wire _1577_;
 wire _1578_;
 wire _1579_;
 wire _1580_;
 wire _1581_;
 wire _1582_;
 wire _1583_;
 wire _1584_;
 wire _1585_;
 wire _1586_;
 wire _1587_;
 wire _1588_;
 wire _1589_;
 wire _1590_;
 wire _1591_;
 wire _1592_;
 wire _1593_;
 wire _1594_;
 wire _1595_;
 wire _1596_;
 wire _1597_;
 wire _1598_;
 wire _1599_;
 wire _1600_;
 wire _1601_;
 wire _1602_;
 wire _1603_;
 wire _1604_;
 wire _1605_;
 wire _1606_;
 wire _1607_;
 wire _1608_;
 wire _1609_;
 wire _1610_;
 wire _1611_;
 wire _1612_;
 wire _1613_;
 wire _1614_;
 wire _1615_;
 wire _1616_;
 wire _1617_;
 wire _1618_;
 wire _1619_;
 wire _1620_;
 wire _1621_;
 wire _1622_;
 wire _1623_;
 wire _1624_;
 wire _1625_;
 wire _1626_;
 wire _1627_;
 wire _1628_;
 wire _1629_;
 wire _1630_;
 wire _1631_;
 wire _1632_;
 wire _1633_;
 wire _1634_;
 wire _1635_;
 wire _1636_;
 wire _1637_;
 wire _1638_;
 wire _1639_;
 wire _1640_;
 wire _1641_;
 wire _1642_;
 wire _1643_;
 wire _1644_;
 wire _1645_;
 wire _1646_;
 wire _1647_;
 wire _1648_;
 wire _1649_;
 wire _1650_;
 wire _1651_;
 wire _1652_;
 wire _1653_;
 wire _1654_;
 wire _1655_;
 wire _1656_;
 wire _1657_;
 wire _1658_;
 wire _1659_;
 wire _1660_;
 wire _1661_;
 wire _1662_;
 wire _1663_;
 wire _1664_;
 wire _1665_;
 wire _1666_;
 wire _1667_;
 wire _1668_;
 wire _1669_;
 wire _1670_;
 wire _1671_;
 wire _1672_;
 wire _1673_;
 wire _1674_;
 wire _1675_;
 wire _1676_;
 wire _1677_;
 wire _1678_;
 wire _1679_;
 wire _1680_;
 wire _1681_;
 wire _1682_;
 wire _1683_;
 wire _1684_;
 wire _1685_;
 wire _1686_;
 wire _1687_;
 wire _1688_;
 wire _1689_;
 wire _1690_;
 wire _1691_;
 wire _1692_;
 wire _1693_;
 wire _1694_;
 wire _1695_;
 wire _1696_;
 wire _1697_;
 wire _1698_;
 wire _1699_;
 wire _1700_;
 wire _1701_;
 wire _1702_;
 wire _1703_;
 wire _1704_;
 wire _1705_;
 wire _1706_;
 wire _1707_;
 wire _1708_;
 wire _1709_;
 wire _1710_;
 wire _1711_;
 wire _1712_;
 wire _1713_;
 wire _1714_;
 wire _1715_;
 wire _1716_;
 wire _1717_;
 wire _1718_;
 wire _1719_;
 wire _1720_;
 wire _1721_;
 wire _1722_;
 wire _1723_;
 wire _1724_;
 wire _1725_;
 wire _1726_;
 wire _1727_;
 wire _1728_;
 wire _1729_;
 wire _1730_;
 wire _1731_;
 wire _1732_;
 wire _1733_;
 wire _1734_;
 wire _1735_;
 wire _1736_;
 wire _1737_;
 wire _1738_;
 wire _1739_;
 wire _1740_;
 wire _1741_;
 wire _1742_;
 wire _1743_;
 wire _1744_;
 wire _1745_;
 wire _1746_;
 wire _1747_;
 wire _1748_;
 wire _1749_;
 wire _1750_;
 wire _1751_;
 wire _1752_;
 wire _1753_;
 wire _1754_;
 wire _1755_;
 wire _1756_;
 wire _1757_;
 wire _1758_;
 wire _1759_;
 wire _1760_;
 wire _1761_;
 wire _1762_;
 wire _1763_;
 wire _1764_;
 wire _1765_;
 wire _1766_;
 wire _1767_;
 wire _1768_;
 wire _1769_;
 wire _1770_;
 wire _1771_;
 wire _1772_;
 wire _1773_;
 wire _1774_;
 wire _1775_;
 wire _1776_;
 wire _1777_;
 wire _1778_;
 wire _1779_;
 wire _1780_;
 wire _1781_;
 wire _1782_;
 wire _1783_;
 wire _1784_;
 wire _1785_;
 wire _1786_;
 wire _1787_;
 wire _1788_;
 wire _1789_;
 wire _1790_;
 wire _1791_;
 wire _1792_;
 wire _1793_;
 wire _1794_;
 wire cal_burst_active;
 wire cal_burst_armed;
 wire \cal_burst_count[0] ;
 wire \cal_burst_count[1] ;
 wire capture_pending;
 wire \capture_step[0] ;
 wire \capture_step[2] ;
 wire comp_sync0;
 wire comp_sync1;
 wire comp_sync2;
 wire comp_sync3;
 wire comp_sync4;
 wire \ds_acc[0] ;
 wire \ds_acc[1] ;
 wire \ds_acc[2] ;
 wire \ds_acc[3] ;
 wire \ds_acc[4] ;
 wire \ds_acc[5] ;
 wire \ds_acc[6] ;
 wire \ds_acc[7] ;
 wire \ds_acc[8] ;
 wire \phase_acc[0] ;
 wire \phase_acc[10] ;
 wire \phase_acc[11] ;
 wire \phase_acc[12] ;
 wire \phase_acc[13] ;
 wire \phase_acc[14] ;
 wire \phase_acc[15] ;
 wire \phase_acc[16] ;
 wire \phase_acc[17] ;
 wire \phase_acc[18] ;
 wire \phase_acc[19] ;
 wire \phase_acc[1] ;
 wire \phase_acc[20] ;
 wire \phase_acc[2] ;
 wire \phase_acc[3] ;
 wire \phase_acc[4] ;
 wire \phase_acc[5] ;
 wire \phase_acc[6] ;
 wire \phase_acc[7] ;
 wire \phase_acc[8] ;
 wire \phase_acc[9] ;
 wire \wave_cycle_cnt[0] ;
 wire \wave_cycle_cnt[1] ;
 wire \wave_cycle_cnt[2] ;
 wire \wave_cycle_cnt[3] ;
 wire \wave_cycle_cnt[4] ;
 wire \wave_cycle_cnt[5] ;
 wire \wave_cycle_cnt[6] ;
 wire \wave_cycle_cnt[7] ;

 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1795_ (.A1(_0197_),
    .A2(_0207_),
    .B(_0203_),
    .ZN(_0208_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1796_ (.A1(_1353_),
    .A2(_0201_),
    .A3(_0208_),
    .Z(cal_phase90_offset[20]));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1797_ (.A1(_1316_),
    .A2(cal_phase0_offset[1]),
    .Z(_0209_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1798_ (.A1(_1316_),
    .A2(cal_phase0_offset[1]),
    .ZN(_0210_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1799_ (.A1(raw_edge2[1]),
    .A2(cal_phase0_offset[1]),
    .ZN(_0211_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1800_ (.A1(raw_edge2[1]),
    .A2(cal_phase0_offset[1]),
    .Z(_0212_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1801_ (.A1(raw_edge2[0]),
    .A2(_1354_),
    .B(_0212_),
    .ZN(_0213_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1802_ (.A1(_1318_),
    .A2(cal_phase0_offset[0]),
    .B(_0211_),
    .ZN(_0214_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1803_ (.A1(raw_edge2[0]),
    .A2(_0214_),
    .ZN(_0215_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1804_ (.A1(_1354_),
    .A2(_0212_),
    .B(_0215_),
    .ZN(_0216_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1805_ (.A1(raw_edge3[2]),
    .A2(_1314_),
    .ZN(_0217_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1806_ (.A1(raw_edge3[2]),
    .A2(raw_edge2[2]),
    .Z(_0218_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1807_ (.I(_0218_),
    .ZN(_0219_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1808_ (.A1(_0210_),
    .A2(_0214_),
    .B(_0218_),
    .ZN(_0220_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1809_ (.A1(_0209_),
    .A2(_0213_),
    .B(_0219_),
    .ZN(_0221_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1810_ (.A1(_0209_),
    .A2(_0213_),
    .A3(_0219_),
    .ZN(_0222_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1811_ (.A1(_0220_),
    .A2(_0222_),
    .ZN(_0223_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1812_ (.A1(raw_edge2[1]),
    .A2(_0223_),
    .ZN(_0224_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1813_ (.A1(_1316_),
    .A2(_0223_),
    .Z(_0225_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1814_ (.A1(_0216_),
    .A2(_0225_),
    .ZN(_0226_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1815_ (.A1(_0216_),
    .A2(_0225_),
    .ZN(cal_phase270_offset[1]));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1816_ (.A1(_0217_),
    .A2(_0221_),
    .Z(_0227_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1817_ (.A1(_1303_),
    .A2(raw_edge2[3]),
    .ZN(_0228_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1818_ (.A1(raw_edge3[3]),
    .A2(_1319_),
    .ZN(_0229_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1819_ (.A1(_0228_),
    .A2(_0229_),
    .ZN(_0230_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1820_ (.A1(_0227_),
    .A2(_0230_),
    .ZN(_0231_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1821_ (.A1(cfg_f_MEMS_fcw[0]),
    .A2(_0231_),
    .ZN(_0232_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1822_ (.A1(cfg_f_MEMS_fcw[0]),
    .A2(_0231_),
    .Z(_0233_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1823_ (.A1(_1290_),
    .A2(_0227_),
    .A3(_0230_),
    .Z(_0234_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1824_ (.A1(raw_edge2[2]),
    .A2(_0234_),
    .Z(_0235_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1825_ (.A1(raw_edge2[2]),
    .A2(_0234_),
    .ZN(_0236_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1826_ (.A1(_1314_),
    .A2(_0234_),
    .Z(_0237_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1827_ (.I(_0237_),
    .ZN(_0238_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1828_ (.A1(_0224_),
    .A2(_0237_),
    .ZN(_0239_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1829_ (.I(_0239_),
    .ZN(_0240_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1830_ (.A1(_0224_),
    .A2(_0237_),
    .B(_0226_),
    .ZN(_0241_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1831_ (.A1(_0226_),
    .A2(_0238_),
    .B1(_0240_),
    .B2(_0241_),
    .ZN(cal_phase270_offset[2]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1832_ (.A1(_0239_),
    .A2(_0241_),
    .ZN(_0242_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1833_ (.A1(raw_edge3[4]),
    .A2(_1321_),
    .ZN(_0243_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1834_ (.A1(raw_edge3[4]),
    .A2(raw_edge2[4]),
    .Z(_0244_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1835_ (.A1(_0217_),
    .A2(_0229_),
    .Z(_0245_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1836_ (.A1(_0217_),
    .A2(_0229_),
    .ZN(_0246_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1837_ (.A1(_0220_),
    .A2(_0246_),
    .B(_0228_),
    .ZN(_0247_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1838_ (.A1(_0244_),
    .A2(_0247_),
    .ZN(_0248_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1839_ (.A1(cfg_f_MEMS_fcw[1]),
    .A2(_0248_),
    .Z(_0249_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1840_ (.A1(cfg_f_MEMS_fcw[1]),
    .A2(_0248_),
    .Z(_0250_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1841_ (.A1(_1289_),
    .A2(_1319_),
    .A3(_0248_),
    .Z(_0251_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1842_ (.A1(cfg_f_MEMS_fcw[1]),
    .A2(_1319_),
    .A3(_0248_),
    .Z(_0252_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1843_ (.A1(_0233_),
    .A2(_0236_),
    .B(_0252_),
    .ZN(_0253_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1844_ (.A1(_0232_),
    .A2(_0235_),
    .A3(_0251_),
    .ZN(_0254_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1845_ (.A1(_0253_),
    .A2(_0254_),
    .ZN(_0255_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1846_ (.A1(_0242_),
    .A2(_0255_),
    .ZN(cal_phase270_offset[3]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1847_ (.A1(raw_edge3[5]),
    .A2(_1323_),
    .ZN(_0256_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1848_ (.A1(raw_edge3[5]),
    .A2(raw_edge2[5]),
    .Z(_0257_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1849_ (.A1(_0244_),
    .A2(_0247_),
    .B(_0243_),
    .ZN(_0258_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1850_ (.A1(_0257_),
    .A2(_0258_),
    .Z(_0259_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1851_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_0259_),
    .ZN(_0260_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1852_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_0259_),
    .ZN(_0261_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1853_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(raw_edge2[4]),
    .A3(_0259_),
    .Z(_0262_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1854_ (.A1(_1319_),
    .A2(_0250_),
    .B(_0249_),
    .ZN(_0263_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1855_ (.A1(_0262_),
    .A2(_0263_),
    .ZN(_0264_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1856_ (.A1(_0262_),
    .A2(_0263_),
    .ZN(_0265_));
 gf180mcu_fd_sc_mcu7t5v0__oai33_1 _1857_ (.A1(_0232_),
    .A2(_0235_),
    .A3(_0251_),
    .B1(_0253_),
    .B2(_0239_),
    .B3(_0241_),
    .ZN(_0266_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1858_ (.A1(_0265_),
    .A2(_0266_),
    .Z(cal_phase270_offset[4]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1859_ (.A1(raw_edge2[4]),
    .A2(_0261_),
    .B(_0260_),
    .ZN(_0267_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1860_ (.A1(raw_edge3[6]),
    .A2(_1325_),
    .ZN(_0268_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1861_ (.A1(raw_edge3[6]),
    .A2(_1325_),
    .ZN(_0269_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1862_ (.A1(_0244_),
    .A2(_0257_),
    .ZN(_0270_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1863_ (.A1(_0244_),
    .A2(_0257_),
    .Z(_0271_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _1864_ (.A1(_1303_),
    .A2(raw_edge2[3]),
    .B1(_0221_),
    .B2(_0245_),
    .C(_0271_),
    .ZN(_0272_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1865_ (.A1(_0220_),
    .A2(_0246_),
    .B(_0270_),
    .C(_0228_),
    .ZN(_0273_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _1866_ (.A1(_1304_),
    .A2(raw_edge2[4]),
    .A3(_0257_),
    .B(_0256_),
    .ZN(_0274_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1867_ (.A1(_0272_),
    .A2(_0274_),
    .ZN(_0275_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1868_ (.A1(_1305_),
    .A2(raw_edge2[6]),
    .A3(_0275_),
    .Z(_0276_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1869_ (.A1(cfg_f_MEMS_fcw[3]),
    .A2(_0276_),
    .ZN(_0277_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1870_ (.A1(cfg_f_MEMS_fcw[3]),
    .A2(_0276_),
    .Z(_0278_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1871_ (.A1(_1323_),
    .A2(_0278_),
    .Z(_0279_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1872_ (.A1(_0267_),
    .A2(_0279_),
    .ZN(_0280_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1873_ (.A1(_0265_),
    .A2(_0266_),
    .B(_0264_),
    .ZN(_0281_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1874_ (.A1(_0267_),
    .A2(_0279_),
    .A3(_0281_),
    .Z(cal_phase270_offset[5]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1875_ (.A1(raw_edge2[5]),
    .A2(_0278_),
    .B(_0277_),
    .ZN(_0282_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1876_ (.I(_0282_),
    .ZN(_0283_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1877_ (.A1(_0268_),
    .A2(_0275_),
    .B(_0269_),
    .ZN(_0284_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1878_ (.A1(raw_edge3[7]),
    .A2(_1327_),
    .ZN(_0285_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1879_ (.A1(raw_edge3[7]),
    .A2(_1327_),
    .Z(_0286_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1880_ (.A1(raw_edge3[7]),
    .A2(_1327_),
    .ZN(_0287_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1881_ (.A1(_0286_),
    .A2(_0287_),
    .ZN(_0288_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1882_ (.A1(_0284_),
    .A2(_0288_),
    .Z(_0289_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1883_ (.A1(cfg_f_MEMS_fcw[4]),
    .A2(_0289_),
    .ZN(_0290_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1884_ (.A1(cfg_f_MEMS_fcw[4]),
    .A2(_0284_),
    .A3(_0288_),
    .Z(_0291_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1885_ (.A1(raw_edge2[6]),
    .A2(_0291_),
    .Z(_0292_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1886_ (.A1(_0283_),
    .A2(_0292_),
    .ZN(_0293_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1887_ (.A1(_0282_),
    .A2(_0292_),
    .ZN(_0294_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _1888_ (.A1(_0265_),
    .A2(_0266_),
    .B1(_0267_),
    .B2(_0279_),
    .C(_0264_),
    .ZN(_0295_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1889_ (.A1(_0280_),
    .A2(_0295_),
    .ZN(_0296_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1890_ (.A1(_0280_),
    .A2(_0294_),
    .A3(_0295_),
    .ZN(_0297_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1891_ (.A1(_0294_),
    .A2(_0296_),
    .ZN(cal_phase270_offset[6]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1892_ (.A1(raw_edge2[6]),
    .A2(_0291_),
    .B(_0290_),
    .ZN(_0298_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1893_ (.A1(_0269_),
    .A2(_0285_),
    .B(_0287_),
    .ZN(_0299_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1894_ (.A1(_0274_),
    .A2(_0299_),
    .ZN(_0300_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1895_ (.A1(_0274_),
    .A2(_0299_),
    .Z(_0301_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1896_ (.A1(_0268_),
    .A2(_0287_),
    .ZN(_0302_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1897_ (.A1(_0268_),
    .A2(_0287_),
    .B(_0285_),
    .ZN(_0303_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1898_ (.A1(_0286_),
    .A2(_0302_),
    .ZN(_0304_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1899_ (.A1(_0272_),
    .A2(_0301_),
    .B(_0303_),
    .ZN(_0305_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1900_ (.A1(raw_edge3[8]),
    .A2(_1329_),
    .ZN(_0306_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1901_ (.A1(raw_edge3[8]),
    .A2(raw_edge2[8]),
    .Z(_0307_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1902_ (.A1(_0305_),
    .A2(_0307_),
    .ZN(_0308_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1903_ (.A1(cfg_f_MEMS_fcw[5]),
    .A2(_0308_),
    .ZN(_0309_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1904_ (.A1(_1286_),
    .A2(_0308_),
    .Z(_0310_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1905_ (.A1(_1327_),
    .A2(_0310_),
    .ZN(_0311_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1906_ (.A1(_1327_),
    .A2(_0310_),
    .Z(_0312_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1907_ (.I(_0312_),
    .ZN(_0313_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1908_ (.A1(_0298_),
    .A2(_0313_),
    .ZN(_0314_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1909_ (.A1(_0298_),
    .A2(_0312_),
    .Z(_0315_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1910_ (.A1(_0293_),
    .A2(_0297_),
    .B(_0315_),
    .ZN(_0316_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1911_ (.A1(_0293_),
    .A2(_0297_),
    .A3(_0315_),
    .Z(_0317_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1912_ (.A1(_0316_),
    .A2(_0317_),
    .ZN(cal_phase270_offset[7]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1913_ (.A1(_0314_),
    .A2(_0316_),
    .ZN(_0318_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1914_ (.A1(raw_edge3[9]),
    .A2(raw_edge2[9]),
    .Z(_0319_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1915_ (.A1(_0305_),
    .A2(_0307_),
    .B(_0306_),
    .ZN(_0320_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1916_ (.A1(_0319_),
    .A2(_0320_),
    .Z(_0321_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1917_ (.A1(cfg_f_MEMS_fcw[6]),
    .A2(_0321_),
    .ZN(_0322_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1918_ (.A1(cfg_f_MEMS_fcw[6]),
    .A2(_0321_),
    .Z(_0323_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1919_ (.A1(_1329_),
    .A2(_0323_),
    .Z(_0324_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1920_ (.A1(_0309_),
    .A2(_0311_),
    .ZN(_0325_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1921_ (.A1(_0324_),
    .A2(_0325_),
    .Z(_0326_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1922_ (.A1(_0324_),
    .A2(_0325_),
    .ZN(_0327_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1923_ (.A1(_0318_),
    .A2(_0327_),
    .Z(cal_phase270_offset[8]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1924_ (.A1(raw_edge2[8]),
    .A2(_0323_),
    .B(_0322_),
    .ZN(_0328_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1925_ (.A1(raw_edge3[10]),
    .A2(_1333_),
    .ZN(_0329_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1926_ (.A1(raw_edge3[10]),
    .A2(_1333_),
    .Z(_0330_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1927_ (.A1(raw_edge3[10]),
    .A2(raw_edge2[10]),
    .Z(_0331_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1928_ (.A1(_0307_),
    .A2(_0319_),
    .Z(_0332_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1929_ (.A1(_0273_),
    .A2(_0300_),
    .B(_0304_),
    .C(_0332_),
    .ZN(_0333_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1930_ (.A1(raw_edge2[8]),
    .A2(_0319_),
    .ZN(_0334_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _1931_ (.A1(raw_edge3[9]),
    .A2(_1331_),
    .B1(_0334_),
    .B2(raw_edge3[8]),
    .ZN(_0335_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1932_ (.I(_0335_),
    .ZN(_0336_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1933_ (.A1(_0333_),
    .A2(_0336_),
    .Z(_0337_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1934_ (.A1(_0333_),
    .A2(_0336_),
    .B(_0330_),
    .ZN(_0338_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1935_ (.A1(_0331_),
    .A2(_0337_),
    .Z(_0339_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1936_ (.A1(cfg_f_MEMS_fcw[7]),
    .A2(_0339_),
    .ZN(_0340_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1937_ (.A1(cfg_f_MEMS_fcw[7]),
    .A2(_0331_),
    .A3(_0337_),
    .Z(_0341_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1938_ (.A1(raw_edge2[9]),
    .A2(_0341_),
    .Z(_0342_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1939_ (.I(_0342_),
    .ZN(_0343_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1940_ (.A1(_0328_),
    .A2(_0343_),
    .ZN(_0344_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1941_ (.A1(_0328_),
    .A2(_0342_),
    .Z(_0345_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1942_ (.A1(_0318_),
    .A2(_0327_),
    .B(_0326_),
    .ZN(_0346_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1943_ (.A1(_0345_),
    .A2(_0346_),
    .ZN(cal_phase270_offset[9]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1944_ (.A1(raw_edge3[11]),
    .A2(_1335_),
    .ZN(_0347_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1945_ (.A1(raw_edge3[11]),
    .A2(_1335_),
    .ZN(_0348_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1946_ (.A1(_1306_),
    .A2(raw_edge2[11]),
    .ZN(_0349_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1947_ (.A1(_0347_),
    .A2(_0349_),
    .ZN(_0350_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1948_ (.A1(_0329_),
    .A2(_0338_),
    .ZN(_0351_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1949_ (.A1(_0329_),
    .A2(_0338_),
    .B(_0350_),
    .ZN(_0352_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1950_ (.A1(_0329_),
    .A2(_0338_),
    .A3(_0350_),
    .Z(_0353_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _1951_ (.A1(cfg_f_MEMS_fcw[8]),
    .A2(_0352_),
    .A3(_0353_),
    .ZN(_0354_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1952_ (.A1(cfg_f_MEMS_fcw[8]),
    .A2(_0350_),
    .A3(_0351_),
    .Z(_0355_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1953_ (.A1(_1333_),
    .A2(_0355_),
    .Z(_0356_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1954_ (.A1(raw_edge2[9]),
    .A2(_0341_),
    .B(_0340_),
    .ZN(_0357_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1955_ (.A1(_0356_),
    .A2(_0357_),
    .ZN(_0358_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1956_ (.A1(_0356_),
    .A2(_0357_),
    .ZN(_0359_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1957_ (.A1(_0356_),
    .A2(_0357_),
    .ZN(_0360_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _1958_ (.A1(_0324_),
    .A2(_0325_),
    .B1(_0328_),
    .B2(_0343_),
    .ZN(_0361_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1959_ (.A1(_0327_),
    .A2(_0345_),
    .ZN(_0362_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1960_ (.A1(_0314_),
    .A2(_0316_),
    .B(_0362_),
    .ZN(_0363_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1961_ (.A1(_0344_),
    .A2(_0361_),
    .ZN(_0364_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1962_ (.A1(_0363_),
    .A2(_0364_),
    .ZN(_0365_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1963_ (.A1(_0360_),
    .A2(_0365_),
    .ZN(cal_phase270_offset[10]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1964_ (.A1(raw_edge2[10]),
    .A2(_0355_),
    .B(_0354_),
    .ZN(_0366_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1965_ (.I(_0366_),
    .ZN(_0367_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1966_ (.A1(raw_edge3[12]),
    .A2(raw_edge2[12]),
    .Z(_0368_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1967_ (.A1(_0329_),
    .A2(_0348_),
    .B(_0347_),
    .ZN(_0369_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _1968_ (.A1(_0330_),
    .A2(_0347_),
    .A3(_0349_),
    .ZN(_0370_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1969_ (.A1(_0332_),
    .A2(_0370_),
    .ZN(_0371_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1970_ (.A1(_0332_),
    .A2(_0370_),
    .Z(_0372_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _1971_ (.A1(_0273_),
    .A2(_0300_),
    .B(_0304_),
    .C(_0372_),
    .ZN(_0373_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _1972_ (.A1(_0272_),
    .A2(_0301_),
    .B(_0303_),
    .C(_0371_),
    .ZN(_0374_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1973_ (.A1(_0335_),
    .A2(_0370_),
    .ZN(_0375_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1974_ (.A1(_0369_),
    .A2(_0375_),
    .ZN(_0376_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1975_ (.A1(_0374_),
    .A2(_0376_),
    .ZN(_0377_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1976_ (.A1(_0374_),
    .A2(_0376_),
    .B(_0368_),
    .ZN(_0378_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1977_ (.A1(_0368_),
    .A2(_0377_),
    .Z(_0379_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1978_ (.A1(cfg_f_MEMS_fcw[9]),
    .A2(_0379_),
    .ZN(_0380_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1979_ (.A1(cfg_f_MEMS_fcw[9]),
    .A2(_0379_),
    .ZN(_0381_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1980_ (.A1(_1282_),
    .A2(_1335_),
    .A3(_0379_),
    .Z(_0382_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1981_ (.A1(_0367_),
    .A2(_0382_),
    .ZN(_0383_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1982_ (.A1(_0366_),
    .A2(_0382_),
    .Z(_0384_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1983_ (.A1(_0359_),
    .A2(_0365_),
    .B(_0358_),
    .ZN(_0385_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1984_ (.A1(_0384_),
    .A2(_0385_),
    .Z(cal_phase270_offset[11]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1985_ (.A1(raw_edge3[13]),
    .A2(raw_edge2[13]),
    .Z(_0386_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1986_ (.A1(raw_edge3[12]),
    .A2(_1337_),
    .B(_0378_),
    .ZN(_0387_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1987_ (.A1(_0386_),
    .A2(_0387_),
    .Z(_0388_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1988_ (.A1(_1281_),
    .A2(_0388_),
    .ZN(_0389_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _1989_ (.A1(_1281_),
    .A2(_0386_),
    .A3(_0387_),
    .Z(_0390_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _1990_ (.A1(raw_edge2[12]),
    .A2(_0390_),
    .ZN(_0391_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _1991_ (.A1(_1337_),
    .A2(_0390_),
    .Z(_0392_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _1992_ (.A1(raw_edge2[11]),
    .A2(_0381_),
    .B(_0380_),
    .ZN(_0393_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _1993_ (.A1(_0392_),
    .A2(_0393_),
    .ZN(_0394_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _1994_ (.A1(_0392_),
    .A2(_0393_),
    .ZN(_0395_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _1995_ (.I(_0395_),
    .ZN(_0396_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _1996_ (.A1(_0367_),
    .A2(_0382_),
    .B(_0358_),
    .ZN(_0397_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _1997_ (.A1(_0383_),
    .A2(_0397_),
    .Z(_0398_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _1998_ (.A1(_0360_),
    .A2(_0384_),
    .Z(_0399_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _1999_ (.A1(_0364_),
    .A2(_0383_),
    .A3(_0397_),
    .Z(_0400_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2000_ (.A1(_0398_),
    .A2(_0399_),
    .B1(_0400_),
    .B2(_0363_),
    .ZN(_0401_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2001_ (.A1(_0396_),
    .A2(_0401_),
    .Z(cal_phase270_offset[12]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2002_ (.A1(_0389_),
    .A2(_0391_),
    .ZN(_0402_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2003_ (.A1(_0368_),
    .A2(_0386_),
    .ZN(_0403_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2004_ (.A1(_0374_),
    .A2(_0376_),
    .B(_0386_),
    .C(_0368_),
    .ZN(_0404_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2005_ (.A1(_0369_),
    .A2(_0373_),
    .A3(_0375_),
    .B(_0403_),
    .ZN(_0405_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2006_ (.A1(raw_edge3[13]),
    .A2(_1339_),
    .B(_1337_),
    .C(raw_edge3[12]),
    .ZN(_0406_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2007_ (.A1(_1307_),
    .A2(raw_edge2[13]),
    .B(_0406_),
    .ZN(_0407_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2008_ (.I(_0407_),
    .ZN(_0408_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2009_ (.A1(_0404_),
    .A2(_0407_),
    .ZN(_0409_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2010_ (.A1(_1308_),
    .A2(raw_edge2[14]),
    .ZN(_0410_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2011_ (.A1(raw_edge3[14]),
    .A2(_1341_),
    .ZN(_0411_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2012_ (.A1(_1308_),
    .A2(raw_edge2[14]),
    .ZN(_0412_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2013_ (.A1(_0411_),
    .A2(_0412_),
    .ZN(_0413_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2014_ (.A1(_0405_),
    .A2(_0408_),
    .B(_0413_),
    .ZN(_0414_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2015_ (.A1(_0409_),
    .A2(_0413_),
    .Z(_0415_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2016_ (.A1(_1280_),
    .A2(_0415_),
    .ZN(_0416_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2017_ (.A1(_1280_),
    .A2(_0409_),
    .A3(_0413_),
    .Z(_0417_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2018_ (.A1(raw_edge2[13]),
    .A2(_0417_),
    .ZN(_0418_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2019_ (.A1(_1339_),
    .A2(_0417_),
    .Z(_0419_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2020_ (.A1(_0389_),
    .A2(_0391_),
    .B(_0419_),
    .ZN(_0420_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2021_ (.A1(_0389_),
    .A2(_0391_),
    .A3(_0419_),
    .ZN(_0421_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2022_ (.A1(_0402_),
    .A2(_0419_),
    .Z(_0422_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2023_ (.A1(_0396_),
    .A2(_0401_),
    .B(_0394_),
    .ZN(_0423_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2024_ (.A1(_0422_),
    .A2(_0423_),
    .Z(cal_phase270_offset[13]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2025_ (.A1(raw_edge3[15]),
    .A2(raw_edge2[15]),
    .Z(_0424_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2026_ (.A1(_0410_),
    .A2(_0414_),
    .ZN(_0425_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2027_ (.A1(_0410_),
    .A2(_0414_),
    .A3(_0424_),
    .Z(_0426_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2028_ (.A1(_0410_),
    .A2(_0414_),
    .B(_0424_),
    .ZN(_0427_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2029_ (.A1(_0426_),
    .A2(_0427_),
    .B(cfg_f_MEMS_fcw[12]),
    .ZN(_0428_));
 gf180mcu_fd_sc_mcu7t5v0__xnor3_1 _2030_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_0424_),
    .A3(_0425_),
    .ZN(_0429_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2031_ (.A1(raw_edge2[14]),
    .A2(_0429_),
    .Z(_0430_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2032_ (.A1(_1341_),
    .A2(_0429_),
    .Z(_0431_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2033_ (.A1(_0416_),
    .A2(_0418_),
    .ZN(_0432_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2034_ (.A1(_0416_),
    .A2(_0418_),
    .B(_0431_),
    .ZN(_0433_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2035_ (.A1(_0431_),
    .A2(_0432_),
    .Z(_0434_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2036_ (.I(_0434_),
    .ZN(_0435_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2037_ (.A1(_0395_),
    .A2(_0422_),
    .ZN(_0436_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2038_ (.A1(_0401_),
    .A2(_0436_),
    .ZN(_0437_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2039_ (.A1(_0394_),
    .A2(_0421_),
    .B(_0420_),
    .ZN(_0438_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2040_ (.A1(_0437_),
    .A2(_0438_),
    .ZN(_0439_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2041_ (.A1(_0435_),
    .A2(_0439_),
    .Z(cal_phase270_offset[14]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2042_ (.A1(raw_edge3[16]),
    .A2(raw_edge2[16]),
    .Z(_0440_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2043_ (.A1(_0413_),
    .A2(_0424_),
    .ZN(_0441_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2044_ (.A1(_0404_),
    .A2(_0407_),
    .B(_0441_),
    .ZN(_0442_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2045_ (.A1(_1309_),
    .A2(raw_edge2[15]),
    .B(_0411_),
    .ZN(_0443_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2046_ (.A1(raw_edge3[15]),
    .A2(_1343_),
    .B(_0443_),
    .ZN(_0444_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2047_ (.A1(_0442_),
    .A2(_0444_),
    .B(_0440_),
    .ZN(_0445_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2048_ (.A1(_0440_),
    .A2(_0442_),
    .A3(_0444_),
    .Z(_0446_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2049_ (.A1(_0445_),
    .A2(_0446_),
    .ZN(_0447_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2050_ (.A1(cfg_f_MEMS_fcw[13]),
    .A2(_0445_),
    .A3(_0446_),
    .ZN(_0448_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2051_ (.A1(_0445_),
    .A2(_0446_),
    .B(cfg_f_MEMS_fcw[13]),
    .ZN(_0449_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2052_ (.A1(_1279_),
    .A2(raw_edge2[15]),
    .A3(_0447_),
    .Z(_0450_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2053_ (.A1(raw_edge2[14]),
    .A2(_0429_),
    .B(_0428_),
    .ZN(_0451_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2054_ (.A1(_0428_),
    .A2(_0430_),
    .Z(_0452_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2055_ (.A1(_0450_),
    .A2(_0452_),
    .ZN(_0453_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2056_ (.A1(_0450_),
    .A2(_0451_),
    .Z(_0454_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2057_ (.A1(_0435_),
    .A2(_0439_),
    .B(_0433_),
    .ZN(_0455_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2058_ (.A1(_0454_),
    .A2(_0455_),
    .Z(cal_phase270_offset[15]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2059_ (.A1(raw_edge3[17]),
    .A2(raw_edge2[17]),
    .Z(_0456_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2060_ (.A1(raw_edge3[16]),
    .A2(_1345_),
    .B(_0445_),
    .ZN(_0457_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2061_ (.A1(_0456_),
    .A2(_0457_),
    .Z(_0458_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2062_ (.A1(_1278_),
    .A2(_0458_),
    .Z(_0459_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2063_ (.A1(_1278_),
    .A2(_0456_),
    .A3(_0457_),
    .Z(_0460_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2064_ (.A1(raw_edge2[16]),
    .A2(_0460_),
    .Z(_0461_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2065_ (.A1(_1345_),
    .A2(_0460_),
    .Z(_0462_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2066_ (.A1(raw_edge2[15]),
    .A2(_0449_),
    .B(_0448_),
    .ZN(_0463_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2067_ (.A1(_0462_),
    .A2(_0463_),
    .ZN(_0464_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2068_ (.A1(_0462_),
    .A2(_0463_),
    .ZN(_0465_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2069_ (.A1(_0450_),
    .A2(_0452_),
    .B(_0433_),
    .ZN(_0466_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _2070_ (.A1(_0395_),
    .A2(_0422_),
    .A3(_0434_),
    .A4(_0454_),
    .ZN(_0467_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2071_ (.A1(_0434_),
    .A2(_0438_),
    .A3(_0454_),
    .Z(_0468_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2072_ (.A1(_0453_),
    .A2(_0466_),
    .A3(_0468_),
    .ZN(_0469_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2073_ (.A1(_0401_),
    .A2(_0467_),
    .B(_0469_),
    .ZN(_0470_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2074_ (.A1(_0465_),
    .A2(_0470_),
    .ZN(_0471_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2075_ (.A1(_0465_),
    .A2(_0470_),
    .Z(cal_phase270_offset[16]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2076_ (.A1(raw_edge3[18]),
    .A2(_1349_),
    .ZN(_0472_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2077_ (.A1(raw_edge3[18]),
    .A2(raw_edge2[18]),
    .Z(_0473_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2078_ (.A1(_1310_),
    .A2(raw_edge2[16]),
    .B1(raw_edge2[17]),
    .B2(_1311_),
    .ZN(_0474_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2079_ (.A1(raw_edge3[17]),
    .A2(_1347_),
    .B1(_0445_),
    .B2(_0474_),
    .ZN(_0475_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2080_ (.A1(_0473_),
    .A2(_0475_),
    .ZN(_0476_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2081_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_0476_),
    .Z(_0477_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2082_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_0476_),
    .Z(_0478_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2083_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(raw_edge2[17]),
    .A3(_0476_),
    .Z(_0479_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2084_ (.A1(_0459_),
    .A2(_0461_),
    .B(_0479_),
    .ZN(_0480_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2085_ (.A1(_0459_),
    .A2(_0461_),
    .A3(_0479_),
    .Z(_0481_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2086_ (.A1(_0480_),
    .A2(_0481_),
    .ZN(_0482_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2087_ (.A1(_0464_),
    .A2(_0471_),
    .ZN(_0483_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2088_ (.A1(_0482_),
    .A2(_0483_),
    .Z(cal_phase270_offset[17]));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2089_ (.A1(_1347_),
    .A2(_0478_),
    .B(_0477_),
    .ZN(_0484_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2090_ (.A1(raw_edge3[19]),
    .A2(_1351_),
    .ZN(_0485_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2091_ (.A1(_0473_),
    .A2(_0475_),
    .B(_0472_),
    .ZN(_0486_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2092_ (.A1(raw_edge3[19]),
    .A2(_1351_),
    .A3(_0486_),
    .Z(_0487_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2093_ (.A1(raw_edge2[18]),
    .A2(_0487_),
    .Z(_0488_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2094_ (.A1(_1349_),
    .A2(_0487_),
    .Z(_0489_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2095_ (.A1(_0484_),
    .A2(_0489_),
    .Z(_0490_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2096_ (.A1(_0484_),
    .A2(_0489_),
    .Z(_0491_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2097_ (.A1(_0465_),
    .A2(_0482_),
    .Z(_0492_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2098_ (.A1(_0464_),
    .A2(_0481_),
    .ZN(_0493_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2099_ (.A1(_0470_),
    .A2(_0492_),
    .B(_0493_),
    .C(_0480_),
    .ZN(_0494_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2100_ (.A1(_0491_),
    .A2(_0494_),
    .Z(cal_phase270_offset[18]));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2101_ (.A1(_0473_),
    .A2(_0475_),
    .B(_0485_),
    .C(_0472_),
    .ZN(_0495_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2102_ (.A1(raw_edge3[19]),
    .A2(_1351_),
    .B(_0495_),
    .ZN(_0496_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2103_ (.A1(raw_edge3[20]),
    .A2(raw_edge2[20]),
    .A3(_0496_),
    .Z(_0497_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2104_ (.A1(raw_edge2[19]),
    .A2(_0497_),
    .ZN(_0498_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2105_ (.A1(_1351_),
    .A2(_0497_),
    .Z(_0499_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2106_ (.A1(_0488_),
    .A2(_0499_),
    .Z(_0500_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2107_ (.A1(_0488_),
    .A2(_0499_),
    .ZN(_0501_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2108_ (.A1(_0488_),
    .A2(_0499_),
    .Z(_0502_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2109_ (.A1(_0491_),
    .A2(_0494_),
    .B(_0490_),
    .ZN(_0503_));
 gf180mcu_fd_sc_mcu7t5v0__xnor3_1 _2110_ (.A1(_0488_),
    .A2(_0499_),
    .A3(_0503_),
    .ZN(cal_phase270_offset[19]));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2111_ (.A1(_0491_),
    .A2(_0501_),
    .A3(_0502_),
    .Z(_0504_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2112_ (.A1(_0490_),
    .A2(_0502_),
    .B1(_0504_),
    .B2(_0494_),
    .C(_0500_),
    .ZN(_0505_));
 gf180mcu_fd_sc_mcu7t5v0__xnor3_1 _2113_ (.A1(raw_edge2[20]),
    .A2(_0498_),
    .A3(_0505_),
    .ZN(cal_phase270_offset[20]));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2114_ (.A1(\ds_acc[0] ),
    .A2(_1508_),
    .ZN(_0009_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2115_ (.A1(_1589_),
    .A2(_1592_),
    .B(_1591_),
    .ZN(_0008_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2116_ (.A1(_1317_),
    .A2(_1595_),
    .B(_1600_),
    .ZN(cal_phase90_offset[0]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2117_ (.A1(_1318_),
    .A2(_0211_),
    .B(_0216_),
    .ZN(cal_phase270_offset[0]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2118_ (.A1(cal_start),
    .A2(cfg_done),
    .ZN(_0506_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2119_ (.A1(cal_start),
    .A2(cfg_done),
    .Z(_0507_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2120_ (.A1(cal_done),
    .A2(cal_timeout),
    .A3(_0506_),
    .ZN(_0508_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2121_ (.A1(cal_done),
    .A2(cal_timeout),
    .A3(_0506_),
    .Z(_0509_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2122_ (.A1(_1302_),
    .A2(comp_sync4),
    .ZN(_0510_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2123_ (.A1(_1302_),
    .A2(comp_sync4),
    .Z(_0511_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2124_ (.A1(comp_sync3),
    .A2(comp_sync4),
    .Z(_0512_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2125_ (.A1(_1372_),
    .A2(_0511_),
    .ZN(_0513_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2126_ (.A1(capture_pending),
    .A2(_0512_),
    .ZN(_0514_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2127_ (.A1(raw_edge2[20]),
    .A2(_1363_),
    .ZN(_0515_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2128_ (.A1(_1353_),
    .A2(_1363_),
    .B(_0515_),
    .ZN(_0516_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2129_ (.I(_0516_),
    .ZN(_0517_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2130_ (.A1(_1352_),
    .A2(\capture_step[0] ),
    .ZN(_0518_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2131_ (.A1(raw_edge2[19]),
    .A2(\capture_step[0] ),
    .B(_0518_),
    .ZN(_0519_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2132_ (.A1(\phase_acc[19] ),
    .A2(_0519_),
    .ZN(_0520_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2133_ (.A1(_1350_),
    .A2(\capture_step[0] ),
    .ZN(_0521_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2134_ (.A1(raw_edge2[18]),
    .A2(\capture_step[0] ),
    .B(_0521_),
    .ZN(_0522_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2135_ (.A1(\phase_acc[18] ),
    .A2(_0522_),
    .ZN(_0523_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2136_ (.A1(raw_edge1[17]),
    .A2(\capture_step[0] ),
    .ZN(_0524_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2137_ (.A1(_1347_),
    .A2(\capture_step[0] ),
    .B(_0524_),
    .ZN(_0525_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2138_ (.A1(raw_edge1[16]),
    .A2(\capture_step[0] ),
    .ZN(_0526_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2139_ (.A1(_1345_),
    .A2(\capture_step[0] ),
    .B(_0526_),
    .ZN(_0527_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2140_ (.A1(raw_edge1[15]),
    .A2(\capture_step[0] ),
    .ZN(_0528_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2141_ (.A1(raw_edge2[15]),
    .A2(_1363_),
    .ZN(_0529_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2142_ (.A1(\phase_acc[15] ),
    .A2(_0528_),
    .A3(_0529_),
    .ZN(_0530_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2143_ (.A1(raw_edge1[14]),
    .A2(\capture_step[0] ),
    .ZN(_0531_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2144_ (.A1(_1341_),
    .A2(\capture_step[0] ),
    .B(_0531_),
    .ZN(_0532_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2145_ (.A1(_1249_),
    .A2(_0532_),
    .B(_0530_),
    .ZN(_0533_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2146_ (.A1(raw_edge2[12]),
    .A2(\capture_step[0] ),
    .ZN(_0534_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2147_ (.A1(_1337_),
    .A2(\capture_step[0] ),
    .ZN(_0535_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2148_ (.A1(raw_edge1[12]),
    .A2(\capture_step[0] ),
    .B(_0535_),
    .C(_1252_),
    .ZN(_0536_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2149_ (.A1(raw_edge1[13]),
    .A2(\capture_step[0] ),
    .ZN(_0537_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2150_ (.A1(_1339_),
    .A2(\capture_step[0] ),
    .B(_0537_),
    .ZN(_0538_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2151_ (.A1(_1251_),
    .A2(_0538_),
    .ZN(_0539_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2152_ (.A1(_0533_),
    .A2(_0536_),
    .A3(_0539_),
    .ZN(_0540_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2153_ (.A1(_1334_),
    .A2(\capture_step[0] ),
    .ZN(_0541_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2154_ (.A1(raw_edge2[10]),
    .A2(\capture_step[0] ),
    .B(_0541_),
    .ZN(_0542_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2155_ (.A1(\phase_acc[10] ),
    .A2(_0542_),
    .Z(_0543_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _2156_ (.I0(raw_edge2[2]),
    .I1(raw_edge1[2]),
    .S(\capture_step[0] ),
    .Z(_0544_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _2157_ (.I0(raw_edge2[1]),
    .I1(raw_edge1[1]),
    .S(\capture_step[0] ),
    .Z(_0545_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _2158_ (.I0(raw_edge2[0]),
    .I1(raw_edge1[0]),
    .S(\capture_step[0] ),
    .Z(_0546_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2159_ (.A1(_1265_),
    .A2(_0545_),
    .B(_0546_),
    .C(_1266_),
    .ZN(_0547_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2160_ (.A1(_1264_),
    .A2(_0544_),
    .B1(_0545_),
    .B2(_1265_),
    .ZN(_0548_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _2161_ (.I0(raw_edge2[3]),
    .I1(raw_edge1[3]),
    .S(\capture_step[0] ),
    .Z(_0549_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2162_ (.I(_0549_),
    .ZN(_0550_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2163_ (.A1(_1264_),
    .A2(_0544_),
    .ZN(_0551_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2164_ (.A1(_0547_),
    .A2(_0548_),
    .B1(_0550_),
    .B2(\phase_acc[3] ),
    .C(_0551_),
    .ZN(_0552_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _2165_ (.I0(_1321_),
    .I1(_1322_),
    .S(\capture_step[0] ),
    .Z(_0553_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2166_ (.A1(\phase_acc[3] ),
    .A2(_0550_),
    .B1(_0553_),
    .B2(\phase_acc[4] ),
    .ZN(_0554_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _2167_ (.I0(raw_edge2[5]),
    .I1(raw_edge1[5]),
    .S(\capture_step[0] ),
    .Z(_0555_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2168_ (.I(_0555_),
    .ZN(_0556_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2169_ (.A1(\phase_acc[4] ),
    .A2(_0553_),
    .B1(_0556_),
    .B2(\phase_acc[5] ),
    .ZN(_0557_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2170_ (.A1(_0552_),
    .A2(_0554_),
    .B(_0557_),
    .ZN(_0558_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2171_ (.A1(raw_edge1[6]),
    .A2(\capture_step[0] ),
    .ZN(_0559_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2172_ (.A1(_1325_),
    .A2(\capture_step[0] ),
    .B(_0559_),
    .ZN(_0560_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2173_ (.A1(_1261_),
    .A2(_0555_),
    .B1(_0560_),
    .B2(_1260_),
    .ZN(_0561_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2174_ (.A1(_1328_),
    .A2(\capture_step[0] ),
    .ZN(_0562_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2175_ (.A1(raw_edge2[7]),
    .A2(\capture_step[0] ),
    .B(_0562_),
    .ZN(_0563_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2176_ (.A1(_1260_),
    .A2(_0560_),
    .ZN(_0564_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2177_ (.A1(_0558_),
    .A2(_0561_),
    .B1(_0563_),
    .B2(\phase_acc[7] ),
    .C(_0564_),
    .ZN(_0565_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2178_ (.A1(raw_edge1[8]),
    .A2(\capture_step[0] ),
    .ZN(_0566_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2179_ (.A1(_1329_),
    .A2(\capture_step[0] ),
    .B(_0566_),
    .ZN(_0567_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2180_ (.A1(_1258_),
    .A2(_0567_),
    .ZN(_0568_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2181_ (.A1(_1258_),
    .A2(_0567_),
    .Z(_0569_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2182_ (.A1(_1331_),
    .A2(_1363_),
    .ZN(_0570_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2183_ (.A1(_1332_),
    .A2(\capture_step[0] ),
    .ZN(_0571_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2184_ (.A1(_1257_),
    .A2(_0570_),
    .A3(_0571_),
    .ZN(_0572_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2185_ (.A1(\phase_acc[7] ),
    .A2(_0563_),
    .B(_0569_),
    .C(_0572_),
    .ZN(_0573_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2186_ (.A1(_0570_),
    .A2(_0571_),
    .B(_1257_),
    .ZN(_0574_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2187_ (.A1(_0568_),
    .A2(_0572_),
    .B(_0574_),
    .ZN(_0575_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2188_ (.A1(_0565_),
    .A2(_0573_),
    .B(_0575_),
    .ZN(_0576_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2189_ (.A1(\phase_acc[10] ),
    .A2(_0542_),
    .ZN(_0577_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2190_ (.I(_0577_),
    .ZN(_0578_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2191_ (.A1(_1336_),
    .A2(\capture_step[0] ),
    .ZN(_0579_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2192_ (.A1(raw_edge2[11]),
    .A2(\capture_step[0] ),
    .B(_0579_),
    .ZN(_0580_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2193_ (.A1(_0543_),
    .A2(_0576_),
    .B1(_0580_),
    .B2(\phase_acc[11] ),
    .C(_0578_),
    .ZN(_0581_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2194_ (.A1(_1249_),
    .A2(_0532_),
    .B1(_0538_),
    .B2(_1251_),
    .ZN(_0582_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2195_ (.A1(_0528_),
    .A2(_0529_),
    .B(\phase_acc[15] ),
    .ZN(_0583_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2196_ (.A1(_1338_),
    .A2(\capture_step[0] ),
    .B(_0534_),
    .C(\phase_acc[12] ),
    .ZN(_0584_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2197_ (.A1(_0583_),
    .A2(_0584_),
    .ZN(_0585_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2198_ (.A1(\phase_acc[11] ),
    .A2(_0580_),
    .B(_0582_),
    .C(_0585_),
    .ZN(_0586_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2199_ (.A1(_0581_),
    .A2(_0586_),
    .B(_0540_),
    .ZN(_0587_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2200_ (.A1(_0533_),
    .A2(_0582_),
    .ZN(_0588_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2201_ (.A1(_0533_),
    .A2(_0536_),
    .A3(_0539_),
    .B1(_0583_),
    .B2(_0588_),
    .ZN(_0589_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2202_ (.A1(\phase_acc[18] ),
    .A2(_0522_),
    .ZN(_0590_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2203_ (.A1(_1246_),
    .A2(_0527_),
    .Z(_0591_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2204_ (.A1(_1245_),
    .A2(_0525_),
    .Z(_0592_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2205_ (.A1(_0589_),
    .A2(_0591_),
    .A3(_0592_),
    .Z(_0593_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2206_ (.A1(_1245_),
    .A2(_0525_),
    .B(_0527_),
    .C(_1246_),
    .ZN(_0594_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2207_ (.A1(_1245_),
    .A2(_0525_),
    .B(_0523_),
    .ZN(_0595_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2208_ (.A1(_0587_),
    .A2(_0593_),
    .B(_0594_),
    .C(_0595_),
    .ZN(_0596_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2209_ (.A1(_0590_),
    .A2(_0596_),
    .ZN(_0597_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2210_ (.A1(_0590_),
    .A2(_0596_),
    .B(_0520_),
    .ZN(_0598_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2211_ (.A1(raw_edge2[19]),
    .A2(\capture_step[0] ),
    .B(_0518_),
    .C(_1271_),
    .ZN(_0599_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2212_ (.I(_0599_),
    .ZN(_0600_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2213_ (.A1(_1270_),
    .A2(_0516_),
    .B(_0600_),
    .ZN(_0601_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2214_ (.A1(\phase_acc[20] ),
    .A2(_0517_),
    .B1(_0598_),
    .B2(_0601_),
    .ZN(_0602_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2215_ (.A1(_1357_),
    .A2(delay_wave_cycle[0]),
    .ZN(_0603_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2216_ (.A1(_1357_),
    .A2(delay_wave_cycle[0]),
    .Z(_0604_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2217_ (.A1(\wave_cycle_cnt[1] ),
    .A2(_1365_),
    .ZN(_0605_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2218_ (.A1(\wave_cycle_cnt[1] ),
    .A2(_1365_),
    .Z(_0606_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2219_ (.A1(_0603_),
    .A2(_0606_),
    .ZN(_0607_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2220_ (.A1(\wave_cycle_cnt[3] ),
    .A2(delay_wave_cycle[3]),
    .Z(_0608_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2221_ (.A1(\wave_cycle_cnt[2] ),
    .A2(delay_wave_cycle[2]),
    .Z(_0609_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2222_ (.A1(_0605_),
    .A2(_0607_),
    .B(_0608_),
    .C(_0609_),
    .ZN(_0610_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2223_ (.I(_0610_),
    .ZN(_0611_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2224_ (.A1(_1359_),
    .A2(delay_wave_cycle[2]),
    .A3(_0608_),
    .Z(_0612_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2225_ (.A1(_1358_),
    .A2(delay_wave_cycle[3]),
    .B(_0612_),
    .ZN(_0613_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2226_ (.A1(_0610_),
    .A2(_0613_),
    .ZN(_0614_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2227_ (.A1(\wave_cycle_cnt[5] ),
    .A2(delay_wave_cycle[5]),
    .Z(_0615_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2228_ (.A1(\wave_cycle_cnt[4] ),
    .A2(delay_wave_cycle[4]),
    .Z(_0616_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2229_ (.A1(_0614_),
    .A2(_0615_),
    .A3(_0616_),
    .Z(_0617_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2230_ (.A1(_1360_),
    .A2(delay_wave_cycle[4]),
    .A3(_0615_),
    .ZN(_0618_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2231_ (.A1(_1360_),
    .A2(delay_wave_cycle[4]),
    .A3(_0615_),
    .Z(_0619_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2232_ (.A1(_1361_),
    .A2(delay_wave_cycle[6]),
    .ZN(_0620_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2233_ (.A1(_1361_),
    .A2(delay_wave_cycle[6]),
    .Z(_0621_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2234_ (.A1(\wave_cycle_cnt[5] ),
    .A2(_1369_),
    .B(_0618_),
    .ZN(_0622_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2235_ (.A1(_0621_),
    .A2(_0622_),
    .ZN(_0623_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2236_ (.A1(_0618_),
    .A2(_0619_),
    .B(_0623_),
    .C(_0614_),
    .ZN(_0624_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2237_ (.A1(_0603_),
    .A2(_0606_),
    .Z(_0625_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2238_ (.A1(\wave_cycle_cnt[7] ),
    .A2(delay_wave_cycle[7]),
    .A3(_0620_),
    .Z(_0626_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2239_ (.A1(_1359_),
    .A2(delay_wave_cycle[2]),
    .A3(_0608_),
    .ZN(_0627_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2240_ (.A1(_0612_),
    .A2(_0627_),
    .ZN(_0628_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2241_ (.A1(_0605_),
    .A2(_0607_),
    .A3(_0628_),
    .ZN(_0629_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2242_ (.A1(_0611_),
    .A2(_0629_),
    .B(_0625_),
    .ZN(_0630_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2243_ (.A1(_0626_),
    .A2(_0630_),
    .ZN(_0631_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2244_ (.A1(_0617_),
    .A2(_0622_),
    .B(_0621_),
    .ZN(_0632_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2245_ (.A1(_0617_),
    .A2(_0624_),
    .B(_0631_),
    .C(_0632_),
    .ZN(_0633_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2246_ (.A1(_0602_),
    .A2(_0604_),
    .B(_0633_),
    .ZN(_0634_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2247_ (.A1(soft_rst_n),
    .A2(_0509_),
    .ZN(_0635_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2248_ (.A1(_0512_),
    .A2(_0635_),
    .ZN(_0636_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2249_ (.A1(capture_pending),
    .A2(_0634_),
    .ZN(_0637_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2250_ (.A1(soft_rst_n),
    .A2(_0507_),
    .ZN(_0638_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2251_ (.A1(_1291_),
    .A2(_0509_),
    .ZN(_0639_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2252_ (.A1(_0637_),
    .A2(_0639_),
    .ZN(_0640_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2253_ (.A1(soft_rst_n),
    .A2(capture_pending),
    .A3(_0511_),
    .ZN(_0641_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2254_ (.A1(_0635_),
    .A2(_0640_),
    .A3(_0641_),
    .ZN(_0642_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2255_ (.A1(\capture_step[2] ),
    .A2(_0636_),
    .A3(_0642_),
    .ZN(_0643_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2256_ (.A1(\phase_acc[20] ),
    .A2(_0516_),
    .Z(_0644_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2257_ (.A1(_0599_),
    .A2(_0644_),
    .ZN(_0645_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2258_ (.A1(_0520_),
    .A2(_0599_),
    .ZN(_0646_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2259_ (.A1(_0597_),
    .A2(_0646_),
    .ZN(_0647_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2260_ (.A1(_0598_),
    .A2(_0644_),
    .B(_0645_),
    .C(_0647_),
    .ZN(_0648_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _2261_ (.A1(_0508_),
    .A2(_0512_),
    .A3(_0637_),
    .A4(_0648_),
    .Z(_0649_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2262_ (.A1(_0512_),
    .A2(_0648_),
    .Z(_0650_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2263_ (.A1(_0637_),
    .A2(_0639_),
    .A3(_0650_),
    .ZN(_0651_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2264_ (.A1(_1363_),
    .A2(_0651_),
    .B(_0643_),
    .ZN(_0007_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2265_ (.A1(soft_rst_n),
    .A2(_1363_),
    .B1(_0639_),
    .B2(_0650_),
    .ZN(_0652_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2266_ (.A1(_0511_),
    .A2(_0648_),
    .ZN(_0653_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2267_ (.A1(_1372_),
    .A2(_0634_),
    .B1(_0653_),
    .B2(\capture_step[2] ),
    .C(_0513_),
    .ZN(_0654_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2268_ (.A1(_0509_),
    .A2(_0654_),
    .ZN(_0655_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2269_ (.A1(_0652_),
    .A2(_0655_),
    .ZN(_0656_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2270_ (.I(_0656_),
    .ZN(_0006_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2271_ (.A1(\capture_step[2] ),
    .A2(_0649_),
    .B(_1291_),
    .ZN(_0657_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2272_ (.A1(raw_edge3[12]),
    .A2(_0657_),
    .ZN(_0658_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2273_ (.A1(\phase_acc[12] ),
    .A2(soft_rst_n),
    .ZN(_0659_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2274_ (.A1(_0657_),
    .A2(_0659_),
    .B(_0658_),
    .ZN(_0017_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2275_ (.A1(\phase_acc[13] ),
    .A2(soft_rst_n),
    .ZN(_0660_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2276_ (.A1(raw_edge3[13]),
    .A2(_0657_),
    .ZN(_0661_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2277_ (.A1(_0657_),
    .A2(_0660_),
    .B(_0661_),
    .ZN(_0018_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2278_ (.A1(\phase_acc[14] ),
    .A2(soft_rst_n),
    .ZN(_0662_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2279_ (.A1(raw_edge3[14]),
    .A2(_0657_),
    .ZN(_0663_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2280_ (.A1(_0657_),
    .A2(_0662_),
    .B(_0663_),
    .ZN(_0019_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2281_ (.A1(\phase_acc[15] ),
    .A2(soft_rst_n),
    .ZN(_0664_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2282_ (.A1(raw_edge3[15]),
    .A2(_0657_),
    .ZN(_0665_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2283_ (.A1(_0657_),
    .A2(_0664_),
    .B(_0665_),
    .ZN(_0020_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2284_ (.A1(raw_edge3[16]),
    .A2(_0657_),
    .ZN(_0666_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2285_ (.A1(\phase_acc[16] ),
    .A2(soft_rst_n),
    .ZN(_0667_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2286_ (.A1(_0657_),
    .A2(_0667_),
    .B(_0666_),
    .ZN(_0021_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2287_ (.A1(raw_edge3[17]),
    .A2(_0657_),
    .ZN(_0668_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2288_ (.A1(\phase_acc[17] ),
    .A2(soft_rst_n),
    .ZN(_0669_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2289_ (.A1(_0657_),
    .A2(_0669_),
    .B(_0668_),
    .ZN(_0022_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2290_ (.A1(raw_edge3[18]),
    .A2(_0657_),
    .ZN(_0670_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2291_ (.A1(\phase_acc[18] ),
    .A2(soft_rst_n),
    .ZN(_0671_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2292_ (.A1(_0657_),
    .A2(_0671_),
    .B(_0670_),
    .ZN(_0023_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2293_ (.A1(\phase_acc[19] ),
    .A2(soft_rst_n),
    .ZN(_0672_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2294_ (.A1(raw_edge3[19]),
    .A2(_0657_),
    .ZN(_0673_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2295_ (.A1(_0657_),
    .A2(_0672_),
    .B(_0673_),
    .ZN(_0024_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2296_ (.A1(raw_edge3[20]),
    .A2(_0657_),
    .ZN(_0674_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2297_ (.A1(\phase_acc[20] ),
    .A2(soft_rst_n),
    .ZN(_0675_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2298_ (.A1(_0657_),
    .A2(_0675_),
    .B(_0674_),
    .ZN(_0025_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2299_ (.A1(\capture_step[0] ),
    .A2(_0649_),
    .B(_1291_),
    .ZN(_0676_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2300_ (.A1(cal_dir),
    .A2(_0676_),
    .ZN(_0677_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2301_ (.A1(_1291_),
    .A2(_0510_),
    .A3(_0676_),
    .B(_0677_),
    .ZN(_0026_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2302_ (.A1(_1254_),
    .A2(_1280_),
    .ZN(_0678_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2303_ (.A1(_1256_),
    .A2(cfg_f_MEMS_fcw[10]),
    .Z(_0679_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2304_ (.A1(\phase_acc[9] ),
    .A2(cfg_f_MEMS_fcw[9]),
    .ZN(_0680_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2305_ (.A1(\phase_acc[9] ),
    .A2(cfg_f_MEMS_fcw[9]),
    .ZN(_0681_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2306_ (.A1(_1258_),
    .A2(_1283_),
    .ZN(_0682_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2307_ (.A1(\phase_acc[7] ),
    .A2(cfg_f_MEMS_fcw[7]),
    .ZN(_0683_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2308_ (.A1(\phase_acc[6] ),
    .A2(cfg_f_MEMS_fcw[6]),
    .ZN(_0684_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2309_ (.I(_0684_),
    .ZN(_0685_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2310_ (.A1(_1260_),
    .A2(_1285_),
    .ZN(_0686_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2311_ (.A1(_0684_),
    .A2(_0686_),
    .ZN(_0687_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2312_ (.A1(\phase_acc[5] ),
    .A2(cfg_f_MEMS_fcw[5]),
    .ZN(_0688_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2313_ (.A1(\phase_acc[5] ),
    .A2(cfg_f_MEMS_fcw[5]),
    .ZN(_0689_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2314_ (.A1(_1262_),
    .A2(_1287_),
    .ZN(_0690_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2315_ (.A1(\phase_acc[4] ),
    .A2(cfg_f_MEMS_fcw[4]),
    .Z(_0691_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2316_ (.A1(\phase_acc[3] ),
    .A2(cfg_f_MEMS_fcw[3]),
    .ZN(_0692_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2317_ (.A1(\phase_acc[2] ),
    .A2(cfg_f_MEMS_fcw[2]),
    .ZN(_0693_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2318_ (.I(_0693_),
    .ZN(_0694_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2319_ (.A1(\phase_acc[2] ),
    .A2(cfg_f_MEMS_fcw[2]),
    .Z(_0695_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2320_ (.A1(_0693_),
    .A2(_0695_),
    .ZN(_0696_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2321_ (.A1(\phase_acc[1] ),
    .A2(cfg_f_MEMS_fcw[1]),
    .ZN(_0697_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2322_ (.A1(\phase_acc[1] ),
    .A2(cfg_f_MEMS_fcw[1]),
    .ZN(_0698_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2323_ (.A1(\phase_acc[0] ),
    .A2(cfg_f_MEMS_fcw[0]),
    .ZN(_0699_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2324_ (.A1(_0698_),
    .A2(_0699_),
    .B(_0697_),
    .ZN(_0700_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2325_ (.A1(_0695_),
    .A2(_0700_),
    .B(_0694_),
    .ZN(_0701_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2326_ (.A1(\phase_acc[3] ),
    .A2(cfg_f_MEMS_fcw[3]),
    .ZN(_0702_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2327_ (.A1(_0701_),
    .A2(_0702_),
    .B(_0692_),
    .ZN(_0703_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2328_ (.A1(_0691_),
    .A2(_0703_),
    .Z(_0704_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2329_ (.A1(_0691_),
    .A2(_0703_),
    .B(_0690_),
    .ZN(_0705_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2330_ (.A1(_0689_),
    .A2(_0705_),
    .B(_0688_),
    .ZN(_0706_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2331_ (.A1(_0686_),
    .A2(_0706_),
    .B(_0685_),
    .ZN(_0707_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2332_ (.A1(\phase_acc[7] ),
    .A2(cfg_f_MEMS_fcw[7]),
    .ZN(_0708_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2333_ (.A1(_0707_),
    .A2(_0708_),
    .B(_0683_),
    .ZN(_0709_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2334_ (.A1(\phase_acc[8] ),
    .A2(cfg_f_MEMS_fcw[8]),
    .Z(_0710_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2335_ (.A1(_0709_),
    .A2(_0710_),
    .ZN(_0711_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2336_ (.I(_0711_),
    .ZN(_0712_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2337_ (.A1(_1258_),
    .A2(_1283_),
    .B(_0711_),
    .ZN(_0713_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2338_ (.A1(\phase_acc[9] ),
    .A2(cfg_f_MEMS_fcw[9]),
    .B1(_0709_),
    .B2(_0710_),
    .C(_0682_),
    .ZN(_0714_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2339_ (.A1(\phase_acc[9] ),
    .A2(cfg_f_MEMS_fcw[9]),
    .B(_0713_),
    .ZN(_0715_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2340_ (.A1(_0679_),
    .A2(_0680_),
    .A3(_0714_),
    .ZN(_0716_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2341_ (.A1(\phase_acc[10] ),
    .A2(cfg_f_MEMS_fcw[10]),
    .B(_0716_),
    .ZN(_0717_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2342_ (.A1(\phase_acc[11] ),
    .A2(cfg_f_MEMS_fcw[11]),
    .B1(cfg_f_MEMS_fcw[10]),
    .B2(\phase_acc[10] ),
    .ZN(_0718_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2343_ (.A1(_0679_),
    .A2(_0680_),
    .A3(_0714_),
    .B(_0718_),
    .ZN(_0719_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2344_ (.A1(\phase_acc[12] ),
    .A2(cfg_f_MEMS_fcw[12]),
    .ZN(_0720_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2345_ (.A1(_1252_),
    .A2(cfg_f_MEMS_fcw[12]),
    .Z(_0721_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2346_ (.I(_0721_),
    .ZN(_0722_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2347_ (.A1(_0678_),
    .A2(_0719_),
    .A3(_0722_),
    .Z(_0723_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2348_ (.A1(_0678_),
    .A2(_0719_),
    .A3(_0722_),
    .ZN(_0724_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2349_ (.A1(\phase_acc[15] ),
    .A2(cfg_f_MEMS_fcw[15]),
    .Z(_0725_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2350_ (.A1(\phase_acc[14] ),
    .A2(cfg_f_MEMS_fcw[14]),
    .Z(_0726_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2351_ (.A1(_0725_),
    .A2(_0726_),
    .ZN(_0727_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2352_ (.A1(\phase_acc[13] ),
    .A2(cfg_f_MEMS_fcw[13]),
    .ZN(_0728_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2353_ (.A1(_1251_),
    .A2(cfg_f_MEMS_fcw[13]),
    .Z(_0729_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2354_ (.A1(\phase_acc[13] ),
    .A2(cfg_f_MEMS_fcw[13]),
    .B1(cfg_f_MEMS_fcw[12]),
    .B2(\phase_acc[12] ),
    .ZN(_0730_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2355_ (.A1(_0727_),
    .A2(_0728_),
    .A3(_0730_),
    .ZN(_0731_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2356_ (.A1(\phase_acc[15] ),
    .A2(cfg_f_MEMS_fcw[15]),
    .B(cfg_f_MEMS_fcw[14]),
    .C(\phase_acc[14] ),
    .ZN(_0732_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2357_ (.I(_0732_),
    .ZN(_0733_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2358_ (.A1(\phase_acc[15] ),
    .A2(cfg_f_MEMS_fcw[15]),
    .B(_0731_),
    .C(_0733_),
    .ZN(_0734_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2359_ (.A1(_0724_),
    .A2(_0727_),
    .A3(_0729_),
    .B(_0734_),
    .ZN(_0735_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2360_ (.A1(\phase_acc[16] ),
    .A2(_0735_),
    .ZN(_0736_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _2361_ (.A1(\phase_acc[17] ),
    .A2(\phase_acc[16] ),
    .A3(_1493_),
    .A4(_0735_),
    .Z(_0737_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2362_ (.A1(\phase_acc[20] ),
    .A2(_0737_),
    .ZN(_0738_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2363_ (.A1(\phase_acc[20] ),
    .A2(_0508_),
    .A3(_0737_),
    .ZN(_0739_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2364_ (.A1(soft_rst_n),
    .A2(_0739_),
    .ZN(_0740_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2365_ (.A1(\phase_acc[20] ),
    .A2(_0639_),
    .A3(_0737_),
    .ZN(_0741_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _2366_ (.I0(_0740_),
    .I1(_0741_),
    .S(_1357_),
    .Z(_0742_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2367_ (.I(_0742_),
    .ZN(_0027_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2368_ (.A1(\wave_cycle_cnt[0] ),
    .A2(_0740_),
    .B(\wave_cycle_cnt[1] ),
    .ZN(_0743_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2369_ (.A1(\wave_cycle_cnt[1] ),
    .A2(\wave_cycle_cnt[0] ),
    .ZN(_0744_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2370_ (.A1(soft_rst_n),
    .A2(_0744_),
    .ZN(_0745_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2371_ (.A1(_0740_),
    .A2(_0745_),
    .B(_0743_),
    .ZN(_0028_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2372_ (.A1(\wave_cycle_cnt[1] ),
    .A2(\wave_cycle_cnt[0] ),
    .A3(_0740_),
    .ZN(_0746_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2373_ (.A1(_1359_),
    .A2(_0744_),
    .ZN(_0747_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2374_ (.A1(\wave_cycle_cnt[1] ),
    .A2(\wave_cycle_cnt[0] ),
    .A3(\wave_cycle_cnt[2] ),
    .ZN(_0748_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2375_ (.A1(soft_rst_n),
    .A2(_0748_),
    .ZN(_0749_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2376_ (.A1(_1359_),
    .A2(_0746_),
    .B1(_0749_),
    .B2(_0740_),
    .ZN(_0029_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2377_ (.A1(_0739_),
    .A2(_0748_),
    .B(soft_rst_n),
    .C(\wave_cycle_cnt[3] ),
    .ZN(_0750_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2378_ (.A1(\wave_cycle_cnt[3] ),
    .A2(_0741_),
    .A3(_0748_),
    .B(_0750_),
    .ZN(_0030_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2379_ (.A1(\wave_cycle_cnt[3] ),
    .A2(_0740_),
    .A3(_0747_),
    .ZN(_0751_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2380_ (.A1(_1358_),
    .A2(_1360_),
    .A3(_0748_),
    .ZN(_0752_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2381_ (.A1(\wave_cycle_cnt[3] ),
    .A2(\wave_cycle_cnt[4] ),
    .A3(_0747_),
    .ZN(_0753_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2382_ (.A1(soft_rst_n),
    .A2(_0753_),
    .ZN(_0754_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2383_ (.A1(_1360_),
    .A2(_0751_),
    .B1(_0754_),
    .B2(_0740_),
    .ZN(_0031_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2384_ (.A1(_0739_),
    .A2(_0753_),
    .B(soft_rst_n),
    .C(\wave_cycle_cnt[5] ),
    .ZN(_0755_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2385_ (.A1(\wave_cycle_cnt[5] ),
    .A2(_0741_),
    .A3(_0753_),
    .B(_0755_),
    .ZN(_0032_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2386_ (.A1(\wave_cycle_cnt[5] ),
    .A2(\wave_cycle_cnt[6] ),
    .A3(_0752_),
    .Z(_0756_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2387_ (.A1(\wave_cycle_cnt[5] ),
    .A2(_0752_),
    .B(\wave_cycle_cnt[6] ),
    .ZN(_0757_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2388_ (.A1(_0741_),
    .A2(_0756_),
    .A3(_0757_),
    .B1(_0740_),
    .B2(_1361_),
    .ZN(_0033_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _2389_ (.A1(\phase_acc[20] ),
    .A2(_0508_),
    .A3(_0737_),
    .A4(_0756_),
    .Z(_0758_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2390_ (.A1(\wave_cycle_cnt[7] ),
    .A2(_0758_),
    .B(soft_rst_n),
    .ZN(_0759_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2391_ (.A1(\wave_cycle_cnt[7] ),
    .A2(_0758_),
    .B(_0759_),
    .ZN(_0034_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2392_ (.A1(_0513_),
    .A2(_0639_),
    .ZN(_0760_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2393_ (.A1(capture_pending),
    .A2(_0635_),
    .B(_0640_),
    .C(_0760_),
    .ZN(_0761_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2394_ (.I(_0761_),
    .ZN(_0035_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2395_ (.A1(soft_rst_n),
    .A2(_0506_),
    .ZN(_0762_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2396_ (.A1(\phase_acc[0] ),
    .A2(cfg_f_MEMS_fcw[0]),
    .ZN(_0763_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2397_ (.A1(_0506_),
    .A2(_0699_),
    .ZN(_0764_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2398_ (.A1(\phase_acc[0] ),
    .A2(soft_rst_n),
    .ZN(_0765_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2399_ (.A1(_0638_),
    .A2(_0765_),
    .B(_0764_),
    .C(_0763_),
    .ZN(_0036_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2400_ (.A1(_1265_),
    .A2(_1289_),
    .A3(_0699_),
    .Z(_0766_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2401_ (.A1(_1265_),
    .A2(_0762_),
    .B1(_0766_),
    .B2(_0638_),
    .ZN(_0037_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2402_ (.A1(_0696_),
    .A2(_0700_),
    .Z(_0767_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2403_ (.A1(_1264_),
    .A2(_0762_),
    .B1(_0767_),
    .B2(_0638_),
    .ZN(_0038_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2404_ (.A1(\phase_acc[3] ),
    .A2(cfg_f_MEMS_fcw[3]),
    .A3(_0701_),
    .Z(_0768_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2405_ (.A1(_1263_),
    .A2(_0762_),
    .B1(_0768_),
    .B2(_0638_),
    .ZN(_0039_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2406_ (.A1(\phase_acc[4] ),
    .A2(soft_rst_n),
    .ZN(_0769_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2407_ (.A1(_0691_),
    .A2(_0703_),
    .ZN(_0770_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2408_ (.A1(_0638_),
    .A2(_0704_),
    .A3(_0770_),
    .B1(_0762_),
    .B2(_1262_),
    .ZN(_0040_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2409_ (.A1(\phase_acc[5] ),
    .A2(soft_rst_n),
    .ZN(_0771_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2410_ (.A1(\phase_acc[5] ),
    .A2(cfg_f_MEMS_fcw[5]),
    .A3(_0705_),
    .Z(_0772_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2411_ (.A1(_1261_),
    .A2(_0762_),
    .B1(_0772_),
    .B2(_0638_),
    .ZN(_0041_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2412_ (.A1(_0687_),
    .A2(_0706_),
    .Z(_0773_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2413_ (.A1(_1260_),
    .A2(_0762_),
    .B1(_0773_),
    .B2(_0638_),
    .ZN(_0042_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2414_ (.A1(\phase_acc[7] ),
    .A2(cfg_f_MEMS_fcw[7]),
    .A3(_0707_),
    .Z(_0774_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2415_ (.A1(_1259_),
    .A2(_0762_),
    .B1(_0774_),
    .B2(_0638_),
    .ZN(_0043_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2416_ (.A1(\phase_acc[8] ),
    .A2(soft_rst_n),
    .ZN(_0775_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2417_ (.A1(_0709_),
    .A2(_0710_),
    .ZN(_0776_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2418_ (.A1(_0638_),
    .A2(_0712_),
    .A3(_0776_),
    .B1(_0762_),
    .B2(_1258_),
    .ZN(_0044_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2419_ (.A1(\phase_acc[9] ),
    .A2(_1282_),
    .A3(_0713_),
    .Z(_0777_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2420_ (.A1(_1257_),
    .A2(_0762_),
    .B1(_0777_),
    .B2(_0638_),
    .ZN(_0045_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2421_ (.A1(_0679_),
    .A2(_0681_),
    .A3(_0715_),
    .Z(_0778_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2422_ (.A1(\phase_acc[10] ),
    .A2(soft_rst_n),
    .ZN(_0779_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2423_ (.A1(_0638_),
    .A2(_0716_),
    .A3(_0778_),
    .B1(_0762_),
    .B2(_1256_),
    .ZN(_0046_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2424_ (.A1(\phase_acc[11] ),
    .A2(soft_rst_n),
    .ZN(_0780_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2425_ (.A1(\phase_acc[11] ),
    .A2(cfg_f_MEMS_fcw[11]),
    .A3(_0717_),
    .Z(_0781_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2426_ (.A1(_1254_),
    .A2(_0762_),
    .B1(_0781_),
    .B2(_0638_),
    .ZN(_0047_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2427_ (.A1(_0678_),
    .A2(_0719_),
    .B(_0722_),
    .ZN(_0782_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2428_ (.A1(_0638_),
    .A2(_0723_),
    .A3(_0782_),
    .B1(_0762_),
    .B2(_1252_),
    .ZN(_0048_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2429_ (.A1(_0720_),
    .A2(_0724_),
    .ZN(_0783_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2430_ (.A1(_0729_),
    .A2(_0783_),
    .Z(_0784_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2431_ (.A1(_0507_),
    .A2(_0660_),
    .B1(_0784_),
    .B2(_0638_),
    .ZN(_0049_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2432_ (.A1(_0724_),
    .A2(_0730_),
    .B(_0728_),
    .ZN(_0785_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2433_ (.A1(_0726_),
    .A2(_0785_),
    .Z(_0786_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2434_ (.A1(_0726_),
    .A2(_0785_),
    .ZN(_0787_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2435_ (.A1(_0638_),
    .A2(_0786_),
    .A3(_0787_),
    .B1(_0762_),
    .B2(_1249_),
    .ZN(_0050_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2436_ (.A1(\phase_acc[14] ),
    .A2(cfg_f_MEMS_fcw[14]),
    .B(_0786_),
    .ZN(_0788_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2437_ (.A1(_0725_),
    .A2(_0788_),
    .Z(_0789_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2438_ (.A1(_1248_),
    .A2(_0762_),
    .B1(_0789_),
    .B2(_0638_),
    .ZN(_0051_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2439_ (.A1(_0506_),
    .A2(_0736_),
    .ZN(_0790_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2440_ (.A1(soft_rst_n),
    .A2(_0507_),
    .A3(_0735_),
    .ZN(_0791_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2441_ (.A1(_0667_),
    .A2(_0791_),
    .B(_0790_),
    .ZN(_0052_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2442_ (.A1(_0506_),
    .A2(_0736_),
    .B(_1245_),
    .ZN(_0792_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2443_ (.A1(_1245_),
    .A2(_0506_),
    .A3(_0736_),
    .ZN(_0793_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _2444_ (.A1(\phase_acc[17] ),
    .A2(\phase_acc[16] ),
    .A3(_0507_),
    .A4(_0735_),
    .ZN(_0794_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2445_ (.A1(soft_rst_n),
    .A2(_0792_),
    .A3(_0794_),
    .Z(_0053_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2446_ (.A1(\phase_acc[18] ),
    .A2(_0793_),
    .B(soft_rst_n),
    .ZN(_0795_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2447_ (.A1(\phase_acc[18] ),
    .A2(_0793_),
    .B(_0795_),
    .ZN(_0054_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2448_ (.A1(\phase_acc[18] ),
    .A2(_0793_),
    .B(\phase_acc[19] ),
    .ZN(_0796_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2449_ (.A1(_1492_),
    .A2(_0794_),
    .ZN(_0797_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2450_ (.A1(_1291_),
    .A2(_0796_),
    .A3(_0797_),
    .ZN(_0055_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2451_ (.A1(_1270_),
    .A2(_0797_),
    .Z(_0798_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2452_ (.A1(_1291_),
    .A2(_0798_),
    .ZN(_0056_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2453_ (.A1(cal_start),
    .A2(cfg_done),
    .ZN(_0799_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2454_ (.A1(cal_burst_armed),
    .A2(_0738_),
    .ZN(_0800_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2455_ (.A1(cal_start),
    .A2(cfg_done),
    .A3(_0800_),
    .ZN(_0057_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2456_ (.A1(cal_burst_active),
    .A2(_0738_),
    .ZN(_0801_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2457_ (.A1(\cal_burst_count[0] ),
    .A2(_1269_),
    .ZN(_0802_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2458_ (.A1(cal_burst_active),
    .A2(_0802_),
    .B(cal_burst_armed),
    .ZN(_0803_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2459_ (.A1(_0738_),
    .A2(_0803_),
    .Z(_0804_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2460_ (.A1(_0801_),
    .A2(_0804_),
    .B(_0799_),
    .ZN(_0058_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2461_ (.A1(\cal_burst_count[0] ),
    .A2(cal_burst_armed),
    .ZN(_0805_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2462_ (.A1(_0804_),
    .A2(_0805_),
    .B(cal_start),
    .C(cfg_done),
    .ZN(_0806_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2463_ (.A1(_1268_),
    .A2(_0804_),
    .B(_0806_),
    .ZN(_0059_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2464_ (.A1(_1269_),
    .A2(_0806_),
    .ZN(_0060_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2465_ (.A1(latch_phase270),
    .A2(latch_phase90),
    .ZN(_0807_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _2466_ (.A1(_1267_),
    .A2(cfg_done),
    .A3(soft_rst_n),
    .A4(_0807_),
    .ZN(_0808_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2467_ (.A1(latch_phase90),
    .A2(_1355_),
    .ZN(_0809_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2468_ (.A1(\phase_acc[15] ),
    .A2(_1293_),
    .ZN(_0810_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2469_ (.A1(\phase_acc[14] ),
    .A2(cfg_phase90_offset[14]),
    .Z(_0811_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2470_ (.A1(_1251_),
    .A2(cfg_phase90_offset[13]),
    .ZN(_0812_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2471_ (.A1(_1251_),
    .A2(cfg_phase90_offset[13]),
    .ZN(_0813_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2472_ (.A1(_1252_),
    .A2(cfg_phase90_offset[12]),
    .ZN(_0814_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2473_ (.A1(\phase_acc[12] ),
    .A2(cfg_phase90_offset[12]),
    .Z(_0815_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2474_ (.I(_0815_),
    .ZN(_0816_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2475_ (.A1(\phase_acc[9] ),
    .A2(_1297_),
    .ZN(_0817_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2476_ (.A1(_1258_),
    .A2(cfg_phase90_offset[8]),
    .ZN(_0818_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2477_ (.A1(\phase_acc[7] ),
    .A2(_1299_),
    .ZN(_0819_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2478_ (.A1(_1260_),
    .A2(cfg_phase90_offset[6]),
    .ZN(_0820_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2479_ (.A1(_1260_),
    .A2(cfg_phase90_offset[6]),
    .ZN(_0821_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2480_ (.A1(\phase_acc[5] ),
    .A2(_1300_),
    .ZN(_0822_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2481_ (.A1(\phase_acc[5] ),
    .A2(_1300_),
    .ZN(_0823_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2482_ (.A1(_1262_),
    .A2(cfg_phase90_offset[4]),
    .Z(_0824_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2483_ (.A1(_1263_),
    .A2(cfg_phase90_offset[3]),
    .ZN(_0825_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2484_ (.A1(_1264_),
    .A2(cfg_phase90_offset[2]),
    .ZN(_0826_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2485_ (.I(_0826_),
    .ZN(_0827_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2486_ (.A1(_1265_),
    .A2(cfg_phase90_offset[1]),
    .Z(_0828_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2487_ (.A1(_1265_),
    .A2(cfg_phase90_offset[1]),
    .ZN(_0829_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2488_ (.A1(\phase_acc[1] ),
    .A2(cfg_phase90_offset[1]),
    .ZN(_0830_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2489_ (.A1(\phase_acc[1] ),
    .A2(cfg_phase90_offset[1]),
    .Z(_0831_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2490_ (.A1(\phase_acc[0] ),
    .A2(_1301_),
    .B(_0831_),
    .ZN(_0832_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2491_ (.A1(_1266_),
    .A2(cfg_phase90_offset[0]),
    .B(_0830_),
    .ZN(_0833_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2492_ (.A1(\phase_acc[2] ),
    .A2(cfg_phase90_offset[2]),
    .ZN(_0834_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2493_ (.I(_0834_),
    .ZN(_0835_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2494_ (.A1(_0829_),
    .A2(_0833_),
    .B(_0835_),
    .ZN(_0836_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2495_ (.A1(\phase_acc[3] ),
    .A2(cfg_phase90_offset[3]),
    .Z(_0837_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2496_ (.I(_0837_),
    .ZN(_0838_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2497_ (.A1(_0827_),
    .A2(_0836_),
    .B(_0838_),
    .ZN(_0839_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2498_ (.A1(_1262_),
    .A2(cfg_phase90_offset[4]),
    .Z(_0840_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2499_ (.I(_0840_),
    .ZN(_0841_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2500_ (.A1(_0825_),
    .A2(_0839_),
    .B(_0841_),
    .ZN(_0842_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2501_ (.A1(_0824_),
    .A2(_0842_),
    .ZN(_0843_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2502_ (.A1(_0822_),
    .A2(_0824_),
    .A3(_0842_),
    .B(_0823_),
    .ZN(_0844_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2503_ (.A1(_0821_),
    .A2(_0844_),
    .B(_0820_),
    .ZN(_0845_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _2504_ (.A1(\phase_acc[7] ),
    .A2(_1299_),
    .B1(_0821_),
    .B2(_0844_),
    .C(_0820_),
    .ZN(_0846_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2505_ (.A1(_0819_),
    .A2(_0846_),
    .ZN(_0847_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2506_ (.A1(_1258_),
    .A2(cfg_phase90_offset[8]),
    .Z(_0848_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2507_ (.I(_0848_),
    .ZN(_0849_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2508_ (.A1(_0819_),
    .A2(_0846_),
    .A3(_0848_),
    .ZN(_0850_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2509_ (.A1(\phase_acc[9] ),
    .A2(cfg_phase90_offset[9]),
    .Z(_0851_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2510_ (.A1(_0849_),
    .A2(_0851_),
    .ZN(_0852_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2511_ (.A1(_0819_),
    .A2(_0846_),
    .A3(_0852_),
    .Z(_0853_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2512_ (.A1(_0819_),
    .A2(_0846_),
    .A3(_0852_),
    .ZN(_0854_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2513_ (.A1(\phase_acc[9] ),
    .A2(_1297_),
    .B(_1298_),
    .C(\phase_acc[8] ),
    .ZN(_0855_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2514_ (.A1(_0817_),
    .A2(_0855_),
    .ZN(_0856_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2515_ (.A1(_0854_),
    .A2(_0856_),
    .Z(_0857_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2516_ (.A1(\phase_acc[10] ),
    .A2(cfg_phase90_offset[10]),
    .Z(_0858_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2517_ (.A1(\phase_acc[10] ),
    .A2(_1296_),
    .B1(_0857_),
    .B2(_0858_),
    .ZN(_0859_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2518_ (.A1(\phase_acc[11] ),
    .A2(cfg_phase90_offset[11]),
    .Z(_0860_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2519_ (.A1(_0858_),
    .A2(_0860_),
    .Z(_0861_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2520_ (.I(_0861_),
    .ZN(_0862_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2521_ (.A1(_0854_),
    .A2(_0856_),
    .B(_0861_),
    .ZN(_0863_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2522_ (.A1(_0817_),
    .A2(_0853_),
    .A3(_0855_),
    .B(_0862_),
    .ZN(_0864_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2523_ (.A1(\phase_acc[11] ),
    .A2(_1295_),
    .B(_1296_),
    .ZN(_0865_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2524_ (.A1(_1254_),
    .A2(cfg_phase90_offset[11]),
    .B1(_0865_),
    .B2(_1256_),
    .ZN(_0866_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2525_ (.I(_0866_),
    .ZN(_0867_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2526_ (.A1(_0863_),
    .A2(_0867_),
    .B(_0816_),
    .ZN(_0868_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2527_ (.A1(_0814_),
    .A2(_0868_),
    .ZN(_0869_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2528_ (.A1(_0813_),
    .A2(_0814_),
    .A3(_0868_),
    .Z(_0870_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2529_ (.A1(_0812_),
    .A2(_0870_),
    .ZN(_0871_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2530_ (.A1(_1248_),
    .A2(cfg_phase90_offset[15]),
    .B1(cfg_phase90_offset[14]),
    .B2(_1249_),
    .ZN(_0872_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2531_ (.A1(_0811_),
    .A2(_0812_),
    .A3(_0870_),
    .B(_0872_),
    .ZN(_0873_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2532_ (.A1(\phase_acc[17] ),
    .A2(_1292_),
    .ZN(_0874_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2533_ (.A1(\phase_acc[17] ),
    .A2(cfg_phase90_offset[17]),
    .Z(_0875_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2534_ (.A1(_1246_),
    .A2(cfg_phase90_offset[16]),
    .ZN(_0876_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2535_ (.A1(_1246_),
    .A2(cfg_phase90_offset[16]),
    .ZN(_0877_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2536_ (.A1(\phase_acc[16] ),
    .A2(cfg_phase90_offset[16]),
    .Z(_0878_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2537_ (.A1(_0875_),
    .A2(_0878_),
    .ZN(_0879_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2538_ (.A1(_0810_),
    .A2(_0873_),
    .A3(_0879_),
    .Z(_0880_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2539_ (.A1(_0810_),
    .A2(_0873_),
    .A3(_0879_),
    .ZN(_0881_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2540_ (.A1(\phase_acc[17] ),
    .A2(_1292_),
    .B(_0876_),
    .ZN(_0882_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2541_ (.A1(_0874_),
    .A2(_0882_),
    .ZN(_0883_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2542_ (.A1(_1243_),
    .A2(cfg_phase90_offset[18]),
    .ZN(_0884_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2543_ (.A1(\phase_acc[18] ),
    .A2(cfg_phase90_offset[18]),
    .Z(_0885_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2544_ (.I(_0885_),
    .ZN(_0886_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2545_ (.A1(_0874_),
    .A2(_0880_),
    .A3(_0882_),
    .B(_0886_),
    .ZN(_0887_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2546_ (.A1(_0881_),
    .A2(_0883_),
    .A3(_0885_),
    .ZN(_0888_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2547_ (.A1(_0811_),
    .A2(_0812_),
    .A3(_0870_),
    .B1(_1294_),
    .B2(\phase_acc[14] ),
    .ZN(_0889_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2548_ (.A1(_1248_),
    .A2(_1293_),
    .A3(_0889_),
    .Z(_0890_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2549_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_0890_),
    .ZN(_0891_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2550_ (.A1(_0811_),
    .A2(_0871_),
    .Z(_0892_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2551_ (.A1(cfg_f_MEMS_fcw[14]),
    .A2(_0892_),
    .ZN(_0893_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2552_ (.A1(_1251_),
    .A2(cfg_phase90_offset[13]),
    .A3(_0869_),
    .Z(_0894_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2553_ (.A1(_1279_),
    .A2(_0894_),
    .ZN(_0895_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2554_ (.A1(_0815_),
    .A2(_0864_),
    .A3(_0866_),
    .ZN(_0896_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2555_ (.A1(_0868_),
    .A2(_0896_),
    .ZN(_0897_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2556_ (.A1(_0859_),
    .A2(_0860_),
    .Z(_0898_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2557_ (.A1(_0857_),
    .A2(_0858_),
    .Z(_0899_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2558_ (.A1(_0857_),
    .A2(_0858_),
    .ZN(_0900_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2559_ (.A1(_0818_),
    .A2(_0850_),
    .A3(_0851_),
    .Z(_0901_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2560_ (.A1(_0818_),
    .A2(_0850_),
    .B(_0851_),
    .ZN(_0902_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2561_ (.A1(_0847_),
    .A2(_0848_),
    .Z(_0903_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2562_ (.A1(\phase_acc[7] ),
    .A2(_1299_),
    .A3(_0845_),
    .Z(_0904_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2563_ (.A1(_1260_),
    .A2(cfg_phase90_offset[6]),
    .A3(_0844_),
    .Z(_0905_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2564_ (.A1(cfg_f_MEMS_fcw[6]),
    .A2(_0905_),
    .ZN(_0906_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2565_ (.A1(_1261_),
    .A2(cfg_phase90_offset[5]),
    .A3(_0843_),
    .Z(_0907_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2566_ (.A1(_0825_),
    .A2(_0839_),
    .A3(_0841_),
    .Z(_0908_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2567_ (.A1(_0842_),
    .A2(_0908_),
    .B(cfg_f_MEMS_fcw[4]),
    .ZN(_0909_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2568_ (.A1(cfg_f_MEMS_fcw[4]),
    .A2(_0842_),
    .A3(_0908_),
    .ZN(_0910_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2569_ (.A1(_0827_),
    .A2(_0836_),
    .A3(_0838_),
    .Z(_0911_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2570_ (.A1(_1288_),
    .A2(_0839_),
    .A3(_0911_),
    .Z(_0912_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2571_ (.A1(_0828_),
    .A2(_0832_),
    .A3(_0834_),
    .ZN(_0913_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _2572_ (.A1(_0836_),
    .A2(_0913_),
    .Z(_0914_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2573_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_0836_),
    .A3(_0913_),
    .ZN(_0915_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _2574_ (.A1(cfg_phase90_offset[0]),
    .A2(_0763_),
    .B1(_0831_),
    .B2(_1289_),
    .C(_0699_),
    .ZN(_0916_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2575_ (.A1(cfg_f_MEMS_fcw[1]),
    .A2(_0831_),
    .ZN(_0917_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2576_ (.A1(_0833_),
    .A2(_0917_),
    .B(_0915_),
    .ZN(_0918_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2577_ (.A1(_0839_),
    .A2(_0911_),
    .B(_1288_),
    .ZN(_0919_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2578_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_0914_),
    .B1(_0916_),
    .B2(_0918_),
    .C(_0919_),
    .ZN(_0920_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2579_ (.A1(_0910_),
    .A2(_0912_),
    .A3(_0920_),
    .B(_0909_),
    .ZN(_0921_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2580_ (.A1(cfg_f_MEMS_fcw[5]),
    .A2(_0907_),
    .B(_0921_),
    .ZN(_0922_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2581_ (.A1(cfg_f_MEMS_fcw[6]),
    .A2(_0905_),
    .B1(_0907_),
    .B2(cfg_f_MEMS_fcw[5]),
    .ZN(_0923_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2582_ (.A1(_1284_),
    .A2(_0904_),
    .B1(_0922_),
    .B2(_0923_),
    .C(_0906_),
    .ZN(_0924_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2583_ (.A1(_1284_),
    .A2(_0904_),
    .ZN(_0925_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2584_ (.A1(cfg_f_MEMS_fcw[8]),
    .A2(_0903_),
    .B(_0924_),
    .C(_0925_),
    .ZN(_0926_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2585_ (.A1(cfg_f_MEMS_fcw[9]),
    .A2(_0901_),
    .A3(_0902_),
    .B1(_0903_),
    .B2(cfg_f_MEMS_fcw[8]),
    .ZN(_0927_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2586_ (.A1(_0901_),
    .A2(_0902_),
    .B(cfg_f_MEMS_fcw[9]),
    .ZN(_0928_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _2587_ (.A1(_1281_),
    .A2(_0899_),
    .B1(_0926_),
    .B2(_0927_),
    .C(_0928_),
    .ZN(_0929_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _2588_ (.A1(cfg_f_MEMS_fcw[11]),
    .A2(_0898_),
    .B1(_0900_),
    .B2(cfg_f_MEMS_fcw[10]),
    .C(_0929_),
    .ZN(_0930_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2589_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_0897_),
    .B1(_0898_),
    .B2(cfg_f_MEMS_fcw[11]),
    .ZN(_0931_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2590_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_0897_),
    .ZN(_0932_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2591_ (.A1(_1279_),
    .A2(_0894_),
    .B1(_0930_),
    .B2(_0931_),
    .C(_0932_),
    .ZN(_0933_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2592_ (.A1(cfg_f_MEMS_fcw[14]),
    .A2(_0892_),
    .B1(_0895_),
    .B2(_0933_),
    .ZN(_0934_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2593_ (.A1(_0891_),
    .A2(_0893_),
    .A3(_0934_),
    .ZN(_0935_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2594_ (.A1(_0810_),
    .A2(_0873_),
    .B(_0878_),
    .ZN(_0936_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2595_ (.A1(_0810_),
    .A2(_0873_),
    .A3(_0878_),
    .Z(_0937_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2596_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_0890_),
    .ZN(_0938_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2597_ (.A1(_1271_),
    .A2(cfg_phase90_offset[19]),
    .ZN(_0939_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2598_ (.A1(\phase_acc[19] ),
    .A2(cfg_phase90_offset[19]),
    .Z(_0940_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2599_ (.A1(_0884_),
    .A2(_0940_),
    .Z(_0941_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2600_ (.A1(_0875_),
    .A2(_0877_),
    .Z(_0942_));
 gf180mcu_fd_sc_mcu7t5v0__or4_1 _2601_ (.A1(_0936_),
    .A2(_0937_),
    .A3(_0941_),
    .A4(_0942_),
    .Z(_0943_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2602_ (.A1(_0887_),
    .A2(_0888_),
    .B(_0938_),
    .C(_0943_),
    .ZN(_0944_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2603_ (.A1(_0881_),
    .A2(_0883_),
    .B(_0885_),
    .C(_0940_),
    .ZN(_0945_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2604_ (.A1(_1271_),
    .A2(cfg_phase90_offset[19]),
    .B(cfg_phase90_offset[18]),
    .C(_1243_),
    .ZN(_0946_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2605_ (.A1(_0939_),
    .A2(_0946_),
    .ZN(_0947_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2606_ (.A1(\phase_acc[20] ),
    .A2(cfg_phase90_offset[20]),
    .Z(_0948_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2607_ (.A1(_0945_),
    .A2(_0947_),
    .A3(_0948_),
    .Z(_0949_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2608_ (.A1(_0945_),
    .A2(_0947_),
    .B(_0948_),
    .ZN(_0950_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _2609_ (.A1(_0935_),
    .A2(_0944_),
    .A3(_0949_),
    .A4(_0950_),
    .ZN(_0951_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2610_ (.A1(_0809_),
    .A2(_0951_),
    .B(_0808_),
    .ZN(_0061_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2611_ (.A1(latch_phase270),
    .A2(_1356_),
    .ZN(_0952_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2612_ (.A1(\phase_acc[15] ),
    .A2(_1272_),
    .ZN(_0953_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2613_ (.A1(\phase_acc[14] ),
    .A2(cfg_phase270_offset[14]),
    .Z(_0954_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2614_ (.A1(_1251_),
    .A2(cfg_phase270_offset[13]),
    .ZN(_0955_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2615_ (.A1(_1252_),
    .A2(cfg_phase270_offset[12]),
    .Z(_0956_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2616_ (.A1(\phase_acc[12] ),
    .A2(cfg_phase270_offset[12]),
    .Z(_0957_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2617_ (.A1(_1257_),
    .A2(cfg_phase270_offset[9]),
    .ZN(_0958_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2618_ (.A1(\phase_acc[7] ),
    .A2(_1276_),
    .ZN(_0959_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2619_ (.A1(_1260_),
    .A2(cfg_phase270_offset[6]),
    .ZN(_0960_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2620_ (.A1(_1260_),
    .A2(cfg_phase270_offset[6]),
    .ZN(_0961_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2621_ (.A1(\phase_acc[5] ),
    .A2(_1277_),
    .ZN(_0962_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2622_ (.A1(\phase_acc[5] ),
    .A2(_1277_),
    .ZN(_0963_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2623_ (.A1(_1262_),
    .A2(cfg_phase270_offset[4]),
    .Z(_0964_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2624_ (.A1(_1263_),
    .A2(cfg_phase270_offset[3]),
    .ZN(_0965_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2625_ (.A1(_1264_),
    .A2(cfg_phase270_offset[2]),
    .Z(_0966_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2626_ (.A1(_1265_),
    .A2(cfg_phase270_offset[1]),
    .ZN(_0967_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2627_ (.A1(\phase_acc[1] ),
    .A2(cfg_phase270_offset[1]),
    .ZN(_0968_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2628_ (.A1(_1266_),
    .A2(cfg_phase270_offset[0]),
    .B(_0968_),
    .ZN(_0969_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2629_ (.A1(_0967_),
    .A2(_0969_),
    .ZN(_0970_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2630_ (.A1(\phase_acc[2] ),
    .A2(cfg_phase270_offset[2]),
    .Z(_0971_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2631_ (.A1(_0967_),
    .A2(_0969_),
    .B(_0971_),
    .ZN(_0972_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2632_ (.A1(_1263_),
    .A2(cfg_phase270_offset[3]),
    .Z(_0973_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2633_ (.A1(_0966_),
    .A2(_0972_),
    .B(_0973_),
    .ZN(_0974_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2634_ (.A1(_0965_),
    .A2(_0974_),
    .ZN(_0975_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2635_ (.A1(\phase_acc[4] ),
    .A2(cfg_phase270_offset[4]),
    .Z(_0976_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2636_ (.A1(_0965_),
    .A2(_0974_),
    .B(_0976_),
    .ZN(_0977_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2637_ (.A1(_0964_),
    .A2(_0977_),
    .ZN(_0978_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2638_ (.A1(_0962_),
    .A2(_0964_),
    .A3(_0977_),
    .B(_0963_),
    .ZN(_0979_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2639_ (.A1(_0961_),
    .A2(_0979_),
    .B(_0960_),
    .ZN(_0980_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _2640_ (.A1(\phase_acc[7] ),
    .A2(_1276_),
    .B1(_0961_),
    .B2(_0979_),
    .C(_0960_),
    .ZN(_0981_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2641_ (.A1(_1258_),
    .A2(cfg_phase270_offset[8]),
    .Z(_0982_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2642_ (.I(_0982_),
    .ZN(_0983_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2643_ (.A1(_0959_),
    .A2(_0981_),
    .A3(_0982_),
    .Z(_0984_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2644_ (.A1(_1258_),
    .A2(cfg_phase270_offset[8]),
    .B(_0984_),
    .ZN(_0985_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2645_ (.A1(\phase_acc[9] ),
    .A2(cfg_phase270_offset[9]),
    .Z(_0986_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2646_ (.A1(_0983_),
    .A2(_0986_),
    .ZN(_0987_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2647_ (.A1(_0959_),
    .A2(_0981_),
    .A3(_0987_),
    .Z(_0988_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2648_ (.A1(_0959_),
    .A2(_0981_),
    .A3(_0987_),
    .ZN(_0989_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2649_ (.A1(_1257_),
    .A2(cfg_phase270_offset[9]),
    .B(cfg_phase270_offset[8]),
    .C(_1258_),
    .ZN(_0990_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2650_ (.A1(_0958_),
    .A2(_0990_),
    .ZN(_0991_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2651_ (.I(_0991_),
    .ZN(_0992_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2652_ (.A1(_1256_),
    .A2(cfg_phase270_offset[10]),
    .Z(_0993_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2653_ (.I(_0993_),
    .ZN(_0994_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2654_ (.A1(_0989_),
    .A2(_0992_),
    .B(_0994_),
    .ZN(_0995_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2655_ (.A1(_1256_),
    .A2(cfg_phase270_offset[10]),
    .B(_0995_),
    .ZN(_0996_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2656_ (.A1(_1254_),
    .A2(cfg_phase270_offset[11]),
    .Z(_0997_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2657_ (.A1(_0988_),
    .A2(_0991_),
    .B(_0993_),
    .C(_0997_),
    .ZN(_0998_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2658_ (.A1(\phase_acc[11] ),
    .A2(_1274_),
    .B(_1275_),
    .ZN(_0999_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2659_ (.A1(_1254_),
    .A2(cfg_phase270_offset[11]),
    .B1(_0999_),
    .B2(_1256_),
    .ZN(_1000_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2660_ (.A1(_0998_),
    .A2(_1000_),
    .ZN(_1001_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2661_ (.A1(_0998_),
    .A2(_1000_),
    .B(_0957_),
    .ZN(_1002_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2662_ (.A1(_0956_),
    .A2(_1002_),
    .ZN(_1003_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2663_ (.A1(_1251_),
    .A2(cfg_phase270_offset[13]),
    .B(_0956_),
    .C(_1002_),
    .ZN(_1004_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2664_ (.A1(_0955_),
    .A2(_1004_),
    .ZN(_1005_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2665_ (.A1(_1248_),
    .A2(cfg_phase270_offset[15]),
    .B1(cfg_phase270_offset[14]),
    .B2(_1249_),
    .ZN(_1006_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2666_ (.A1(_0954_),
    .A2(_0955_),
    .A3(_1004_),
    .B(_1006_),
    .ZN(_1007_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2667_ (.A1(_0953_),
    .A2(_1007_),
    .ZN(_1008_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2668_ (.A1(_1246_),
    .A2(cfg_phase270_offset[16]),
    .ZN(_1009_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2669_ (.A1(_1245_),
    .A2(cfg_phase270_offset[17]),
    .ZN(_1010_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2670_ (.A1(\phase_acc[17] ),
    .A2(cfg_phase270_offset[17]),
    .Z(_1011_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2671_ (.A1(_1246_),
    .A2(cfg_phase270_offset[16]),
    .Z(_1012_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2672_ (.I(_1012_),
    .ZN(_1013_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2673_ (.A1(_1011_),
    .A2(_1013_),
    .ZN(_1014_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2674_ (.A1(_0953_),
    .A2(_1007_),
    .A3(_1014_),
    .ZN(_1015_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2675_ (.A1(_1245_),
    .A2(cfg_phase270_offset[17]),
    .B(cfg_phase270_offset[16]),
    .C(_1246_),
    .ZN(_1016_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2676_ (.A1(_1010_),
    .A2(_1016_),
    .ZN(_1017_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2677_ (.I(_1017_),
    .ZN(_1018_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2678_ (.A1(_1015_),
    .A2(_1018_),
    .ZN(_1019_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2679_ (.A1(_1243_),
    .A2(cfg_phase270_offset[18]),
    .ZN(_1020_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2680_ (.A1(\phase_acc[18] ),
    .A2(cfg_phase270_offset[18]),
    .Z(_1021_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2681_ (.A1(_1019_),
    .A2(_1021_),
    .Z(_1022_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _2682_ (.A1(_0954_),
    .A2(_0955_),
    .A3(_1004_),
    .B1(_1273_),
    .B2(\phase_acc[14] ),
    .ZN(_1023_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2683_ (.A1(_1248_),
    .A2(_1272_),
    .A3(_1023_),
    .Z(_1024_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2684_ (.A1(_0954_),
    .A2(_1005_),
    .Z(_1025_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2685_ (.A1(\phase_acc[13] ),
    .A2(cfg_phase270_offset[13]),
    .A3(_1003_),
    .Z(_1026_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2686_ (.A1(_1279_),
    .A2(_1026_),
    .ZN(_1027_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2687_ (.A1(_0957_),
    .A2(_1001_),
    .Z(_1028_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2688_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_1028_),
    .ZN(_1029_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2689_ (.A1(_0996_),
    .A2(_0997_),
    .Z(_1030_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2690_ (.A1(_0988_),
    .A2(_0991_),
    .A3(_0993_),
    .ZN(_1031_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2691_ (.A1(_0995_),
    .A2(_1031_),
    .B(cfg_f_MEMS_fcw[10]),
    .ZN(_1032_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2692_ (.A1(cfg_f_MEMS_fcw[10]),
    .A2(_0995_),
    .A3(_1031_),
    .Z(_1033_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2693_ (.A1(_0985_),
    .A2(_0986_),
    .Z(_1034_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2694_ (.A1(_0959_),
    .A2(_0981_),
    .B(_0982_),
    .ZN(_1035_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2695_ (.A1(_0984_),
    .A2(_1035_),
    .ZN(_1036_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2696_ (.A1(_0984_),
    .A2(_1035_),
    .B(cfg_f_MEMS_fcw[8]),
    .ZN(_1037_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2697_ (.A1(_1259_),
    .A2(_1276_),
    .A3(_0980_),
    .Z(_1038_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2698_ (.A1(\phase_acc[6] ),
    .A2(cfg_phase270_offset[6]),
    .A3(_0979_),
    .Z(_1039_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _2699_ (.A1(\phase_acc[5] ),
    .A2(cfg_phase270_offset[5]),
    .A3(_0978_),
    .Z(_1040_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2700_ (.A1(_0975_),
    .A2(_0976_),
    .Z(_1041_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2701_ (.A1(cfg_f_MEMS_fcw[4]),
    .A2(_1041_),
    .ZN(_1042_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2702_ (.A1(_0966_),
    .A2(_0972_),
    .A3(_0973_),
    .Z(_1043_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _2703_ (.A1(_0974_),
    .A2(_1043_),
    .Z(_1044_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2704_ (.A1(_1288_),
    .A2(_1044_),
    .ZN(_1045_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2705_ (.A1(_0970_),
    .A2(_0971_),
    .Z(_1046_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2706_ (.A1(_1289_),
    .A2(_0968_),
    .B(_0969_),
    .ZN(_1047_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2707_ (.A1(_1289_),
    .A2(_0969_),
    .ZN(_1048_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2708_ (.A1(cfg_phase270_offset[0]),
    .A2(_0699_),
    .B(_0763_),
    .ZN(_1049_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _2709_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_1046_),
    .B1(_1048_),
    .B2(_1049_),
    .C(_1047_),
    .ZN(_1050_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2710_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_1046_),
    .ZN(_1051_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2711_ (.A1(_1288_),
    .A2(_1044_),
    .B(_1050_),
    .C(_1051_),
    .ZN(_1052_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2712_ (.A1(cfg_f_MEMS_fcw[4]),
    .A2(_1041_),
    .B1(_1045_),
    .B2(_1052_),
    .ZN(_1053_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2713_ (.A1(_1286_),
    .A2(_1040_),
    .B(_1042_),
    .C(_1053_),
    .ZN(_1054_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2714_ (.A1(_1285_),
    .A2(_1039_),
    .B1(_1040_),
    .B2(_1286_),
    .ZN(_1055_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2715_ (.A1(_1285_),
    .A2(_1039_),
    .ZN(_1056_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _2716_ (.A1(cfg_f_MEMS_fcw[7]),
    .A2(_1038_),
    .B1(_1054_),
    .B2(_1055_),
    .C(_1056_),
    .ZN(_1057_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2717_ (.A1(cfg_f_MEMS_fcw[7]),
    .A2(_1038_),
    .ZN(_1058_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _2718_ (.A1(_1037_),
    .A2(_1057_),
    .A3(_1058_),
    .Z(_1059_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2719_ (.A1(_1282_),
    .A2(_1034_),
    .B1(_1036_),
    .B2(_1283_),
    .C(_1059_),
    .ZN(_1060_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2720_ (.A1(_1282_),
    .A2(_1034_),
    .B(_1032_),
    .ZN(_1061_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _2721_ (.A1(cfg_f_MEMS_fcw[11]),
    .A2(_1030_),
    .B1(_1060_),
    .B2(_1061_),
    .C(_1033_),
    .ZN(_1062_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2722_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_1028_),
    .B1(_1030_),
    .B2(cfg_f_MEMS_fcw[11]),
    .ZN(_1063_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2723_ (.A1(_1279_),
    .A2(_1026_),
    .B1(_1062_),
    .B2(_1063_),
    .C(_1029_),
    .ZN(_1064_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2724_ (.A1(cfg_f_MEMS_fcw[14]),
    .A2(_1025_),
    .B1(_1027_),
    .B2(_1064_),
    .ZN(_1065_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _2725_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_1024_),
    .B1(_1025_),
    .B2(cfg_f_MEMS_fcw[14]),
    .ZN(_1066_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2726_ (.A1(_1008_),
    .A2(_1013_),
    .Z(_1067_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2727_ (.A1(_1009_),
    .A2(_1011_),
    .ZN(_1068_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2728_ (.A1(_1271_),
    .A2(cfg_phase270_offset[19]),
    .ZN(_1069_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2729_ (.A1(\phase_acc[19] ),
    .A2(cfg_phase270_offset[19]),
    .Z(_1070_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _2730_ (.A1(_1020_),
    .A2(_1070_),
    .ZN(_1071_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2731_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_1024_),
    .B(_1068_),
    .C(_1071_),
    .ZN(_1072_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2732_ (.A1(_1065_),
    .A2(_1066_),
    .B(_1067_),
    .C(_1072_),
    .ZN(_1073_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _2733_ (.A1(_1015_),
    .A2(_1018_),
    .B(_1021_),
    .C(_1070_),
    .ZN(_1074_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _2734_ (.A1(_1271_),
    .A2(cfg_phase270_offset[19]),
    .B(cfg_phase270_offset[18]),
    .C(_1243_),
    .ZN(_1075_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2735_ (.A1(_1069_),
    .A2(_1075_),
    .ZN(_1076_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _2736_ (.A1(cfg_phase270_offset[20]),
    .A2(\phase_acc[20] ),
    .Z(_1077_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _2737_ (.A1(_1074_),
    .A2(_1076_),
    .A3(_1077_),
    .Z(_1078_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2738_ (.A1(_1074_),
    .A2(_1076_),
    .B(_1077_),
    .ZN(_1079_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _2739_ (.A1(_1022_),
    .A2(_1073_),
    .A3(_1078_),
    .A4(_1079_),
    .ZN(_1080_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2740_ (.A1(_0952_),
    .A2(_1080_),
    .B(_0808_),
    .ZN(_0062_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2741_ (.A1(soft_rst_n),
    .A2(latch_error),
    .ZN(_1081_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _2742_ (.A1(_1291_),
    .A2(_1410_),
    .A3(_0807_),
    .B(_1081_),
    .ZN(_0063_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2743_ (.A1(_1362_),
    .A2(_0657_),
    .B(_1291_),
    .ZN(_0064_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2744_ (.A1(soft_rst_n),
    .A2(cal_timeout),
    .ZN(_1082_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2745_ (.A1(\wave_cycle_cnt[7] ),
    .A2(_0639_),
    .A3(_0756_),
    .ZN(_1083_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2746_ (.A1(_1082_),
    .A2(_1083_),
    .ZN(_0065_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2747_ (.A1(_1364_),
    .A2(_0513_),
    .ZN(_1084_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2748_ (.A1(\capture_step[2] ),
    .A2(\capture_step[0] ),
    .ZN(_1085_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _2749_ (.A1(capture_pending),
    .A2(_0634_),
    .A3(_1085_),
    .ZN(_1086_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2750_ (.A1(\wave_cycle_cnt[0] ),
    .A2(_0512_),
    .ZN(_1087_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2751_ (.A1(_1364_),
    .A2(_0512_),
    .B(_1087_),
    .ZN(_1088_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2752_ (.A1(\capture_step[0] ),
    .A2(_1088_),
    .B(capture_pending),
    .ZN(_1089_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2753_ (.A1(_0650_),
    .A2(_1089_),
    .ZN(_1090_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2754_ (.A1(\wave_cycle_cnt[0] ),
    .A2(_0513_),
    .B1(_1086_),
    .B2(_1090_),
    .C(_1084_),
    .ZN(_1091_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2755_ (.A1(_0650_),
    .A2(_1088_),
    .B(\capture_step[2] ),
    .ZN(_1092_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2756_ (.A1(_0634_),
    .A2(_1085_),
    .ZN(_1093_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2757_ (.A1(_1089_),
    .A2(_1092_),
    .A3(_1093_),
    .ZN(_1094_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2758_ (.A1(_0639_),
    .A2(_1094_),
    .ZN(_1095_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2759_ (.A1(_1364_),
    .A2(_0635_),
    .B1(_1091_),
    .B2(_1095_),
    .ZN(_0066_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2760_ (.A1(_1365_),
    .A2(_0513_),
    .ZN(_1096_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2761_ (.A1(\wave_cycle_cnt[1] ),
    .A2(_0512_),
    .ZN(_1097_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2762_ (.A1(_1365_),
    .A2(_0512_),
    .B(_1097_),
    .ZN(_1098_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2763_ (.A1(\capture_step[0] ),
    .A2(_1098_),
    .B(capture_pending),
    .ZN(_1099_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2764_ (.A1(_0650_),
    .A2(_1099_),
    .ZN(_1100_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2765_ (.A1(\wave_cycle_cnt[1] ),
    .A2(_0513_),
    .B1(_1086_),
    .B2(_1100_),
    .C(_1096_),
    .ZN(_1101_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2766_ (.A1(_0650_),
    .A2(_1098_),
    .B(\capture_step[2] ),
    .ZN(_1102_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2767_ (.A1(_1093_),
    .A2(_1099_),
    .A3(_1102_),
    .ZN(_1103_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2768_ (.A1(_0639_),
    .A2(_1103_),
    .ZN(_1104_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2769_ (.A1(_1365_),
    .A2(_0635_),
    .B1(_1101_),
    .B2(_1104_),
    .ZN(_0067_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2770_ (.A1(_1366_),
    .A2(_0513_),
    .ZN(_1105_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2771_ (.A1(\wave_cycle_cnt[2] ),
    .A2(_0512_),
    .ZN(_1106_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2772_ (.A1(_1366_),
    .A2(_0512_),
    .B(_1106_),
    .ZN(_1107_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2773_ (.A1(\capture_step[0] ),
    .A2(_1107_),
    .B(capture_pending),
    .ZN(_1108_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2774_ (.A1(_0650_),
    .A2(_1108_),
    .ZN(_1109_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2775_ (.A1(\wave_cycle_cnt[2] ),
    .A2(_0513_),
    .B1(_1086_),
    .B2(_1109_),
    .C(_1105_),
    .ZN(_1110_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2776_ (.A1(_0650_),
    .A2(_1107_),
    .B(\capture_step[2] ),
    .ZN(_1111_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2777_ (.A1(_1093_),
    .A2(_1108_),
    .A3(_1111_),
    .ZN(_1112_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2778_ (.A1(_0639_),
    .A2(_1112_),
    .ZN(_1113_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2779_ (.A1(_1366_),
    .A2(_0635_),
    .B1(_1110_),
    .B2(_1113_),
    .ZN(_0068_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2780_ (.A1(_1367_),
    .A2(_0513_),
    .ZN(_1114_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2781_ (.A1(\wave_cycle_cnt[3] ),
    .A2(_0512_),
    .ZN(_1115_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2782_ (.A1(_1367_),
    .A2(_0512_),
    .B(_1115_),
    .ZN(_1116_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2783_ (.A1(\capture_step[0] ),
    .A2(_1116_),
    .B(capture_pending),
    .ZN(_1117_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2784_ (.A1(_0650_),
    .A2(_1117_),
    .ZN(_1118_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2785_ (.A1(\wave_cycle_cnt[3] ),
    .A2(_0513_),
    .B1(_1086_),
    .B2(_1118_),
    .C(_1114_),
    .ZN(_1119_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2786_ (.A1(_0650_),
    .A2(_1116_),
    .B(\capture_step[2] ),
    .ZN(_1120_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2787_ (.A1(_1093_),
    .A2(_1117_),
    .A3(_1120_),
    .ZN(_1121_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2788_ (.A1(_0639_),
    .A2(_1121_),
    .ZN(_1122_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2789_ (.A1(_1367_),
    .A2(_0635_),
    .B1(_1119_),
    .B2(_1122_),
    .ZN(_0069_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2790_ (.A1(_1368_),
    .A2(_0513_),
    .ZN(_1123_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2791_ (.A1(\wave_cycle_cnt[4] ),
    .A2(_0512_),
    .ZN(_1124_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2792_ (.A1(_1368_),
    .A2(_0512_),
    .B(_1124_),
    .ZN(_1125_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2793_ (.A1(\capture_step[0] ),
    .A2(_1125_),
    .B(capture_pending),
    .ZN(_1126_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2794_ (.A1(_0650_),
    .A2(_1126_),
    .ZN(_1127_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2795_ (.A1(\wave_cycle_cnt[4] ),
    .A2(_0513_),
    .B1(_1086_),
    .B2(_1127_),
    .C(_1123_),
    .ZN(_1128_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2796_ (.A1(_0650_),
    .A2(_1125_),
    .B(\capture_step[2] ),
    .ZN(_1129_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2797_ (.A1(_1093_),
    .A2(_1126_),
    .A3(_1129_),
    .ZN(_1130_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2798_ (.A1(_0639_),
    .A2(_1130_),
    .ZN(_1131_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2799_ (.A1(_1368_),
    .A2(_0635_),
    .B1(_1128_),
    .B2(_1131_),
    .ZN(_0070_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2800_ (.A1(_1369_),
    .A2(_0513_),
    .ZN(_1132_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2801_ (.A1(\wave_cycle_cnt[5] ),
    .A2(_0512_),
    .ZN(_1133_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2802_ (.A1(_1369_),
    .A2(_0512_),
    .B(_1133_),
    .ZN(_1134_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2803_ (.A1(\capture_step[0] ),
    .A2(_1134_),
    .B(capture_pending),
    .ZN(_1135_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2804_ (.A1(_0650_),
    .A2(_1135_),
    .ZN(_1136_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2805_ (.A1(\wave_cycle_cnt[5] ),
    .A2(_0513_),
    .B1(_1086_),
    .B2(_1136_),
    .C(_1132_),
    .ZN(_1137_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2806_ (.A1(_0650_),
    .A2(_1134_),
    .B(\capture_step[2] ),
    .ZN(_1138_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2807_ (.A1(_1093_),
    .A2(_1135_),
    .A3(_1138_),
    .ZN(_1139_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2808_ (.A1(_0639_),
    .A2(_1139_),
    .ZN(_1140_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2809_ (.A1(_1369_),
    .A2(_0635_),
    .B1(_1137_),
    .B2(_1140_),
    .ZN(_0071_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2810_ (.A1(_1370_),
    .A2(_0513_),
    .ZN(_1141_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2811_ (.A1(\wave_cycle_cnt[6] ),
    .A2(_0512_),
    .ZN(_1142_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2812_ (.A1(_1370_),
    .A2(_0512_),
    .B(_1142_),
    .ZN(_1143_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2813_ (.A1(\capture_step[0] ),
    .A2(_1143_),
    .B(capture_pending),
    .ZN(_1144_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2814_ (.A1(_0650_),
    .A2(_1144_),
    .ZN(_1145_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2815_ (.A1(\wave_cycle_cnt[6] ),
    .A2(_0513_),
    .B1(_1086_),
    .B2(_1145_),
    .C(_1141_),
    .ZN(_1146_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2816_ (.A1(_0650_),
    .A2(_1143_),
    .B(\capture_step[2] ),
    .ZN(_1147_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2817_ (.A1(_1093_),
    .A2(_1144_),
    .A3(_1147_),
    .ZN(_1148_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2818_ (.A1(_0639_),
    .A2(_1148_),
    .ZN(_1149_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2819_ (.A1(_1370_),
    .A2(_0635_),
    .B1(_1146_),
    .B2(_1149_),
    .ZN(_0072_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2820_ (.A1(_1371_),
    .A2(_0513_),
    .ZN(_1150_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2821_ (.A1(\wave_cycle_cnt[7] ),
    .A2(_0512_),
    .ZN(_1151_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2822_ (.A1(_1371_),
    .A2(_0512_),
    .B(_1151_),
    .ZN(_1152_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2823_ (.A1(\capture_step[0] ),
    .A2(_1152_),
    .B(capture_pending),
    .ZN(_1153_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2824_ (.A1(_0650_),
    .A2(_1153_),
    .ZN(_1154_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _2825_ (.A1(\wave_cycle_cnt[7] ),
    .A2(_0513_),
    .B1(_1086_),
    .B2(_1154_),
    .C(_1150_),
    .ZN(_1155_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2826_ (.A1(_0650_),
    .A2(_1152_),
    .B(\capture_step[2] ),
    .ZN(_1156_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _2827_ (.A1(_1093_),
    .A2(_1153_),
    .A3(_1156_),
    .ZN(_1157_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2828_ (.A1(_0639_),
    .A2(_1157_),
    .ZN(_1158_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2829_ (.A1(_1371_),
    .A2(_0635_),
    .B1(_1155_),
    .B2(_1158_),
    .ZN(_0073_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2830_ (.A1(_0653_),
    .A2(_1093_),
    .ZN(_1159_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _2831_ (.A1(_0653_),
    .A2(_1093_),
    .B(_0513_),
    .ZN(_1160_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2832_ (.A1(_0514_),
    .A2(_1159_),
    .ZN(_1161_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2833_ (.A1(\phase_acc[0] ),
    .A2(_1160_),
    .ZN(_1162_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2834_ (.A1(raw_edge1[0]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1163_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2835_ (.A1(_1317_),
    .A2(_0635_),
    .B1(_1162_),
    .B2(_1163_),
    .ZN(_0074_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2836_ (.A1(\phase_acc[1] ),
    .A2(_1160_),
    .ZN(_1164_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2837_ (.A1(raw_edge1[1]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1165_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2838_ (.A1(_1313_),
    .A2(_0635_),
    .B1(_1164_),
    .B2(_1165_),
    .ZN(_0075_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2839_ (.A1(raw_edge1[2]),
    .A2(_1161_),
    .ZN(_1166_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2840_ (.A1(\phase_acc[2] ),
    .A2(_1160_),
    .B(_0639_),
    .ZN(_1167_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2841_ (.A1(_1315_),
    .A2(_0635_),
    .B1(_1166_),
    .B2(_1167_),
    .ZN(_0076_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2842_ (.A1(\phase_acc[3] ),
    .A2(_1160_),
    .ZN(_1168_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2843_ (.A1(raw_edge1[3]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1169_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2844_ (.A1(_1320_),
    .A2(_0635_),
    .B1(_1168_),
    .B2(_1169_),
    .ZN(_0077_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2845_ (.A1(\phase_acc[4] ),
    .A2(_1160_),
    .ZN(_1170_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2846_ (.A1(raw_edge1[4]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1171_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2847_ (.A1(_1322_),
    .A2(_0635_),
    .B1(_1170_),
    .B2(_1171_),
    .ZN(_0078_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2848_ (.A1(\phase_acc[5] ),
    .A2(_1160_),
    .ZN(_1172_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2849_ (.A1(raw_edge1[5]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1173_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2850_ (.A1(_1324_),
    .A2(_0635_),
    .B1(_1172_),
    .B2(_1173_),
    .ZN(_0079_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2851_ (.A1(raw_edge1[6]),
    .A2(_1161_),
    .ZN(_1174_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2852_ (.A1(\phase_acc[6] ),
    .A2(_1160_),
    .B(_0639_),
    .ZN(_1175_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2853_ (.A1(_1326_),
    .A2(_0635_),
    .B1(_1174_),
    .B2(_1175_),
    .ZN(_0080_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2854_ (.A1(\phase_acc[7] ),
    .A2(_1160_),
    .ZN(_1176_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2855_ (.A1(raw_edge1[7]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1177_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2856_ (.A1(_1328_),
    .A2(_0635_),
    .B1(_1176_),
    .B2(_1177_),
    .ZN(_0081_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2857_ (.A1(raw_edge1[8]),
    .A2(_1161_),
    .ZN(_1178_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2858_ (.A1(\phase_acc[8] ),
    .A2(_1160_),
    .B(_0639_),
    .ZN(_1179_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2859_ (.A1(_1330_),
    .A2(_0635_),
    .B1(_1178_),
    .B2(_1179_),
    .ZN(_0082_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2860_ (.A1(\phase_acc[9] ),
    .A2(_1160_),
    .ZN(_1180_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2861_ (.A1(raw_edge1[9]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1181_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2862_ (.A1(_1332_),
    .A2(_0635_),
    .B1(_1180_),
    .B2(_1181_),
    .ZN(_0083_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2863_ (.A1(\phase_acc[10] ),
    .A2(_1160_),
    .ZN(_1182_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2864_ (.A1(raw_edge1[10]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1183_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2865_ (.A1(_1334_),
    .A2(_0635_),
    .B1(_1182_),
    .B2(_1183_),
    .ZN(_0084_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2866_ (.A1(\phase_acc[11] ),
    .A2(_1160_),
    .ZN(_1184_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2867_ (.A1(raw_edge1[11]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1185_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2868_ (.A1(_1336_),
    .A2(_0635_),
    .B1(_1184_),
    .B2(_1185_),
    .ZN(_0085_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2869_ (.A1(raw_edge1[12]),
    .A2(_1161_),
    .ZN(_1186_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2870_ (.A1(\phase_acc[12] ),
    .A2(_1160_),
    .B(_0639_),
    .ZN(_1187_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2871_ (.A1(_1338_),
    .A2(_0635_),
    .B1(_1186_),
    .B2(_1187_),
    .ZN(_0086_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2872_ (.A1(raw_edge1[13]),
    .A2(_1161_),
    .ZN(_1188_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2873_ (.A1(\phase_acc[13] ),
    .A2(_1160_),
    .B(_0639_),
    .ZN(_1189_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2874_ (.A1(_1340_),
    .A2(_0635_),
    .B1(_1188_),
    .B2(_1189_),
    .ZN(_0087_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2875_ (.A1(\phase_acc[14] ),
    .A2(_1160_),
    .ZN(_1190_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2876_ (.A1(raw_edge1[14]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1191_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2877_ (.A1(_1342_),
    .A2(_0635_),
    .B1(_1190_),
    .B2(_1191_),
    .ZN(_0088_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2878_ (.A1(\phase_acc[15] ),
    .A2(_1160_),
    .ZN(_1192_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2879_ (.A1(raw_edge1[15]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1193_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2880_ (.A1(_1344_),
    .A2(_0635_),
    .B1(_1192_),
    .B2(_1193_),
    .ZN(_0089_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2881_ (.A1(\phase_acc[16] ),
    .A2(_1160_),
    .ZN(_1194_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2882_ (.A1(raw_edge1[16]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1195_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2883_ (.A1(_1346_),
    .A2(_0635_),
    .B1(_1194_),
    .B2(_1195_),
    .ZN(_0090_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2884_ (.A1(\phase_acc[17] ),
    .A2(_1160_),
    .ZN(_1196_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2885_ (.A1(raw_edge1[17]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1197_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2886_ (.A1(_1348_),
    .A2(_0635_),
    .B1(_1196_),
    .B2(_1197_),
    .ZN(_0091_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2887_ (.A1(\phase_acc[18] ),
    .A2(_1160_),
    .ZN(_1198_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2888_ (.A1(raw_edge1[18]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1199_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2889_ (.A1(_1350_),
    .A2(_0635_),
    .B1(_1198_),
    .B2(_1199_),
    .ZN(_0092_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2890_ (.A1(\phase_acc[19] ),
    .A2(_1160_),
    .ZN(_1200_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2891_ (.A1(raw_edge1[19]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1201_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2892_ (.A1(_1352_),
    .A2(_0635_),
    .B1(_1200_),
    .B2(_1201_),
    .ZN(_0093_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _2893_ (.A1(\phase_acc[20] ),
    .A2(_1160_),
    .ZN(_1202_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2894_ (.A1(raw_edge1[20]),
    .A2(_1161_),
    .B(_0639_),
    .ZN(_1203_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _2895_ (.A1(_1353_),
    .A2(_0635_),
    .B1(_1202_),
    .B2(_1203_),
    .ZN(_0094_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2896_ (.A1(raw_edge2[0]),
    .A2(_0676_),
    .ZN(_1204_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2897_ (.A1(_0676_),
    .A2(_0765_),
    .B(_1204_),
    .ZN(_0095_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2898_ (.A1(raw_edge2[1]),
    .A2(_0676_),
    .ZN(_1205_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2899_ (.A1(\phase_acc[1] ),
    .A2(soft_rst_n),
    .ZN(_1206_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2900_ (.A1(_0676_),
    .A2(_1206_),
    .B(_1205_),
    .ZN(_0096_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2901_ (.A1(raw_edge2[2]),
    .A2(_0676_),
    .ZN(_1207_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2902_ (.A1(\phase_acc[2] ),
    .A2(soft_rst_n),
    .ZN(_1208_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2903_ (.A1(_0676_),
    .A2(_1208_),
    .B(_1207_),
    .ZN(_0097_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2904_ (.A1(raw_edge2[3]),
    .A2(_0676_),
    .ZN(_1209_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2905_ (.A1(\phase_acc[3] ),
    .A2(soft_rst_n),
    .ZN(_1210_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2906_ (.A1(_0676_),
    .A2(_1210_),
    .B(_1209_),
    .ZN(_0098_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2907_ (.A1(raw_edge2[4]),
    .A2(_0676_),
    .ZN(_1211_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2908_ (.A1(_0676_),
    .A2(_0769_),
    .B(_1211_),
    .ZN(_0099_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2909_ (.A1(raw_edge2[5]),
    .A2(_0676_),
    .ZN(_1212_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2910_ (.A1(_0676_),
    .A2(_0771_),
    .B(_1212_),
    .ZN(_0100_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2911_ (.A1(raw_edge2[6]),
    .A2(_0676_),
    .ZN(_1213_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2912_ (.A1(\phase_acc[6] ),
    .A2(soft_rst_n),
    .ZN(_1214_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2913_ (.A1(_0676_),
    .A2(_1214_),
    .B(_1213_),
    .ZN(_0101_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2914_ (.A1(raw_edge2[7]),
    .A2(_0676_),
    .ZN(_1215_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2915_ (.A1(\phase_acc[7] ),
    .A2(soft_rst_n),
    .ZN(_1216_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2916_ (.A1(_0676_),
    .A2(_1216_),
    .B(_1215_),
    .ZN(_0102_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2917_ (.A1(raw_edge2[8]),
    .A2(_0676_),
    .ZN(_1217_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2918_ (.A1(_0676_),
    .A2(_0775_),
    .B(_1217_),
    .ZN(_0103_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2919_ (.A1(raw_edge2[9]),
    .A2(_0676_),
    .ZN(_1218_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2920_ (.A1(\phase_acc[9] ),
    .A2(soft_rst_n),
    .ZN(_1219_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2921_ (.A1(_0676_),
    .A2(_1219_),
    .B(_1218_),
    .ZN(_0104_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2922_ (.A1(raw_edge2[10]),
    .A2(_0676_),
    .ZN(_1220_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2923_ (.A1(_0676_),
    .A2(_0779_),
    .B(_1220_),
    .ZN(_0105_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2924_ (.A1(raw_edge2[11]),
    .A2(_0676_),
    .ZN(_1221_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2925_ (.A1(_0676_),
    .A2(_0780_),
    .B(_1221_),
    .ZN(_0106_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2926_ (.A1(raw_edge2[12]),
    .A2(_0676_),
    .ZN(_1222_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2927_ (.A1(_0659_),
    .A2(_0676_),
    .B(_1222_),
    .ZN(_0107_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2928_ (.A1(raw_edge2[13]),
    .A2(_0676_),
    .ZN(_1223_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2929_ (.A1(_0660_),
    .A2(_0676_),
    .B(_1223_),
    .ZN(_0108_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2930_ (.A1(raw_edge2[14]),
    .A2(_0676_),
    .ZN(_1224_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2931_ (.A1(_0662_),
    .A2(_0676_),
    .B(_1224_),
    .ZN(_0109_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2932_ (.A1(raw_edge2[15]),
    .A2(_0676_),
    .ZN(_1225_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2933_ (.A1(_0664_),
    .A2(_0676_),
    .B(_1225_),
    .ZN(_0110_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2934_ (.A1(raw_edge2[16]),
    .A2(_0676_),
    .ZN(_1226_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2935_ (.A1(_0667_),
    .A2(_0676_),
    .B(_1226_),
    .ZN(_0111_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2936_ (.A1(raw_edge2[17]),
    .A2(_0676_),
    .ZN(_1227_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2937_ (.A1(_0669_),
    .A2(_0676_),
    .B(_1227_),
    .ZN(_0112_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2938_ (.A1(raw_edge2[18]),
    .A2(_0676_),
    .ZN(_1228_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2939_ (.A1(_0671_),
    .A2(_0676_),
    .B(_1228_),
    .ZN(_0113_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2940_ (.A1(raw_edge2[19]),
    .A2(_0676_),
    .ZN(_1229_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2941_ (.A1(_0672_),
    .A2(_0676_),
    .B(_1229_),
    .ZN(_0114_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2942_ (.A1(raw_edge2[20]),
    .A2(_0676_),
    .ZN(_1230_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2943_ (.A1(_0675_),
    .A2(_0676_),
    .B(_1230_),
    .ZN(_0115_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2944_ (.A1(cal_phase0_offset[0]),
    .A2(_0657_),
    .ZN(_1231_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2945_ (.A1(_0657_),
    .A2(_0765_),
    .B(_1231_),
    .ZN(_0116_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2946_ (.A1(cal_phase0_offset[1]),
    .A2(_0657_),
    .ZN(_1232_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2947_ (.A1(_0657_),
    .A2(_1206_),
    .B(_1232_),
    .ZN(_0117_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2948_ (.A1(raw_edge3[2]),
    .A2(_0657_),
    .ZN(_1233_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2949_ (.A1(_0657_),
    .A2(_1208_),
    .B(_1233_),
    .ZN(_0118_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2950_ (.A1(raw_edge3[3]),
    .A2(_0657_),
    .ZN(_1234_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2951_ (.A1(_0657_),
    .A2(_1210_),
    .B(_1234_),
    .ZN(_0119_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2952_ (.A1(raw_edge3[4]),
    .A2(_0657_),
    .ZN(_1235_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2953_ (.A1(_0657_),
    .A2(_0769_),
    .B(_1235_),
    .ZN(_0120_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2954_ (.A1(raw_edge3[5]),
    .A2(_0657_),
    .ZN(_1236_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2955_ (.A1(_0657_),
    .A2(_0771_),
    .B(_1236_),
    .ZN(_0121_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2956_ (.A1(raw_edge3[6]),
    .A2(_0657_),
    .ZN(_1237_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2957_ (.A1(_0657_),
    .A2(_1214_),
    .B(_1237_),
    .ZN(_0122_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2958_ (.A1(raw_edge3[7]),
    .A2(_0657_),
    .ZN(_1238_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2959_ (.A1(_0657_),
    .A2(_1216_),
    .B(_1238_),
    .ZN(_0123_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2960_ (.A1(raw_edge3[8]),
    .A2(_0657_),
    .ZN(_1239_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2961_ (.A1(_0657_),
    .A2(_0775_),
    .B(_1239_),
    .ZN(_0124_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2962_ (.A1(raw_edge3[9]),
    .A2(_0657_),
    .ZN(_1240_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2963_ (.A1(_0657_),
    .A2(_1219_),
    .B(_1240_),
    .ZN(_0125_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2964_ (.A1(raw_edge3[10]),
    .A2(_0657_),
    .ZN(_1241_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2965_ (.A1(_0657_),
    .A2(_0779_),
    .B(_1241_),
    .ZN(_0126_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _2966_ (.A1(raw_edge3[11]),
    .A2(_0657_),
    .ZN(_1242_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _2967_ (.A1(_0657_),
    .A2(_0780_),
    .B(_1242_),
    .ZN(_0127_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2968_ (.I(\phase_acc[18] ),
    .ZN(_1243_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2969_ (.I(cfg_phase0_offset[17]),
    .ZN(_1244_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2970_ (.I(\phase_acc[17] ),
    .ZN(_1245_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2971_ (.I(\phase_acc[16] ),
    .ZN(_1246_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2972_ (.I(cfg_phase0_offset[16]),
    .ZN(_1247_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2973_ (.I(\phase_acc[15] ),
    .ZN(_1248_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2974_ (.I(\phase_acc[14] ),
    .ZN(_1249_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2975_ (.I(cfg_phase0_offset[13]),
    .ZN(_1250_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2976_ (.I(\phase_acc[13] ),
    .ZN(_1251_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2977_ (.I(\phase_acc[12] ),
    .ZN(_1252_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2978_ (.I(cfg_phase0_offset[11]),
    .ZN(_1253_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2979_ (.I(\phase_acc[11] ),
    .ZN(_1254_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2980_ (.I(cfg_phase0_offset[10]),
    .ZN(_1255_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2981_ (.I(\phase_acc[10] ),
    .ZN(_1256_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2982_ (.I(\phase_acc[9] ),
    .ZN(_1257_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2983_ (.I(\phase_acc[8] ),
    .ZN(_1258_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2984_ (.I(\phase_acc[7] ),
    .ZN(_1259_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2985_ (.I(\phase_acc[6] ),
    .ZN(_1260_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2986_ (.I(\phase_acc[5] ),
    .ZN(_1261_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2987_ (.I(\phase_acc[4] ),
    .ZN(_1262_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2988_ (.I(\phase_acc[3] ),
    .ZN(_1263_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2989_ (.I(\phase_acc[2] ),
    .ZN(_1264_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2990_ (.I(\phase_acc[1] ),
    .ZN(_1265_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2991_ (.I(\phase_acc[0] ),
    .ZN(_1266_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2992_ (.I(cal_start),
    .ZN(_1267_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2993_ (.I(\cal_burst_count[0] ),
    .ZN(_1268_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2994_ (.I(\cal_burst_count[1] ),
    .ZN(_1269_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2995_ (.I(\phase_acc[20] ),
    .ZN(_1270_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2996_ (.I(\phase_acc[19] ),
    .ZN(_1271_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2997_ (.I(cfg_phase270_offset[15]),
    .ZN(_1272_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2998_ (.I(cfg_phase270_offset[14]),
    .ZN(_1273_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _2999_ (.I(cfg_phase270_offset[11]),
    .ZN(_1274_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3000_ (.I(cfg_phase270_offset[10]),
    .ZN(_1275_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3001_ (.I(cfg_phase270_offset[7]),
    .ZN(_1276_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3002_ (.I(cfg_phase270_offset[5]),
    .ZN(_1277_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3003_ (.I(cfg_f_MEMS_fcw[14]),
    .ZN(_1278_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3004_ (.I(cfg_f_MEMS_fcw[13]),
    .ZN(_1279_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3005_ (.I(cfg_f_MEMS_fcw[11]),
    .ZN(_1280_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3006_ (.I(cfg_f_MEMS_fcw[10]),
    .ZN(_1281_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3007_ (.I(cfg_f_MEMS_fcw[9]),
    .ZN(_1282_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3008_ (.I(cfg_f_MEMS_fcw[8]),
    .ZN(_1283_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3009_ (.I(cfg_f_MEMS_fcw[7]),
    .ZN(_1284_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3010_ (.I(cfg_f_MEMS_fcw[6]),
    .ZN(_1285_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3011_ (.I(cfg_f_MEMS_fcw[5]),
    .ZN(_1286_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3012_ (.I(cfg_f_MEMS_fcw[4]),
    .ZN(_1287_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3013_ (.I(cfg_f_MEMS_fcw[3]),
    .ZN(_1288_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3014_ (.I(cfg_f_MEMS_fcw[1]),
    .ZN(_1289_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3015_ (.I(cfg_f_MEMS_fcw[0]),
    .ZN(_1290_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3016_ (.I(soft_rst_n),
    .ZN(_1291_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3017_ (.I(cfg_phase90_offset[17]),
    .ZN(_1292_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3018_ (.I(cfg_phase90_offset[15]),
    .ZN(_1293_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3019_ (.I(cfg_phase90_offset[14]),
    .ZN(_1294_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3020_ (.I(cfg_phase90_offset[11]),
    .ZN(_1295_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3021_ (.I(cfg_phase90_offset[10]),
    .ZN(_1296_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3022_ (.I(cfg_phase90_offset[9]),
    .ZN(_1297_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3023_ (.I(cfg_phase90_offset[8]),
    .ZN(_1298_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3024_ (.I(cfg_phase90_offset[7]),
    .ZN(_1299_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3025_ (.I(cfg_phase90_offset[5]),
    .ZN(_1300_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3026_ (.I(cfg_phase90_offset[0]),
    .ZN(_1301_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3027_ (.I(comp_sync3),
    .ZN(_1302_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3028_ (.I(raw_edge3[3]),
    .ZN(_1303_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3029_ (.I(raw_edge3[4]),
    .ZN(_1304_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3030_ (.I(raw_edge3[6]),
    .ZN(_1305_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3031_ (.I(raw_edge3[11]),
    .ZN(_1306_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3032_ (.I(raw_edge3[13]),
    .ZN(_1307_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3033_ (.I(raw_edge3[14]),
    .ZN(_1308_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3034_ (.I(raw_edge3[15]),
    .ZN(_1309_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3035_ (.I(raw_edge3[16]),
    .ZN(_1310_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3036_ (.I(raw_edge3[17]),
    .ZN(_1311_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3037_ (.I(\ds_acc[5] ),
    .ZN(_1312_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3038_ (.I(raw_edge1[1]),
    .ZN(_1313_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3039_ (.I(raw_edge2[2]),
    .ZN(_1314_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3040_ (.I(raw_edge1[2]),
    .ZN(_1315_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3041_ (.I(raw_edge2[1]),
    .ZN(_1316_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3042_ (.I(raw_edge1[0]),
    .ZN(_1317_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3043_ (.I(raw_edge2[0]),
    .ZN(_1318_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3044_ (.I(raw_edge2[3]),
    .ZN(_1319_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3045_ (.I(raw_edge1[3]),
    .ZN(_1320_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3046_ (.I(raw_edge2[4]),
    .ZN(_1321_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3047_ (.I(raw_edge1[4]),
    .ZN(_1322_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3048_ (.I(raw_edge2[5]),
    .ZN(_1323_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3049_ (.I(raw_edge1[5]),
    .ZN(_1324_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3050_ (.I(raw_edge2[6]),
    .ZN(_1325_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3051_ (.I(raw_edge1[6]),
    .ZN(_1326_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3052_ (.I(raw_edge2[7]),
    .ZN(_1327_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3053_ (.I(raw_edge1[7]),
    .ZN(_1328_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3054_ (.I(raw_edge2[8]),
    .ZN(_1329_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3055_ (.I(raw_edge1[8]),
    .ZN(_1330_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3056_ (.I(raw_edge2[9]),
    .ZN(_1331_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3057_ (.I(raw_edge1[9]),
    .ZN(_1332_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3058_ (.I(raw_edge2[10]),
    .ZN(_1333_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3059_ (.I(raw_edge1[10]),
    .ZN(_1334_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3060_ (.I(raw_edge2[11]),
    .ZN(_1335_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3061_ (.I(raw_edge1[11]),
    .ZN(_1336_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3062_ (.I(raw_edge2[12]),
    .ZN(_1337_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3063_ (.I(raw_edge1[12]),
    .ZN(_1338_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3064_ (.I(raw_edge2[13]),
    .ZN(_1339_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3065_ (.I(raw_edge1[13]),
    .ZN(_1340_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3066_ (.I(raw_edge2[14]),
    .ZN(_1341_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3067_ (.I(raw_edge1[14]),
    .ZN(_1342_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3068_ (.I(raw_edge2[15]),
    .ZN(_1343_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3069_ (.I(raw_edge1[15]),
    .ZN(_1344_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3070_ (.I(raw_edge2[16]),
    .ZN(_1345_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3071_ (.I(raw_edge1[16]),
    .ZN(_1346_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3072_ (.I(raw_edge2[17]),
    .ZN(_1347_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3073_ (.I(raw_edge1[17]),
    .ZN(_1348_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3074_ (.I(raw_edge2[18]),
    .ZN(_1349_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3075_ (.I(raw_edge1[18]),
    .ZN(_1350_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3076_ (.I(raw_edge2[19]),
    .ZN(_1351_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3077_ (.I(raw_edge1[19]),
    .ZN(_1352_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3078_ (.I(raw_edge1[20]),
    .ZN(_1353_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3079_ (.I(cal_phase0_offset[0]),
    .ZN(_1354_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3080_ (.I(latch_phase90_ack),
    .ZN(_1355_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3081_ (.I(latch_phase270_ack),
    .ZN(_1356_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3082_ (.I(\wave_cycle_cnt[0] ),
    .ZN(_1357_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3083_ (.I(\wave_cycle_cnt[3] ),
    .ZN(_1358_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3084_ (.I(\wave_cycle_cnt[2] ),
    .ZN(_1359_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3085_ (.I(\wave_cycle_cnt[4] ),
    .ZN(_1360_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3086_ (.I(\wave_cycle_cnt[6] ),
    .ZN(_1361_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3087_ (.I(cal_done),
    .ZN(_1362_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3088_ (.I(\capture_step[0] ),
    .ZN(_1363_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3089_ (.I(delay_wave_cycle[0]),
    .ZN(_1364_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3090_ (.I(delay_wave_cycle[1]),
    .ZN(_1365_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3091_ (.I(delay_wave_cycle[2]),
    .ZN(_1366_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3092_ (.I(delay_wave_cycle[3]),
    .ZN(_1367_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3093_ (.I(delay_wave_cycle[4]),
    .ZN(_1368_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3094_ (.I(delay_wave_cycle[5]),
    .ZN(_1369_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3095_ (.I(delay_wave_cycle[6]),
    .ZN(_1370_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3096_ (.I(delay_wave_cycle[7]),
    .ZN(_1371_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3097_ (.I(capture_pending),
    .ZN(_1372_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3098_ (.A1(_1253_),
    .A2(\phase_acc[11] ),
    .B1(_1255_),
    .B2(\phase_acc[10] ),
    .ZN(_1373_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3099_ (.A1(_1253_),
    .A2(\phase_acc[11] ),
    .ZN(_1374_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _3100_ (.A1(cfg_phase0_offset[1]),
    .A2(_1265_),
    .B(cfg_phase0_offset[0]),
    .C(_1266_),
    .ZN(_1375_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3101_ (.A1(cfg_phase0_offset[2]),
    .A2(_1264_),
    .B1(cfg_phase0_offset[1]),
    .B2(_1265_),
    .ZN(_1376_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3102_ (.A1(_1375_),
    .A2(_1376_),
    .Z(_1377_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _3103_ (.A1(cfg_phase0_offset[3]),
    .A2(_1263_),
    .B1(cfg_phase0_offset[2]),
    .B2(_1264_),
    .ZN(_1378_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3104_ (.A1(_1262_),
    .A2(cfg_phase0_offset[4]),
    .B1(cfg_phase0_offset[3]),
    .B2(_1263_),
    .ZN(_1379_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3105_ (.A1(_1377_),
    .A2(_1378_),
    .B(_1379_),
    .ZN(_1380_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _3106_ (.A1(cfg_phase0_offset[5]),
    .A2(_1261_),
    .B1(_1262_),
    .B2(cfg_phase0_offset[4]),
    .C(_1380_),
    .ZN(_1381_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3107_ (.A1(cfg_phase0_offset[6]),
    .A2(_1260_),
    .B1(cfg_phase0_offset[5]),
    .B2(_1261_),
    .ZN(_1382_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _3108_ (.A1(cfg_phase0_offset[7]),
    .A2(_1259_),
    .B1(cfg_phase0_offset[6]),
    .B2(_1260_),
    .ZN(_1383_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3109_ (.A1(_1381_),
    .A2(_1382_),
    .B(_1383_),
    .ZN(_1384_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _3110_ (.A1(_1258_),
    .A2(cfg_phase0_offset[8]),
    .B1(cfg_phase0_offset[7]),
    .B2(_1259_),
    .C(_1384_),
    .ZN(_1385_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _3111_ (.A1(cfg_phase0_offset[9]),
    .A2(_1257_),
    .B1(_1258_),
    .B2(cfg_phase0_offset[8]),
    .ZN(_1386_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3112_ (.A1(cfg_phase0_offset[9]),
    .A2(_1257_),
    .B(_1374_),
    .ZN(_1387_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _3113_ (.A1(_1255_),
    .A2(\phase_acc[10] ),
    .B1(_1385_),
    .B2(_1386_),
    .C(_1387_),
    .ZN(_1388_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _3114_ (.I0(_1374_),
    .I1(_1388_),
    .S(_1373_),
    .Z(_1389_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _3115_ (.A1(cfg_phase0_offset[15]),
    .A2(_1248_),
    .B1(cfg_phase0_offset[14]),
    .B2(_1249_),
    .ZN(_1390_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3116_ (.A1(cfg_phase0_offset[15]),
    .A2(_1248_),
    .Z(_1391_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3117_ (.A1(cfg_phase0_offset[15]),
    .A2(_1248_),
    .ZN(_1392_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _3118_ (.A1(cfg_phase0_offset[14]),
    .A2(_1249_),
    .B(_1390_),
    .C(_1391_),
    .ZN(_1393_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _3119_ (.A1(cfg_phase0_offset[13]),
    .A2(_1251_),
    .B1(_1252_),
    .B2(cfg_phase0_offset[12]),
    .ZN(_1394_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3120_ (.A1(_1252_),
    .A2(cfg_phase0_offset[12]),
    .ZN(_1395_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _3121_ (.A1(_1250_),
    .A2(\phase_acc[13] ),
    .B(_1393_),
    .C(_1395_),
    .ZN(_1396_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _3122_ (.A1(_1389_),
    .A2(_1394_),
    .A3(_1396_),
    .Z(_1397_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3123_ (.A1(_1390_),
    .A2(_1392_),
    .ZN(_1398_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _3124_ (.A1(_1250_),
    .A2(\phase_acc[13] ),
    .B(_1393_),
    .C(_1394_),
    .ZN(_1399_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3125_ (.A1(_1397_),
    .A2(_1398_),
    .A3(_1399_),
    .ZN(_1400_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _3126_ (.A1(cfg_phase0_offset[18]),
    .A2(_1243_),
    .B1(_1271_),
    .B2(cfg_phase0_offset[19]),
    .ZN(_1401_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3127_ (.A1(_1271_),
    .A2(cfg_phase0_offset[19]),
    .ZN(_1402_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _3128_ (.A1(_1246_),
    .A2(cfg_phase0_offset[16]),
    .B1(_1271_),
    .B2(cfg_phase0_offset[19]),
    .C(_1401_),
    .ZN(_1403_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3129_ (.A1(_1244_),
    .A2(\phase_acc[17] ),
    .B1(\phase_acc[16] ),
    .B2(_1247_),
    .ZN(_1404_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3130_ (.A1(cfg_phase0_offset[18]),
    .A2(_1243_),
    .B1(cfg_phase0_offset[17]),
    .B2(_1245_),
    .ZN(_1405_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _3131_ (.A1(_1400_),
    .A2(_1403_),
    .A3(_1404_),
    .A4(_1405_),
    .ZN(_1406_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _3132_ (.A1(cfg_phase0_offset[18]),
    .A2(_1243_),
    .B1(cfg_phase0_offset[17]),
    .B2(_1245_),
    .C(_1404_),
    .ZN(_1407_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3133_ (.A1(_1401_),
    .A2(_1407_),
    .B(_1402_),
    .ZN(_1408_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3134_ (.A1(_1406_),
    .A2(_1408_),
    .ZN(_1409_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3135_ (.A1(_1267_),
    .A2(cfg_done),
    .ZN(_1410_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3136_ (.A1(\phase_acc[20] ),
    .A2(cfg_phase0_offset[20]),
    .A3(_1409_),
    .Z(_1411_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3137_ (.A1(_1410_),
    .A2(_1411_),
    .ZN(_0005_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3138_ (.A1(_1291_),
    .A2(_1302_),
    .ZN(_0004_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3139_ (.A1(soft_rst_n),
    .A2(comp_sync2),
    .Z(_0003_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3140_ (.A1(soft_rst_n),
    .A2(comp_sync1),
    .Z(_0002_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3141_ (.A1(soft_rst_n),
    .A2(comp_sync0),
    .Z(_0001_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3142_ (.A1(soft_rst_n),
    .A2(comp),
    .Z(_0000_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3143_ (.A1(_1289_),
    .A2(raw_edge3[3]),
    .ZN(_1412_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3144_ (.A1(cfg_f_MEMS_fcw[1]),
    .A2(raw_edge3[3]),
    .ZN(_1413_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3145_ (.A1(_1290_),
    .A2(raw_edge3[2]),
    .ZN(_1414_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3146_ (.A1(_1290_),
    .A2(raw_edge3[2]),
    .B(_1413_),
    .ZN(_1415_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3147_ (.A1(_1413_),
    .A2(_1414_),
    .ZN(cal_phase0_offset[3]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3148_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_1304_),
    .ZN(_1416_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3149_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(raw_edge3[4]),
    .ZN(_1417_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3150_ (.I(_1417_),
    .ZN(_1418_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3151_ (.A1(_1412_),
    .A2(_1415_),
    .ZN(_1419_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3152_ (.A1(_1412_),
    .A2(_1415_),
    .B(_1418_),
    .ZN(_1420_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3153_ (.A1(_1417_),
    .A2(_1419_),
    .Z(cal_phase0_offset[4]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3154_ (.A1(_1288_),
    .A2(raw_edge3[5]),
    .ZN(_1421_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3155_ (.A1(_1288_),
    .A2(raw_edge3[5]),
    .Z(_1422_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3156_ (.A1(_1416_),
    .A2(_1420_),
    .B(_1422_),
    .ZN(_1423_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _3157_ (.A1(_1416_),
    .A2(_1420_),
    .A3(_1422_),
    .Z(_1424_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3158_ (.A1(_1423_),
    .A2(_1424_),
    .Z(cal_phase0_offset[5]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3159_ (.A1(cfg_f_MEMS_fcw[4]),
    .A2(_1305_),
    .ZN(_1425_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3160_ (.A1(_1287_),
    .A2(raw_edge3[6]),
    .Z(_1426_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3161_ (.I(_1426_),
    .ZN(_1427_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3162_ (.A1(_1421_),
    .A2(_1423_),
    .B(_1427_),
    .ZN(_1428_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _3163_ (.A1(_1421_),
    .A2(_1423_),
    .A3(_1427_),
    .Z(_1429_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3164_ (.A1(_1428_),
    .A2(_1429_),
    .ZN(cal_phase0_offset[6]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3165_ (.A1(_1425_),
    .A2(_1428_),
    .ZN(_1430_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3166_ (.A1(_1286_),
    .A2(raw_edge3[7]),
    .ZN(_1431_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3167_ (.A1(cfg_f_MEMS_fcw[5]),
    .A2(raw_edge3[7]),
    .A3(_1430_),
    .Z(cal_phase0_offset[7]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3168_ (.A1(_1285_),
    .A2(raw_edge3[8]),
    .ZN(_1432_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3169_ (.A1(cfg_f_MEMS_fcw[6]),
    .A2(raw_edge3[8]),
    .Z(_1433_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _3170_ (.A1(_1286_),
    .A2(raw_edge3[7]),
    .B(_1425_),
    .C(_1428_),
    .ZN(_1434_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3171_ (.A1(_1431_),
    .A2(_1434_),
    .ZN(_1435_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3172_ (.A1(_1433_),
    .A2(_1435_),
    .ZN(cal_phase0_offset[8]));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3173_ (.A1(_1284_),
    .A2(raw_edge3[9]),
    .Z(_1436_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3174_ (.A1(cfg_f_MEMS_fcw[7]),
    .A2(raw_edge3[9]),
    .Z(_1437_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3175_ (.I(_1437_),
    .ZN(_1438_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _3176_ (.A1(_1431_),
    .A2(_1433_),
    .A3(_1434_),
    .B(_1432_),
    .ZN(_1439_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3177_ (.A1(_1438_),
    .A2(_1439_),
    .Z(cal_phase0_offset[9]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3178_ (.A1(_1283_),
    .A2(raw_edge3[10]),
    .ZN(_1440_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3179_ (.A1(cfg_f_MEMS_fcw[8]),
    .A2(raw_edge3[10]),
    .Z(_1441_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3180_ (.A1(_1438_),
    .A2(_1439_),
    .B(_1436_),
    .ZN(_1442_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3181_ (.A1(_1441_),
    .A2(_1442_),
    .Z(cal_phase0_offset[10]));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3182_ (.A1(_1441_),
    .A2(_1442_),
    .B(_1440_),
    .ZN(_1443_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3183_ (.A1(cfg_f_MEMS_fcw[9]),
    .A2(_1306_),
    .ZN(_1444_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3184_ (.A1(cfg_f_MEMS_fcw[9]),
    .A2(_1306_),
    .A3(_1443_),
    .Z(cal_phase0_offset[11]));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3185_ (.A1(_1281_),
    .A2(raw_edge3[12]),
    .Z(_1445_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3186_ (.A1(_1281_),
    .A2(raw_edge3[12]),
    .Z(_1446_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _3187_ (.A1(cfg_f_MEMS_fcw[9]),
    .A2(_1306_),
    .B1(_1441_),
    .B2(_1442_),
    .C(_1440_),
    .ZN(_1447_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _3188_ (.A1(_1444_),
    .A2(_1446_),
    .A3(_1447_),
    .Z(_1448_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3189_ (.A1(_1444_),
    .A2(_1447_),
    .B(_1446_),
    .ZN(_1449_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3190_ (.A1(_1448_),
    .A2(_1449_),
    .ZN(cal_phase0_offset[12]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3191_ (.A1(_1445_),
    .A2(_1448_),
    .ZN(_1450_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3192_ (.A1(cfg_f_MEMS_fcw[11]),
    .A2(_1307_),
    .ZN(_1451_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3193_ (.A1(cfg_f_MEMS_fcw[11]),
    .A2(_1307_),
    .ZN(_1452_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3194_ (.A1(cfg_f_MEMS_fcw[11]),
    .A2(raw_edge3[13]),
    .A3(_1450_),
    .Z(cal_phase0_offset[13]));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3195_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_1308_),
    .Z(_1453_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3196_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_1308_),
    .ZN(_1454_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3197_ (.A1(_1453_),
    .A2(_1454_),
    .ZN(_1455_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _3198_ (.A1(_1445_),
    .A2(_1448_),
    .A3(_1451_),
    .B(_1452_),
    .ZN(_1456_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3199_ (.A1(_1455_),
    .A2(_1456_),
    .Z(cal_phase0_offset[14]));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3200_ (.A1(_1455_),
    .A2(_1456_),
    .B(_1453_),
    .ZN(_1457_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3201_ (.A1(cfg_f_MEMS_fcw[13]),
    .A2(_1309_),
    .ZN(_1458_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3202_ (.A1(cfg_f_MEMS_fcw[13]),
    .A2(_1309_),
    .A3(_1457_),
    .Z(cal_phase0_offset[15]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3203_ (.A1(cfg_f_MEMS_fcw[14]),
    .A2(_1310_),
    .ZN(_1459_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3204_ (.A1(_1278_),
    .A2(raw_edge3[16]),
    .Z(_1460_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _3205_ (.A1(cfg_f_MEMS_fcw[13]),
    .A2(_1309_),
    .B1(_1455_),
    .B2(_1456_),
    .C(_1453_),
    .ZN(_1461_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _3206_ (.A1(_1458_),
    .A2(_1460_),
    .A3(_1461_),
    .Z(_1462_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3207_ (.A1(_1458_),
    .A2(_1461_),
    .B(_1460_),
    .ZN(_1463_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3208_ (.A1(_1462_),
    .A2(_1463_),
    .ZN(cal_phase0_offset[16]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3209_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_1311_),
    .ZN(_1464_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3210_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_1311_),
    .ZN(_1465_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3211_ (.A1(_1459_),
    .A2(_1462_),
    .ZN(_1466_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3212_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(raw_edge3[17]),
    .A3(_1466_),
    .Z(cal_phase0_offset[17]));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _3213_ (.A1(_1459_),
    .A2(_1462_),
    .A3(_1465_),
    .B(_1464_),
    .ZN(_1467_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3214_ (.I(_1467_),
    .ZN(_1468_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3215_ (.A1(raw_edge3[18]),
    .A2(_1468_),
    .ZN(_1469_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3216_ (.A1(raw_edge3[18]),
    .A2(_1467_),
    .Z(cal_phase0_offset[18]));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _3217_ (.A1(raw_edge3[18]),
    .A2(raw_edge3[19]),
    .A3(_1468_),
    .ZN(_1470_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3218_ (.A1(raw_edge3[19]),
    .A2(_1469_),
    .Z(cal_phase0_offset[19]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3219_ (.A1(raw_edge3[20]),
    .A2(_1470_),
    .Z(cal_phase0_offset[20]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3220_ (.A1(cfg_f_MEMS_fcw[0]),
    .A2(raw_edge3[2]),
    .Z(cal_phase0_offset[2]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3221_ (.A1(\phase_acc[15] ),
    .A2(\phase_acc[19] ),
    .Z(_1471_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3222_ (.A1(\phase_acc[15] ),
    .A2(\phase_acc[19] ),
    .ZN(_1472_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3223_ (.A1(\phase_acc[13] ),
    .A2(\phase_acc[19] ),
    .Z(_1473_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3224_ (.A1(\phase_acc[13] ),
    .A2(\phase_acc[19] ),
    .ZN(_1474_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3225_ (.A1(\phase_acc[14] ),
    .A2(\phase_acc[19] ),
    .Z(_1475_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3226_ (.A1(\phase_acc[14] ),
    .A2(\phase_acc[19] ),
    .ZN(_1476_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3227_ (.A1(_1473_),
    .A2(_1476_),
    .ZN(_1477_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3228_ (.A1(_1471_),
    .A2(_1475_),
    .ZN(_1478_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3229_ (.A1(_1472_),
    .A2(_1476_),
    .ZN(_1479_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _3230_ (.A1(_1471_),
    .A2(_1474_),
    .A3(_1475_),
    .ZN(_1480_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3231_ (.A1(_1472_),
    .A2(_1477_),
    .Z(_1481_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3232_ (.A1(\phase_acc[16] ),
    .A2(\phase_acc[19] ),
    .Z(_1482_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3233_ (.A1(_1246_),
    .A2(\phase_acc[19] ),
    .Z(_1483_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3234_ (.A1(\phase_acc[17] ),
    .A2(\phase_acc[19] ),
    .Z(_1484_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3235_ (.A1(\phase_acc[17] ),
    .A2(\phase_acc[19] ),
    .ZN(_1485_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3236_ (.A1(_1473_),
    .A2(_1475_),
    .ZN(_1486_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3237_ (.A1(_1473_),
    .A2(_1475_),
    .B(_1472_),
    .ZN(_1487_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3238_ (.A1(_1471_),
    .A2(_1486_),
    .ZN(_1488_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3239_ (.A1(_1484_),
    .A2(_1487_),
    .ZN(_1489_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3240_ (.A1(_1478_),
    .A2(_1483_),
    .B(_1484_),
    .ZN(_1490_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3241_ (.A1(_1481_),
    .A2(_1483_),
    .B1(_1489_),
    .B2(_1490_),
    .ZN(_1491_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3242_ (.A1(\phase_acc[18] ),
    .A2(\phase_acc[19] ),
    .ZN(_1492_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3243_ (.I(_1492_),
    .ZN(_1493_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3244_ (.A1(\phase_acc[18] ),
    .A2(\phase_acc[19] ),
    .Z(_1494_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3245_ (.A1(_1243_),
    .A2(\phase_acc[19] ),
    .Z(_1495_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3246_ (.A1(_1473_),
    .A2(_1484_),
    .B(_1495_),
    .ZN(_1496_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3247_ (.A1(_1472_),
    .A2(_1475_),
    .ZN(_1497_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3248_ (.A1(_1474_),
    .A2(_1482_),
    .ZN(_1498_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3249_ (.A1(_1473_),
    .A2(_1483_),
    .ZN(_1499_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3250_ (.A1(_1471_),
    .A2(_1475_),
    .ZN(_1500_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _3251_ (.A1(_1482_),
    .A2(_1497_),
    .B1(_1498_),
    .B2(_1500_),
    .C(_1485_),
    .ZN(_1501_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3252_ (.A1(_1482_),
    .A2(_1485_),
    .ZN(_1502_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3253_ (.A1(_1472_),
    .A2(_1474_),
    .ZN(_1503_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3254_ (.A1(_1477_),
    .A2(_1503_),
    .B(_1502_),
    .ZN(_1504_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _3255_ (.A1(_1495_),
    .A2(_1501_),
    .A3(_1504_),
    .B1(_1496_),
    .B2(_1491_),
    .ZN(_1505_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3256_ (.A1(cfg_done),
    .A2(cal_burst_active),
    .ZN(_1506_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3257_ (.A1(_1410_),
    .A2(_1506_),
    .ZN(_1507_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3258_ (.A1(_1505_),
    .A2(_1507_),
    .ZN(_1508_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3259_ (.A1(\ds_acc[0] ),
    .A2(_1505_),
    .A3(_1507_),
    .ZN(_1509_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3260_ (.A1(\phase_acc[14] ),
    .A2(\phase_acc[13] ),
    .ZN(_1510_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3261_ (.A1(_1472_),
    .A2(_1510_),
    .ZN(_1511_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3262_ (.A1(_1471_),
    .A2(_1474_),
    .A3(_1475_),
    .ZN(_1512_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _3263_ (.A1(_1511_),
    .A2(_1512_),
    .B(_1482_),
    .C(_1485_),
    .ZN(_1513_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3264_ (.A1(_1472_),
    .A2(_1474_),
    .ZN(_1514_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _3265_ (.A1(_1471_),
    .A2(_1473_),
    .B(_1482_),
    .C(_1484_),
    .ZN(_1515_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3266_ (.A1(_1485_),
    .A2(_1510_),
    .ZN(_1516_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3267_ (.A1(_1514_),
    .A2(_1515_),
    .B(_1516_),
    .ZN(_1517_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3268_ (.A1(_1513_),
    .A2(_1517_),
    .B(_1495_),
    .ZN(_1518_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3269_ (.A1(_1471_),
    .A2(_1510_),
    .Z(_1519_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3270_ (.A1(_1480_),
    .A2(_1519_),
    .B(_1482_),
    .ZN(_1520_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3271_ (.A1(_1499_),
    .A2(_1520_),
    .B(_1484_),
    .ZN(_1521_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3272_ (.A1(_1476_),
    .A2(_1483_),
    .B(_1490_),
    .ZN(_1522_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _3273_ (.A1(_1495_),
    .A2(_1521_),
    .A3(_1522_),
    .B(_1518_),
    .ZN(_1523_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3274_ (.A1(\phase_acc[20] ),
    .A2(_1505_),
    .ZN(_1524_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3275_ (.A1(_1523_),
    .A2(_1524_),
    .ZN(_1525_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3276_ (.A1(_1507_),
    .A2(_1525_),
    .ZN(_1526_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3277_ (.A1(\ds_acc[1] ),
    .A2(_1507_),
    .A3(_1525_),
    .ZN(_1527_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3278_ (.A1(_1507_),
    .A2(_1525_),
    .B(\ds_acc[1] ),
    .ZN(_1528_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3279_ (.A1(\ds_acc[1] ),
    .A2(_1509_),
    .A3(_1526_),
    .Z(_0010_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3280_ (.A1(_1509_),
    .A2(_1528_),
    .B(_1527_),
    .ZN(_1529_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3281_ (.A1(_1505_),
    .A2(_1523_),
    .B(\phase_acc[20] ),
    .ZN(_1530_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3282_ (.A1(_1474_),
    .A2(_1476_),
    .B(_1483_),
    .ZN(_1531_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3283_ (.A1(_1502_),
    .A2(_1516_),
    .B1(_1531_),
    .B2(_1488_),
    .ZN(_1532_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _3284_ (.A1(_1479_),
    .A2(_1483_),
    .A3(_1484_),
    .A4(_1500_),
    .Z(_1533_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3285_ (.A1(_1532_),
    .A2(_1533_),
    .B(_1494_),
    .ZN(_1534_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _3286_ (.A1(_1480_),
    .A2(_1519_),
    .A3(_1531_),
    .ZN(_1535_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3287_ (.A1(_1484_),
    .A2(_1520_),
    .ZN(_1536_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3288_ (.A1(_1481_),
    .A2(_1485_),
    .Z(_1537_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3289_ (.A1(_1535_),
    .A2(_1536_),
    .B(_1495_),
    .ZN(_1538_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3290_ (.A1(_1537_),
    .A2(_1538_),
    .B(_1534_),
    .ZN(_1539_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3291_ (.A1(_1530_),
    .A2(_1539_),
    .ZN(_1540_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3292_ (.A1(_1530_),
    .A2(_1539_),
    .Z(_1541_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _3293_ (.A1(_1410_),
    .A2(_1506_),
    .B(_1540_),
    .C(_1541_),
    .ZN(_1542_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3294_ (.A1(\ds_acc[2] ),
    .A2(_1542_),
    .ZN(_1543_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3295_ (.A1(\ds_acc[2] ),
    .A2(_1542_),
    .Z(_1544_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3296_ (.A1(_1529_),
    .A2(_1544_),
    .ZN(_1545_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3297_ (.A1(_1529_),
    .A2(_1544_),
    .Z(_0011_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3298_ (.A1(_1543_),
    .A2(_1545_),
    .ZN(_1546_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3299_ (.A1(_1473_),
    .A2(_1475_),
    .B(_1471_),
    .ZN(_1547_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3300_ (.A1(_1479_),
    .A2(_1485_),
    .A3(_1547_),
    .ZN(_1548_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3301_ (.A1(_1482_),
    .A2(_1489_),
    .A3(_1548_),
    .ZN(_1549_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3302_ (.A1(_1483_),
    .A2(_1547_),
    .Z(_1550_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3303_ (.A1(_1479_),
    .A2(_1550_),
    .ZN(_1551_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3304_ (.A1(_1495_),
    .A2(_1549_),
    .A3(_1551_),
    .ZN(_1552_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3305_ (.A1(_1484_),
    .A2(_1495_),
    .ZN(_1553_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _3306_ (.A1(_1471_),
    .A2(_1482_),
    .A3(_1486_),
    .ZN(_1554_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3307_ (.A1(_1472_),
    .A2(_1483_),
    .ZN(_1555_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _3308_ (.A1(_1487_),
    .A2(_1554_),
    .A3(_1555_),
    .B(_1553_),
    .ZN(_1556_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _3309_ (.A1(_1478_),
    .A2(_1483_),
    .A3(_1484_),
    .A4(_1494_),
    .ZN(_1557_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3310_ (.A1(_1552_),
    .A2(_1556_),
    .A3(_1557_),
    .ZN(_1558_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3311_ (.A1(_1270_),
    .A2(_1541_),
    .ZN(_1559_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3312_ (.A1(_1558_),
    .A2(_1559_),
    .ZN(_1560_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _3313_ (.A1(\ds_acc[3] ),
    .A2(_1507_),
    .A3(_1560_),
    .Z(_1561_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3314_ (.A1(_1507_),
    .A2(_1560_),
    .B(\ds_acc[3] ),
    .ZN(_1562_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3315_ (.A1(_1561_),
    .A2(_1562_),
    .ZN(_1563_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3316_ (.A1(_1546_),
    .A2(_1563_),
    .Z(_0012_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3317_ (.A1(_1546_),
    .A2(_1563_),
    .B(_1561_),
    .ZN(_1564_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3318_ (.A1(_1541_),
    .A2(_1558_),
    .B(_1270_),
    .ZN(_1565_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3319_ (.A1(_1472_),
    .A2(_1483_),
    .A3(_1486_),
    .ZN(_1566_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3320_ (.A1(_1553_),
    .A2(_1566_),
    .ZN(_1567_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3321_ (.A1(_1550_),
    .A2(_1555_),
    .ZN(_1568_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3322_ (.A1(_1485_),
    .A2(_1497_),
    .A3(_1568_),
    .ZN(_1569_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _3323_ (.A1(_1485_),
    .A2(_1568_),
    .B(_1569_),
    .C(_1495_),
    .ZN(_1570_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3324_ (.A1(_1555_),
    .A2(_1567_),
    .B(_1570_),
    .ZN(_1571_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3325_ (.A1(_1565_),
    .A2(_1571_),
    .Z(_1572_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3326_ (.A1(_1410_),
    .A2(_1506_),
    .B(_1572_),
    .ZN(_1573_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3327_ (.A1(\ds_acc[4] ),
    .A2(_1573_),
    .ZN(_1574_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3328_ (.A1(\ds_acc[4] ),
    .A2(_1573_),
    .ZN(_1575_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3329_ (.A1(_1564_),
    .A2(_1575_),
    .Z(_0013_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3330_ (.A1(_1564_),
    .A2(_1575_),
    .B(_1574_),
    .ZN(_1576_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3331_ (.A1(_1494_),
    .A2(_1566_),
    .ZN(_1577_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _3332_ (.A1(_1478_),
    .A2(_1502_),
    .B1(_1568_),
    .B2(_1490_),
    .C(_1577_),
    .ZN(_1578_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3333_ (.A1(_1565_),
    .A2(_1578_),
    .Z(_1579_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3334_ (.A1(_1507_),
    .A2(_1579_),
    .ZN(_1580_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3335_ (.A1(_1312_),
    .A2(_1580_),
    .ZN(_1581_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3336_ (.A1(_1312_),
    .A2(_1580_),
    .ZN(_1582_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3337_ (.A1(_1312_),
    .A2(_1576_),
    .A3(_1580_),
    .Z(_0014_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3338_ (.A1(_1485_),
    .A2(_1550_),
    .B(_1495_),
    .ZN(_1583_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3339_ (.A1(\phase_acc[20] ),
    .A2(_1583_),
    .B(_1507_),
    .ZN(_1584_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3340_ (.A1(_1565_),
    .A2(_1583_),
    .B(_1584_),
    .ZN(_1585_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3341_ (.A1(\ds_acc[6] ),
    .A2(_1585_),
    .ZN(_1586_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3342_ (.A1(_1576_),
    .A2(_1582_),
    .B(_1581_),
    .ZN(_1587_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3343_ (.A1(_1586_),
    .A2(_1587_),
    .ZN(_1588_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3344_ (.A1(_1586_),
    .A2(_1587_),
    .Z(_0015_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3345_ (.A1(\ds_acc[6] ),
    .A2(_1585_),
    .B(_1588_),
    .ZN(_1589_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3346_ (.A1(\phase_acc[20] ),
    .A2(_1507_),
    .ZN(_1590_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3347_ (.A1(\ds_acc[7] ),
    .A2(_1590_),
    .ZN(_1591_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3348_ (.A1(\ds_acc[7] ),
    .A2(_1590_),
    .ZN(_1592_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3349_ (.A1(_1589_),
    .A2(_1592_),
    .Z(_0016_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3350_ (.A1(raw_edge1[1]),
    .A2(_1316_),
    .ZN(_1593_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3351_ (.A1(_1313_),
    .A2(raw_edge2[1]),
    .ZN(_1594_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3352_ (.A1(raw_edge1[1]),
    .A2(raw_edge2[1]),
    .ZN(_1595_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3353_ (.A1(raw_edge1[1]),
    .A2(raw_edge2[1]),
    .Z(_1596_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3354_ (.A1(raw_edge1[0]),
    .A2(_1318_),
    .B(_1596_),
    .ZN(_1597_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3355_ (.A1(_1317_),
    .A2(raw_edge2[0]),
    .B(_1595_),
    .ZN(_1598_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3356_ (.A1(raw_edge1[0]),
    .A2(_1598_),
    .ZN(_1599_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3357_ (.A1(_1318_),
    .A2(_1596_),
    .B(_1599_),
    .ZN(_1600_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3358_ (.A1(raw_edge2[2]),
    .A2(raw_edge1[2]),
    .Z(_1601_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3359_ (.I(_1601_),
    .ZN(_1602_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3360_ (.A1(_1594_),
    .A2(_1598_),
    .B(_1601_),
    .ZN(_1603_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3361_ (.A1(_1593_),
    .A2(_1597_),
    .B(_1602_),
    .ZN(_1604_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _3362_ (.A1(_1593_),
    .A2(_1597_),
    .A3(_1602_),
    .ZN(_1605_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3363_ (.A1(_1603_),
    .A2(_1605_),
    .ZN(_1606_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3364_ (.A1(raw_edge1[1]),
    .A2(_1606_),
    .ZN(_1607_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3365_ (.A1(_1313_),
    .A2(_1606_),
    .Z(_1608_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3366_ (.A1(_1600_),
    .A2(_1608_),
    .ZN(_1609_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3367_ (.A1(_1600_),
    .A2(_1608_),
    .ZN(cal_phase90_offset[1]));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3368_ (.A1(_1314_),
    .A2(raw_edge1[2]),
    .B(_1604_),
    .ZN(_1610_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3369_ (.A1(_1319_),
    .A2(raw_edge1[3]),
    .ZN(_1611_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3370_ (.A1(raw_edge2[3]),
    .A2(_1320_),
    .ZN(_1612_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3371_ (.A1(_1611_),
    .A2(_1612_),
    .ZN(_1613_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3372_ (.A1(_1610_),
    .A2(_1613_),
    .Z(_1614_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3373_ (.A1(cfg_f_MEMS_fcw[0]),
    .A2(_1614_),
    .ZN(_1615_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3374_ (.A1(cfg_f_MEMS_fcw[0]),
    .A2(_1614_),
    .Z(_1616_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3375_ (.A1(cfg_f_MEMS_fcw[0]),
    .A2(_1610_),
    .A3(_1613_),
    .Z(_1617_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3376_ (.A1(raw_edge1[2]),
    .A2(_1617_),
    .Z(_1618_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3377_ (.A1(raw_edge1[2]),
    .A2(_1617_),
    .ZN(_1619_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3378_ (.A1(_1315_),
    .A2(_1617_),
    .Z(_1620_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3379_ (.I(_1620_),
    .ZN(_1621_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3380_ (.A1(_1607_),
    .A2(_1620_),
    .ZN(_1622_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3381_ (.I(_1622_),
    .ZN(_1623_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3382_ (.A1(_1607_),
    .A2(_1620_),
    .B(_1609_),
    .ZN(_1624_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3383_ (.A1(_1609_),
    .A2(_1621_),
    .B1(_1623_),
    .B2(_1624_),
    .ZN(cal_phase90_offset[2]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3384_ (.A1(_1622_),
    .A2(_1624_),
    .ZN(_1625_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3385_ (.A1(raw_edge2[4]),
    .A2(_1322_),
    .ZN(_1626_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3386_ (.A1(_1321_),
    .A2(raw_edge1[4]),
    .Z(_1627_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3387_ (.I(_1627_),
    .ZN(_1628_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _3388_ (.A1(_1314_),
    .A2(raw_edge1[2]),
    .B1(_1319_),
    .B2(raw_edge1[3]),
    .ZN(_1629_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3389_ (.I(_1629_),
    .ZN(_1630_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3390_ (.A1(_1603_),
    .A2(_1629_),
    .B(_1611_),
    .ZN(_1631_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3391_ (.A1(_1627_),
    .A2(_1631_),
    .Z(_1632_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3392_ (.A1(cfg_f_MEMS_fcw[1]),
    .A2(_1632_),
    .Z(_1633_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3393_ (.A1(cfg_f_MEMS_fcw[1]),
    .A2(_1632_),
    .Z(_1634_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3394_ (.A1(_1289_),
    .A2(_1320_),
    .A3(_1632_),
    .Z(_1635_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3395_ (.A1(cfg_f_MEMS_fcw[1]),
    .A2(_1320_),
    .A3(_1632_),
    .Z(_1636_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3396_ (.A1(_1616_),
    .A2(_1619_),
    .ZN(_1637_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3397_ (.A1(_1616_),
    .A2(_1619_),
    .B(_1636_),
    .ZN(_1638_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3398_ (.A1(_1625_),
    .A2(_1636_),
    .A3(_1637_),
    .Z(cal_phase90_offset[3]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3399_ (.A1(_1323_),
    .A2(raw_edge1[5]),
    .Z(_1639_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3400_ (.A1(raw_edge2[5]),
    .A2(raw_edge1[5]),
    .Z(_1640_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3401_ (.A1(_1628_),
    .A2(_1631_),
    .B(_1626_),
    .ZN(_1641_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3402_ (.A1(_1640_),
    .A2(_1641_),
    .Z(_1642_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3403_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_1642_),
    .ZN(_1643_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3404_ (.A1(cfg_f_MEMS_fcw[2]),
    .A2(_1640_),
    .A3(_1641_),
    .Z(_1644_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3405_ (.A1(raw_edge1[4]),
    .A2(_1644_),
    .Z(_1645_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3406_ (.A1(_1320_),
    .A2(_1634_),
    .B(_1633_),
    .ZN(_1646_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3407_ (.A1(_1645_),
    .A2(_1646_),
    .ZN(_1647_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3408_ (.A1(_1645_),
    .A2(_1646_),
    .ZN(_1648_));
 gf180mcu_fd_sc_mcu7t5v0__oai33_1 _3409_ (.A1(_1615_),
    .A2(_1618_),
    .A3(_1635_),
    .B1(_1638_),
    .B2(_1622_),
    .B3(_1624_),
    .ZN(_1649_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3410_ (.A1(_1648_),
    .A2(_1649_),
    .ZN(_1650_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3411_ (.A1(_1648_),
    .A2(_1649_),
    .Z(cal_phase90_offset[4]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3412_ (.A1(_1645_),
    .A2(_1646_),
    .B(_1650_),
    .ZN(_1651_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3413_ (.A1(raw_edge1[4]),
    .A2(_1644_),
    .B(_1643_),
    .ZN(_1652_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3414_ (.A1(raw_edge2[6]),
    .A2(_1326_),
    .ZN(_1653_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3415_ (.A1(_1325_),
    .A2(raw_edge1[6]),
    .ZN(_1654_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3416_ (.A1(_1653_),
    .A2(_1654_),
    .ZN(_1655_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3417_ (.A1(_1627_),
    .A2(_1639_),
    .Z(_1656_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3418_ (.A1(_1627_),
    .A2(_1639_),
    .ZN(_1657_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _3419_ (.A1(_1319_),
    .A2(raw_edge1[3]),
    .B1(_1604_),
    .B2(_1630_),
    .C(_1657_),
    .ZN(_1658_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _3420_ (.A1(_1603_),
    .A2(_1629_),
    .B(_1656_),
    .C(_1611_),
    .ZN(_1659_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3421_ (.A1(raw_edge1[4]),
    .A2(_1640_),
    .ZN(_1660_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3422_ (.A1(raw_edge2[5]),
    .A2(_1324_),
    .B1(_1660_),
    .B2(raw_edge2[4]),
    .ZN(_1661_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3423_ (.A1(_1659_),
    .A2(_1661_),
    .ZN(_1662_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3424_ (.A1(_1655_),
    .A2(_1662_),
    .Z(_1663_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3425_ (.A1(cfg_f_MEMS_fcw[3]),
    .A2(_1655_),
    .A3(_1662_),
    .Z(_1664_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3426_ (.A1(_1324_),
    .A2(_1664_),
    .ZN(_1665_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3427_ (.A1(raw_edge1[5]),
    .A2(_1664_),
    .Z(_1666_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3428_ (.A1(_1652_),
    .A2(_1666_),
    .ZN(_1667_));
 gf180mcu_fd_sc_mcu7t5v0__xnor3_1 _3429_ (.A1(_1651_),
    .A2(_1652_),
    .A3(_1666_),
    .ZN(cal_phase90_offset[5]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3430_ (.A1(_1288_),
    .A2(_1663_),
    .B(_1665_),
    .ZN(_1668_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3431_ (.A1(_1327_),
    .A2(raw_edge1[7]),
    .ZN(_1669_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3432_ (.I(_1669_),
    .ZN(_1670_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3433_ (.A1(raw_edge2[7]),
    .A2(_1328_),
    .ZN(_1671_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3434_ (.A1(_1669_),
    .A2(_1671_),
    .ZN(_1672_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3435_ (.A1(_1655_),
    .A2(_1662_),
    .B(_1654_),
    .ZN(_1673_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3436_ (.A1(_1672_),
    .A2(_1673_),
    .Z(_1674_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3437_ (.A1(cfg_f_MEMS_fcw[4]),
    .A2(_1672_),
    .A3(_1673_),
    .Z(_1675_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3438_ (.A1(_1326_),
    .A2(_1675_),
    .ZN(_1676_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3439_ (.A1(_1326_),
    .A2(_1675_),
    .Z(_1677_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3440_ (.I(_1677_),
    .ZN(_1678_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3441_ (.A1(_1668_),
    .A2(_1678_),
    .ZN(_1679_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3442_ (.A1(_1668_),
    .A2(_1677_),
    .ZN(_1680_));
 gf180mcu_fd_sc_mcu7t5v0__oai221_1 _3443_ (.A1(_1648_),
    .A2(_1649_),
    .B1(_1652_),
    .B2(_1666_),
    .C(_1647_),
    .ZN(_1681_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _3444_ (.A1(_1667_),
    .A2(_1680_),
    .A3(_1681_),
    .Z(_1682_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3445_ (.A1(_1667_),
    .A2(_1681_),
    .B(_1680_),
    .ZN(_1683_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3446_ (.A1(_1682_),
    .A2(_1683_),
    .ZN(cal_phase90_offset[6]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3447_ (.A1(_1287_),
    .A2(_1674_),
    .B(_1676_),
    .ZN(_1684_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3448_ (.I(_1684_),
    .ZN(_1685_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3449_ (.A1(_1329_),
    .A2(raw_edge1[8]),
    .ZN(_1686_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3450_ (.A1(_1329_),
    .A2(raw_edge1[8]),
    .Z(_1687_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3451_ (.A1(_1654_),
    .A2(_1669_),
    .ZN(_1688_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3452_ (.A1(_1653_),
    .A2(_1671_),
    .ZN(_1689_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _3453_ (.A1(_1661_),
    .A2(_1671_),
    .A3(_1688_),
    .Z(_1690_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3454_ (.A1(_1661_),
    .A2(_1671_),
    .A3(_1688_),
    .ZN(_1691_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _3455_ (.A1(_1658_),
    .A2(_1691_),
    .B(_1689_),
    .C(_1669_),
    .ZN(_1692_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _3456_ (.A1(_1653_),
    .A2(_1671_),
    .B1(_1690_),
    .B2(_1659_),
    .C(_1670_),
    .ZN(_1693_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3457_ (.A1(_1687_),
    .A2(_1692_),
    .Z(_1694_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3458_ (.A1(cfg_f_MEMS_fcw[5]),
    .A2(_1687_),
    .A3(_1692_),
    .Z(_1695_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3459_ (.A1(raw_edge1[7]),
    .A2(_1695_),
    .ZN(_1696_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3460_ (.A1(raw_edge1[7]),
    .A2(_1695_),
    .Z(_1697_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3461_ (.A1(_1685_),
    .A2(_1697_),
    .ZN(_1698_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3462_ (.A1(_1684_),
    .A2(_1697_),
    .ZN(_1699_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3463_ (.A1(_1679_),
    .A2(_1682_),
    .B(_1699_),
    .ZN(_1700_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _3464_ (.A1(_1679_),
    .A2(_1682_),
    .A3(_1699_),
    .Z(_1701_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3465_ (.A1(_1700_),
    .A2(_1701_),
    .Z(cal_phase90_offset[7]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3466_ (.A1(_1698_),
    .A2(_1700_),
    .ZN(_1702_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3467_ (.A1(raw_edge2[9]),
    .A2(raw_edge1[9]),
    .ZN(_1703_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3468_ (.A1(_1687_),
    .A2(_1693_),
    .B(_1686_),
    .ZN(_1704_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3469_ (.A1(_1703_),
    .A2(_1704_),
    .Z(_1705_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3470_ (.A1(cfg_f_MEMS_fcw[6]),
    .A2(_1705_),
    .ZN(_1706_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3471_ (.A1(cfg_f_MEMS_fcw[6]),
    .A2(_1705_),
    .Z(_1707_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3472_ (.A1(cfg_f_MEMS_fcw[6]),
    .A2(_1703_),
    .A3(_1704_),
    .Z(_1708_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3473_ (.A1(raw_edge1[8]),
    .A2(_1708_),
    .Z(_1709_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3474_ (.A1(raw_edge1[8]),
    .A2(_1708_),
    .ZN(_1710_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3475_ (.A1(raw_edge1[8]),
    .A2(_1708_),
    .Z(_1711_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3476_ (.A1(cfg_f_MEMS_fcw[5]),
    .A2(_1694_),
    .B(_1696_),
    .ZN(_1712_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3477_ (.A1(_1711_),
    .A2(_1712_),
    .ZN(_1713_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3478_ (.A1(_1711_),
    .A2(_1712_),
    .ZN(_1714_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3479_ (.I(_1714_),
    .ZN(_1715_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3480_ (.A1(_1702_),
    .A2(_1715_),
    .ZN(_1716_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3481_ (.A1(_1702_),
    .A2(_1715_),
    .Z(cal_phase90_offset[8]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3482_ (.A1(_1333_),
    .A2(raw_edge1[10]),
    .ZN(_1717_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3483_ (.A1(_1333_),
    .A2(raw_edge1[10]),
    .Z(_1718_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3484_ (.A1(_1687_),
    .A2(_1703_),
    .ZN(_1719_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3485_ (.A1(_1330_),
    .A2(_1703_),
    .Z(_1720_));
 gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _3486_ (.A1(raw_edge2[9]),
    .A2(_1332_),
    .B1(_1720_),
    .B2(raw_edge2[8]),
    .ZN(_1721_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3487_ (.A1(_1692_),
    .A2(_1719_),
    .B(_1721_),
    .ZN(_1722_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3488_ (.A1(_1718_),
    .A2(_1722_),
    .ZN(_1723_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3489_ (.A1(cfg_f_MEMS_fcw[7]),
    .A2(_1723_),
    .ZN(_1724_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3490_ (.A1(cfg_f_MEMS_fcw[7]),
    .A2(_1723_),
    .ZN(_1725_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3491_ (.A1(_1284_),
    .A2(_1332_),
    .A3(_1723_),
    .Z(_1726_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3492_ (.A1(cfg_f_MEMS_fcw[7]),
    .A2(_1332_),
    .A3(_1723_),
    .Z(_1727_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3493_ (.A1(_1707_),
    .A2(_1710_),
    .B(_1727_),
    .ZN(_1728_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3494_ (.A1(_1706_),
    .A2(_1709_),
    .B(_1726_),
    .ZN(_1729_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _3495_ (.A1(_1706_),
    .A2(_1709_),
    .A3(_1726_),
    .ZN(_1730_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3496_ (.A1(_1728_),
    .A2(_1730_),
    .ZN(_1731_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3497_ (.A1(_1713_),
    .A2(_1716_),
    .ZN(_1732_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3498_ (.A1(_1731_),
    .A2(_1732_),
    .Z(cal_phase90_offset[9]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3499_ (.A1(_1335_),
    .A2(raw_edge1[11]),
    .ZN(_1733_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3500_ (.A1(_1335_),
    .A2(raw_edge1[11]),
    .Z(_1734_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3501_ (.A1(_1718_),
    .A2(_1722_),
    .B(_1717_),
    .ZN(_1735_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3502_ (.A1(_1734_),
    .A2(_1735_),
    .Z(_1736_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3503_ (.A1(cfg_f_MEMS_fcw[8]),
    .A2(_1736_),
    .ZN(_1737_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3504_ (.A1(cfg_f_MEMS_fcw[8]),
    .A2(_1734_),
    .A3(_1735_),
    .Z(_1738_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3505_ (.A1(raw_edge1[10]),
    .A2(_1738_),
    .Z(_1739_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3506_ (.A1(_1334_),
    .A2(_1738_),
    .Z(_1740_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3507_ (.A1(raw_edge1[9]),
    .A2(_1725_),
    .B(_1724_),
    .ZN(_1741_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3508_ (.A1(_1740_),
    .A2(_1741_),
    .ZN(_1742_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3509_ (.A1(_1740_),
    .A2(_1741_),
    .Z(_1743_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3510_ (.A1(_1715_),
    .A2(_1731_),
    .ZN(_1744_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3511_ (.A1(_1713_),
    .A2(_1730_),
    .B(_1729_),
    .ZN(_1745_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3512_ (.I(_1745_),
    .ZN(_1746_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _3513_ (.A1(_1716_),
    .A2(_1728_),
    .A3(_1730_),
    .B(_1746_),
    .ZN(_1747_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3514_ (.A1(_1743_),
    .A2(_1747_),
    .Z(cal_phase90_offset[10]));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3515_ (.A1(_1718_),
    .A2(_1734_),
    .ZN(_1748_));
 gf180mcu_fd_sc_mcu7t5v0__oai22_1 _3516_ (.A1(_1335_),
    .A2(raw_edge1[11]),
    .B1(_1721_),
    .B2(_1748_),
    .ZN(_1749_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3517_ (.A1(_1717_),
    .A2(_1733_),
    .B(_1749_),
    .ZN(_1750_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _3518_ (.A1(_1692_),
    .A2(_1719_),
    .A3(_1748_),
    .B(_1750_),
    .ZN(_1751_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3519_ (.A1(_1337_),
    .A2(raw_edge1[12]),
    .ZN(_1752_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3520_ (.A1(raw_edge2[12]),
    .A2(_1338_),
    .ZN(_1753_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3521_ (.A1(_1337_),
    .A2(raw_edge1[12]),
    .ZN(_1754_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3522_ (.A1(_1753_),
    .A2(_1754_),
    .ZN(_1755_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3523_ (.A1(_1751_),
    .A2(_1755_),
    .Z(_1756_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3524_ (.A1(cfg_f_MEMS_fcw[9]),
    .A2(_1756_),
    .Z(_1757_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3525_ (.A1(cfg_f_MEMS_fcw[9]),
    .A2(_1756_),
    .Z(_1758_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3526_ (.A1(_1282_),
    .A2(_1336_),
    .A3(_1756_),
    .Z(_1759_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3527_ (.A1(_1737_),
    .A2(_1739_),
    .B(_1759_),
    .ZN(_1760_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _3528_ (.A1(_1737_),
    .A2(_1739_),
    .A3(_1759_),
    .Z(_1761_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3529_ (.A1(_1760_),
    .A2(_1761_),
    .ZN(_1762_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3530_ (.A1(_1743_),
    .A2(_1747_),
    .B(_1742_),
    .ZN(_1763_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3531_ (.A1(_1762_),
    .A2(_1763_),
    .Z(cal_phase90_offset[11]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3532_ (.A1(raw_edge2[13]),
    .A2(raw_edge1[13]),
    .Z(_1764_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3533_ (.A1(_1751_),
    .A2(_1754_),
    .B(_1752_),
    .ZN(_1765_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3534_ (.A1(_1764_),
    .A2(_1765_),
    .ZN(_1766_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3535_ (.A1(cfg_f_MEMS_fcw[10]),
    .A2(_1766_),
    .ZN(_1767_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3536_ (.A1(_1281_),
    .A2(_1764_),
    .A3(_1765_),
    .Z(_1768_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3537_ (.A1(raw_edge1[12]),
    .A2(_1768_),
    .Z(_1769_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3538_ (.A1(raw_edge1[12]),
    .A2(_1768_),
    .Z(_1770_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3539_ (.A1(_1336_),
    .A2(_1758_),
    .B(_1757_),
    .ZN(_1771_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3540_ (.A1(_1770_),
    .A2(_1771_),
    .ZN(_1772_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3541_ (.A1(_1770_),
    .A2(_1771_),
    .Z(_1773_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3542_ (.A1(_1772_),
    .A2(_1773_),
    .ZN(_1774_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3543_ (.A1(_1742_),
    .A2(_1761_),
    .ZN(_1775_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _3544_ (.A1(_1743_),
    .A2(_1760_),
    .A3(_1761_),
    .ZN(_1776_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _3545_ (.A1(_1698_),
    .A2(_1700_),
    .B(_1744_),
    .C(_1776_),
    .ZN(_1777_));
 gf180mcu_fd_sc_mcu7t5v0__oai211_1 _3546_ (.A1(_1746_),
    .A2(_1776_),
    .B(_1775_),
    .C(_1760_),
    .ZN(_1778_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3547_ (.A1(_1777_),
    .A2(_1778_),
    .ZN(_1779_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3548_ (.A1(_1774_),
    .A2(_1779_),
    .Z(cal_phase90_offset[12]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3549_ (.A1(_1755_),
    .A2(_1764_),
    .ZN(_1780_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3550_ (.A1(_1339_),
    .A2(raw_edge1[13]),
    .B(_1753_),
    .ZN(_1781_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _3551_ (.A1(raw_edge2[13]),
    .A2(_1340_),
    .B1(_1751_),
    .B2(_1780_),
    .C(_1781_),
    .ZN(_1782_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3552_ (.A1(raw_edge2[14]),
    .A2(_1342_),
    .ZN(_1783_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3553_ (.A1(_1341_),
    .A2(raw_edge1[14]),
    .Z(_1784_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3554_ (.I(_1784_),
    .ZN(_1785_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3555_ (.A1(_1782_),
    .A2(_1784_),
    .Z(_1786_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3556_ (.A1(cfg_f_MEMS_fcw[11]),
    .A2(_1786_),
    .ZN(_1787_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3557_ (.A1(cfg_f_MEMS_fcw[11]),
    .A2(_1786_),
    .ZN(_1788_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3558_ (.A1(_1280_),
    .A2(_1340_),
    .A3(_1786_),
    .Z(_1789_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3559_ (.A1(_1767_),
    .A2(_1769_),
    .B(_1789_),
    .ZN(_1790_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _3560_ (.A1(_1767_),
    .A2(_1769_),
    .A3(_1789_),
    .Z(_1791_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3561_ (.I(_1791_),
    .ZN(_1792_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3562_ (.A1(_1790_),
    .A2(_1791_),
    .ZN(_1793_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3563_ (.A1(_1774_),
    .A2(_1779_),
    .B(_1772_),
    .ZN(_1794_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3564_ (.A1(_1793_),
    .A2(_1794_),
    .ZN(cal_phase90_offset[13]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3565_ (.A1(raw_edge2[15]),
    .A2(raw_edge1[15]),
    .Z(_0128_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3566_ (.A1(_1782_),
    .A2(_1785_),
    .B(_1783_),
    .ZN(_0129_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3567_ (.A1(_0128_),
    .A2(_0129_),
    .Z(_0130_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3568_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_0130_),
    .Z(_0131_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3569_ (.A1(cfg_f_MEMS_fcw[12]),
    .A2(_0128_),
    .A3(_0129_),
    .Z(_0132_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3570_ (.A1(raw_edge1[14]),
    .A2(_0132_),
    .ZN(_0133_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3571_ (.A1(_1342_),
    .A2(_0132_),
    .Z(_0134_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3572_ (.A1(raw_edge1[13]),
    .A2(_1788_),
    .B(_1787_),
    .ZN(_0135_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3573_ (.A1(_0134_),
    .A2(_0135_),
    .Z(_0136_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3574_ (.A1(_0134_),
    .A2(_0135_),
    .ZN(_0137_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_1 _3575_ (.A1(_1772_),
    .A2(_1773_),
    .A3(_1790_),
    .A4(_1791_),
    .ZN(_0138_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3576_ (.A1(_1779_),
    .A2(_0138_),
    .ZN(_0139_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3577_ (.A1(_1772_),
    .A2(_1792_),
    .B(_1790_),
    .ZN(_0140_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3578_ (.A1(_0139_),
    .A2(_0140_),
    .ZN(_0141_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3579_ (.A1(_0137_),
    .A2(_0141_),
    .Z(cal_phase90_offset[14]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3580_ (.A1(_1345_),
    .A2(raw_edge1[16]),
    .ZN(_0142_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3581_ (.A1(_1345_),
    .A2(raw_edge1[16]),
    .ZN(_0143_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3582_ (.A1(_1343_),
    .A2(raw_edge1[15]),
    .B(_1783_),
    .ZN(_0144_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3583_ (.A1(raw_edge2[15]),
    .A2(_1344_),
    .B(_0144_),
    .ZN(_0145_));
 gf180mcu_fd_sc_mcu7t5v0__oai31_1 _3584_ (.A1(_1782_),
    .A2(_1785_),
    .A3(_0128_),
    .B(_0145_),
    .ZN(_0146_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3585_ (.A1(raw_edge2[16]),
    .A2(_1346_),
    .A3(_0146_),
    .Z(_0147_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3586_ (.A1(_1279_),
    .A2(_0147_),
    .ZN(_0148_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3587_ (.A1(_1279_),
    .A2(_0147_),
    .ZN(_0149_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3588_ (.A1(cfg_f_MEMS_fcw[13]),
    .A2(raw_edge1[15]),
    .A3(_0147_),
    .Z(_0150_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3589_ (.A1(_0131_),
    .A2(_0133_),
    .B(_0150_),
    .ZN(_0151_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _3590_ (.A1(_0131_),
    .A2(_0133_),
    .A3(_0150_),
    .Z(_0152_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3591_ (.A1(_0151_),
    .A2(_0152_),
    .ZN(_0153_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3592_ (.A1(_0137_),
    .A2(_0141_),
    .B(_0136_),
    .ZN(_0154_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3593_ (.A1(_0153_),
    .A2(_0154_),
    .Z(cal_phase90_offset[15]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3594_ (.A1(raw_edge2[17]),
    .A2(_1348_),
    .ZN(_0155_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3595_ (.A1(raw_edge2[17]),
    .A2(raw_edge1[17]),
    .Z(_0156_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3596_ (.A1(_0143_),
    .A2(_0146_),
    .B(_0142_),
    .ZN(_0157_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3597_ (.A1(_0156_),
    .A2(_0157_),
    .ZN(_0158_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3598_ (.A1(_1278_),
    .A2(_0156_),
    .A3(_0157_),
    .Z(_0159_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3599_ (.A1(raw_edge1[16]),
    .A2(_0159_),
    .ZN(_0160_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3600_ (.A1(raw_edge1[16]),
    .A2(_0159_),
    .Z(_0161_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3601_ (.A1(_1344_),
    .A2(_0149_),
    .B(_0148_),
    .ZN(_0162_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3602_ (.A1(_0161_),
    .A2(_0162_),
    .ZN(_0163_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3603_ (.A1(_0161_),
    .A2(_0162_),
    .ZN(_0164_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3604_ (.A1(_0136_),
    .A2(_0152_),
    .ZN(_0165_));
 gf180mcu_fd_sc_mcu7t5v0__nor3_1 _3605_ (.A1(_0137_),
    .A2(_0151_),
    .A3(_0152_),
    .ZN(_0166_));
 gf180mcu_fd_sc_mcu7t5v0__nor4_1 _3606_ (.A1(_0137_),
    .A2(_0138_),
    .A3(_0151_),
    .A4(_0152_),
    .ZN(_0167_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3607_ (.A1(_1777_),
    .A2(_1778_),
    .B(_0167_),
    .ZN(_0168_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _3608_ (.A1(_0140_),
    .A2(_0166_),
    .B(_0165_),
    .C(_0151_),
    .ZN(_0169_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3609_ (.A1(_0168_),
    .A2(_0169_),
    .Z(_0170_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3610_ (.A1(_0164_),
    .A2(_0170_),
    .Z(cal_phase90_offset[16]));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3611_ (.A1(raw_edge2[18]),
    .A2(raw_edge1[18]),
    .Z(_0171_));
 gf180mcu_fd_sc_mcu7t5v0__aoi221_1 _3612_ (.A1(raw_edge2[17]),
    .A2(_1348_),
    .B1(_0143_),
    .B2(_0146_),
    .C(_0142_),
    .ZN(_0172_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3613_ (.A1(_0155_),
    .A2(_0172_),
    .Z(_0173_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3614_ (.A1(_0171_),
    .A2(_0173_),
    .ZN(_0174_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3615_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_0174_),
    .ZN(_0175_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3616_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(_0174_),
    .ZN(_0176_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3617_ (.A1(cfg_f_MEMS_fcw[15]),
    .A2(raw_edge1[17]),
    .A3(_0174_),
    .Z(_0177_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3618_ (.A1(cfg_f_MEMS_fcw[14]),
    .A2(_0158_),
    .B(_0160_),
    .ZN(_0178_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3619_ (.A1(_0177_),
    .A2(_0178_),
    .ZN(_0179_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3620_ (.A1(_0177_),
    .A2(_0178_),
    .ZN(_0180_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3621_ (.A1(_0177_),
    .A2(_0178_),
    .ZN(_0181_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3622_ (.A1(_0164_),
    .A2(_0170_),
    .B(_0163_),
    .ZN(_0182_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3623_ (.A1(_0181_),
    .A2(_0182_),
    .ZN(cal_phase90_offset[17]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3624_ (.A1(raw_edge1[17]),
    .A2(_0176_),
    .B(_0175_),
    .ZN(_0183_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3625_ (.A1(_1351_),
    .A2(raw_edge1[19]),
    .ZN(_0184_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3626_ (.A1(raw_edge2[19]),
    .A2(_1352_),
    .ZN(_0185_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3627_ (.A1(_1351_),
    .A2(raw_edge1[19]),
    .ZN(_0186_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3628_ (.A1(_0185_),
    .A2(_0186_),
    .ZN(_0187_));
 gf180mcu_fd_sc_mcu7t5v0__oai32_1 _3629_ (.A1(_0155_),
    .A2(_0171_),
    .A3(_0172_),
    .B1(raw_edge1[18]),
    .B2(_1349_),
    .ZN(_0188_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3630_ (.A1(_0187_),
    .A2(_0188_),
    .Z(_0189_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3631_ (.A1(_1350_),
    .A2(_0189_),
    .Z(_0190_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3632_ (.A1(raw_edge1[18]),
    .A2(_0189_),
    .Z(_0191_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _3633_ (.I(_0191_),
    .ZN(_0192_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3634_ (.A1(_0183_),
    .A2(_0192_),
    .ZN(_0193_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _3635_ (.A1(_0183_),
    .A2(_0192_),
    .Z(_0194_));
 gf180mcu_fd_sc_mcu7t5v0__aoi211_1 _3636_ (.A1(_0168_),
    .A2(_0169_),
    .B(_0181_),
    .C(_0164_),
    .ZN(_0195_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3637_ (.A1(_0163_),
    .A2(_0180_),
    .B(_0179_),
    .ZN(_0196_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3638_ (.A1(_0195_),
    .A2(_0196_),
    .B(_0194_),
    .ZN(_0197_));
 gf180mcu_fd_sc_mcu7t5v0__or3_1 _3639_ (.A1(_0194_),
    .A2(_0195_),
    .A3(_0196_),
    .Z(_0198_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _3640_ (.A1(_0197_),
    .A2(_0198_),
    .Z(cal_phase90_offset[18]));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3641_ (.A1(_0186_),
    .A2(_0188_),
    .B(_0184_),
    .ZN(_0199_));
 gf180mcu_fd_sc_mcu7t5v0__xor3_1 _3642_ (.A1(raw_edge1[20]),
    .A2(raw_edge2[20]),
    .A3(_0199_),
    .Z(_0200_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3643_ (.A1(raw_edge1[19]),
    .A2(_0200_),
    .Z(_0201_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _3644_ (.A1(raw_edge1[19]),
    .A2(_0200_),
    .ZN(_0202_));
 gf180mcu_fd_sc_mcu7t5v0__and3_1 _3645_ (.A1(_0190_),
    .A2(_0201_),
    .A3(_0202_),
    .Z(_0203_));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _3646_ (.A1(_0201_),
    .A2(_0202_),
    .B(_0190_),
    .ZN(_0204_));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _3647_ (.A1(_0203_),
    .A2(_0204_),
    .Z(_0205_));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _3648_ (.A1(_0183_),
    .A2(_0192_),
    .B(_0197_),
    .ZN(_0206_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _3649_ (.A1(_0205_),
    .A2(_0206_),
    .ZN(cal_phase90_offset[19]));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _3650_ (.A1(_0193_),
    .A2(_0204_),
    .ZN(_0207_));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _3651_ (.D(_0057_),
    .SETN(rst_n),
    .CLK(clk),
    .Q(cal_burst_armed));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3652_ (.D(_0058_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cal_burst_active));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3653_ (.D(_0059_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cal_burst_count[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3654_ (.D(_0060_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\cal_burst_count[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3655_ (.D(_0061_),
    .RN(rst_n),
    .CLK(clk),
    .Q(latch_phase90));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3656_ (.D(_0062_),
    .RN(rst_n),
    .CLK(clk),
    .Q(latch_phase270));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3657_ (.D(_0063_),
    .RN(rst_n),
    .CLK(clk),
    .Q(latch_error));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3658_ (.D(_0064_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cal_done));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3659_ (.D(_0065_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cal_timeout));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3660_ (.D(_0066_),
    .RN(rst_n),
    .CLK(clk),
    .Q(delay_wave_cycle[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3661_ (.D(_0067_),
    .RN(rst_n),
    .CLK(clk),
    .Q(delay_wave_cycle[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3662_ (.D(_0068_),
    .RN(rst_n),
    .CLK(clk),
    .Q(delay_wave_cycle[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3663_ (.D(_0069_),
    .RN(rst_n),
    .CLK(clk),
    .Q(delay_wave_cycle[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3664_ (.D(_0070_),
    .RN(rst_n),
    .CLK(clk),
    .Q(delay_wave_cycle[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3665_ (.D(_0071_),
    .RN(rst_n),
    .CLK(clk),
    .Q(delay_wave_cycle[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3666_ (.D(_0072_),
    .RN(rst_n),
    .CLK(clk),
    .Q(delay_wave_cycle[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3667_ (.D(_0073_),
    .RN(rst_n),
    .CLK(clk),
    .Q(delay_wave_cycle[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3668_ (.D(_0074_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3669_ (.D(_0075_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3670_ (.D(_0076_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3671_ (.D(_0077_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3672_ (.D(_0078_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3673_ (.D(_0079_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3674_ (.D(_0080_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3675_ (.D(_0081_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3676_ (.D(_0082_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3677_ (.D(_0083_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3678_ (.D(_0084_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3679_ (.D(_0085_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3680_ (.D(_0086_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3681_ (.D(_0087_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3682_ (.D(_0088_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3683_ (.D(_0089_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3684_ (.D(_0090_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3685_ (.D(_0091_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3686_ (.D(_0092_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3687_ (.D(_0093_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3688_ (.D(_0094_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge1[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3689_ (.D(_0095_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3690_ (.D(_0096_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3691_ (.D(_0097_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3692_ (.D(_0098_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3693_ (.D(_0099_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3694_ (.D(_0100_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3695_ (.D(_0101_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3696_ (.D(_0102_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3697_ (.D(_0103_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3698_ (.D(_0104_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3699_ (.D(_0105_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3700_ (.D(_0106_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3701_ (.D(_0107_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3702_ (.D(_0108_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3703_ (.D(_0109_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3704_ (.D(_0110_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3705_ (.D(_0111_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3706_ (.D(_0112_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3707_ (.D(_0113_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3708_ (.D(_0114_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3709_ (.D(_0115_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge2[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3710_ (.D(_0116_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cal_phase0_offset[0]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3711_ (.D(_0117_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cal_phase0_offset[1]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3712_ (.D(_0118_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[2]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3713_ (.D(_0119_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[3]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3714_ (.D(_0120_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[4]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3715_ (.D(_0121_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[5]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3716_ (.D(_0122_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[6]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3717_ (.D(_0123_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[7]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3718_ (.D(_0124_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[8]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3719_ (.D(_0125_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[9]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3720_ (.D(_0126_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[10]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3721_ (.D(_0127_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[11]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3722_ (.D(_0017_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[12]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3723_ (.D(_0018_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[13]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3724_ (.D(_0019_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[14]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3725_ (.D(_0020_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[15]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3726_ (.D(_0021_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[16]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3727_ (.D(_0022_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[17]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3728_ (.D(_0023_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[18]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3729_ (.D(_0024_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[19]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3730_ (.D(_0025_),
    .RN(rst_n),
    .CLK(clk),
    .Q(raw_edge3[20]));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3731_ (.D(_0026_),
    .RN(rst_n),
    .CLK(clk),
    .Q(cal_dir));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3732_ (.D(_0027_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\wave_cycle_cnt[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3733_ (.D(_0028_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\wave_cycle_cnt[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3734_ (.D(_0029_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\wave_cycle_cnt[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3735_ (.D(_0030_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\wave_cycle_cnt[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3736_ (.D(_0031_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\wave_cycle_cnt[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3737_ (.D(_0032_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\wave_cycle_cnt[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3738_ (.D(_0033_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\wave_cycle_cnt[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3739_ (.D(_0034_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\wave_cycle_cnt[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _3740_ (.D(_0035_),
    .SETN(rst_n),
    .CLK(clk),
    .Q(capture_pending));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3741_ (.D(_0036_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3742_ (.D(_0037_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3743_ (.D(_0038_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3744_ (.D(_0039_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3745_ (.D(_0040_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3746_ (.D(_0041_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3747_ (.D(_0042_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3748_ (.D(_0043_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3749_ (.D(_0044_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3750_ (.D(_0045_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[9] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3751_ (.D(_0046_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[10] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3752_ (.D(_0047_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[11] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3753_ (.D(_0048_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[12] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3754_ (.D(_0049_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[13] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3755_ (.D(_0050_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[14] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3756_ (.D(_0051_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[15] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3757_ (.D(_0052_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[16] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3758_ (.D(_0053_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[17] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3759_ (.D(_0054_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[18] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3760_ (.D(_0055_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[19] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3761_ (.D(_0056_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\phase_acc[20] ));
 gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _3762_ (.D(_0006_),
    .SETN(rst_n),
    .CLK(clk),
    .Q(\capture_step[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3763_ (.D(_0007_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\capture_step[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3764_ (.D(\ds_acc[8] ),
    .RN(rst_n),
    .CLK(clk),
    .Q(mems_drv));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3765_ (.D(_0005_),
    .RN(rst_n),
    .CLK(clk),
    .Q(ref_wave));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3766_ (.D(_0009_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[0] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3767_ (.D(_0010_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[1] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3768_ (.D(_0011_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[2] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3769_ (.D(_0012_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[3] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3770_ (.D(_0013_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[4] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3771_ (.D(_0014_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[5] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3772_ (.D(_0015_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[6] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3773_ (.D(_0016_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[7] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3774_ (.D(_0008_),
    .RN(rst_n),
    .CLK(clk),
    .Q(\ds_acc[8] ));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3775_ (.D(_0000_),
    .RN(rst_n),
    .CLK(clk),
    .Q(comp_sync0));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3776_ (.D(_0001_),
    .RN(rst_n),
    .CLK(clk),
    .Q(comp_sync1));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3777_ (.D(_0002_),
    .RN(rst_n),
    .CLK(clk),
    .Q(comp_sync2));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3778_ (.D(_0003_),
    .RN(rst_n),
    .CLK(clk),
    .Q(comp_sync3));
 gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _3779_ (.D(_0004_),
    .RN(rst_n),
    .CLK(clk),
    .Q(comp_sync4));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 _3780_ (.I(cal_phase0_offset[0]),
    .Z(raw_edge3[0]));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 _3781_ (.I(cal_phase0_offset[1]),
    .Z(raw_edge3[1]));
endmodule
