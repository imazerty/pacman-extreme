`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2017 10:34:52 AM
// Design Name: 
// Module Name: collision
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


module collision(
    input [10:0] x_1,
    input [9:0] y_1,
    input [7:0] w_1,
    input [7:0] h_1,
    input [10:0] x_2,
    input [9:0] y_2,
    input [7:0] w_2,
    input [7:0] h_2,
    output collision
    );
    
    assign collision = ((x_1 < (x_2 + w_2)) &&
       ((x_1 + w_1)> x_2)  &&
       (y_1 < (y_2 + h_2)) &&
       ((h_1+ y_1) > y_2));
    
endmodule
