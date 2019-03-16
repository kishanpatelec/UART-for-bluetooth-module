`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:16 08/24/2018 
// Design Name: 
// Module Name:    Recieve_byte 
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
module Recieve_byte(rx,clk,buf_byte,en
    );
input rx,clk;
wire [7:0] hexcode;
output reg [1:0] en;
wire nclk;
reg com,seg;

output reg [7:0] buf_byte;
reg [3:0] pos;
reg [15:0] count;
reg [3:0] msb_n, lsb_n; 
reg [3:0] add;


initial begin
	pos=4'd0;
	com=0;
	seg=0;  //clk of 1ms
	count=0;   
end
fd f(clk,nclk);
memory_hexcode mhc(clk,hexcode,add);
always @(posedge nclk) begin
   if((pos==4'd0) && (rx==0)) begin
		pos=pos+1;
		com=1;
	end
	else if((pos==4'd9)&&(rx==1)) begin	
		pos=4'd0;
		com=0;
	end
	else if((com==1)) begin 
		buf_byte[pos-1]=rx;	
		pos=pos+1;
	end
end	

always @(posedge clk) begin
	count=count+1;
	if(count==50000)
		seg=~seg;
end

always begin
	lsb_n[3:0]=buf_byte[3:0];
	msb_n[3:0]=buf_byte[7:4];
end	

always @(posedge clk) begin
	if(seg==0) begin
		en=1;
		add=lsb_n[3:0];
	end	
	else begin
		en=2;
		add=msb_n[3:0];
	end
end	
endmodule


