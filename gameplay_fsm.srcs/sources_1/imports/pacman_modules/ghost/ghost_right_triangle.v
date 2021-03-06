`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2017 07:52:48 PM
// Design Name: 
// Module Name: ghost_right_triangle
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


module ghost_right_triangle(
    input clk,
    input reset,
    input [10:0] x,
    input [9:0] y,
    input [10:0] hcount,
    input [9:0] vcount,
    input [11:0] color,
    output reg [11:0] pixel
    );
    
    always @(posedge clk) begin
        
    
    if (vcount == y && hcount == x) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 2) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 3) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 4) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 5) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 6) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 7) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 8) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 9) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 10) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 11) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 12) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 13) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 0 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 2) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 3) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 4) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 5) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 6) pixel <= color;
    else if (vcount == y + 1 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 1 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 1 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 1 && hcount == x + 10) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 11) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 12) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 13) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 1 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 2 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 2 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 2 && hcount == x + 2) pixel <= 12'h000;
    else if (vcount == y + 2 && hcount == x + 3) pixel <= 12'h000;
    else if (vcount == y + 2 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 2 && hcount == x + 5) pixel <= color;
    else if (vcount == y + 2 && hcount == x + 6) pixel <= color;
    else if (vcount == y + 2 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 2 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 2 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 2 && hcount == x + 10) pixel <= color;
    else if (vcount == y + 2 && hcount == x + 11) pixel <= color;
    else if (vcount == y + 2 && hcount == x + 12) pixel <= 12'h000;
    else if (vcount == y + 2 && hcount == x + 13) pixel <= 12'h000;
    else if (vcount == y + 2 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 2 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 3 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 3 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 3 && hcount == x + 2) pixel <= 12'h000;
    else if (vcount == y + 3 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 5) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 6) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 10) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 11) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 12) pixel <= color;
    else if (vcount == y + 3 && hcount == x + 13) pixel <= 12'h000;
    else if (vcount == y + 3 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 3 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 4 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 4 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 4 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 4 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 4 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 4 && hcount == x + 5) pixel <= 12'hFFF;
    else if (vcount == y + 4 && hcount == x + 6) pixel <= 12'hFFF;
    else if (vcount == y + 4 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 4 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 4 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 4 && hcount == x + 10) pixel <= color;
    else if (vcount == y + 4 && hcount == x + 11) pixel <= 12'hFFF;
    else if (vcount == y + 4 && hcount == x + 12) pixel <= 12'hFFF;
    else if (vcount == y + 4 && hcount == x + 13) pixel <= color;
    else if (vcount == y + 4 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 4 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 5 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 5 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 5 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 5 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 5 && hcount == x + 4) pixel <= 12'hFFF;
    else if (vcount == y + 5 && hcount == x + 5) pixel <= 12'hFFF;
    else if (vcount == y + 5 && hcount == x + 6) pixel <= 12'hFFF;
    else if (vcount == y + 5 && hcount == x + 7) pixel <= 12'hFFF;
    else if (vcount == y + 5 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 5 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 5 && hcount == x + 10) pixel <= 12'hFFF;
    else if (vcount == y + 5 && hcount == x + 11) pixel <= 12'hFFF;
    else if (vcount == y + 5 && hcount == x + 12) pixel <= 12'hFFF;
    else if (vcount == y + 5 && hcount == x + 13) pixel <= 12'hFFF;
    else if (vcount == y + 5 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 5 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 6 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 6 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 6 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 6 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 6 && hcount == x + 4) pixel <= 12'hFFF;
    else if (vcount == y + 6 && hcount == x + 5) pixel <= 12'hFFF;
    else if (vcount == y + 6 && hcount == x + 6) pixel <= 12'h00F;
    else if (vcount == y + 6 && hcount == x + 7) pixel <= 12'h00F;
    else if (vcount == y + 6 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 6 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 6 && hcount == x + 10) pixel <= 12'hFFF;
    else if (vcount == y + 6 && hcount == x + 11) pixel <= 12'hFFF;
    else if (vcount == y + 6 && hcount == x + 12) pixel <= 12'h00F;
    else if (vcount == y + 6 && hcount == x + 13) pixel <= 12'h00F;
    else if (vcount == y + 6 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 6 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 7 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 7 && hcount == x + 1) pixel <= color;
    else if (vcount == y + 7 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 7 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 7 && hcount == x + 4) pixel <= 12'hFFF;
    else if (vcount == y + 7 && hcount == x + 5) pixel <= 12'hFFF;
    else if (vcount == y + 7 && hcount == x + 6) pixel <= 12'h00F;
    else if (vcount == y + 7 && hcount == x + 7) pixel <= 12'h00F;
    else if (vcount == y + 7 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 7 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 7 && hcount == x + 10) pixel <= 12'hFFF;
    else if (vcount == y + 7 && hcount == x + 11) pixel <= 12'hFFF;
    else if (vcount == y + 7 && hcount == x + 12) pixel <= 12'h00F;
    else if (vcount == y + 7 && hcount == x + 13) pixel <= 12'h00F;
    else if (vcount == y + 7 && hcount == x + 14) pixel <= color;
    else if (vcount == y + 7 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 8 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 8 && hcount == x + 1) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 5) pixel <= 12'hFFF;
    else if (vcount == y + 8 && hcount == x + 6) pixel <= 12'hFFF;
    else if (vcount == y + 8 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 10) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 11) pixel <= 12'hFFF;
    else if (vcount == y + 8 && hcount == x + 12) pixel <= 12'hFFF;
    else if (vcount == y + 8 && hcount == x + 13) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 14) pixel <= color;
    else if (vcount == y + 8 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 9 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 9 && hcount == x + 1) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 5) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 6) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 10) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 11) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 12) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 13) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 14) pixel <= color;
    else if (vcount == y + 9 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 10 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 10 && hcount == x + 1) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 5) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 6) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 10) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 11) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 12) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 13) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 14) pixel <= color;
    else if (vcount == y + 10 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 11 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 11 && hcount == x + 1) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 5) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 6) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 10) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 11) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 12) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 13) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 14) pixel <= color;
    else if (vcount == y + 11 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 12 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 12 && hcount == x + 1) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 5) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 6) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 10) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 11) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 12) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 13) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 14) pixel <= color;
    else if (vcount == y + 12 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 13 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 13 && hcount == x + 1) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 4) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 5) pixel <= 12'h000;
    else if (vcount == y + 13 && hcount == x + 6) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 9) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 10) pixel <= 12'h000;
    else if (vcount == y + 13 && hcount == x + 11) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 12) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 13) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 14) pixel <= color;
    else if (vcount == y + 13 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 2) pixel <= color;
    else if (vcount == y + 14 && hcount == x + 3) pixel <= color;
    else if (vcount == y + 14 && hcount == x + 4) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 5) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 6) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 7) pixel <= color;
    else if (vcount == y + 14 && hcount == x + 8) pixel <= color;
    else if (vcount == y + 14 && hcount == x + 9) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 10) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 11) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 12) pixel <= color;
    else if (vcount == y + 14 && hcount == x + 13) pixel <= color;
    else if (vcount == y + 14 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 14 && hcount == x + 15) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 0) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 1) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 2) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 3) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 4) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 5) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 6) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 7) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 8) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 9) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 10) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 11) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 12) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 13) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 14) pixel <= 12'h000;
    else if (vcount == y + 15 && hcount == x + 15) pixel <= 12'h000;
    else pixel <= 12'h000;
    end
    
endmodule
