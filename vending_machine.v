`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2024 13:01:54
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(out,change,in,clk,rst);
input [1:0]in;
input clk,rst;
output reg [1:0]change;
output reg out;

reg [1:0]curr_state,next_state;
parameter s0=2'b00, s1=2'b01, s2=2'b10;

always @(posedge clk)
begin
    if(rst)curr_state<=0;
    else curr_state<=next_state;
end

always @(in,curr_state)
    case(curr_state)
        s0:begin
                if(in==0)begin change=s0;out=0;next_state<=s0; end
                else if(in==1)begin change=s0;out=0;next_state<=s1; end
                else if(in==2)begin change=s0;out=0;next_state<=s2; end
            end
        s1:begin
                if(in==0)begin change=s1;out=0;next_state<=s0; end
                else if(in==1)begin change=s0;out=0;next_state<=s2; end
                else if(in==2)begin change=s0;out=1;next_state<=s0; end
            end
        s2:begin
                if(in==0)begin change=s2;out=0;next_state<=s0; end
                else if(in==1)begin change=s1;out=1;next_state<=s0; end
                else if(in==2)begin change=s2;out=1;next_state<=s2; end
            end
        default curr_state=s0;
    endcase
endmodule
