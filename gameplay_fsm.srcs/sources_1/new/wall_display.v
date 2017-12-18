`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2017 10:40:50 AM
// Design Name: 
// Module Name: wall_display
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


module wall_display
    (input [10:0] hcount,
    input[9:0] vcount,
    input wall,
    output reg [11:0] pixel,
    output reg [4:0] x,y);
    
    always @ * begin
        if(wall) pixel = 12'h 0_7_F; //wall colour??
        else pixel = 0;
        
        //x=(hcount+1)/16;
        //y=(vcount)/16;
        
    end
    
endmodule