//==============================================
//==============================================				
//	Author	:	Yen-Chieh Yu																	
//----------------------------------------------
//												
//	File Name		:	Conv_3x3.v					
//	Module Name		:	Con_3x3_pipeline						
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
module Convolution_with_pipeline(
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
	Out_OFM,
	//for debugging
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
parameter IDLE      	= 3'd0;
parameter IN        	= 3'd1;
parameter stage_1       = 3'd2;
parameter stage_12		= 3'd3;
parameter stage_123		= 3'd4;
parameter stage_all		= 3'd5;
parameter stage_all_out	= 3'd6;

//---------------------------------
//      Reg declaration
//---------------------------------
//input stage
//reg [2:0]count_stage; //count four stage pipeline, then output ready
reg [2:0]cstate;
reg [2:0]nstate;
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
//First pipeline stage 
reg [20:0] pps1_1;
reg [20:0] pps1_2;
reg [20:0] pps1_3;
reg [20:0] pps1_4;
reg [20:0] pps1_5;
reg [20:0] pps1_6;
reg [20:0] pps1_7;
reg [20:0] pps1_8;
reg [20:0] pps1_9;
//Second pipeline stage
reg [20:0] pps2_1;
reg [20:0] pps2_2;
reg [20:0] pps2_3;
reg [20:0] pps2_4;
reg [20:0] pps2_5;
//Third pipeline stage
reg [20:0] pps3_1;
reg [20:0] pps3_2;
reg [20:0] pps3_3;
//Fourth pipeline stage
reg [20:0] pps4_1;
reg [20:0] pps4_2;
//Combinational Circuit
wire [20:0]MUL_1;
wire [20:0]MUL_2;
wire [20:0]MUL_3;
wire [20:0]MUL_4;
wire [20:0]MUL_5;
wire [20:0]MUL_6;
wire [20:0]MUL_7;
wire [20:0]MUL_8;
wire [20:0]MUL_9;
wire [20:0]Adder_11;
wire [20:0]Adder_12;
wire [20:0]Adder_13;
wire [20:0]Adder_14;
wire [20:0]Adder_21;
wire [20:0]Adder_22;
wire [20:0]Adder_3;
wire [20:0]Adder_4;


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
			nstate = stage_1;
		stage_1:  
			nstate = stage_12; 
		stage_12: 	                           
			nstate = stage_123;
		stage_123:
			nstate = stage_all;
		stage_all:
			nstate =  stage_all_out;
		stage_all_out:
			if(!rst_n)
				nstate = IDLE;
			else 
				nstate = stage_all_out;
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
//          Convolution circuit (3x3)
//----------------------------------------------------
assign MUL_1 = In_1 * weigts1;
assign MUL_2 = In_2 * weigts2;
assign MUL_3 = In_3 * weigts3;
assign MUL_4 = In_4 * weigts4;
assign MUL_5 = In_5 * weigts5;
assign MUL_6 = In_6 * weigts6;
assign MUL_7 = In_7 * weigts7;
assign MUL_8 = In_8 * weigts8;
assign MUL_9 = In_9 * weigts9;
assign Adder_11 = pps1_1 + pps1_2;
assign Adder_12 = pps1_3 + pps1_4;
assign Adder_13 = pps1_5 + pps1_6; 
assign Adder_14 = pps1_7 + pps1_8; 
assign Adder_21 = pps2_1 + pps2_2; 
assign Adder_22 = pps2_3 + pps2_4; 
assign Adder_3 = pps3_1 + pps3_2; 
assign Adder_4 = pps4_1 + pps4_2; 

//pipeline register store
always @(posedge clk or negedge rst_n) 
begin
	if(!rst_n)
		begin 
			pps1_1 <= 21'd0;
			pps1_2 <= 21'd0;
			pps1_3 <= 21'd0;
			pps1_4 <= 21'd0;
			pps1_5 <= 21'd0;
			pps1_6 <= 21'd0;
			pps1_7 <= 21'd0;
			pps1_8 <= 21'd0;
			pps1_9 = 21'd0;
			pps2_1 <= 21'd0;
			pps2_2 <= 21'd0;
			pps2_3 <= 21'd0;
			pps2_4 <= 21'd0;
			pps2_5 = 21'd0;
			pps3_1 <= 21'd0;
			pps3_2 <= 21'd0;
			pps3_3 = 21'd0;
			pps4_1 <= 21'd0;
			pps4_2 = 21'd0;	
		end
	else if (cstate == stage_1)
		begin
			pps1_1 <= MUL_1;
			pps1_2 <= MUL_2;
			pps1_3 <= MUL_3;
			pps1_4 <= MUL_4;
			pps1_5 <= MUL_5;
			pps1_6 <= MUL_6;
			pps1_7 <= MUL_7;
			pps1_8 <= MUL_8;
			pps1_9 = MUL_9;
		end
	else if (cstate == stage_12)
		begin
			pps1_1 <= MUL_1;
			pps1_2 <= MUL_2;
			pps1_3 <= MUL_3;
			pps1_4 <= MUL_4;
			pps1_5 <= MUL_5;
			pps1_6 <= MUL_6;
			pps1_7 <= MUL_7;
			pps1_8 <= MUL_8;
			pps2_1 <= Adder_11;
			pps2_2 <= Adder_12;
			pps2_3 <= Adder_13;
			pps2_4 <= Adder_14;
			pps2_5 = pps1_9;
			pps1_9 = MUL_9;
		end
	else if (cstate == stage_123)
		begin
			pps1_1 <= MUL_1;
			pps1_2 <= MUL_2;
			pps1_3 <= MUL_3;
			pps1_4 <= MUL_4;
			pps1_5 <= MUL_5;
			pps1_6 <= MUL_6;
			pps1_7 <= MUL_7;
			pps1_8 <= MUL_8;
			pps2_1 <= Adder_11;
			pps2_2 <= Adder_12;
			pps2_3 <= Adder_13;
			pps2_4 <= Adder_14;
			pps3_1 <= Adder_21;
			pps3_2 <= Adder_22;
			pps3_3 = pps2_5;
			pps2_5 = pps1_9;
			pps1_9 = MUL_9;
		end
	else if ((cstate == stage_all) || (cstate == stage_all_out))
		begin
			pps1_1 <= MUL_1;
			pps1_2 <= MUL_2;
			pps1_3 <= MUL_3;
			pps1_4 <= MUL_4;
			pps1_5 <= MUL_5;
			pps1_6 <= MUL_6;
			pps1_7 <= MUL_7;
			pps1_8 <= MUL_8;
			pps2_1 <= Adder_11;
			pps2_2 <= Adder_12;
			pps2_3 <= Adder_13;
			pps2_4 <= Adder_14;
			pps3_1 <= Adder_21;
			pps3_2 <= Adder_22;
			pps4_1 <= Adder_3;
			pps4_2 = pps3_3;
			pps3_3 = pps2_5;
			pps2_5 = pps1_9;
			pps1_9 = MUL_9;
		end
	else if (cstate == IDLE)
		begin
			pps1_1 <= 21'd0;
			pps1_2 <= 21'd0;
			pps1_3 <= 21'd0;
			pps1_4 <= 21'd0;
			pps1_5 <= 21'd0;
			pps1_6 <= 21'd0;
			pps1_7 <= 21'd0;
			pps1_8 <= 21'd0;
			pps1_9 = 21'd0;			
			pps2_1 <= 21'd0;
			pps2_2 <= 21'd0;
			pps2_3 <= 21'd0;
			pps2_4 <= 21'd0;
			pps2_5 = 21'd0;			
			pps3_1 <= 21'd0;
			pps3_2 <= 21'd0;
			pps3_3 = 21'd0;			
			pps4_1 <= 21'd0;
			pps4_2 = 21'd0;			
		end
	else 
		begin
			pps1_1 <= pps1_1;
			pps1_2 <= pps1_2;
			pps1_3 <= pps1_3;
			pps1_4 <= pps1_4;
			pps1_5 <= pps1_5;
			pps1_6 <= pps1_6;
			pps1_7 <= pps1_7;
			pps1_8 <= pps1_8;
			pps1_9 = pps1_9;
			pps2_1 <= pps2_1;
			pps2_2 <= pps2_2;
			pps2_3 <= pps2_3;
			pps2_4 <= pps2_4;
			pps2_5 = pps2_5;
			pps3_1 <= pps3_1;
			pps3_2 <= pps3_2;
			pps3_3 = pps3_3;
			pps4_1 <= pps4_1;
			pps4_2 = pps4_2;
		end
end

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
//assign Adder = (In_1 * weigts1) +  (In_2 * weigts2)+  (In_3 * weigts3)+  (In_4 * weigts4)+  (In_5 * weigts5)+  (In_6 * weigts6)+  (In_7 * weigts7)+  (In_8 * weigts8)+  (In_9 * weigts9);
//----------------------------------------------------
//          Output the calculated data
//----------------------------------------------------
//set output data
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		Out_OFM <= 21'd0;
	else if(cstate == stage_all_out)
		Out_OFM <= Adder_4;
	else 
		Out_OFM <= 21'd0;
end

//output valid signal
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		out_valid <= 1'd0;
	else if(cstate == stage_all_out)
		out_valid <= 1'd1;
	else 
		out_valid <= 1'd0;

end
endmodule