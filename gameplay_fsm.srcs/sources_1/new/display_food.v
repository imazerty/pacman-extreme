`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2017 01:39:51 PM
// Design Name: 
// Module Name: display_food
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


module display_food(
    input [3:0] food, // is there food in teh cell that is getting displayed?
    input clk,   //system clock because all pixel outputs need to be clocked or we get glitches
    output [11:0] pixel,  //the output for vga
    input [10:0] hcount, //current location 
    input [9:0] vcount
    );
    wire [11:0] food_pixel, special1_pixel, special2_pixel, special3_pixel, special4_pixel, special5_pixel, special6_pixel;
    wire [10:0] x = (hcount >> 4)<<4; ///hcount/16*16;
    wire [9:0] y = (vcount >> 4)<<4;//(vcount)/16*16;

    
    assign pixel = (food == 1) ? food_pixel : (food == 2) ? special1_pixel :
                    (food == 3) ? special2_pixel : (food == 4) ? special3_pixel :
                    (food == 5) ? special4_pixel : (food == 6) ? special5_pixel : 
                    (food == 7) ? special6_pixel : 0 ;
    food(.clk(clk),
        .x(x),.hcount(hcount),
        .y(y),.vcount(vcount),
        .pixel(food_pixel)
        );
     energizer_powerup(.clk(clk),
            .x(x),.hcount(hcount),
            .y(y),.vcount(vcount),
            .pixel(special1_pixel)
            );
     cherry(.clk(clk),
                .x(x),.hcount(hcount),
                .y(y),.vcount(vcount),
                .pixel(special2_pixel)
                );
      orange(.clk(clk),
               .x(x),.hcount(hcount),
               .y(y),.vcount(vcount),
               .pixel(special3_pixel)
               );
     key(.clk(clk),
              .x(x),.hcount(hcount),
              .y(y),.vcount(vcount),
              .pixel(special4_pixel)
              );
    apple(.clk(clk),
         .x(x),.hcount(hcount),
         .y(y),.vcount(vcount),
         .pixel(special5_pixel)
         );
    strawberry(.clk(clk),
            .x(x),.hcount(hcount),
            .y(y),.vcount(vcount),
            .pixel(special6_pixel)
            );
     
endmodule
