`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:35 08/24/2018 
// Design Name: 
// Module Name:    fd 
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
module fd(clk,nclk);
	input clk;
	output reg nclk;
	reg [10:0] count;
	initial begin
		nclk=0;
		count=0;
	end
	always @(posedge clk) begin
		count=count+1;
		if((count==11'd1302)) begin
			nclk=~nclk;
			count=0;
		end
	end
endmodule
