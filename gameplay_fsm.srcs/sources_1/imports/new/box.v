`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 01:40:27 PM
// Design Name: 
// Module Name: box
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


module box(
    input clk,
    input [7:0] width,
    input [7:0] height,
    input [11:0] color,
    input [10:0] x,
    input [10:0] hcount,
    input [9:0] y,
    input [9:0] vcount,
    output reg [11:0] pixel
    );
    
    always @(posedge clk) begin
        pixel = ((((vcount == y) | (vcount == y+height-1))& (hcount>=x) & (hcount<=x+width-1))| 
                (((hcount== x )| (hcount == x+width-1))& (vcount>=y) & (vcount<=y+height-1))) ? color :0; 
    end
    
endmodule
