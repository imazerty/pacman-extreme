`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2017 11:35:46 PM
// Design Name: 
// Module Name: divider
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


module divider_kim #(parameter SKIP_CYCLES = 25_000_000) (
    input reset,
    input clk_25mhz,
    output reg interval_enable
    );
    
    reg [25:0] counter = 0;
    
    always @(posedge clk_25mhz) begin
        if (reset) begin
            interval_enable <= 0;
            counter <= 0;
        end else begin
            counter <= counter + 1;
            if (counter >=  SKIP_CYCLES) begin
                counter <= 0;
                interval_enable <= 1;
            end else if (counter == 0) begin
                interval_enable <= 0;
            end
        end
    end
endmodule
