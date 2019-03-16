`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:00 09/05/2018 
// Design Name: 
// Module Name:    baud_rate_gen 
// Project Name: 
// Target Devices: 
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
module baud_rate_gen(clk,nclk);
	input clk;
	output reg nclk;
	reg [11:0] count;
	initial begin
		nclk=0;
		count=0;
	end
	always @(posedge clk) begin
		count=count+1;
		if((count==12'd1302)) begin
			nclk=~nclk;
			count=0;
		end
	end
endmodule

