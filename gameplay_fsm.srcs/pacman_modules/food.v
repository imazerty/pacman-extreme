`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2017 10:02:45 PM
// Design Name: 
// Module Name: food
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


module food(
    input clk,
    input reset,
    input [10:0] x,
    input [10:0] hcount,
    input [9:0] y,
    input [9:0] vcount,
    input hsync,
    input vsync,
    output reg [11:0] pixel
    );
    
    reg inner_graphics = 0;
    reg [6:0] graphics_counter = 0;
    
    always @(posedge clk) begin
        
        graphics_counter <= graphics_counter + 1;
        if (graphics_counter == 0) inner_graphics <= !inner_graphics;
    
        if (inner_graphics) begin
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
            else if (vcount == y + 1 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 1 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 1 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 1 && hcount == x + 9) pixel <= 12'h000;
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
            else if (vcount == y + 2 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 7) pixel <= 12'hFFF;
            else if (vcount == y + 6 && hcount == x + 8) pixel <= 12'hFFF;
            else if (vcount == y + 6 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 6) pixel <= 12'hFFF;
            else if (vcount == y + 7 && hcount == x + 7) pixel <= 12'hFFF;
            else if (vcount == y + 7 && hcount == x + 8) pixel <= 12'hFFF;
            else if (vcount == y + 7 && hcount == x + 9) pixel <= 12'hFFF;
            else if (vcount == y + 7 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 6) pixel <= 12'hFFF;
            else if (vcount == y + 8 && hcount == x + 7) pixel <= 12'hFFF;
            else if (vcount == y + 8 && hcount == x + 8) pixel <= 12'hFFF;
            else if (vcount == y + 8 && hcount == x + 9) pixel <= 12'hFFF;
            else if (vcount == y + 8 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 7) pixel <= 12'hFFF;
            else if (vcount == y + 9 && hcount == x + 8) pixel <= 12'hFFF;
            else if (vcount == y + 9 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 13) pixel <= 12'h000;
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
        end else begin
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
            else if (vcount == y + 1 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 1 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 1 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 1 && hcount == x + 9) pixel <= 12'h000;
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
            else if (vcount == y + 2 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 2 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 3 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 4 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 5 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 6) pixel <= 12'hFFF;
            else if (vcount == y + 6 && hcount == x + 7) pixel <= 12'hFFF;
            else if (vcount == y + 6 && hcount == x + 8) pixel <= 12'hFFF;
            else if (vcount == y + 6 && hcount == x + 9) pixel <= 12'hFFF;
            else if (vcount == y + 6 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 6 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 6) pixel <= 12'hFFF;
            else if (vcount == y + 7 && hcount == x + 7) pixel <= 12'hFFF;
            else if (vcount == y + 7 && hcount == x + 8) pixel <= 12'hFFF;
            else if (vcount == y + 7 && hcount == x + 9) pixel <= 12'hFFF;
            else if (vcount == y + 7 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 7 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 6) pixel <= 12'hFFF;
            else if (vcount == y + 8 && hcount == x + 7) pixel <= 12'hFFF;
            else if (vcount == y + 8 && hcount == x + 8) pixel <= 12'hFFF;
            else if (vcount == y + 8 && hcount == x + 9) pixel <= 12'hFFF;
            else if (vcount == y + 8 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 8 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 6) pixel <= 12'hFFF;
            else if (vcount == y + 9 && hcount == x + 7) pixel <= 12'hFFF;
            else if (vcount == y + 9 && hcount == x + 8) pixel <= 12'hFFF;
            else if (vcount == y + 9 && hcount == x + 9) pixel <= 12'hFFF;
            else if (vcount == y + 9 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 9 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 10 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 11 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 12 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 13) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 14) pixel <= 12'h000;
            else if (vcount == y + 13 && hcount == x + 15) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 0) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 1) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 2) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 3) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 4) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 5) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 6) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 7) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 8) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 9) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 10) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 11) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 12) pixel <= 12'h000;
            else if (vcount == y + 14 && hcount == x + 13) pixel <= 12'h000;
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
    end
    
endmodule
