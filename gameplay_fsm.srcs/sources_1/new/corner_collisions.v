`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2017 12:11:25 PM
// Design Name: 
// Module Name: corner_collisions
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


module corner_collisions(
    input clk,
    input [10:0] x,hcount,
    input [9:0] y,vcount,
    input [7:0] size,
    input [11:0] wall_pixel,
    output [3:0] corners
    );
    reg [7:0] sides;
    always @(posedge clk)begin
        if((hcount == (x+1) && vcount == y)) sides[0]<= (|wall_pixel);
        if((hcount == (x) && vcount == (y+1))) sides[1]<= (|wall_pixel);
        if((hcount == (x+(size-1)-1) && vcount == (y))) sides[2]<= (|wall_pixel);
        if((hcount == (x+(size-1)) && vcount == (y+1))) sides[3]<= (|wall_pixel);
        if((hcount == (x) && vcount == (y+(size-1)-1))) sides[4]<= (|wall_pixel);
        if((hcount == (x+1) && vcount == (y+(size-1)))) sides[5]<= (|wall_pixel);
        if((hcount == (x+(size-1)-1) && vcount == (y+(size-1)))) sides[6]<= (|wall_pixel);
        if((hcount == (x+(size-1)) && vcount == (y+(size-1)-1))) sides[7]<= (|wall_pixel);
    end
    assign corners[0]=sides[5]|sides[6];
    assign corners[1]=sides[0]|sides[2];
    assign corners[2]=sides[3]|sides[7];
    assign corners[3]=sides[1]|sides[4];
    
endmodule
