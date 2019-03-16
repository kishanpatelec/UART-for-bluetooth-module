`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kishan Patel
// 
// Create Date:    18:04:00 09/05/2018 
// Design Name: 
// Module Name:    memory 
// Project Name: 
// Target Devices: Waxwing SPARTAN 6 FPGA 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module memory(clk,add,out_byte);	  
	//input clk, [7:0] tmpbyte;
	input [4:0] add;
	input clk;
	output reg  [7:0] out_byte;
	reg [7:0] mem [15:0];
	initial begin	
		mem[0]=8'h4B;
		mem[1]=8'h49;
		mem[2]=8'h53;
		mem[3]=8'h48;
		mem[4]=8'h41;
		mem[5]=8'h4E;
		mem[6]=8'h20;
		mem[7]=8'h20;
		mem[8]=8'h20;
		mem[9]=8'h50;
		mem[10]=8'h41;
		mem[11]=8'h54;
		mem[12]=8'h45;
		mem[13]=8'h4C;
		mem[14]=8'h0A;
		mem[15]=8'h0D;
	end		
	always @(posedge clk) begin
		out_byte = mem[add];
	end
		
endmodule
