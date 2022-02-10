//==============================================
//==============================================				
//	Author	:	Angelo Yu																		
//----------------------------------------------
//												
//	File Name		:	Conv_3x3.v					
//	Module Name		:	Con_3x3						
//	Release version	:	v1.0					
//												
//----------------------------------------------								
//----------------------------------------------											
//	Input	:	clk,
//				rst_n,
//              IFM,
//				Weights,					
//												
//	Output	:	OFM,
//				out_valid					
//==============================================
//==============================================
module Convolution_without_pipeline(
    //Input Port
    clk,
    rst_n,
	in_valid,
	In_IFM_1,
	In_IFM_2,
	In_IFM_3,
	In_IFM_4,
	In_IFM_5,
	In_IFM_6,
	In_IFM_7,
	In_IFM_8,
	In_IFM_9,
	In_Weight_1,
	In_Weight_2,
	In_Weight_3,
	In_Weight_4,
    In_Weight_5,
	In_Weight_6,
	In_Weight_7,
	In_Weight_8,
	In_Weight_9,
    //Output Port
    out_valid, 
	Out_OFM
    );

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input clk, rst_n;
input in_valid;
input[7:0]In_IFM_1;
input[7:0]In_IFM_2;
input[7:0]In_IFM_3;
input[7:0]In_IFM_4;
input[7:0]In_IFM_5;
input[7:0]In_IFM_6;
input[7:0]In_IFM_7;
input[7:0]In_IFM_8;
input[7:0]In_IFM_9;
input[7:0]In_Weight_1;
input[7:0]In_Weight_2;
input[7:0]In_Weight_3;
input[7:0]In_Weight_4;
input[7:0]In_Weight_5;
input[7:0]In_Weight_6;
input[7:0]In_Weight_7;
input[7:0]In_Weight_8;
input[7:0]In_Weight_9;
output reg out_valid;
output reg [20:0]Out_OFM;


//---------------------------------
//      Parameter declaration
//---------------------------------
parameter IDLE       = 2'd0;
parameter IN         = 2'd1;
parameter Cal        = 2'd2;
parameter Out        = 2'd3;

//---------------------------------
//      Reg declaration
//---------------------------------
reg [1:0]cstate;
reg [1:0]nstate;
reg [7:0]In_1;
reg [7:0]In_2;
reg [7:0]In_3;
reg [7:0]In_4;
reg [7:0]In_5;
reg [7:0]In_6;
reg [7:0]In_7;
reg [7:0]In_8;
reg [7:0]In_9;
reg [7:0]weigts1;
reg [7:0]weigts2;
reg [7:0]weigts3;
reg [7:0]weigts4;
reg [7:0]weigts5;
reg [7:0]weigts6;
reg [7:0]weigts7;
reg [7:0]weigts8;
reg [7:0]weigts9;
//reg [18:0]Adder;
wire [20:0]Adder;

//----------------------------------------------------
//          Finite-state machine (FSM)
//----------------------------------------------------
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cstate <= IDLE;
	else 
		cstate <= nstate;
end

always@(*)
begin
	case(cstate)
		IDLE:  
			if(in_valid==1)   
				nstate = IN;      
			else
				nstate = cstate;
		IN:
			nstate = Cal;
		Cal:  
			nstate = Out;         
		
		Out: 	                           
			nstate = IDLE;
		default
			nstate = cstate;
	endcase
end


//----------------------------------------------------
//          Receive Inputs from Pattern
//----------------------------------------------------

always@(posedge clk or negedge rst_n)  // receive IFM
begin
	if(!rst_n)
		begin
			In_1 <= 8'd0;
			In_2 <= 8'd0;
			In_3 <= 8'd0;
			In_4 <= 8'd0;
			In_5 <= 8'd0;
			In_6 <= 8'd0;
			In_7 <= 8'd0;
			In_8 <= 8'd0;
			In_9 <= 8'd0;
		end
	else if(in_valid == 1)
		begin
			In_1 <= In_IFM_1;
			In_2 <= In_IFM_2;	
			In_3 <= In_IFM_3;	
			In_4 <= In_IFM_4;
			In_5 <= In_IFM_5;
			In_6 <= In_IFM_6;	
			In_7 <= In_IFM_7;	
			In_8 <= In_IFM_8;	
			In_9 <= In_IFM_9;
		end	
	else if(cstate == IDLE)
		begin
			In_1 <= 8'd0;
			In_2 <= 8'd0;
			In_3 <= 8'd0;
			In_4 <= 8'd0;
			In_5 <= 8'd0;
			In_6 <= 8'd0;
			In_7 <= 8'd0;
			In_8 <= 8'd0;
			In_9 <= 8'd0;
		end
	else
		begin
			In_1 <= In_1;
			In_2 <= In_2;
			In_3 <= In_3;
			In_4 <= In_4;
			In_5 <= In_5;
			In_6 <= In_6;
			In_7 <= In_7;
			In_8 <= In_8;
			In_9 <= In_9;
		end
end

always@(posedge clk or negedge rst_n)  // receive weights
begin
	if(!rst_n)
		begin
			weigts1 <= 8'd0;
			weigts2 <= 8'd0;
			weigts3 <= 8'd0;
			weigts4 <= 8'd0;
			weigts5 <= 8'd0;
			weigts6 <= 8'd0;
			weigts7 <= 8'd0;
			weigts8 <= 8'd0;
			weigts9 <= 8'd0;
		end
	else if(in_valid == 1)
		begin
			weigts1 <= In_Weight_1;
			weigts2 <= In_Weight_2;	
			weigts3 <= In_Weight_3;	
			weigts4 <= In_Weight_4;
			weigts5 <= In_Weight_5;
			weigts6 <= In_Weight_6;	
			weigts7 <= In_Weight_7;	
			weigts8 <= In_Weight_8;
			weigts9 <= In_Weight_9;
		end
	else if(cstate == IDLE)
		begin
			weigts1 <= 8'd0;
			weigts2 <= 8'd0;
			weigts3 <= 8'd0;
			weigts4 <= 8'd0;
			weigts5 <= 8'd0;
			weigts6 <= 8'd0;
			weigts7 <= 8'd0;
			weigts8 <= 8'd0;
			weigts9 <= 8'd0;
		end	
	else
		begin
			weigts1 <= weigts1;
			weigts2 <= weigts2;
			weigts3 <= weigts3;
			weigts4 <= weigts4;
			weigts5 <= weigts5;
			weigts6 <= weigts6;
			weigts7 <= weigts7;
			weigts8 <= weigts8;
			weigts9 <= weigts9;
		end
end

//----------------------------------------------------
//          Convolution circuit (2x2)
//----------------------------------------------------

// Adder

/*always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		Adder <= 19'd0;
	else if(cstate == Cal)
		Adder <= (In_1 * weigts1) +  (In_2 * weigts2)+  (In_3 * weigts3)+  (In_4 * weigts4);
	else 
		Adder <= Adder;
end
*/
assign Adder = (In_1 * weigts1) +  (In_2 * weigts2)+  (In_3 * weigts3)+  (In_4 * weigts4)+  (In_5 * weigts5)+  (In_6 * weigts6)+  (In_7 * weigts7)+  (In_8 * weigts8)+  (In_9 * weigts9);
//----------------------------------------------------
//          Output the calculated data
//----------------------------------------------------
//output data
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		Out_OFM <= 21'd0;
	else if(cstate == Out)
		Out_OFM <= Adder;
	else 
		Out_OFM <= 21'd0;
end

//output valid
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		out_valid <= 1'd0;
	else if(cstate == Out)
		out_valid <= 1'd1;
	else 
		out_valid <= 1'd0;

end


endmodule