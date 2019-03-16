`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:53 10/02/2018 
// Design Name: 
// Module Name:    memory_hexcode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module is to represent the recieved information on the seven segments and this memory 
//						owns the hexcode for the 0x0 to 0xF representation
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module memory_hexcode(clk,data,add);
	input [3:0] add;
   output reg [7:0] data;
   input clk;
	reg [7:0] mem [15:0];
initial begin
		mem[0]=8'hC0;
		mem[1]=8'hF3;
		mem[2]=8'hA4;
		mem[3]=8'hB0;
		mem[4]=8'h99;
		mem[5]=8'h92;
		mem[6]=8'h82;
		mem[7]=8'hF8;
		mem[8]=8'h80;
		mem[9]=8'h90;
		mem[10]=8'h88;
		mem[11]=8'h83;
		mem[12]=8'hC6;
		mem[13]=8'hA1;
		mem[14]=8'hB6;
		mem[15]=8'h8E;	
end		
always @(posedge clk)	
		data=mem[add];
endmodule
