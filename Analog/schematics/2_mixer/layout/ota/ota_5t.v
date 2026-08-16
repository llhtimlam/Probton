// sch_path: /workspace/Analog/schematics/2_mixer/ota_5t.sch
module ota_5t
(
  output wire Vout_5tota,
  inout wire Ibias_30uA_nmos,
  input wire Vdd_3v3,
  input wire Vin_p_5tota,
  input wire Vin_m_5tota,
  input wire VSS
);
wire net1 ;

nfet_03v3
#(
.L ( 2.8e-07 ) ,
.W ( 6e-06 ) ,
.nf ( 1 ) ,
.m ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.18u ) ,
.nrs ( "'0.18u ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_03v3 ) ,
.spiceprefix ( X )
)
Mnmos_amp_p ( 
 .D( net1 ),
 .G( Vin_p_5tota ),
 .S( Ibias_30uA_nmos ),
 .B( VSS )
);


nfet_03v3
#(
.L ( 2.8e-07 ) ,
.W ( 6e-06 ) ,
.nf ( 1 ) ,
.m ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.18u ) ,
.nrs ( "'0.18u ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_03v3 ) ,
.spiceprefix ( X )
)
Mnmos_amp_n ( 
 .D( Vout_5tota ),
 .G( Vin_m_5tota ),
 .S( Ibias_30uA_nmos ),
 .B( VSS )
);


pfet_03v3
#(
.L ( 2.8e-07 ) ,
.W ( 1e-05 ) ,
.nf ( 1 ) ,
.m ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.18u ) ,
.nrs ( "'0.18u ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_03v3 ) ,
.spiceprefix ( X )
)
Mpmos_cs_p ( 
 .D( net1 ),
 .G( net1 ),
 .S( Vdd_3v3 ),
 .B( Vdd_3v3 )
);


pfet_03v3
#(
.L ( 2.8e-07 ) ,
.W ( 1e-05 ) ,
.nf ( 1 ) ,
.m ( 1 ) ,
.ad ( "'int((nf+1)/2) ) ,
.pd ( "'2*int((nf+1)/2) ) ,
.as ( "'int((nf+2)/2) ) ,
.ps ( "'2*int((nf+2)/2) ) ,
.nrd ( "'0.18u ) ,
.nrs ( "'0.18u ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_03v3 ) ,
.spiceprefix ( X )
)
Mpmos_cs_n ( 
 .D( Vout_5tota ),
 .G( net1 ),
 .S( Vdd_3v3 ),
 .B( Vdd_3v3 )
);

endmodule
