###################################################################

# Created by write_sdc on Thu Nov 18 19:03:58 2021

###################################################################
set sdc_version 2.1

set_units -time ns -resistance 1.000000e+04kOhm -capacitance 1.000000e-04pF    \
-voltage V -current uA
set_load -pin_load 0.05 [get_ports out_valid]
set_load -pin_load 0.05 [get_ports {Out_OFM[20]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[19]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[18]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[17]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[16]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[15]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[14]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[13]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[12]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[11]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[10]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[9]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[8]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[7]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[6]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[5]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[4]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[3]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[2]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[1]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[0]}]
set_ideal_network -no_propagate  [get_ports clk]
create_clock [get_ports clk]  -period 400  -waveform {0 200}
set_input_delay -clock clk  0  [get_ports clk]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  200  [get_ports in_valid]
set_input_delay -clock clk  200  [get_ports {In_IFM_1[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_1[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_1[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_1[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_1[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_1[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_1[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_1[0]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_2[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_2[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_2[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_2[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_2[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_2[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_2[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_2[0]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_3[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_3[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_3[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_3[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_3[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_3[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_3[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_3[0]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_4[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_4[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_4[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_4[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_4[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_4[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_4[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_4[0]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_5[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_5[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_5[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_5[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_5[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_5[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_5[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_5[0]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_6[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_6[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_6[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_6[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_6[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_6[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_6[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_6[0]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_7[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_7[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_7[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_7[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_7[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_7[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_7[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_7[0]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_8[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_8[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_8[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_8[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_8[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_8[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_8[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_8[0]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_9[7]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_9[6]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_9[5]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_9[4]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_9[3]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_9[2]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_9[1]}]
set_input_delay -clock clk  200  [get_ports {In_IFM_9[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_1[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_1[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_1[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_1[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_1[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_1[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_1[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_1[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_2[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_2[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_2[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_2[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_2[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_2[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_2[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_2[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_3[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_3[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_3[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_3[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_3[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_3[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_3[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_3[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_4[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_4[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_4[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_4[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_4[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_4[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_4[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_4[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_5[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_5[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_5[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_5[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_5[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_5[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_5[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_5[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_6[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_6[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_6[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_6[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_6[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_6[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_6[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_6[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_7[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_7[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_7[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_7[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_7[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_7[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_7[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_7[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_8[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_8[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_8[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_8[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_8[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_8[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_8[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_8[0]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_9[7]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_9[6]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_9[5]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_9[4]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_9[3]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_9[2]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_9[1]}]
set_input_delay -clock clk  200  [get_ports {In_Weight_9[0]}]
set_output_delay -clock clk  200  [get_ports out_valid]
set_output_delay -clock clk  200  [get_ports {Out_OFM[20]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[19]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[18]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[17]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[16]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[15]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[14]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[13]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[12]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[11]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[10]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[9]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[8]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[7]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[6]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[5]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[4]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[3]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[2]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[1]}]
set_output_delay -clock clk  200  [get_ports {Out_OFM[0]}]
