`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:56 09/05/2018 
// Design Name: 
// Module Name:    tx_byte 
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
module tx_byte(clk,tx,ip);
	input clk,ip;
	wire nclk;
	output reg tx;
	reg com;
	wire [7:0] t_byte;
	reg [4:0] add;
	reg [4:0] pos;
	wire [7:0] out_byte;
	reg en;
	initial begin
		add=0;
		tx=1;
		pos=0;
		com=0;
	end		
	memory m1(clk,add,out_byte);
	baud_rate_gen brg1(clk,nclk);
	always @(posedge nclk) begin
	if (add<16) begin	
		if (pos==9) begin
			tx=1;
			add=add+1;
			pos=0;
			com=0;
		end		
		else if(com==1) begin
			tx = out_byte[pos-1];	
			pos=pos+1;
		end
		else if((ip==1) && (pos==0)) begin
				com=1;
				tx=0;
				pos=pos+1;	
		end
		
	end
	else if(ip==0) begin
				pos=0;
				add=0;
	end
	end
endmodule
