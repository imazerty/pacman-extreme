`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 02:05:32 PM
// Design Name: 
// Module Name: grid
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


module grid(
    input clk,
    input [10:0] hcount,
    input [9:0] vcount,
    output reg [11:0] pixel,
    input [5:0] index_x,
    input [4:0] index_y
    );
    
    wire [5:0] width = 19;
    wire [4:0] height = 30;
     wire [6:0] x = hcount >> 4; ///hcount/16;
     wire [6:0] y = vcount >> 4;//(vcount)/16;
    always @(posedge clk)begin
        pixel<= (((vcount>>4)<height) & ((hcount>>4)<width)
                 & (~(|hcount[3:0]) | (&hcount[3:0]) ||
                 ~(|vcount[3:0]) | (&vcount[3:0]))) ? 
                 ((x==index_x)&(y==index_y)) ? 12'hF00 : 12'hFFF 
                 : 12'h000;
        
    end
endmodule
