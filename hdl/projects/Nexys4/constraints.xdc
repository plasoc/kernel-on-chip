set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {gpio_input[0]}]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {gpio_input[1]}]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {gpio_input[2]}]
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports {gpio_input[3]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {gpio_input[4]}]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {gpio_input[5]}]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {gpio_input[6]}]
set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS33} [get_ports {gpio_input[7]}]
set_property -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS18} [get_ports {gpio_input[8]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS18} [get_ports {gpio_input[9]}]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {gpio_input[10]}]
set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVCMOS33} [get_ports {gpio_input[11]}]
set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports {gpio_input[12]}]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {gpio_input[13]}]
set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports {gpio_input[14]}]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {gpio_input[15]}]

set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {gpio_output[0]}]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {gpio_output[1]}]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {gpio_output[2]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {gpio_output[3]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {gpio_output[4]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {gpio_output[5]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {gpio_output[6]}]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {gpio_output[7]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {gpio_output[8]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {gpio_output[9]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {gpio_output[10]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {gpio_output[11]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {gpio_output[12]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {gpio_output[13]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {gpio_output[14]}]
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {gpio_output[15]}]

set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports uart_tx]

set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports sys_clk_i]
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports sys_rst]

create_clock -period 10.000 -name clock -waveform {0.000 5.000} -add [get_ports sys_clk_i]

create_clock -period 20.000 -name VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0 -waveform {0.000 10.000}
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0] -min -add_delay 2.000 [get_ports {gpio_input[*]}]
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0] -max -add_delay 2.000 [get_ports {gpio_input[*]}]
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0] -min -add_delay 2.000 [get_ports sys_rst]
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0] -max -add_delay 2.000 [get_ports sys_rst]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0] -min -add_delay 0.000 [get_ports {gpio_output[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0] -max -add_delay 0.000 [get_ports {gpio_output[*]}]

create_clock -period 104166.672 -name virtual_uart_baud_clock
set_input_delay -clock [get_clocks virtual_uart_baud_clock] -min -add_delay 2.000 [get_ports uart_rx]
set_input_delay -clock [get_clocks virtual_uart_baud_clock] -max -add_delay 2.000 [get_ports uart_rx]
set_output_delay -clock [get_clocks virtual_uart_baud_clock] -min -add_delay 2.000 [get_ports uart_tx]
set_output_delay -clock [get_clocks virtual_uart_baud_clock] -max -add_delay 2.000 [get_ports uart_tx]

set_false_path -from [get_clocks clk_pll_i] -to [get_clocks clk_pll_i_1]
set_false_path -from [get_clocks clk_pll_i_1] -to [get_clocks clk_pll_i]
set_false_path -from [get_clocks aclk_bd_clk_wiz_0_0_1] -to [get_clocks virtual_uart_baud_clock]
set_false_path -from [get_clocks aclk_bd_clk_wiz_0_0] -to [get_clocks virtual_uart_baud_clock]
set_false_path -from [get_clocks clk_ref_i_bd_clk_wiz_0_0] -to [get_clocks clk_ref_i_bd_clk_wiz_0_0_1]
set_false_path -from [get_clocks clk_ref_i_bd_clk_wiz_0_0_1] -to [get_clocks clk_ref_i_bd_clk_wiz_0_0]
set_false_path -from [get_clocks aclk_bd_clk_wiz_0] -to [get_clocks aclk_bd_clk_wiz_0_0_1]
set_false_path -from [get_clocks aclk_bd_clk_wiz_0_0_1] -to [get_clocks aclk_bd_clk_wiz_0_0]
set_false_path -from [get_clocks aclk_bd_clk_wiz_0_0] -to [get_clocks aclk_bd_clk_wiz_0_0_1]
set_false_path -from [get_clocks mmcm_clkout0] -to [get_clocks VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0]
set_false_path -from [get_clocks VIRTUAL_clk_out1_ip_block_design_clk_wiz_0_0] -to [get_clocks mmcm_clkout0]
set_false_path -from [get_clocks mmcm_clkout0] -to [get_clocks virtual_uart_baud_clock]
set_false_path -from [get_clocks oserdes_clk] -to [get_clocks oserdes_clkdiv]
set_false_path -from [get_clocks oserdes_clk_1] -to [get_clocks oserdes_clkdiv_1]
set_false_path -from [get_clocks oserdes_clk_2] -to [get_clocks oserdes_clkdiv_2]
set_false_path -from [get_clocks oserdes_clk_3] -to [get_clocks oserdes_clkdiv_3]
set_false_path -from [get_clocks oserdes_clk_5] -to [get_clocks oserdes_clkdiv_5]
set_false_path -from [get_clocks oserdes_clk_1] -to [get_clocks oserdes_clkdiv_5]
set_false_path -from [get_clocks oserdes_clk_5] -to [get_clocks oserdes_clk_1]
set_false_path -from [get_clocks oserdes_clk_5] -to [get_clocks oserdes_clkdiv_1]
set_false_path -from [get_clocks oserdes_clk_6] -to [get_clocks oserdes_clkdiv_6]
set_false_path -from [get_clocks oserdes_clk_6] -to [get_clocks oserdes_clk_2]
set_false_path -from [get_clocks oserdes_clk_6] -to [get_clocks oserdes_clkdiv_2]
set_false_path -from [get_clocks oserdes_clk_2] -to [get_clocks oserdes_clkdiv_6]
set_false_path -from [get_clocks oserdes_clk_2] -to [get_clocks oserdes_clkdiv_6]
set_false_path -from [get_clocks oserdes_clk_7] -to [get_clocks oserdes_clkdiv_7]
set_false_path -from [get_clocks oserdes_clk_3] -to [get_clocks oserdes_clkdiv_7]
set_false_path -from [get_clocks oserdes_clk_7] -to [get_clocks oserdes_clk_3]
set_false_path -from [get_clocks oserdes_clk_7] -to [get_clocks oserdes_clkdiv_3]
set_false_path -from [get_clocks oserdes_clk_4] -to [get_clocks oserdes_clkdiv_4]
set_false_path -from [get_clocks oserdes_clk_4] -to [get_clocks oserdes_clkdiv]
set_false_path -from [get_clocks oserdes_clk] -to [get_clocks oserdes_clkdiv_4]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#set_property strategy Performance_ExtraTimingOpt [get_runs impl_1]

#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets sys_clk_i_IBUF]

#set_property MARK_DEBUG true [get_nets uart_main_inst/uart_inst/tx_baud_tick_reg_n_0]
#set_property MARK_DEBUG true [get_nets {uart_main_inst/out_fifo[7]}]
#set_property MARK_DEBUG true [get_nets {uart_main_inst/out_fifo[5]}]
#set_property MARK_DEBUG true [get_nets {uart_main_inst/out_fifo[2]}]
#set_property MARK_DEBUG true [get_nets {uart_main_inst/out_fifo[0]}]
#set_property MARK_DEBUG true [get_nets {uart_main_inst/out_fifo[1]}]
#set_property MARK_DEBUG true [get_nets {uart_main_inst/out_fifo[3]}]
#set_property MARK_DEBUG true [get_nets {uart_main_inst/out_fifo[4]}]
#set_property MARK_DEBUG true [get_nets {uart_main_inst/out_fifo[6]}]
#create_clock -period 104166.672 -name uart_baud_clock -add [get_nets uart_main_inst/uart_inst/tx_baud_tick_reg_n_0]
#set_property MARK_DEBUG true [get_nets uart_main_inst/uart_inst/uart_tx_OBUF]
#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list gen_ext_mm.bd_wrapper_inst/bd_i/mig_7series_0/u_bd_mig_7series_0_0_mig/u_ddr2_infrastructure/ui_addn_clk_0]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 8 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {uart_main_inst/out_fifo[0]} {uart_main_inst/out_fifo[1]} {uart_main_inst/out_fifo[2]} {uart_main_inst/out_fifo[3]} {uart_main_inst/out_fifo[4]} {uart_main_inst/out_fifo[5]} {uart_main_inst/out_fifo[6]} {uart_main_inst/out_fifo[7]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 1 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list uart_main_inst/uart_inst/tx_baud_tick_reg_n_0]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 1 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list uart_tx_OBUF]]
#connect_debug_port u_ila_0/probe2 [get_nets [list uart_main_inst/uart_inst/uart_tx_OBUF]]

#set_property MARK_DEBUG true [get_nets uart_tx_OBUF]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets s_axi_aclk]
