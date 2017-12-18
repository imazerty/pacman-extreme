`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2017 01:05:16 PM
// Design Name: 
// Module Name: nes_controler
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


module nes_controler(
    input clk, start,
    input data,
    output reg latch, 
    output reg pulse,
    output reg [7:0] button_state,
    output wire collect
    );
    
    wire data_clk;
    controler_clk clock(.clk(clk),.clk6us(data_clk), .start(start));
    reg [4:0] count=0;
    reg [7:0] data_stored;
    assign collect = (((~count[0] & count>1) && count < 18 ) && count < 19 && data_clk);

    
    always @(posedge clk)begin
        latch <= (count < 3 && count > 0) ? 1:0;
        pulse <= (count > 3 && ~count[0] && (count<19)); // odd counts after latch
        if (start) count<=0;
        if(count < 19) begin
            if(data_clk) begin
                count<=count+1;
                if(((~count[0] & count>1) && count < 18 )) data_stored <= {data_stored[6:0], ~data}; /// on falling edge of pulse see timing diagram 
            end
         end
         else button_state<=data_stored;
    end
    
        
        
    
endmodule