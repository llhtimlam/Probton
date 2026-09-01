module SSCS_2026_01 (
    A40_VSS,
    A40_IQ_DATA_I_0,
    A40_IQ_DATA_Q_0,
    A40_IQ_DATA_I_1,
    A40_IQ_DATA_Q_1,
    A40_IQ_DATA_I_2,
    A40_IQ_DATA_Q_2,
    A40_IQ_DATA_I_3,
    A40_IQ_DATA_Q_3,
    A40_IQ_CLK,
    A40_RESETB,
    A40_REMOD_A_I,
    A40_REMOD_A_Q,
    A40_PSRAM_SCK,
    A40_PSRAM_CE_N,
    A40_PSRAM_SIO_0,
    A40_PSRAM_SIO_1,
    A40_PSRAM_SIO_2,
    A40_PSRAM_SIO_3,
    A40_HOST_CS,
    A40_SPI_SCK,
    A40_SPI_MOSI,
    A40_SPI_MISO,
    A40_IRQ_OUT,
    A40_VDD,
    A09_VSS,
    A09_VDD,
    A09_clk,
    A09_rst_n,
    A09_uart_rx,
    A09_uart_tx,
    A09_qspi_csn[0],
    A09_qspi_csn[1],
    A09_qspi_sck,
    A09_qspi_io[0],
    A09_qspi_io[1],
    A09_qspi_io[2],
    A09_qspi_io[3],
    A30_VSS,
    A30_reset,
    A30_clk,
    A30_uart_rx,
    A30_spi_miso,
    A30_spi_data0,
    A30_spi_data1,
    A30_spi_data2,
    A30_spi_data3,
    A30_spi_clk_out,
    A30_spi_flash_select,
    A30_spi_ram_a_select,
    A30_uart_tx,
    A30_spi_select,
    A30_disp_spi_clk_out,
    A30_spi_mosi,
    A30_spi_dc,
    A30_VDD,
    B18_VSS,
    B18_rst_n,
    B18_spi_cs_n,
    B18_spi_sclk,
    B18_spi_mosi,
    B18_spi_miso,
    B18_clk,
    B18_move_en_x,
    B18_dir_x,
    B18_ref_wave_x,
    B18_mems_drv_x,
    B18_mems_drv_y,
    B18_ref_wave_y,
    B18_dir_y,
    B18_move_en_y,
    B18_comp_x,
    B18_read_en,
    B18_comp_y,
    B18_VDD
);
  inout A40_VSS;
  inout A40_IQ_DATA_I_0;
  inout A40_IQ_DATA_Q_0;
  inout A40_IQ_DATA_I_1;
  inout A40_IQ_DATA_Q_1;
  inout A40_IQ_DATA_I_2;
  inout A40_IQ_DATA_Q_2;
  inout A40_IQ_DATA_I_3;
  inout A40_IQ_DATA_Q_3;
  inout A40_IQ_CLK;
  inout A40_RESETB;
  inout A40_REMOD_A_I;
  inout A40_REMOD_A_Q;
  inout A40_PSRAM_SCK;
  inout A40_PSRAM_CE_N;
  inout A40_PSRAM_SIO_0;
  inout A40_PSRAM_SIO_1;
  inout A40_PSRAM_SIO_2;
  inout A40_PSRAM_SIO_3;
  inout A40_HOST_CS;
  inout A40_SPI_SCK;
  inout A40_SPI_MOSI;
  inout A40_SPI_MISO;
  inout A40_IRQ_OUT;
  inout A40_VDD;
  inout A09_VSS;
  inout A09_VDD;
  inout A09_clk;
  inout A09_rst_n;
  inout A09_uart_rx;
  inout A09_uart_tx;
  inout A09_qspi_csn[0];
  inout A09_qspi_csn[1];
  inout A09_qspi_sck;
  inout A09_qspi_io[0];
  inout A09_qspi_io[1];
  inout A09_qspi_io[2];
  inout A09_qspi_io[3];
  inout A30_VSS;
  inout A30_reset;
  inout A30_clk;
  inout A30_uart_rx;
  inout A30_spi_miso;
  inout A30_spi_data0;
  inout A30_spi_data1;
  inout A30_spi_data2;
  inout A30_spi_data3;
  inout A30_spi_clk_out;
  inout A30_spi_flash_select;
  inout A30_spi_ram_a_select;
  inout A30_uart_tx;
  inout A30_spi_select;
  inout A30_disp_spi_clk_out;
  inout A30_spi_mosi;
  inout A30_spi_dc;
  inout A30_VDD;
  inout B18_VSS;
  inout B18_rst_n;
  inout B18_spi_cs_n;
  inout B18_spi_sclk;
  inout B18_spi_mosi;
  inout B18_spi_miso;
  inout B18_clk;
  inout B18_move_en_x;
  inout B18_dir_x;
  inout B18_ref_wave_x;
  inout B18_mems_drv_x;
  inout B18_mems_drv_y;
  inout B18_ref_wave_y;
  inout B18_dir_y;
  inout B18_move_en_y;
  inout B18_comp_x;
  inout B18_read_en;
  inout B18_comp_y;
  inout B18_VDD;
  wire A09_clk_PD;
  wire A09_clk_PU;
  wire A09_clk__CORE;
  wire A09_qspi_csn_CS[0];
  wire A09_qspi_csn_CS[1];
  wire A09_qspi_csn_IE[0];
  wire A09_qspi_csn_IE[1];
  wire A09_qspi_csn_IN[0];
  wire A09_qspi_csn_IN[1];
  wire A09_qspi_csn_OE[0];
  wire A09_qspi_csn_OE[1];
  wire A09_qspi_csn_OUT[0];
  wire A09_qspi_csn_OUT[1];
  wire A09_qspi_csn_PDRV0[0];
  wire A09_qspi_csn_PDRV0[1];
  wire A09_qspi_csn_PDRV1[0];
  wire A09_qspi_csn_PDRV1[1];
  wire A09_qspi_csn_PD[0];
  wire A09_qspi_csn_PD[1];
  wire A09_qspi_csn_PU[0];
  wire A09_qspi_csn_PU[1];
  wire A09_qspi_csn_SL[0];
  wire A09_qspi_csn_SL[1];
  wire A09_qspi_io_CS[0];
  wire A09_qspi_io_CS[1];
  wire A09_qspi_io_CS[2];
  wire A09_qspi_io_CS[3];
  wire A09_qspi_io_IE[0];
  wire A09_qspi_io_IE[1];
  wire A09_qspi_io_IE[2];
  wire A09_qspi_io_IE[3];
  wire A09_qspi_io_IN[0];
  wire A09_qspi_io_IN[1];
  wire A09_qspi_io_IN[2];
  wire A09_qspi_io_IN[3];
  wire A09_qspi_io_OE[0];
  wire A09_qspi_io_OE[1];
  wire A09_qspi_io_OE[2];
  wire A09_qspi_io_OE[3];
  wire A09_qspi_io_OUT[0];
  wire A09_qspi_io_OUT[1];
  wire A09_qspi_io_OUT[2];
  wire A09_qspi_io_OUT[3];
  wire A09_qspi_io_PDRV0[0];
  wire A09_qspi_io_PDRV0[1];
  wire A09_qspi_io_PDRV0[2];
  wire A09_qspi_io_PDRV0[3];
  wire A09_qspi_io_PDRV1[0];
  wire A09_qspi_io_PDRV1[1];
  wire A09_qspi_io_PDRV1[2];
  wire A09_qspi_io_PDRV1[3];
  wire A09_qspi_io_PD[0];
  wire A09_qspi_io_PD[1];
  wire A09_qspi_io_PD[2];
  wire A09_qspi_io_PD[3];
  wire A09_qspi_io_PU[0];
  wire A09_qspi_io_PU[1];
  wire A09_qspi_io_PU[2];
  wire A09_qspi_io_PU[3];
  wire A09_qspi_io_SL[0];
  wire A09_qspi_io_SL[1];
  wire A09_qspi_io_SL[2];
  wire A09_qspi_io_SL[3];
  wire A09_qspi_sck_CS;
  wire A09_qspi_sck_IE;
  wire A09_qspi_sck_IN;
  wire A09_qspi_sck_OE;
  wire A09_qspi_sck_OUT;
  wire A09_qspi_sck_PD;
  wire A09_qspi_sck_PDRV0;
  wire A09_qspi_sck_PDRV1;
  wire A09_qspi_sck_PU;
  wire A09_qspi_sck_SL;
  wire A09_rst_n_PD;
  wire A09_rst_n_PU;
  wire A09_rst_n__CORE;
  wire A09_uart_rx_PD;
  wire A09_uart_rx_PU;
  wire A09_uart_rx__CORE;
  wire A09_uart_tx_CS;
  wire A09_uart_tx_IE;
  wire A09_uart_tx_IN;
  wire A09_uart_tx_OE;
  wire A09_uart_tx_OUT;
  wire A09_uart_tx_PD;
  wire A09_uart_tx_PDRV0;
  wire A09_uart_tx_PDRV1;
  wire A09_uart_tx_PU;
  wire A09_uart_tx_SL;
  wire A30_clk_PD;
  wire A30_clk_PU;
  wire A30_clk__CORE;
  wire A30_disp_spi_clk_out_CS;
  wire A30_disp_spi_clk_out_IE;
  wire A30_disp_spi_clk_out_IN;
  wire A30_disp_spi_clk_out_OE;
  wire A30_disp_spi_clk_out_OUT;
  wire A30_disp_spi_clk_out_PD;
  wire A30_disp_spi_clk_out_PU;
  wire A30_disp_spi_clk_out_SL;
  wire A30_reset_PD;
  wire A30_reset_PU;
  wire A30_reset__CORE;
  wire A30_spi_clk_out_CS;
  wire A30_spi_clk_out_IE;
  wire A30_spi_clk_out_IN;
  wire A30_spi_clk_out_OE;
  wire A30_spi_clk_out_OUT;
  wire A30_spi_clk_out_PD;
  wire A30_spi_clk_out_PU;
  wire A30_spi_clk_out_SL;
  wire A30_spi_data0_CS;
  wire A30_spi_data0_IE;
  wire A30_spi_data0_IN;
  wire A30_spi_data0_OE;
  wire A30_spi_data0_OUT;
  wire A30_spi_data0_PD;
  wire A30_spi_data0_PU;
  wire A30_spi_data0_SL;
  wire A30_spi_data1_CS;
  wire A30_spi_data1_IE;
  wire A30_spi_data1_IN;
  wire A30_spi_data1_OE;
  wire A30_spi_data1_OUT;
  wire A30_spi_data1_PD;
  wire A30_spi_data1_PU;
  wire A30_spi_data1_SL;
  wire A30_spi_data2_CS;
  wire A30_spi_data2_IE;
  wire A30_spi_data2_IN;
  wire A30_spi_data2_OE;
  wire A30_spi_data2_OUT;
  wire A30_spi_data2_PD;
  wire A30_spi_data2_PU;
  wire A30_spi_data2_SL;
  wire A30_spi_data3_CS;
  wire A30_spi_data3_IE;
  wire A30_spi_data3_IN;
  wire A30_spi_data3_OE;
  wire A30_spi_data3_OUT;
  wire A30_spi_data3_PD;
  wire A30_spi_data3_PU;
  wire A30_spi_data3_SL;
  wire A30_spi_dc_CS;
  wire A30_spi_dc_IE;
  wire A30_spi_dc_IN;
  wire A30_spi_dc_OE;
  wire A30_spi_dc_OUT;
  wire A30_spi_dc_PD;
  wire A30_spi_dc_PU;
  wire A30_spi_dc_SL;
  wire A30_spi_flash_select_CS;
  wire A30_spi_flash_select_IE;
  wire A30_spi_flash_select_IN;
  wire A30_spi_flash_select_OE;
  wire A30_spi_flash_select_OUT;
  wire A30_spi_flash_select_PD;
  wire A30_spi_flash_select_PU;
  wire A30_spi_flash_select_SL;
  wire A30_spi_miso_CS;
  wire A30_spi_miso_IE;
  wire A30_spi_miso_IN;
  wire A30_spi_miso_OE;
  wire A30_spi_miso_OUT;
  wire A30_spi_miso_PD;
  wire A30_spi_miso_PDRV0;
  wire A30_spi_miso_PDRV1;
  wire A30_spi_miso_PU;
  wire A30_spi_miso_SL;
  wire A30_spi_mosi_CS;
  wire A30_spi_mosi_IE;
  wire A30_spi_mosi_IN;
  wire A30_spi_mosi_OE;
  wire A30_spi_mosi_OUT;
  wire A30_spi_mosi_PD;
  wire A30_spi_mosi_PU;
  wire A30_spi_mosi_SL;
  wire A30_spi_ram_a_select_CS;
  wire A30_spi_ram_a_select_IE;
  wire A30_spi_ram_a_select_IN;
  wire A30_spi_ram_a_select_OE;
  wire A30_spi_ram_a_select_OUT;
  wire A30_spi_ram_a_select_PD;
  wire A30_spi_ram_a_select_PU;
  wire A30_spi_ram_a_select_SL;
  wire A30_spi_select_CS;
  wire A30_spi_select_IE;
  wire A30_spi_select_IN;
  wire A30_spi_select_OE;
  wire A30_spi_select_OUT;
  wire A30_spi_select_PD;
  wire A30_spi_select_PU;
  wire A30_spi_select_SL;
  wire A30_uart_rx_CS;
  wire A30_uart_rx_IE;
  wire A30_uart_rx_IN;
  wire A30_uart_rx_OE;
  wire A30_uart_rx_OUT;
  wire A30_uart_rx_PD;
  wire A30_uart_rx_PDRV0;
  wire A30_uart_rx_PDRV1;
  wire A30_uart_rx_PU;
  wire A30_uart_rx_SL;
  wire A30_uart_tx_CS;
  wire A30_uart_tx_IE;
  wire A30_uart_tx_IN;
  wire A30_uart_tx_OE;
  wire A30_uart_tx_OUT;
  wire A30_uart_tx_PD;
  wire A30_uart_tx_PU;
  wire A30_uart_tx_SL;
  wire A40_HOST_CS_PD;
  wire A40_HOST_CS_PU;
  wire A40_HOST_CS__CORE;
  wire A40_IQ_CLK_PD;
  wire A40_IQ_CLK_PU;
  wire A40_IQ_CLK__CORE;
  wire A40_IQ_DATA_I_0_PD;
  wire A40_IQ_DATA_I_0_PU;
  wire A40_IQ_DATA_I_0__CORE;
  wire A40_IQ_DATA_I_1_PD;
  wire A40_IQ_DATA_I_1_PU;
  wire A40_IQ_DATA_I_1__CORE;
  wire A40_IQ_DATA_I_2_PD;
  wire A40_IQ_DATA_I_2_PU;
  wire A40_IQ_DATA_I_2__CORE;
  wire A40_IQ_DATA_I_3_PD;
  wire A40_IQ_DATA_I_3_PU;
  wire A40_IQ_DATA_I_3__CORE;
  wire A40_IQ_DATA_Q_0_PD;
  wire A40_IQ_DATA_Q_0_PU;
  wire A40_IQ_DATA_Q_0__CORE;
  wire A40_IQ_DATA_Q_1_PD;
  wire A40_IQ_DATA_Q_1_PU;
  wire A40_IQ_DATA_Q_1__CORE;
  wire A40_IQ_DATA_Q_2_PD;
  wire A40_IQ_DATA_Q_2_PU;
  wire A40_IQ_DATA_Q_2__CORE;
  wire A40_IQ_DATA_Q_3_PD;
  wire A40_IQ_DATA_Q_3_PU;
  wire A40_IQ_DATA_Q_3__CORE;
  wire A40_IRQ_OUT_CS;
  wire A40_IRQ_OUT_IE;
  wire A40_IRQ_OUT_IN;
  wire A40_IRQ_OUT_OE;
  wire A40_IRQ_OUT_OUT;
  wire A40_IRQ_OUT_PD;
  wire A40_IRQ_OUT_PDRV0;
  wire A40_IRQ_OUT_PDRV1;
  wire A40_IRQ_OUT_PU;
  wire A40_IRQ_OUT_SL;
  wire A40_PSRAM_CE_N_CS;
  wire A40_PSRAM_CE_N_IE;
  wire A40_PSRAM_CE_N_IN;
  wire A40_PSRAM_CE_N_OE;
  wire A40_PSRAM_CE_N_OUT;
  wire A40_PSRAM_CE_N_PD;
  wire A40_PSRAM_CE_N_PDRV0;
  wire A40_PSRAM_CE_N_PDRV1;
  wire A40_PSRAM_CE_N_PU;
  wire A40_PSRAM_CE_N_SL;
  wire A40_PSRAM_SCK_CS;
  wire A40_PSRAM_SCK_IE;
  wire A40_PSRAM_SCK_IN;
  wire A40_PSRAM_SCK_OE;
  wire A40_PSRAM_SCK_OUT;
  wire A40_PSRAM_SCK_PD;
  wire A40_PSRAM_SCK_PU;
  wire A40_PSRAM_SCK_SL;
  wire A40_PSRAM_SIO_0_CS;
  wire A40_PSRAM_SIO_0_IE;
  wire A40_PSRAM_SIO_0_IN;
  wire A40_PSRAM_SIO_0_OE;
  wire A40_PSRAM_SIO_0_OUT;
  wire A40_PSRAM_SIO_0_PD;
  wire A40_PSRAM_SIO_0_PDRV0;
  wire A40_PSRAM_SIO_0_PDRV1;
  wire A40_PSRAM_SIO_0_PU;
  wire A40_PSRAM_SIO_0_SL;
  wire A40_PSRAM_SIO_1_CS;
  wire A40_PSRAM_SIO_1_IE;
  wire A40_PSRAM_SIO_1_IN;
  wire A40_PSRAM_SIO_1_OE;
  wire A40_PSRAM_SIO_1_OUT;
  wire A40_PSRAM_SIO_1_PD;
  wire A40_PSRAM_SIO_1_PDRV0;
  wire A40_PSRAM_SIO_1_PDRV1;
  wire A40_PSRAM_SIO_1_PU;
  wire A40_PSRAM_SIO_1_SL;
  wire A40_PSRAM_SIO_2_CS;
  wire A40_PSRAM_SIO_2_IE;
  wire A40_PSRAM_SIO_2_IN;
  wire A40_PSRAM_SIO_2_OE;
  wire A40_PSRAM_SIO_2_OUT;
  wire A40_PSRAM_SIO_2_PD;
  wire A40_PSRAM_SIO_2_PDRV0;
  wire A40_PSRAM_SIO_2_PDRV1;
  wire A40_PSRAM_SIO_2_PU;
  wire A40_PSRAM_SIO_2_SL;
  wire A40_PSRAM_SIO_3_CS;
  wire A40_PSRAM_SIO_3_IE;
  wire A40_PSRAM_SIO_3_IN;
  wire A40_PSRAM_SIO_3_OE;
  wire A40_PSRAM_SIO_3_OUT;
  wire A40_PSRAM_SIO_3_PD;
  wire A40_PSRAM_SIO_3_PDRV0;
  wire A40_PSRAM_SIO_3_PDRV1;
  wire A40_PSRAM_SIO_3_PU;
  wire A40_PSRAM_SIO_3_SL;
  wire A40_REMOD_A_I_CS;
  wire A40_REMOD_A_I_IE;
  wire A40_REMOD_A_I_IN;
  wire A40_REMOD_A_I_OE;
  wire A40_REMOD_A_I_OUT;
  wire A40_REMOD_A_I_PD;
  wire A40_REMOD_A_I_PDRV0;
  wire A40_REMOD_A_I_PDRV1;
  wire A40_REMOD_A_I_PU;
  wire A40_REMOD_A_I_SL;
  wire A40_REMOD_A_Q_CS;
  wire A40_REMOD_A_Q_IE;
  wire A40_REMOD_A_Q_IN;
  wire A40_REMOD_A_Q_OE;
  wire A40_REMOD_A_Q_OUT;
  wire A40_REMOD_A_Q_PD;
  wire A40_REMOD_A_Q_PDRV0;
  wire A40_REMOD_A_Q_PDRV1;
  wire A40_REMOD_A_Q_PU;
  wire A40_REMOD_A_Q_SL;
  wire A40_RESETB_PD;
  wire A40_RESETB_PU;
  wire A40_RESETB__CORE;
  wire A40_SPI_MISO_CS;
  wire A40_SPI_MISO_IE;
  wire A40_SPI_MISO_IN;
  wire A40_SPI_MISO_OE;
  wire A40_SPI_MISO_OUT;
  wire A40_SPI_MISO_PD;
  wire A40_SPI_MISO_PDRV0;
  wire A40_SPI_MISO_PDRV1;
  wire A40_SPI_MISO_PU;
  wire A40_SPI_MISO_SL;
  wire A40_SPI_MOSI_PD;
  wire A40_SPI_MOSI_PU;
  wire A40_SPI_MOSI__CORE;
  wire A40_SPI_SCK_PD;
  wire A40_SPI_SCK_PU;
  wire A40_SPI_SCK__CORE;
  wire B18_clk_PD;
  wire B18_clk_PU;
  wire B18_clk__CORE;
  wire B18_comp_x_PD;
  wire B18_comp_x_PU;
  wire B18_comp_x__CORE;
  wire B18_comp_y_PD;
  wire B18_comp_y_PU;
  wire B18_comp_y__CORE;
  wire B18_dir_x_CS;
  wire B18_dir_x_IE;
  wire B18_dir_x_IN;
  wire B18_dir_x_OE;
  wire B18_dir_x_OUT;
  wire B18_dir_x_PD;
  wire B18_dir_x_PDRV0;
  wire B18_dir_x_PDRV1;
  wire B18_dir_x_PU;
  wire B18_dir_x_SL;
  wire B18_dir_y_CS;
  wire B18_dir_y_IE;
  wire B18_dir_y_IN;
  wire B18_dir_y_OE;
  wire B18_dir_y_OUT;
  wire B18_dir_y_PD;
  wire B18_dir_y_PDRV0;
  wire B18_dir_y_PDRV1;
  wire B18_dir_y_PU;
  wire B18_dir_y_SL;
  wire B18_mems_drv_x_CS;
  wire B18_mems_drv_x_IE;
  wire B18_mems_drv_x_IN;
  wire B18_mems_drv_x_OE;
  wire B18_mems_drv_x_OUT;
  wire B18_mems_drv_x_PD;
  wire B18_mems_drv_x_PDRV0;
  wire B18_mems_drv_x_PDRV1;
  wire B18_mems_drv_x_PU;
  wire B18_mems_drv_x_SL;
  wire B18_mems_drv_y_CS;
  wire B18_mems_drv_y_IE;
  wire B18_mems_drv_y_IN;
  wire B18_mems_drv_y_OE;
  wire B18_mems_drv_y_OUT;
  wire B18_mems_drv_y_PD;
  wire B18_mems_drv_y_PDRV0;
  wire B18_mems_drv_y_PDRV1;
  wire B18_mems_drv_y_PU;
  wire B18_mems_drv_y_SL;
  wire B18_move_en_x_CS;
  wire B18_move_en_x_IE;
  wire B18_move_en_x_IN;
  wire B18_move_en_x_OE;
  wire B18_move_en_x_OUT;
  wire B18_move_en_x_PD;
  wire B18_move_en_x_PDRV0;
  wire B18_move_en_x_PDRV1;
  wire B18_move_en_x_PU;
  wire B18_move_en_x_SL;
  wire B18_move_en_y_CS;
  wire B18_move_en_y_IE;
  wire B18_move_en_y_IN;
  wire B18_move_en_y_OE;
  wire B18_move_en_y_OUT;
  wire B18_move_en_y_PD;
  wire B18_move_en_y_PDRV0;
  wire B18_move_en_y_PDRV1;
  wire B18_move_en_y_PU;
  wire B18_move_en_y_SL;
  wire B18_read_en_CS;
  wire B18_read_en_IE;
  wire B18_read_en_IN;
  wire B18_read_en_OE;
  wire B18_read_en_OUT;
  wire B18_read_en_PD;
  wire B18_read_en_PDRV0;
  wire B18_read_en_PDRV1;
  wire B18_read_en_PU;
  wire B18_read_en_SL;
  wire B18_ref_wave_x_CS;
  wire B18_ref_wave_x_IE;
  wire B18_ref_wave_x_IN;
  wire B18_ref_wave_x_OE;
  wire B18_ref_wave_x_OUT;
  wire B18_ref_wave_x_PD;
  wire B18_ref_wave_x_PDRV0;
  wire B18_ref_wave_x_PDRV1;
  wire B18_ref_wave_x_PU;
  wire B18_ref_wave_x_SL;
  wire B18_ref_wave_y_CS;
  wire B18_ref_wave_y_IE;
  wire B18_ref_wave_y_IN;
  wire B18_ref_wave_y_OE;
  wire B18_ref_wave_y_OUT;
  wire B18_ref_wave_y_PD;
  wire B18_ref_wave_y_PDRV0;
  wire B18_ref_wave_y_PDRV1;
  wire B18_ref_wave_y_PU;
  wire B18_ref_wave_y_SL;
  wire B18_rst_n_PD;
  wire B18_rst_n_PU;
  wire B18_rst_n__CORE;
  wire B18_spi_cs_n_PD;
  wire B18_spi_cs_n_PU;
  wire B18_spi_cs_n__CORE;
  wire B18_spi_miso_CS;
  wire B18_spi_miso_IE;
  wire B18_spi_miso_IN;
  wire B18_spi_miso_OUT;
  wire B18_spi_miso_PD;
  wire B18_spi_miso_PDRV0;
  wire B18_spi_miso_PDRV1;
  wire B18_spi_miso_PU;
  wire B18_spi_miso_SL;
  wire B18_spi_miso_oe;
  wire B18_spi_mosi_PD;
  wire B18_spi_mosi_PU;
  wire B18_spi_mosi__CORE;
  wire B18_spi_sclk_PD;
  wire B18_spi_sclk_PU;
  wire B18_spi_sclk__CORE;
  SSCS_2026_01_padring PADRING (.E01(A30_spi_flash_select), .E01_A(A30_spi_flash_select_OUT), .E01_CS(A30_spi_flash_select_CS), .E01_IE(A30_spi_flash_select_IE), .E01_OE(A30_spi_flash_select_OE), .E01_PD(A30_spi_flash_select_PD), .E01_PU(A30_spi_flash_select_PU), .E01_SL(A30_spi_flash_select_SL), .E01_Y(A30_spi_flash_select_IN), .E02(A30_spi_clk_out), .E02_A(A30_spi_clk_out_OUT), .E02_CS(A30_spi_clk_out_CS), .E02_IE(A30_spi_clk_out_IE), .E02_OE(A30_spi_clk_out_OE), .E02_PD(A30_spi_clk_out_PD), .E02_PU(A30_spi_clk_out_PU), .E02_SL(A30_spi_clk_out_SL), .E02_Y(A30_spi_clk_out_IN), .E03(A30_spi_data3), .E03_A(A30_spi_data3_OUT), .E03_CS(A30_spi_data3_CS), .E03_IE(A30_spi_data3_IE), .E03_OE(A30_spi_data3_OE), .E03_PD(A30_spi_data3_PD), .E03_PU(A30_spi_data3_PU), .E03_SL(A30_spi_data3_SL), .E03_Y(A30_spi_data3_IN), .E04(A30_spi_data2), .E04_A(A30_spi_data2_OUT), .E04_CS(A30_spi_data2_CS), .E04_IE(A30_spi_data2_IE), .E04_OE(A30_spi_data2_OE), .E04_PD(A30_spi_data2_PD), .E04_PU(A30_spi_data2_PU), .E04_SL(A30_spi_data2_SL), .E04_Y(A30_spi_data2_IN), .E05(A30_spi_data1), .E05_A(A30_spi_data1_OUT), .E05_CS(A30_spi_data1_CS), .E05_IE(A30_spi_data1_IE), .E05_OE(A30_spi_data1_OE), .E05_PD(A30_spi_data1_PD), .E05_PU(A30_spi_data1_PU), .E05_SL(A30_spi_data1_SL), .E05_Y(A30_spi_data1_IN), .E06(A30_spi_data0), .E06_A(A30_spi_data0_OUT), .E06_CS(A30_spi_data0_CS), .E06_IE(A30_spi_data0_IE), .E06_OE(A30_spi_data0_OE), .E06_PD(A30_spi_data0_PD), .E06_PU(A30_spi_data0_PU), .E06_SL(A30_spi_data0_SL), .E06_Y(A30_spi_data0_IN), .E07(A30_spi_miso), .E07_A(A30_spi_miso_OUT), .E07_CS(A30_spi_miso_CS), .E07_IE(A30_spi_miso_IE), .E07_OE(A30_spi_miso_OE), .E07_PD(A30_spi_miso_PD), .E07_PDRV0(A30_spi_miso_PDRV0), .E07_PDRV1(A30_spi_miso_PDRV1), .E07_PU(A30_spi_miso_PU), .E07_SL(A30_spi_miso_SL), .E07_Y(A30_spi_miso_IN), .E08(A30_uart_rx), .E08_A(A30_uart_rx_OUT), .E08_CS(A30_uart_rx_CS), .E08_IE(A30_uart_rx_IE), .E08_OE(A30_uart_rx_OE), .E08_PD(A30_uart_rx_PD), .E08_PDRV0(A30_uart_rx_PDRV0), .E08_PDRV1(A30_uart_rx_PDRV1), .E08_PU(A30_uart_rx_PU), .E08_SL(A30_uart_rx_SL), .E08_Y(A30_uart_rx_IN), .E09(A30_clk), .E09_PD(A30_clk_PD), .E09_PU(A30_clk_PU), .E09_Y(A30_clk__CORE), .E10(A30_reset), .E10_PD(A30_reset_PD), .E10_PU(A30_reset_PU), .E10_Y(A30_reset__CORE), .E11(A30_VSS), .E12(A09_VSS), .E13(A09_VDD), .E14(A09_clk), .E14_PD(A09_clk_PD), .E14_PU(A09_clk_PU), .E14_Y(A09_clk__CORE), .E15(A09_rst_n), .E15_PD(A09_rst_n_PD), .E15_PU(A09_rst_n_PU), .E15_Y(A09_rst_n__CORE), .E16(A09_uart_rx), .E16_PD(A09_uart_rx_PD), .E16_PU(A09_uart_rx_PU), .E16_Y(A09_uart_rx__CORE), .E17(A09_uart_tx), .E17_A(A09_uart_tx_OUT), .E17_CS(A09_uart_tx_CS), .E17_IE(A09_uart_tx_IE), .E17_OE(A09_uart_tx_OE), .E17_PD(A09_uart_tx_PD), .E17_PDRV0(A09_uart_tx_PDRV0), .E17_PDRV1(A09_uart_tx_PDRV1), .E17_PU(A09_uart_tx_PU), .E17_SL(A09_uart_tx_SL), .E17_Y(A09_uart_tx_IN), .E18(A09_qspi_csn[0]), .E18_A(A09_qspi_csn_OUT[0]), .E18_CS(A09_qspi_csn_CS[0]), .E18_IE(A09_qspi_csn_IE[0]), .E18_OE(A09_qspi_csn_OE[0]), .E18_PD(A09_qspi_csn_PD[0]), .E18_PDRV0(A09_qspi_csn_PDRV0[0]), .E18_PDRV1(A09_qspi_csn_PDRV1[0]), .E18_PU(A09_qspi_csn_PU[0]), .E18_SL(A09_qspi_csn_SL[0]), .E18_Y(A09_qspi_csn_IN[0]), .E19(A09_qspi_csn[1]), .E19_A(A09_qspi_csn_OUT[1]), .E19_CS(A09_qspi_csn_CS[1]), .E19_IE(A09_qspi_csn_IE[1]), .E19_OE(A09_qspi_csn_OE[1]), .E19_PD(A09_qspi_csn_PD[1]), .E19_PDRV0(A09_qspi_csn_PDRV0[1]), .E19_PDRV1(A09_qspi_csn_PDRV1[1]), .E19_PU(A09_qspi_csn_PU[1]), .E19_SL(A09_qspi_csn_SL[1]), .E19_Y(A09_qspi_csn_IN[1]), .E20(A09_qspi_sck), .E20_A(A09_qspi_sck_OUT), .E20_CS(A09_qspi_sck_CS), .E20_IE(A09_qspi_sck_IE), .E20_OE(A09_qspi_sck_OE), .E20_PD(A09_qspi_sck_PD), .E20_PDRV0(A09_qspi_sck_PDRV0), .E20_PDRV1(A09_qspi_sck_PDRV1), .E20_PU(A09_qspi_sck_PU), .E20_SL(A09_qspi_sck_SL), .E20_Y(A09_qspi_sck_IN), .E21(A09_qspi_io[0]), .E21_A(A09_qspi_io_OUT[0]), .E21_CS(A09_qspi_io_CS[0]), .E21_IE(A09_qspi_io_IE[0]), .E21_OE(A09_qspi_io_OE[0]), .E21_PD(A09_qspi_io_PD[0]), .E21_PDRV0(A09_qspi_io_PDRV0[0]), .E21_PDRV1(A09_qspi_io_PDRV1[0]), .E21_PU(A09_qspi_io_PU[0]), .E21_SL(A09_qspi_io_SL[0]), .E21_Y(A09_qspi_io_IN[0]), .E22(A09_qspi_io[1]), .E22_A(A09_qspi_io_OUT[1]), .E22_CS(A09_qspi_io_CS[1]), .E22_IE(A09_qspi_io_IE[1]), .E22_OE(A09_qspi_io_OE[1]), .E22_PD(A09_qspi_io_PD[1]), .E22_PDRV0(A09_qspi_io_PDRV0[1]), .E22_PDRV1(A09_qspi_io_PDRV1[1]), .E22_PU(A09_qspi_io_PU[1]), .E22_SL(A09_qspi_io_SL[1]), .E22_Y(A09_qspi_io_IN[1]), .N01(A40_REMOD_A_I), .N01_A(A40_REMOD_A_I_OUT), .N01_CS(A40_REMOD_A_I_CS), .N01_IE(A40_REMOD_A_I_IE), .N01_OE(A40_REMOD_A_I_OE), .N01_PD(A40_REMOD_A_I_PD), .N01_PDRV0(A40_REMOD_A_I_PDRV0), .N01_PDRV1(A40_REMOD_A_I_PDRV1), .N01_PU(A40_REMOD_A_I_PU), .N01_SL(A40_REMOD_A_I_SL), .N01_Y(A40_REMOD_A_I_IN), .N02(A40_REMOD_A_Q), .N02_A(A40_REMOD_A_Q_OUT), .N02_CS(A40_REMOD_A_Q_CS), .N02_IE(A40_REMOD_A_Q_IE), .N02_OE(A40_REMOD_A_Q_OE), .N02_PD(A40_REMOD_A_Q_PD), .N02_PDRV0(A40_REMOD_A_Q_PDRV0), .N02_PDRV1(A40_REMOD_A_Q_PDRV1), .N02_PU(A40_REMOD_A_Q_PU), .N02_SL(A40_REMOD_A_Q_SL), .N02_Y(A40_REMOD_A_Q_IN), .N03(A40_PSRAM_SCK), .N03_A(A40_PSRAM_SCK_OUT), .N03_CS(A40_PSRAM_SCK_CS), .N03_IE(A40_PSRAM_SCK_IE), .N03_OE(A40_PSRAM_SCK_OE), .N03_PD(A40_PSRAM_SCK_PD), .N03_PU(A40_PSRAM_SCK_PU), .N03_SL(A40_PSRAM_SCK_SL), .N03_Y(A40_PSRAM_SCK_IN), .N04(A40_PSRAM_CE_N), .N04_A(A40_PSRAM_CE_N_OUT), .N04_CS(A40_PSRAM_CE_N_CS), .N04_IE(A40_PSRAM_CE_N_IE), .N04_OE(A40_PSRAM_CE_N_OE), .N04_PD(A40_PSRAM_CE_N_PD), .N04_PDRV0(A40_PSRAM_CE_N_PDRV0), .N04_PDRV1(A40_PSRAM_CE_N_PDRV1), .N04_PU(A40_PSRAM_CE_N_PU), .N04_SL(A40_PSRAM_CE_N_SL), .N04_Y(A40_PSRAM_CE_N_IN), .N05(A40_PSRAM_SIO_0), .N05_A(A40_PSRAM_SIO_0_OUT), .N05_CS(A40_PSRAM_SIO_0_CS), .N05_IE(A40_PSRAM_SIO_0_IE), .N05_OE(A40_PSRAM_SIO_0_OE), .N05_PD(A40_PSRAM_SIO_0_PD), .N05_PDRV0(A40_PSRAM_SIO_0_PDRV0), .N05_PDRV1(A40_PSRAM_SIO_0_PDRV1), .N05_PU(A40_PSRAM_SIO_0_PU), .N05_SL(A40_PSRAM_SIO_0_SL), .N05_Y(A40_PSRAM_SIO_0_IN), .N06(A40_PSRAM_SIO_1), .N06_A(A40_PSRAM_SIO_1_OUT), .N06_CS(A40_PSRAM_SIO_1_CS), .N06_IE(A40_PSRAM_SIO_1_IE), .N06_OE(A40_PSRAM_SIO_1_OE), .N06_PD(A40_PSRAM_SIO_1_PD), .N06_PDRV0(A40_PSRAM_SIO_1_PDRV0), .N06_PDRV1(A40_PSRAM_SIO_1_PDRV1), .N06_PU(A40_PSRAM_SIO_1_PU), .N06_SL(A40_PSRAM_SIO_1_SL), .N06_Y(A40_PSRAM_SIO_1_IN), .N07(A40_PSRAM_SIO_2), .N07_A(A40_PSRAM_SIO_2_OUT), .N07_CS(A40_PSRAM_SIO_2_CS), .N07_IE(A40_PSRAM_SIO_2_IE), .N07_OE(A40_PSRAM_SIO_2_OE), .N07_PD(A40_PSRAM_SIO_2_PD), .N07_PDRV0(A40_PSRAM_SIO_2_PDRV0), .N07_PDRV1(A40_PSRAM_SIO_2_PDRV1), .N07_PU(A40_PSRAM_SIO_2_PU), .N07_SL(A40_PSRAM_SIO_2_SL), .N07_Y(A40_PSRAM_SIO_2_IN), .N08(A40_PSRAM_SIO_3), .N08_A(A40_PSRAM_SIO_3_OUT), .N08_CS(A40_PSRAM_SIO_3_CS), .N08_IE(A40_PSRAM_SIO_3_IE), .N08_OE(A40_PSRAM_SIO_3_OE), .N08_PD(A40_PSRAM_SIO_3_PD), .N08_PDRV0(A40_PSRAM_SIO_3_PDRV0), .N08_PDRV1(A40_PSRAM_SIO_3_PDRV1), .N08_PU(A40_PSRAM_SIO_3_PU), .N08_SL(A40_PSRAM_SIO_3_SL), .N08_Y(A40_PSRAM_SIO_3_IN), .N09(A40_HOST_CS), .N09_PD(A40_HOST_CS_PD), .N09_PU(A40_HOST_CS_PU), .N09_Y(A40_HOST_CS__CORE), .N10(A40_SPI_SCK), .N10_PD(A40_SPI_SCK_PD), .N10_PU(A40_SPI_SCK_PU), .N10_Y(A40_SPI_SCK__CORE), .N11(A40_SPI_MOSI), .N11_PD(A40_SPI_MOSI_PD), .N11_PU(A40_SPI_MOSI_PU), .N11_Y(A40_SPI_MOSI__CORE), .N12(A40_SPI_MISO), .N12_A(A40_SPI_MISO_OUT), .N12_CS(A40_SPI_MISO_CS), .N12_IE(A40_SPI_MISO_IE), .N12_OE(A40_SPI_MISO_OE), .N12_PD(A40_SPI_MISO_PD), .N12_PDRV0(A40_SPI_MISO_PDRV0), .N12_PDRV1(A40_SPI_MISO_PDRV1), .N12_PU(A40_SPI_MISO_PU), .N12_SL(A40_SPI_MISO_SL), .N12_Y(A40_SPI_MISO_IN), .N13(A40_IRQ_OUT), .N13_A(A40_IRQ_OUT_OUT), .N13_CS(A40_IRQ_OUT_CS), .N13_IE(A40_IRQ_OUT_IE), .N13_OE(A40_IRQ_OUT_OE), .N13_PD(A40_IRQ_OUT_PD), .N13_PDRV0(A40_IRQ_OUT_PDRV0), .N13_PDRV1(A40_IRQ_OUT_PDRV1), .N13_PU(A40_IRQ_OUT_PU), .N13_SL(A40_IRQ_OUT_SL), .N13_Y(A40_IRQ_OUT_IN), .N14(A40_VDD), .N21(A09_qspi_io[3]), .N21_A(A09_qspi_io_OUT[3]), .N21_CS(A09_qspi_io_CS[3]), .N21_IE(A09_qspi_io_IE[3]), .N21_OE(A09_qspi_io_OE[3]), .N21_PD(A09_qspi_io_PD[3]), .N21_PDRV0(A09_qspi_io_PDRV0[3]), .N21_PDRV1(A09_qspi_io_PDRV1[3]), .N21_PU(A09_qspi_io_PU[3]), .N21_SL(A09_qspi_io_SL[3]), .N21_Y(A09_qspi_io_IN[3]), .N22(A09_qspi_io[2]), .N22_A(A09_qspi_io_OUT[2]), .N22_CS(A09_qspi_io_CS[2]), .N22_IE(A09_qspi_io_IE[2]), .N22_OE(A09_qspi_io_OE[2]), .N22_PD(A09_qspi_io_PD[2]), .N22_PDRV0(A09_qspi_io_PDRV0[2]), .N22_PDRV1(A09_qspi_io_PDRV1[2]), .N22_PU(A09_qspi_io_PU[2]), .N22_SL(A09_qspi_io_SL[2]), .N22_Y(A09_qspi_io_IN[2]), .S01(B18_mems_drv_y), .S01_A(B18_mems_drv_y_OUT), .S01_CS(B18_mems_drv_y_CS), .S01_IE(B18_mems_drv_y_IE), .S01_OE(B18_mems_drv_y_OE), .S01_PD(B18_mems_drv_y_PD), .S01_PDRV0(B18_mems_drv_y_PDRV0), .S01_PDRV1(B18_mems_drv_y_PDRV1), .S01_PU(B18_mems_drv_y_PU), .S01_SL(B18_mems_drv_y_SL), .S01_Y(B18_mems_drv_y_IN), .S02(B18_ref_wave_y), .S02_A(B18_ref_wave_y_OUT), .S02_CS(B18_ref_wave_y_CS), .S02_IE(B18_ref_wave_y_IE), .S02_OE(B18_ref_wave_y_OE), .S02_PD(B18_ref_wave_y_PD), .S02_PDRV0(B18_ref_wave_y_PDRV0), .S02_PDRV1(B18_ref_wave_y_PDRV1), .S02_PU(B18_ref_wave_y_PU), .S02_SL(B18_ref_wave_y_SL), .S02_Y(B18_ref_wave_y_IN), .S03(B18_dir_y), .S03_A(B18_dir_y_OUT), .S03_CS(B18_dir_y_CS), .S03_IE(B18_dir_y_IE), .S03_OE(B18_dir_y_OE), .S03_PD(B18_dir_y_PD), .S03_PDRV0(B18_dir_y_PDRV0), .S03_PDRV1(B18_dir_y_PDRV1), .S03_PU(B18_dir_y_PU), .S03_SL(B18_dir_y_SL), .S03_Y(B18_dir_y_IN), .S04(B18_move_en_y), .S04_A(B18_move_en_y_OUT), .S04_CS(B18_move_en_y_CS), .S04_IE(B18_move_en_y_IE), .S04_OE(B18_move_en_y_OE), .S04_PD(B18_move_en_y_PD), .S04_PDRV0(B18_move_en_y_PDRV0), .S04_PDRV1(B18_move_en_y_PDRV1), .S04_PU(B18_move_en_y_PU), .S04_SL(B18_move_en_y_SL), .S04_Y(B18_move_en_y_IN), .S05(B18_comp_x), .S05_PD(B18_comp_x_PD), .S05_PU(B18_comp_x_PU), .S05_Y(B18_comp_x__CORE), .S06(B18_read_en), .S06_A(B18_read_en_OUT), .S06_CS(B18_read_en_CS), .S06_IE(B18_read_en_IE), .S06_OE(B18_read_en_OE), .S06_PD(B18_read_en_PD), .S06_PDRV0(B18_read_en_PDRV0), .S06_PDRV1(B18_read_en_PDRV1), .S06_PU(B18_read_en_PU), .S06_SL(B18_read_en_SL), .S06_Y(B18_read_en_IN), .S07(B18_comp_y), .S07_PD(B18_comp_y_PD), .S07_PU(B18_comp_y_PU), .S07_Y(B18_comp_y__CORE), .S08(B18_VDD), .S16(A30_VDD), .S17(A30_spi_dc), .S17_A(A30_spi_dc_OUT), .S17_CS(A30_spi_dc_CS), .S17_IE(A30_spi_dc_IE), .S17_OE(A30_spi_dc_OE), .S17_PD(A30_spi_dc_PD), .S17_PU(A30_spi_dc_PU), .S17_SL(A30_spi_dc_SL), .S17_Y(A30_spi_dc_IN), .S18(A30_spi_mosi), .S18_A(A30_spi_mosi_OUT), .S18_CS(A30_spi_mosi_CS), .S18_IE(A30_spi_mosi_IE), .S18_OE(A30_spi_mosi_OE), .S18_PD(A30_spi_mosi_PD), .S18_PU(A30_spi_mosi_PU), .S18_SL(A30_spi_mosi_SL), .S18_Y(A30_spi_mosi_IN), .S19(A30_disp_spi_clk_out), .S19_A(A30_disp_spi_clk_out_OUT), .S19_CS(A30_disp_spi_clk_out_CS), .S19_IE(A30_disp_spi_clk_out_IE), .S19_OE(A30_disp_spi_clk_out_OE), .S19_PD(A30_disp_spi_clk_out_PD), .S19_PU(A30_disp_spi_clk_out_PU), .S19_SL(A30_disp_spi_clk_out_SL), .S19_Y(A30_disp_spi_clk_out_IN), .S20(A30_spi_select), .S20_A(A30_spi_select_OUT), .S20_CS(A30_spi_select_CS), .S20_IE(A30_spi_select_IE), .S20_OE(A30_spi_select_OE), .S20_PD(A30_spi_select_PD), .S20_PU(A30_spi_select_PU), .S20_SL(A30_spi_select_SL), .S20_Y(A30_spi_select_IN), .S21(A30_uart_tx), .S21_A(A30_uart_tx_OUT), .S21_CS(A30_uart_tx_CS), .S21_IE(A30_uart_tx_IE), .S21_OE(A30_uart_tx_OE), .S21_PD(A30_uart_tx_PD), .S21_PU(A30_uart_tx_PU), .S21_SL(A30_uart_tx_SL), .S21_Y(A30_uart_tx_IN), .S22(A30_spi_ram_a_select), .S22_A(A30_spi_ram_a_select_OUT), .S22_CS(A30_spi_ram_a_select_CS), .S22_IE(A30_spi_ram_a_select_IE), .S22_OE(A30_spi_ram_a_select_OE), .S22_PD(A30_spi_ram_a_select_PD), .S22_PU(A30_spi_ram_a_select_PU), .S22_SL(A30_spi_ram_a_select_SL), .S22_Y(A30_spi_ram_a_select_IN), .W01(B18_mems_drv_x), .W01_A(B18_mems_drv_x_OUT), .W01_CS(B18_mems_drv_x_CS), .W01_IE(B18_mems_drv_x_IE), .W01_OE(B18_mems_drv_x_OE), .W01_PD(B18_mems_drv_x_PD), .W01_PDRV0(B18_mems_drv_x_PDRV0), .W01_PDRV1(B18_mems_drv_x_PDRV1), .W01_PU(B18_mems_drv_x_PU), .W01_SL(B18_mems_drv_x_SL), .W01_Y(B18_mems_drv_x_IN), .W02(B18_ref_wave_x), .W02_A(B18_ref_wave_x_OUT), .W02_CS(B18_ref_wave_x_CS), .W02_IE(B18_ref_wave_x_IE), .W02_OE(B18_ref_wave_x_OE), .W02_PD(B18_ref_wave_x_PD), .W02_PDRV0(B18_ref_wave_x_PDRV0), .W02_PDRV1(B18_ref_wave_x_PDRV1), .W02_PU(B18_ref_wave_x_PU), .W02_SL(B18_ref_wave_x_SL), .W02_Y(B18_ref_wave_x_IN), .W03(B18_dir_x), .W03_A(B18_dir_x_OUT), .W03_CS(B18_dir_x_CS), .W03_IE(B18_dir_x_IE), .W03_OE(B18_dir_x_OE), .W03_PD(B18_dir_x_PD), .W03_PDRV0(B18_dir_x_PDRV0), .W03_PDRV1(B18_dir_x_PDRV1), .W03_PU(B18_dir_x_PU), .W03_SL(B18_dir_x_SL), .W03_Y(B18_dir_x_IN), .W04(B18_move_en_x), .W04_A(B18_move_en_x_OUT), .W04_CS(B18_move_en_x_CS), .W04_IE(B18_move_en_x_IE), .W04_OE(B18_move_en_x_OE), .W04_PD(B18_move_en_x_PD), .W04_PDRV0(B18_move_en_x_PDRV0), .W04_PDRV1(B18_move_en_x_PDRV1), .W04_PU(B18_move_en_x_PU), .W04_SL(B18_move_en_x_SL), .W04_Y(B18_move_en_x_IN), .W05(B18_clk), .W05_PD(B18_clk_PD), .W05_PU(B18_clk_PU), .W05_Y(B18_clk__CORE), .W06(B18_spi_miso), .W06_A(B18_spi_miso_OUT), .W06_CS(B18_spi_miso_CS), .W06_IE(B18_spi_miso_IE), .W06_OE(B18_spi_miso_oe), .W06_PD(B18_spi_miso_PD), .W06_PDRV0(B18_spi_miso_PDRV0), .W06_PDRV1(B18_spi_miso_PDRV1), .W06_PU(B18_spi_miso_PU), .W06_SL(B18_spi_miso_SL), .W06_Y(B18_spi_miso_IN), .W07(B18_spi_mosi), .W07_PD(B18_spi_mosi_PD), .W07_PU(B18_spi_mosi_PU), .W07_Y(B18_spi_mosi__CORE), .W08(B18_spi_sclk), .W08_PD(B18_spi_sclk_PD), .W08_PU(B18_spi_sclk_PU), .W08_Y(B18_spi_sclk__CORE), .W09(B18_spi_cs_n), .W09_PD(B18_spi_cs_n_PD), .W09_PU(B18_spi_cs_n_PU), .W09_Y(B18_spi_cs_n__CORE), .W10(B18_rst_n), .W10_PD(B18_rst_n_PD), .W10_PU(B18_rst_n_PU), .W10_Y(B18_rst_n__CORE), .W11(B18_VSS), .W12(A40_VSS), .W13(A40_IQ_DATA_I_0), .W13_PD(A40_IQ_DATA_I_0_PD), .W13_PU(A40_IQ_DATA_I_0_PU), .W13_Y(A40_IQ_DATA_I_0__CORE), .W14(A40_IQ_DATA_Q_0), .W14_PD(A40_IQ_DATA_Q_0_PD), .W14_PU(A40_IQ_DATA_Q_0_PU), .W14_Y(A40_IQ_DATA_Q_0__CORE), .W15(A40_IQ_DATA_I_1), .W15_PD(A40_IQ_DATA_I_1_PD), .W15_PU(A40_IQ_DATA_I_1_PU), .W15_Y(A40_IQ_DATA_I_1__CORE), .W16(A40_IQ_DATA_Q_1), .W16_PD(A40_IQ_DATA_Q_1_PD), .W16_PU(A40_IQ_DATA_Q_1_PU), .W16_Y(A40_IQ_DATA_Q_1__CORE), .W17(A40_IQ_DATA_I_2), .W17_PD(A40_IQ_DATA_I_2_PD), .W17_PU(A40_IQ_DATA_I_2_PU), .W17_Y(A40_IQ_DATA_I_2__CORE), .W18(A40_IQ_DATA_Q_2), .W18_PD(A40_IQ_DATA_Q_2_PD), .W18_PU(A40_IQ_DATA_Q_2_PU), .W18_Y(A40_IQ_DATA_Q_2__CORE), .W19(A40_IQ_DATA_I_3), .W19_PD(A40_IQ_DATA_I_3_PD), .W19_PU(A40_IQ_DATA_I_3_PU), .W19_Y(A40_IQ_DATA_I_3__CORE), .W20(A40_IQ_DATA_Q_3), .W20_PD(A40_IQ_DATA_Q_3_PD), .W20_PU(A40_IQ_DATA_Q_3_PU), .W20_Y(A40_IQ_DATA_Q_3__CORE), .W21(A40_IQ_CLK), .W21_PD(A40_IQ_CLK_PD), .W21_PU(A40_IQ_CLK_PU), .W21_Y(A40_IQ_CLK__CORE), .W22(A40_RESETB), .W22_PD(A40_RESETB_PD), .W22_PU(A40_RESETB_PU), .W22_Y(A40_RESETB__CORE));
  A40_trouper_top A40_PROJECT (.VSS(A40_VSS), .IQ_DATA_I_0_PU(A40_IQ_DATA_I_0_PU), .IQ_DATA_I_0_PD(A40_IQ_DATA_I_0_PD), .IQ_DATA_I_0(A40_IQ_DATA_I_0__CORE), .IQ_DATA_Q_0_PU(A40_IQ_DATA_Q_0_PU), .IQ_DATA_Q_0_PD(A40_IQ_DATA_Q_0_PD), .IQ_DATA_Q_0(A40_IQ_DATA_Q_0__CORE), .IQ_DATA_I_1_PU(A40_IQ_DATA_I_1_PU), .IQ_DATA_I_1_PD(A40_IQ_DATA_I_1_PD), .IQ_DATA_I_1(A40_IQ_DATA_I_1__CORE), .IQ_DATA_Q_1_PU(A40_IQ_DATA_Q_1_PU), .IQ_DATA_Q_1_PD(A40_IQ_DATA_Q_1_PD), .IQ_DATA_Q_1(A40_IQ_DATA_Q_1__CORE), .IQ_DATA_I_2_PU(A40_IQ_DATA_I_2_PU), .IQ_DATA_I_2_PD(A40_IQ_DATA_I_2_PD), .IQ_DATA_I_2(A40_IQ_DATA_I_2__CORE), .IQ_DATA_Q_2_PU(A40_IQ_DATA_Q_2_PU), .IQ_DATA_Q_2_PD(A40_IQ_DATA_Q_2_PD), .IQ_DATA_Q_2(A40_IQ_DATA_Q_2__CORE), .IQ_DATA_I_3_PU(A40_IQ_DATA_I_3_PU), .IQ_DATA_I_3_PD(A40_IQ_DATA_I_3_PD), .IQ_DATA_I_3(A40_IQ_DATA_I_3__CORE), .IQ_DATA_Q_3_PU(A40_IQ_DATA_Q_3_PU), .IQ_DATA_Q_3_PD(A40_IQ_DATA_Q_3_PD), .IQ_DATA_Q_3(A40_IQ_DATA_Q_3__CORE), .IQ_CLK_PU(A40_IQ_CLK_PU), .IQ_CLK_PD(A40_IQ_CLK_PD), .IQ_CLK(A40_IQ_CLK__CORE), .RESETB_PU(A40_RESETB_PU), .RESETB_PD(A40_RESETB_PD), .RESETB(A40_RESETB__CORE), .REMOD_A_I_CS(A40_REMOD_A_I_CS), .REMOD_A_I_SL(A40_REMOD_A_I_SL), .REMOD_A_I_IE(A40_REMOD_A_I_IE), .REMOD_A_I_OE(A40_REMOD_A_I_OE), .REMOD_A_I_PU(A40_REMOD_A_I_PU), .REMOD_A_I_PD(A40_REMOD_A_I_PD), .REMOD_A_I_OUT(A40_REMOD_A_I_OUT), .REMOD_A_I_PDRV0(A40_REMOD_A_I_PDRV0), .REMOD_A_I_PDRV1(A40_REMOD_A_I_PDRV1), .REMOD_A_I_IN(A40_REMOD_A_I_IN), .REMOD_A_Q_CS(A40_REMOD_A_Q_CS), .REMOD_A_Q_SL(A40_REMOD_A_Q_SL), .REMOD_A_Q_IE(A40_REMOD_A_Q_IE), .REMOD_A_Q_OE(A40_REMOD_A_Q_OE), .REMOD_A_Q_PU(A40_REMOD_A_Q_PU), .REMOD_A_Q_PD(A40_REMOD_A_Q_PD), .REMOD_A_Q_OUT(A40_REMOD_A_Q_OUT), .REMOD_A_Q_PDRV0(A40_REMOD_A_Q_PDRV0), .REMOD_A_Q_PDRV1(A40_REMOD_A_Q_PDRV1), .REMOD_A_Q_IN(A40_REMOD_A_Q_IN), .PSRAM_SCK_CS(A40_PSRAM_SCK_CS), .PSRAM_SCK_SL(A40_PSRAM_SCK_SL), .PSRAM_SCK_IE(A40_PSRAM_SCK_IE), .PSRAM_SCK_OE(A40_PSRAM_SCK_OE), .PSRAM_SCK_PU(A40_PSRAM_SCK_PU), .PSRAM_SCK_PD(A40_PSRAM_SCK_PD), .PSRAM_SCK_OUT(A40_PSRAM_SCK_OUT), .PSRAM_SCK_IN(A40_PSRAM_SCK_IN), .PSRAM_CE_N_CS(A40_PSRAM_CE_N_CS), .PSRAM_CE_N_SL(A40_PSRAM_CE_N_SL), .PSRAM_CE_N_IE(A40_PSRAM_CE_N_IE), .PSRAM_CE_N_OE(A40_PSRAM_CE_N_OE), .PSRAM_CE_N_PU(A40_PSRAM_CE_N_PU), .PSRAM_CE_N_PD(A40_PSRAM_CE_N_PD), .PSRAM_CE_N_OUT(A40_PSRAM_CE_N_OUT), .PSRAM_CE_N_PDRV0(A40_PSRAM_CE_N_PDRV0), .PSRAM_CE_N_PDRV1(A40_PSRAM_CE_N_PDRV1), .PSRAM_CE_N_IN(A40_PSRAM_CE_N_IN), .PSRAM_SIO_0_CS(A40_PSRAM_SIO_0_CS), .PSRAM_SIO_0_SL(A40_PSRAM_SIO_0_SL), .PSRAM_SIO_0_IE(A40_PSRAM_SIO_0_IE), .PSRAM_SIO_0_OE(A40_PSRAM_SIO_0_OE), .PSRAM_SIO_0_PU(A40_PSRAM_SIO_0_PU), .PSRAM_SIO_0_PD(A40_PSRAM_SIO_0_PD), .PSRAM_SIO_0_OUT(A40_PSRAM_SIO_0_OUT), .PSRAM_SIO_0_PDRV0(A40_PSRAM_SIO_0_PDRV0), .PSRAM_SIO_0_PDRV1(A40_PSRAM_SIO_0_PDRV1), .PSRAM_SIO_0_IN(A40_PSRAM_SIO_0_IN), .PSRAM_SIO_1_CS(A40_PSRAM_SIO_1_CS), .PSRAM_SIO_1_SL(A40_PSRAM_SIO_1_SL), .PSRAM_SIO_1_IE(A40_PSRAM_SIO_1_IE), .PSRAM_SIO_1_OE(A40_PSRAM_SIO_1_OE), .PSRAM_SIO_1_PU(A40_PSRAM_SIO_1_PU), .PSRAM_SIO_1_PD(A40_PSRAM_SIO_1_PD), .PSRAM_SIO_1_OUT(A40_PSRAM_SIO_1_OUT), .PSRAM_SIO_1_PDRV0(A40_PSRAM_SIO_1_PDRV0), .PSRAM_SIO_1_PDRV1(A40_PSRAM_SIO_1_PDRV1), .PSRAM_SIO_1_IN(A40_PSRAM_SIO_1_IN), .PSRAM_SIO_2_CS(A40_PSRAM_SIO_2_CS), .PSRAM_SIO_2_SL(A40_PSRAM_SIO_2_SL), .PSRAM_SIO_2_IE(A40_PSRAM_SIO_2_IE), .PSRAM_SIO_2_OE(A40_PSRAM_SIO_2_OE), .PSRAM_SIO_2_PU(A40_PSRAM_SIO_2_PU), .PSRAM_SIO_2_PD(A40_PSRAM_SIO_2_PD), .PSRAM_SIO_2_OUT(A40_PSRAM_SIO_2_OUT), .PSRAM_SIO_2_PDRV0(A40_PSRAM_SIO_2_PDRV0), .PSRAM_SIO_2_PDRV1(A40_PSRAM_SIO_2_PDRV1), .PSRAM_SIO_2_IN(A40_PSRAM_SIO_2_IN), .PSRAM_SIO_3_CS(A40_PSRAM_SIO_3_CS), .PSRAM_SIO_3_SL(A40_PSRAM_SIO_3_SL), .PSRAM_SIO_3_IE(A40_PSRAM_SIO_3_IE), .PSRAM_SIO_3_OE(A40_PSRAM_SIO_3_OE), .PSRAM_SIO_3_PU(A40_PSRAM_SIO_3_PU), .PSRAM_SIO_3_PD(A40_PSRAM_SIO_3_PD), .PSRAM_SIO_3_OUT(A40_PSRAM_SIO_3_OUT), .PSRAM_SIO_3_PDRV0(A40_PSRAM_SIO_3_PDRV0), .PSRAM_SIO_3_PDRV1(A40_PSRAM_SIO_3_PDRV1), .PSRAM_SIO_3_IN(A40_PSRAM_SIO_3_IN), .HOST_CS_PU(A40_HOST_CS_PU), .HOST_CS_PD(A40_HOST_CS_PD), .HOST_CS(A40_HOST_CS__CORE), .SPI_SCK_PU(A40_SPI_SCK_PU), .SPI_SCK_PD(A40_SPI_SCK_PD), .SPI_SCK(A40_SPI_SCK__CORE), .SPI_MOSI_PU(A40_SPI_MOSI_PU), .SPI_MOSI_PD(A40_SPI_MOSI_PD), .SPI_MOSI(A40_SPI_MOSI__CORE), .SPI_MISO_CS(A40_SPI_MISO_CS), .SPI_MISO_SL(A40_SPI_MISO_SL), .SPI_MISO_IE(A40_SPI_MISO_IE), .SPI_MISO_OE(A40_SPI_MISO_OE), .SPI_MISO_PU(A40_SPI_MISO_PU), .SPI_MISO_PD(A40_SPI_MISO_PD), .SPI_MISO_OUT(A40_SPI_MISO_OUT), .SPI_MISO_PDRV0(A40_SPI_MISO_PDRV0), .SPI_MISO_PDRV1(A40_SPI_MISO_PDRV1), .SPI_MISO_IN(A40_SPI_MISO_IN), .IRQ_OUT_CS(A40_IRQ_OUT_CS), .IRQ_OUT_SL(A40_IRQ_OUT_SL), .IRQ_OUT_IE(A40_IRQ_OUT_IE), .IRQ_OUT_OE(A40_IRQ_OUT_OE), .IRQ_OUT_PU(A40_IRQ_OUT_PU), .IRQ_OUT_PD(A40_IRQ_OUT_PD), .IRQ_OUT_OUT(A40_IRQ_OUT_OUT), .IRQ_OUT_PDRV0(A40_IRQ_OUT_PDRV0), .IRQ_OUT_PDRV1(A40_IRQ_OUT_PDRV1), .IRQ_OUT_IN(A40_IRQ_OUT_IN), .VDD(A40_VDD));
  A09_BV A09_PROJECT (.VSS(A09_VSS), .VDD(A09_VDD), .clk_PU(A09_clk_PU), .clk_PD(A09_clk_PD), .clk(A09_clk__CORE), .rst_n_PU(A09_rst_n_PU), .rst_n_PD(A09_rst_n_PD), .rst_n(A09_rst_n__CORE), .uart_rx_PU(A09_uart_rx_PU), .uart_rx_PD(A09_uart_rx_PD), .uart_rx(A09_uart_rx__CORE), .uart_tx_CS(A09_uart_tx_CS), .uart_tx_SL(A09_uart_tx_SL), .uart_tx_IE(A09_uart_tx_IE), .uart_tx_OE(A09_uart_tx_OE), .uart_tx_PU(A09_uart_tx_PU), .uart_tx_PD(A09_uart_tx_PD), .uart_tx_OUT(A09_uart_tx_OUT), .uart_tx_PDRV0(A09_uart_tx_PDRV0), .uart_tx_PDRV1(A09_uart_tx_PDRV1), .uart_tx_IN(A09_uart_tx_IN), .qspi_csn_CS[0](A09_qspi_csn_CS[0]), .qspi_csn_SL[0](A09_qspi_csn_SL[0]), .qspi_csn_IE[0](A09_qspi_csn_IE[0]), .qspi_csn_OE[0](A09_qspi_csn_OE[0]), .qspi_csn_PU[0](A09_qspi_csn_PU[0]), .qspi_csn_PD[0](A09_qspi_csn_PD[0]), .qspi_csn_OUT[0](A09_qspi_csn_OUT[0]), .qspi_csn_PDRV0[0](A09_qspi_csn_PDRV0[0]), .qspi_csn_PDRV1[0](A09_qspi_csn_PDRV1[0]), .qspi_csn_IN[0](A09_qspi_csn_IN[0]), .qspi_csn_CS[1](A09_qspi_csn_CS[1]), .qspi_csn_SL[1](A09_qspi_csn_SL[1]), .qspi_csn_IE[1](A09_qspi_csn_IE[1]), .qspi_csn_OE[1](A09_qspi_csn_OE[1]), .qspi_csn_PU[1](A09_qspi_csn_PU[1]), .qspi_csn_PD[1](A09_qspi_csn_PD[1]), .qspi_csn_OUT[1](A09_qspi_csn_OUT[1]), .qspi_csn_PDRV0[1](A09_qspi_csn_PDRV0[1]), .qspi_csn_PDRV1[1](A09_qspi_csn_PDRV1[1]), .qspi_csn_IN[1](A09_qspi_csn_IN[1]), .qspi_sck_CS(A09_qspi_sck_CS), .qspi_sck_SL(A09_qspi_sck_SL), .qspi_sck_IE(A09_qspi_sck_IE), .qspi_sck_OE(A09_qspi_sck_OE), .qspi_sck_PU(A09_qspi_sck_PU), .qspi_sck_PD(A09_qspi_sck_PD), .qspi_sck_OUT(A09_qspi_sck_OUT), .qspi_sck_PDRV0(A09_qspi_sck_PDRV0), .qspi_sck_PDRV1(A09_qspi_sck_PDRV1), .qspi_sck_IN(A09_qspi_sck_IN), .qspi_io_CS[0](A09_qspi_io_CS[0]), .qspi_io_SL[0](A09_qspi_io_SL[0]), .qspi_io_IE[0](A09_qspi_io_IE[0]), .qspi_io_OE[0](A09_qspi_io_OE[0]), .qspi_io_PU[0](A09_qspi_io_PU[0]), .qspi_io_PD[0](A09_qspi_io_PD[0]), .qspi_io_OUT[0](A09_qspi_io_OUT[0]), .qspi_io_PDRV0[0](A09_qspi_io_PDRV0[0]), .qspi_io_PDRV1[0](A09_qspi_io_PDRV1[0]), .qspi_io_IN[0](A09_qspi_io_IN[0]), .qspi_io_CS[1](A09_qspi_io_CS[1]), .qspi_io_SL[1](A09_qspi_io_SL[1]), .qspi_io_IE[1](A09_qspi_io_IE[1]), .qspi_io_OE[1](A09_qspi_io_OE[1]), .qspi_io_PU[1](A09_qspi_io_PU[1]), .qspi_io_PD[1](A09_qspi_io_PD[1]), .qspi_io_OUT[1](A09_qspi_io_OUT[1]), .qspi_io_PDRV0[1](A09_qspi_io_PDRV0[1]), .qspi_io_PDRV1[1](A09_qspi_io_PDRV1[1]), .qspi_io_IN[1](A09_qspi_io_IN[1]), .qspi_io_CS[2](A09_qspi_io_CS[2]), .qspi_io_SL[2](A09_qspi_io_SL[2]), .qspi_io_IE[2](A09_qspi_io_IE[2]), .qspi_io_OE[2](A09_qspi_io_OE[2]), .qspi_io_PU[2](A09_qspi_io_PU[2]), .qspi_io_PD[2](A09_qspi_io_PD[2]), .qspi_io_OUT[2](A09_qspi_io_OUT[2]), .qspi_io_PDRV0[2](A09_qspi_io_PDRV0[2]), .qspi_io_PDRV1[2](A09_qspi_io_PDRV1[2]), .qspi_io_IN[2](A09_qspi_io_IN[2]), .qspi_io_CS[3](A09_qspi_io_CS[3]), .qspi_io_SL[3](A09_qspi_io_SL[3]), .qspi_io_IE[3](A09_qspi_io_IE[3]), .qspi_io_OE[3](A09_qspi_io_OE[3]), .qspi_io_PU[3](A09_qspi_io_PU[3]), .qspi_io_PD[3](A09_qspi_io_PD[3]), .qspi_io_OUT[3](A09_qspi_io_OUT[3]), .qspi_io_PDRV0[3](A09_qspi_io_PDRV0[3]), .qspi_io_PDRV1[3](A09_qspi_io_PDRV1[3]), .qspi_io_IN[3](A09_qspi_io_IN[3]));
  A30_qspi_chip_top A30_PROJECT (.VSS(A30_VSS), .reset_PU(A30_reset_PU), .reset_PD(A30_reset_PD), .reset(A30_reset__CORE), .clk_PU(A30_clk_PU), .clk_PD(A30_clk_PD), .clk(A30_clk__CORE), .uart_rx_CS(A30_uart_rx_CS), .uart_rx_SL(A30_uart_rx_SL), .uart_rx_IE(A30_uart_rx_IE), .uart_rx_OE(A30_uart_rx_OE), .uart_rx_PU(A30_uart_rx_PU), .uart_rx_PD(A30_uart_rx_PD), .uart_rx_OUT(A30_uart_rx_OUT), .uart_rx_PDRV0(A30_uart_rx_PDRV0), .uart_rx_PDRV1(A30_uart_rx_PDRV1), .uart_rx_IN(A30_uart_rx_IN), .spi_miso_CS(A30_spi_miso_CS), .spi_miso_SL(A30_spi_miso_SL), .spi_miso_IE(A30_spi_miso_IE), .spi_miso_OE(A30_spi_miso_OE), .spi_miso_PU(A30_spi_miso_PU), .spi_miso_PD(A30_spi_miso_PD), .spi_miso_OUT(A30_spi_miso_OUT), .spi_miso_PDRV0(A30_spi_miso_PDRV0), .spi_miso_PDRV1(A30_spi_miso_PDRV1), .spi_miso_IN(A30_spi_miso_IN), .spi_data0_CS(A30_spi_data0_CS), .spi_data0_SL(A30_spi_data0_SL), .spi_data0_IE(A30_spi_data0_IE), .spi_data0_OE(A30_spi_data0_OE), .spi_data0_PU(A30_spi_data0_PU), .spi_data0_PD(A30_spi_data0_PD), .spi_data0_OUT(A30_spi_data0_OUT), .spi_data0_IN(A30_spi_data0_IN), .spi_data1_CS(A30_spi_data1_CS), .spi_data1_SL(A30_spi_data1_SL), .spi_data1_IE(A30_spi_data1_IE), .spi_data1_OE(A30_spi_data1_OE), .spi_data1_PU(A30_spi_data1_PU), .spi_data1_PD(A30_spi_data1_PD), .spi_data1_OUT(A30_spi_data1_OUT), .spi_data1_IN(A30_spi_data1_IN), .spi_data2_CS(A30_spi_data2_CS), .spi_data2_SL(A30_spi_data2_SL), .spi_data2_IE(A30_spi_data2_IE), .spi_data2_OE(A30_spi_data2_OE), .spi_data2_PU(A30_spi_data2_PU), .spi_data2_PD(A30_spi_data2_PD), .spi_data2_OUT(A30_spi_data2_OUT), .spi_data2_IN(A30_spi_data2_IN), .spi_data3_CS(A30_spi_data3_CS), .spi_data3_SL(A30_spi_data3_SL), .spi_data3_IE(A30_spi_data3_IE), .spi_data3_OE(A30_spi_data3_OE), .spi_data3_PU(A30_spi_data3_PU), .spi_data3_PD(A30_spi_data3_PD), .spi_data3_OUT(A30_spi_data3_OUT), .spi_data3_IN(A30_spi_data3_IN), .spi_clk_out_CS(A30_spi_clk_out_CS), .spi_clk_out_SL(A30_spi_clk_out_SL), .spi_clk_out_IE(A30_spi_clk_out_IE), .spi_clk_out_OE(A30_spi_clk_out_OE), .spi_clk_out_PU(A30_spi_clk_out_PU), .spi_clk_out_PD(A30_spi_clk_out_PD), .spi_clk_out_OUT(A30_spi_clk_out_OUT), .spi_clk_out_IN(A30_spi_clk_out_IN), .spi_flash_select_CS(A30_spi_flash_select_CS), .spi_flash_select_SL(A30_spi_flash_select_SL), .spi_flash_select_IE(A30_spi_flash_select_IE), .spi_flash_select_OE(A30_spi_flash_select_OE), .spi_flash_select_PU(A30_spi_flash_select_PU), .spi_flash_select_PD(A30_spi_flash_select_PD), .spi_flash_select_OUT(A30_spi_flash_select_OUT), .spi_flash_select_IN(A30_spi_flash_select_IN), .spi_ram_a_select_CS(A30_spi_ram_a_select_CS), .spi_ram_a_select_SL(A30_spi_ram_a_select_SL), .spi_ram_a_select_IE(A30_spi_ram_a_select_IE), .spi_ram_a_select_OE(A30_spi_ram_a_select_OE), .spi_ram_a_select_PU(A30_spi_ram_a_select_PU), .spi_ram_a_select_PD(A30_spi_ram_a_select_PD), .spi_ram_a_select_OUT(A30_spi_ram_a_select_OUT), .spi_ram_a_select_IN(A30_spi_ram_a_select_IN), .uart_tx_CS(A30_uart_tx_CS), .uart_tx_SL(A30_uart_tx_SL), .uart_tx_IE(A30_uart_tx_IE), .uart_tx_OE(A30_uart_tx_OE), .uart_tx_PU(A30_uart_tx_PU), .uart_tx_PD(A30_uart_tx_PD), .uart_tx_OUT(A30_uart_tx_OUT), .uart_tx_IN(A30_uart_tx_IN), .spi_select_CS(A30_spi_select_CS), .spi_select_SL(A30_spi_select_SL), .spi_select_IE(A30_spi_select_IE), .spi_select_OE(A30_spi_select_OE), .spi_select_PU(A30_spi_select_PU), .spi_select_PD(A30_spi_select_PD), .spi_select_OUT(A30_spi_select_OUT), .spi_select_IN(A30_spi_select_IN), .disp_spi_clk_out_CS(A30_disp_spi_clk_out_CS), .disp_spi_clk_out_SL(A30_disp_spi_clk_out_SL), .disp_spi_clk_out_IE(A30_disp_spi_clk_out_IE), .disp_spi_clk_out_OE(A30_disp_spi_clk_out_OE), .disp_spi_clk_out_PU(A30_disp_spi_clk_out_PU), .disp_spi_clk_out_PD(A30_disp_spi_clk_out_PD), .disp_spi_clk_out_OUT(A30_disp_spi_clk_out_OUT), .disp_spi_clk_out_IN(A30_disp_spi_clk_out_IN), .spi_mosi_CS(A30_spi_mosi_CS), .spi_mosi_SL(A30_spi_mosi_SL), .spi_mosi_IE(A30_spi_mosi_IE), .spi_mosi_OE(A30_spi_mosi_OE), .spi_mosi_PU(A30_spi_mosi_PU), .spi_mosi_PD(A30_spi_mosi_PD), .spi_mosi_OUT(A30_spi_mosi_OUT), .spi_mosi_IN(A30_spi_mosi_IN), .spi_dc_CS(A30_spi_dc_CS), .spi_dc_SL(A30_spi_dc_SL), .spi_dc_IE(A30_spi_dc_IE), .spi_dc_OE(A30_spi_dc_OE), .spi_dc_PU(A30_spi_dc_PU), .spi_dc_PD(A30_spi_dc_PD), .spi_dc_OUT(A30_spi_dc_OUT), .spi_dc_IN(A30_spi_dc_IN), .VDD(A30_VDD));
  B18_Probton B18_PROJECT (.VSS(B18_VSS), .rst_n_PU(B18_rst_n_PU), .rst_n_PD(B18_rst_n_PD), .rst_n(B18_rst_n__CORE), .spi_cs_n_PU(B18_spi_cs_n_PU), .spi_cs_n_PD(B18_spi_cs_n_PD), .spi_cs_n(B18_spi_cs_n__CORE), .spi_sclk_PU(B18_spi_sclk_PU), .spi_sclk_PD(B18_spi_sclk_PD), .spi_sclk(B18_spi_sclk__CORE), .spi_mosi_PU(B18_spi_mosi_PU), .spi_mosi_PD(B18_spi_mosi_PD), .spi_mosi(B18_spi_mosi__CORE), .spi_miso_CS(B18_spi_miso_CS), .spi_miso_SL(B18_spi_miso_SL), .spi_miso_IE(B18_spi_miso_IE), .spi_miso_oe(B18_spi_miso_oe), .spi_miso_PU(B18_spi_miso_PU), .spi_miso_PD(B18_spi_miso_PD), .spi_miso_OUT(B18_spi_miso_OUT), .spi_miso_PDRV0(B18_spi_miso_PDRV0), .spi_miso_PDRV1(B18_spi_miso_PDRV1), .spi_miso_IN(B18_spi_miso_IN), .clk_PU(B18_clk_PU), .clk_PD(B18_clk_PD), .clk(B18_clk__CORE), .move_en_x_CS(B18_move_en_x_CS), .move_en_x_SL(B18_move_en_x_SL), .move_en_x_IE(B18_move_en_x_IE), .move_en_x_OE(B18_move_en_x_OE), .move_en_x_PU(B18_move_en_x_PU), .move_en_x_PD(B18_move_en_x_PD), .move_en_x_OUT(B18_move_en_x_OUT), .move_en_x_PDRV0(B18_move_en_x_PDRV0), .move_en_x_PDRV1(B18_move_en_x_PDRV1), .move_en_x_IN(B18_move_en_x_IN), .dir_x_CS(B18_dir_x_CS), .dir_x_SL(B18_dir_x_SL), .dir_x_IE(B18_dir_x_IE), .dir_x_OE(B18_dir_x_OE), .dir_x_PU(B18_dir_x_PU), .dir_x_PD(B18_dir_x_PD), .dir_x_OUT(B18_dir_x_OUT), .dir_x_PDRV0(B18_dir_x_PDRV0), .dir_x_PDRV1(B18_dir_x_PDRV1), .dir_x_IN(B18_dir_x_IN), .ref_wave_x_CS(B18_ref_wave_x_CS), .ref_wave_x_SL(B18_ref_wave_x_SL), .ref_wave_x_IE(B18_ref_wave_x_IE), .ref_wave_x_OE(B18_ref_wave_x_OE), .ref_wave_x_PU(B18_ref_wave_x_PU), .ref_wave_x_PD(B18_ref_wave_x_PD), .ref_wave_x_OUT(B18_ref_wave_x_OUT), .ref_wave_x_PDRV0(B18_ref_wave_x_PDRV0), .ref_wave_x_PDRV1(B18_ref_wave_x_PDRV1), .ref_wave_x_IN(B18_ref_wave_x_IN), .mems_drv_x_CS(B18_mems_drv_x_CS), .mems_drv_x_SL(B18_mems_drv_x_SL), .mems_drv_x_IE(B18_mems_drv_x_IE), .mems_drv_x_OE(B18_mems_drv_x_OE), .mems_drv_x_PU(B18_mems_drv_x_PU), .mems_drv_x_PD(B18_mems_drv_x_PD), .mems_drv_x_OUT(B18_mems_drv_x_OUT), .mems_drv_x_PDRV0(B18_mems_drv_x_PDRV0), .mems_drv_x_PDRV1(B18_mems_drv_x_PDRV1), .mems_drv_x_IN(B18_mems_drv_x_IN), .mems_drv_y_CS(B18_mems_drv_y_CS), .mems_drv_y_SL(B18_mems_drv_y_SL), .mems_drv_y_IE(B18_mems_drv_y_IE), .mems_drv_y_OE(B18_mems_drv_y_OE), .mems_drv_y_PU(B18_mems_drv_y_PU), .mems_drv_y_PD(B18_mems_drv_y_PD), .mems_drv_y_OUT(B18_mems_drv_y_OUT), .mems_drv_y_PDRV0(B18_mems_drv_y_PDRV0), .mems_drv_y_PDRV1(B18_mems_drv_y_PDRV1), .mems_drv_y_IN(B18_mems_drv_y_IN), .ref_wave_y_CS(B18_ref_wave_y_CS), .ref_wave_y_SL(B18_ref_wave_y_SL), .ref_wave_y_IE(B18_ref_wave_y_IE), .ref_wave_y_OE(B18_ref_wave_y_OE), .ref_wave_y_PU(B18_ref_wave_y_PU), .ref_wave_y_PD(B18_ref_wave_y_PD), .ref_wave_y_OUT(B18_ref_wave_y_OUT), .ref_wave_y_PDRV0(B18_ref_wave_y_PDRV0), .ref_wave_y_PDRV1(B18_ref_wave_y_PDRV1), .ref_wave_y_IN(B18_ref_wave_y_IN), .dir_y_CS(B18_dir_y_CS), .dir_y_SL(B18_dir_y_SL), .dir_y_IE(B18_dir_y_IE), .dir_y_OE(B18_dir_y_OE), .dir_y_PU(B18_dir_y_PU), .dir_y_PD(B18_dir_y_PD), .dir_y_OUT(B18_dir_y_OUT), .dir_y_PDRV0(B18_dir_y_PDRV0), .dir_y_PDRV1(B18_dir_y_PDRV1), .dir_y_IN(B18_dir_y_IN), .move_en_y_CS(B18_move_en_y_CS), .move_en_y_SL(B18_move_en_y_SL), .move_en_y_IE(B18_move_en_y_IE), .move_en_y_OE(B18_move_en_y_OE), .move_en_y_PU(B18_move_en_y_PU), .move_en_y_PD(B18_move_en_y_PD), .move_en_y_OUT(B18_move_en_y_OUT), .move_en_y_PDRV0(B18_move_en_y_PDRV0), .move_en_y_PDRV1(B18_move_en_y_PDRV1), .move_en_y_IN(B18_move_en_y_IN), .comp_x_PU(B18_comp_x_PU), .comp_x_PD(B18_comp_x_PD), .comp_x(B18_comp_x__CORE), .read_en_CS(B18_read_en_CS), .read_en_SL(B18_read_en_SL), .read_en_IE(B18_read_en_IE), .read_en_OE(B18_read_en_OE), .read_en_PU(B18_read_en_PU), .read_en_PD(B18_read_en_PD), .read_en_OUT(B18_read_en_OUT), .read_en_PDRV0(B18_read_en_PDRV0), .read_en_PDRV1(B18_read_en_PDRV1), .read_en_IN(B18_read_en_IN), .comp_y_PU(B18_comp_y_PU), .comp_y_PD(B18_comp_y_PD), .comp_y(B18_comp_y__CORE), .VDD(B18_VDD));
endmodule
