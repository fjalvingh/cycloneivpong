/*
 Copyright (C) 2020  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and any partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel FPGA IP License Agreement, or other applicable license
 agreement, including, without limitation, that your use is for
 the sole purpose of programming logic devices manufactured by
 Intel and sold by Intel or its authorized distributors.  Please
 refer to the applicable agreement for further details, at
 https://fpgasoftware.intel.com/eula.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Fast Corner delays for the design using part EP4CE6E22C8
 with speed grade M, core voltage 1.2V, and temperature 0 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "vga";
DATE "11/07/2021 18:47:41";
PROGRAM "Quartus Prime";



INPUT altera_reserved_tdi;
INPUT altera_reserved_tck;
INPUT altera_reserved_tms;
INPUT configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DATA0;
INPUT clk;
INPUT rst;
INPUT swb;
INPUT swa;
INPUT swc;
INPUT swd;
OUTPUT configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DCLK;
OUTPUT configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_SCE;
OUTPUT configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_SDO;
OUTPUT hsync;
OUTPUT vsync;
OUTPUT vga_r;
OUTPUT vga_g;
OUTPUT vga_b;
OUTPUT hsync_dbg;
OUTPUT vsync_dbg;
OUTPUT ballhit;
OUTPUT paddlehit;
OUTPUT xdir;
OUTPUT altera_reserved_tdo;

/*Arc definitions start here*/
pos_altera_reserved_tdi__altera_reserved_tck__setup:		SETUP (POSEDGE) altera_reserved_tdi altera_reserved_tck ;
pos_altera_reserved_tms__altera_reserved_tck__setup:		SETUP (POSEDGE) altera_reserved_tms altera_reserved_tck ;
pos_configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DATA0__altera_reserved_tck__setup:		SETUP (POSEDGE) configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DATA0 altera_reserved_tck ;
pos_altera_reserved_tdi__altera_reserved_tck__hold:		HOLD (POSEDGE) altera_reserved_tdi altera_reserved_tck ;
pos_altera_reserved_tms__altera_reserved_tck__hold:		HOLD (POSEDGE) altera_reserved_tms altera_reserved_tck ;
pos_configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DATA0__altera_reserved_tck__hold:		HOLD (POSEDGE) configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DATA0 altera_reserved_tck ;
pos_altera_reserved_tck__altera_reserved_tdo__delay:		DELAY (POSEDGE) altera_reserved_tck altera_reserved_tdo ;
pos_altera_reserved_tck__configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DCLK__delay:		DELAY (POSEDGE) altera_reserved_tck configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DCLK ;
pos_altera_reserved_tck__configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DCLK__delay:		DELAY (POSEDGE) altera_reserved_tck configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_DCLK ;
pos_altera_reserved_tck__configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_SCE__delay:		DELAY (POSEDGE) altera_reserved_tck configloader:flashloader|altera_serial_flash_loader:serial_flash_loader_0|altserial_flash_loader:altserial_flash_loader_component|\GEN_ASMI_TYPE_1:asmi_inst~ALTERA_SCE ;
___4.008__delay:		DELAY  4.008 ;

ENDMODEL
