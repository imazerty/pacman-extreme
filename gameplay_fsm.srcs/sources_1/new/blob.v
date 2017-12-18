`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2017 10:40:50 AM
// Design Name: 
// Module Name: blob
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


module blob
   #(parameter WIDTH = 64,            // default width: 64 pixels
               HEIGHT = 64,           // default height: 64 pixels
               COLOR = 12'hF_FF)  // default color: white
   (input [7:0] width, height,
   input [11:0] color,
   input [10:0] x,hcount,
    input [9:0] y,vcount,
    input clk,
    output reg [11:0] pixel);

   always @(posedge clk) begin
      if ((hcount >= x && hcount < (x+width)) &&
	 (vcount >= y && vcount < (y+height)))
	pixel <= color;
      else pixel <= 0;
   end
endmodule

