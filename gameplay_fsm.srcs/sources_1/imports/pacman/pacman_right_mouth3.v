`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2017 03:18:10 PM
// Design Name: 
// Module Name: pacman_right_mouth3
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


module pacman_right_mouth3(
    input clk,
    input reset,
    input inner_graphics,
    input [10:0] hcount,
    input [9:0] vcount,
    input [10:0] x,
    input [9:0] y,
    output reg [11:0] pixel
    );
    
    always @(posedge clk) begin
        if (inner_graphics) begin
            if (hcount == x && vcount == y) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 3 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 4 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 5 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 12 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 13 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 3 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 2) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 2) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 2) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 2) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 3) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 3) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 4) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 4) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 9 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 10 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 11 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 12 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 13 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 11) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 11) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 12) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 12) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 13) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 13) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 13) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 13) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 3 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 3 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 4 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 5 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 12 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 13 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 15) pixel <= 12'h000;
        else pixel <= 12'h000;
        end else begin
            if (hcount == x && vcount == y) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 3 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 4 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 5 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 0) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 12 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 13 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 0) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 3 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 1) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 1) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 2) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 2) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 2) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 2) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 2) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 3) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 3) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 3) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 4) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 4) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 4) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 5) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 6) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 7) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 8) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 12 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 13 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 8) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 9) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 1 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 10) pixel <= 12'hFF0;
        else if (hcount == x + 0 && vcount == y + 11) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 11) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 11) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 12) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 2 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 12) pixel <= 12'hFF0;
        else if (hcount == x + 15 && vcount == y + 12) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 13) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 13) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 3 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 13) pixel <= 12'hFF0;
        else if (hcount == x + 14 && vcount == y + 13) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 13) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 3 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 4 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 5 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 12 && vcount == y + 14) pixel <= 12'hFF0;
        else if (hcount == x + 13 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 14) pixel <= 12'h000;
        else if (hcount == x + 0 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 1 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 2 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 3 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 4 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 5 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 6 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 7 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 8 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 9 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 10 && vcount == y + 15) pixel <= 12'hFF0;
        else if (hcount == x + 11 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 12 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 13 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 14 && vcount == y + 15) pixel <= 12'h000;
        else if (hcount == x + 15 && vcount == y + 15) pixel <= 12'h000;
        else pixel <= 12'h000;
        end
    end
endmodule
