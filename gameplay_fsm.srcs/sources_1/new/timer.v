`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2017 10:38:01 AM
// Design Name: 
// Module Name: timer
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


// creates a timer counts down for value seconds
module timer(input [3:0] value, input clk, input start_timer, input rset,
                output reg timer_done);
    // creates 1 hz puls to track time
    divider one_hz(.clk(clk), .one_hz(one_sec), .sw(sw), .reset(start_timer));
    
    reg [3:0] count;
    reg start_timer_prev;
    reg state;
    
    always @(posedge clk) begin
        start_timer_prev<=start_timer;
        // starts on posedge of timer
        if ((start_timer & !start_timer_prev)|rset)begin
                    count<=value;
                    timer_done<=0;    
                    state<=0;  
         end        
         //else if(state <=1)timer_done<=0;
         // when count is done send done signal
        else if (state ==0) begin 
            if(count==0 ) begin
                timer_done<=1;
                state<=1;
            end
            //count down every second
            else if (one_sec)begin
              count<= count-1;
            end 
        end
        else if(state == 1) timer_done<=0;
    end
endmodule   