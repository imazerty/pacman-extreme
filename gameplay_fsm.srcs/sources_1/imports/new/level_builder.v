`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2017 01:36:44 PM
// Design Name: 
// Module Name: level_builder
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


module level_builder #(parameter [2399:0]food_default=0,parameter [599:0] walls_default=0)
     (
    input clk,
    input [9:0] hcount,
    input [9:0] vcount,
    input rset,
    input [4:0] controls,
//    input [599:0] walls_default,
//    input [2399:0] food_default,
    output [11:0] pixel,
    output [599:0] walls_output,
    output [2399:0] food_output
    );
    //wire [79:0] food_default [29:0];
    //wire [19:0] walls_default [29:0];
      
    
    
    reg up_prev, down_prev, left_prev, right_prev, select_prev;
    assign {select, left, right, up, down} = {controls[4], controls[3], controls[2], controls[1], controls[0]};
    wire [11:0] grid_pixel;
    reg [5:0] index_x=0;
    reg [4:0] index_y=0;
    grid user_grid(.clk(clk),.hcount(hcount),.vcount(vcount),
                  
                    .pixel(grid_pixel),
                    .index_x(index_x), .index_y(index_y));
    assign pixel = (hcount < (19<<4)) ? (|grid_pixel) ? grid_pixel:
                                        (pixel_blocked) ? 12'hFFF: // marking off squares that can't be changed
                                        food_pixel|wall_pixel :0;
   reg [79:0] food [29:0];
   assign food_output = {food[29],food[28],food[27],food[26],food[25],
                        food[24],food[23],food[22],food[21],food[20],
                        food[19],food[18],food[17],food[16],food[15],
                        food[14],food[13],food[12],food[11],food[10],
                        food[9],food[8],food[7],food[6],food[5],
                        food[4],food[3],food[2],food[1],food[0]};
    reg [19:0] walls [29:0];
    assign walls_output = {walls[29],walls[28],walls[27],walls[26],walls[25],
                          walls[24],walls[23],walls[22],walls[21],walls[20],
                          walls[19],walls[18],walls[17],walls[16],walls[15],
                          walls[14],walls[13],walls[12],walls[11],walls[10],
                          walls[9],walls[8],walls[7],walls[6],walls[5],
                          walls[4],walls[3],walls[2],walls[1],walls[0]};
    wire [5:0] x = hcount >> 4; ///hcount/16;
    wire [5:0] y = vcount >> 4;//(vcount)/16;
         
    
    reg [3:0] food_incell;
//    reg [3:0] food_atindex;
    reg [11:0] colour;
    reg [4:0] size;
    wire [11:0] food_pixel;
    display_food food_display(.food(food_incell), .pixel(food_pixel),
             .hcount(hcount), .vcount(vcount), .clk(clk));
    
    assign wall_atindex = walls[index_y][index_x];        
    reg [11:0] wall_pixel;
    reg [3:0] food_atindex;
    wire pixel_blocked;
    location_blocked display_blocked(.clk(clk),.x(x),.y(y),.blocked(pixel_blocked));
    
    wire index_blocked;
    location_blocked change_blocked(.clk(clk),.x(index_x),.y(index_y),.blocked(index_blocked));
    
    always @(posedge clk)begin
        food_incell <= {food[y][{hcount[9:4],2'd3}], food[y][{hcount[9:4],2'd2}], food[y][{hcount[9:4],2'd1}], food[y][{hcount[9:4],2'd0}]};
        size <= (food_incell == 1) ? 4 : 8; 
         colour <= (food_incell == 1) ? 12'hCFF :
                   (food_incell == 2) ? 12'h099
                  : (food_incell == 3) ? 12'hF00 :  12'h0F0;
         
         wall_pixel<= ( (hcount < 11'd320) && (vcount < 10'd480) && (walls[y][x]==1) ) ? 12'h 0_7_F : 12'h000;      //displaying walls
         
         food_atindex<={food[index_y][{index_x,2'd3}], food[index_y][{index_x,2'd2}], food[index_y][{index_x,2'd1}], food[index_y][{index_x,2'd0}]};                
        
        //keeping track of button state to detect rising edge
        up_prev<=up;
        down_prev<=down;
        right_prev<=right;
        left_prev<=left;
        select_prev<=select;
        
        if(rset) begin
            index_y<=9;
            index_x<=3;
            
            {food[29],food[28],food[27],food[26],food[25],
            food[24],food[23],food[22],food[21],food[20],
            food[19],food[18],food[17],food[16],food[15],
            food[14],food[13],food[12],food[11],food[10],
            food[9],food[8],food[7],food[6],food[5],
            food[4],food[3],food[2],food[1],food[0]} <=food_default;

             {walls[29],walls[28],walls[27],walls[26],walls[25],
               walls[24],walls[23],walls[22],walls[21],walls[20],
               walls[19],walls[18],walls[17],walls[16],walls[15],
               walls[14],walls[13],walls[12],walls[11],walls[10],
               walls[9],walls[8],walls[7],walls[6],walls[5],
               walls[4],walls[3],walls[2],walls[1],walls[0]} <=  walls_default;

        end
        else begin
            if(up & ~up_prev) index_y<=(index_y>0) ? index_y-1 : 29;
            else if(down & ~down_prev) index_y<=(index_y < 29) ? index_y+1: 0;
            else if(right & ~right_prev) index_x<=(index_x < 18) ? index_x+1 : 0;
            else if(left & ~left_prev) index_x<=(index_x>0) ? index_x-1 : 18;
            
            else if(select & ~select_prev & ~(index_blocked)) begin
                if(~walls[index_y][index_x] && ~(|food_atindex))begin
                    walls[index_y][index_x]<=1;
                end
                else if(walls[index_y][index_x])begin
                    walls[index_y][index_x]<=0;
                    {food[index_y][{index_x,2'd3}], food[index_y][{index_x,2'd2}], food[index_y][{index_x,2'd1}], food[index_y][{index_x,2'd0}]}<=1;
                end
                else if(food_atindex<7) begin
                   {food[index_y][{index_x,2'd3}], food[index_y][{index_x,2'd2}], food[index_y][{index_x,2'd1}], food[index_y][{index_x,2'd0}]}<=food_atindex+1; 
                end
                else begin
                    {food[index_y][{index_x,2'd3}], food[index_y][{index_x,2'd2}], food[index_y][{index_x,2'd1}], food[index_y][{index_x,2'd0}]}<=0;
                end
            end
        end
        
    end
endmodule
