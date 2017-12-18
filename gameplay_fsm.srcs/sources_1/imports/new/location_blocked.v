`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2017 12:37:25 PM
// Design Name: 
// Module Name: location_blocked
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


module location_blocked(
    input clk,
    input [6:0] x,
    input [5:0] y,
    output reg blocked
    );
    
    always @(posedge clk) blocked <= x==0 | x==18 | y==0 | y==29 | ((x>=4 &x<=14) & (y>=10 &y<=15)) | (x==3 & y==23);
endmodule
