`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2017 10:53:16 AM
// Design Name: 
// Module Name: get_indicies
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


module get_indicies(
    input [10:0] x,
    input [9:0] y,
    input [7:0] width,
    input [7:0] height,
    output [9:0] index1,
    output [9:0] index2,
    output [9:0] index3,
    output [9:0] index4
    );
    
    assign index1[4:0] = x/16;
    assign index1[9:5] = y/16;
    assign index2[4:0] = (x+width-1)/16;
    assign index2[9:5] = y/16;
    assign index3[4:0] = x/16;
    assign index3[9:5] = (y+height-1)/16;
    assign index4[4:0] = (x+width-1)/16;
    assign index4[9:5] = (y+height-1)/16;
    
endmodule
