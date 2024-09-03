`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2024 14:00:24
// Design Name: 
// Module Name: vending_machine_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vending_machine_tb;
reg clk,rst;
reg [1:0]in;
wire out;
wire [1:0]change;

vending_machine dut (out,change,in,clk,rst);

always #5 clk=~clk;

initial
    begin
        rst=1;clk=0;
        #8 rst=0;in=2'b01;
        #5 in=2'b10;
        #5 $finish;
    end

endmodule
