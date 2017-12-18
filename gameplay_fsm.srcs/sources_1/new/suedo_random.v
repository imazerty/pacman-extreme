`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2017 03:28:25 PM
// Design Name: 
// Module Name: suedo_random
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


module suedo_random(
    input clk,
    output reg [1:0] number
    );
    
    reg[15:0] counter;
    always @(posedge clk)begin
        if(counter == 55523) begin
            counter <= 0;
            number <= number+1;
        end
        else counter <= counter+1;
    end
endmodule
