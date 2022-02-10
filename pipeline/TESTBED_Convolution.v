/////////////////////////////////////////////////////////////////////////
// Project Name: Conv_2x2						   					   //
// Task Name   : Conv_2x2								  			   //
// Module Name : Conv_2x2                               	  		   //
// File Name   : TESTBED.v          TESTBED                	  		   //
// Description : Convolution			                               //
// Author      : Lu Wei		 		                                   //
// Revision History:                                                   //
/////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
`include "PATTERN_Convolution.v"


`ifdef RTL
  `include "Convolution_with_pipeline.v"
`endif

`ifdef GATE
  `include "Netlist/Convolution_with_pipeline_SYN.v"
`endif


module TESTBED;
   //input
	wire clk;
	wire rst_n;
	wire in_valid;  
	wire [7:0]In_IFM_1;
	wire [7:0]In_IFM_2;
	wire [7:0]In_IFM_3;
	wire [7:0]In_IFM_4;
	wire [7:0]In_IFM_5;	
	wire [7:0]In_IFM_6;	
	wire [7:0]In_IFM_7;	
	wire [7:0]In_IFM_8;	
	wire [7:0]In_IFM_9;	
	wire [7:0]In_Weight_1;
 	wire [7:0]In_Weight_2;
	wire [7:0]In_Weight_3;	
	wire [7:0]In_Weight_4;
	wire [7:0]In_Weight_5;
	wire [7:0]In_Weight_6;
	wire [7:0]In_Weight_7;
	wire [7:0]In_Weight_8;
	wire [7:0]In_Weight_9;
 
	//output
	wire out_valid;
	wire [20:0] Out_OFM;

	
	
initial begin
  `ifdef RTL
    $fsdbDumpfile("Convolution.fsdb");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("Netlist/Convolution_with_pipeline_SYN.sdf",u_Convolution_with_pipeline);
    $fsdbDumpfile("Convolution_SYN.fsdb");
    $fsdbDumpvars();    
  `endif
end

`ifdef RTL	
Convolution_with_pipeline	u_Convolution_with_pipeline	(
		.clk(clk),
		.rst_n(rst_n),	
		.in_valid(in_valid),	
		.In_IFM_1(In_IFM_1),
		.In_IFM_2(In_IFM_2),
		.In_IFM_3(In_IFM_3),
		.In_IFM_4(In_IFM_4),
		.In_IFM_5(In_IFM_5),
		.In_IFM_6(In_IFM_6),
		.In_IFM_7(In_IFM_7),
		.In_IFM_8(In_IFM_8),
		.In_IFM_9(In_IFM_9),
		.In_Weight_1(In_Weight_1),
		.In_Weight_2(In_Weight_2),		
		.In_Weight_3(In_Weight_3),		
		.In_Weight_4(In_Weight_4),
		.In_Weight_5(In_Weight_5),
		.In_Weight_6(In_Weight_6),
		.In_Weight_7(In_Weight_7),
		.In_Weight_8(In_Weight_8),
		.In_Weight_9(In_Weight_9),
		.out_valid(out_valid), 
		.Out_OFM(Out_OFM)
		);
`endif

`ifdef GATE
Convolution_with_pipeline	u_Convolution_with_pipeline	(
		.clk(clk),
		.rst_n(rst_n),	
		.in_valid(in_valid),	
		.In_IFM_1(In_IFM_1),
		.In_IFM_2(In_IFM_2),
		.In_IFM_3(In_IFM_3),
		.In_IFM_4(In_IFM_4),
		.In_IFM_5(In_IFM_5),
		.In_IFM_6(In_IFM_6),
		.In_IFM_7(In_IFM_7),
		.In_IFM_8(In_IFM_8),
		.In_IFM_9(In_IFM_9),
		.In_Weight_1(In_Weight_1),
		.In_Weight_2(In_Weight_2),		
		.In_Weight_3(In_Weight_3),		
		.In_Weight_4(In_Weight_4),
		.In_Weight_5(In_Weight_5),
		.In_Weight_6(In_Weight_6),
		.In_Weight_7(In_Weight_7),
		.In_Weight_8(In_Weight_8),
		.In_Weight_9(In_Weight_9),
		.out_valid(out_valid), 
		.Out_OFM(Out_OFM)
		);
`endif

PATTERN_example	u_PATTERN_example(
		.clk(clk),
		.rst_n(rst_n),	
		.in_valid(in_valid),	
		.In_IFM_1(In_IFM_1),
		.In_IFM_2(In_IFM_2),
		.In_IFM_3(In_IFM_3),
		.In_IFM_4(In_IFM_4),
		.In_IFM_5(In_IFM_5),
		.In_IFM_6(In_IFM_6),
		.In_IFM_7(In_IFM_7),
		.In_IFM_8(In_IFM_8),
		.In_IFM_9(In_IFM_9),
		.In_Weight_1(In_Weight_1),
		.In_Weight_2(In_Weight_2),		
		.In_Weight_3(In_Weight_3),		
		.In_Weight_4(In_Weight_4),
		.In_Weight_5(In_Weight_5),
		.In_Weight_6(In_Weight_6),
		.In_Weight_7(In_Weight_7),
		.In_Weight_8(In_Weight_8),
		.In_Weight_9(In_Weight_9),
		.out_valid(out_valid), 
		.Out_OFM(Out_OFM)
		);
		
endmodule