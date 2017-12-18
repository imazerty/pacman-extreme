`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2017 01:18:57 PM
// Design Name: 
// Module Name: controler_clk
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


module controler_clk(
    input clk,start,
    output clk6us
    );
    
    reg [7:0] count;
  
    assign clk6us = (count==0);
    always @(posedge clk)begin
        if(count == 149 || start) count<=0;
        else count<=count+1;
           
    end
    
endmodule
