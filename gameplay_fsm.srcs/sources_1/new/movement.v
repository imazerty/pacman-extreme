`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2017 12:55:00 PM
// Design Name: 
// Module Name: ghost_movement
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


module movement(
    input clk, rset, hold_position, dead,
    input [3:0] controls,aviable,
    output reg [9:0] x=16,
    input [9:0] xstart,
    output reg [9:0] y=16,
    input [9:0] ystart,
    input [1:0]speed,
    output reg [3:0] dir,
    input vsync
    );
    reg vsync_prev;
    reg [3:0] controls_saved;
    
    always @(posedge clk) begin
        vsync_prev<=vsync;
        controls_saved<= (|controls) ? controls : controls_saved;
        if(rset)begin
            x<=xstart;
            y<=ystart;
            dir<=0;
            controls_saved<=0;
        end
        else if(~vsync && vsync_prev  && !hold_position )begin
            if(dir[3]) x<=(aviable[3]) ?  (x-speed) : ((((x-speed)>>4)+1)<<4);
            if(dir[2]) x<=(aviable[2]) ?  (x+speed) : ((((x+speed)>>4))<<4);
            if(dir[1]) y<=(aviable[1]) ?  (y-speed) : ((((y-speed)>>4)+1)<<4);
            if(dir[0]) y<=(aviable[0]) ?  (y+speed) : ((((y+speed)>>4))<<4);
        end
        else if(!(dir==controls_saved)) begin
           
            if(controls_saved[0] && aviable[0])begin
                dir[0]<=1;
                dir[1]<=0;
                if(!(|controls_saved[3:2])) dir[3:2]<=2'b0;
            end
            else if(controls_saved[1] && aviable[1])begin
                dir[0]<=0;
                dir[1]<=1;
                if(!(|controls_saved[3:2])) dir[3:2]<=2'b0;
            end
            if(controls_saved[2] && aviable[2])begin
                dir[2]<=1;
                dir[3]<=0;
                if(!(|controls_saved[1:0])) dir[1:0]<=2'b0;
            end
            if(controls_saved[3] && aviable[3])begin
                dir[2]<=0;
                dir[3]<=1;
                if(!(|controls_saved[1:0])) dir[1:0]<=2'b0;
            end
            
        end
    end
endmodule
