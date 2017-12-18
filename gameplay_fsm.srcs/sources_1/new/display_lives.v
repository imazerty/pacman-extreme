`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2017 04:07:30 PM
// Design Name: 
// Module Name: display_lives
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


module display_lives(
    input clk,
    input [10:0] x,
    input [9:0] y,
    input [9:0] hcount,
    input [9:0] vcount,
    input [2:0] lives,
    output [11:0] pixel
    );
    wire [11:0] pixel_1, pixel_2, pixel_3, pixel_4, pixel_5, pixel_6, pixel_7;
    wire [9:0] display_y = ((lives>=7) & (vcount>= y +144)) ? y+144:
                ((lives>=6) & (vcount>= y +120)) ? y+120:
                ((lives>=5) & (vcount>= y +96)) ? y+96:
                ((lives>=4) & (vcount>= y +72)) ? y+72:
                ((lives>=3) & (vcount>= y +48)) ? y+48:
                ((lives>=2) & (vcount>= y +24)) ? y+24:
                ((lives>=1) ) ? y:0;
    pacman_life life_1(.clk(clk), .hcount(hcount), .vcount(vcount), .x(x), .y(display_y), .pixel(pixel_1));
//    cherry life_2(.clk(clk), .hcount(hcount), .vcount(vcount), .x(x), .y(y+24), .pixel(pixel_2));
//    cherry life_3(.clk(clk), .hcount(hcount), .vcount(vcount), .x(x), .y(y+48), .pixel(pixel_3));
//    cherry life_4(.clk(clk), .hcount(hcount), .vcount(vcount), .x(x), .y(y+72), .pixel(pixel_4));
//    cherry life_5(.clk(clk), .hcount(hcount), .vcount(vcount), .x(x), .y(y+96), .pixel(pixel_5));
//    cherry life_6(.clk(clk), .hcount(hcount), .vcount(vcount), .x(x), .y(y+120), .pixel(pixel_6));
//    cherry life_7(.clk(clk), .hcount(hcount), .vcount(vcount), .x(x), .y(y+144), .pixel(pixel_7));
    assign pixel =(lives >0) ? pixel_1 : 0;
//    assign pixel = (lives ==7) ? pixel_1|pixel_2|pixel_3|pixel_4|pixel_5|pixel_6|pixel_7 :
//                    (lives ==6) ? pixel_1|pixel_2|pixel_3|pixel_4|pixel_5|pixel_6 :
//                    (lives ==5) ? pixel_1|pixel_2|pixel_3|pixel_4|pixel_5 :
//                    (lives ==4) ? pixel_1|pixel_2|pixel_3|pixel_4:
//                    (lives ==3) ? pixel_1|pixel_2|pixel_3 :
//                    (lives ==2) ? pixel_1|pixel_2 :
//                    (lives ==1) ? pixel_1 :
//                    0;
endmodule
