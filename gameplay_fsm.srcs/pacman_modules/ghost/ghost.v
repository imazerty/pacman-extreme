`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2017 10:13:42 PM
// Design Name: 
// Module Name: ghost
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


module ghost #(
    parameter DOWN = 4'b0001,
    parameter UP = 4'b0010,
    parameter RIGHT = 4'b0100,
    parameter LEFT = 4'b1000
    ) (
    input clk,
    input reset,
    input [10:0] hcount,
    input [9:0] vcount,
    input [10:0] x,
    input [9:0] y,
    input start, // resets the ghost to its "going" state
    input scared, // scares the ghost when it goes high
    input [2:0] scared_time, // time in seconds the ghost is scared
    input [2:0] flashes, // number of times the ghost flashes
    input [3:0] direction, // the direction the ghost is facing
    input caught, // catches the ghost, turning it into eyes, when it goes high
    input hidden, // hides the ghost
    input [11:0] color,
    output reg [11:0] pixel,
    output [2:0] flash_count,
    output done_being_scared // goes high when the ghost is done begin scared
    );
    
    reg [1:0] state = 0;
    localparam GOING = 0;
    localparam SCARED = 1;
    localparam EYES = 2;

    
    reg [20:0] graphics_counter;
    reg triangle_graphics;
        
    wire [11:0] scared_ghost_pixel;
    scared_ghost sg(.clk(clk), 
        .reset(reset), 
        .x(x), 
        .y(y), 
        .hcount(hcount + 2), 
        .vcount(vcount), 
        .triangle_graphics(triangle_graphics),
        .scared(scared),
        .scared_time(scared_time), 
        .flashes(flashes), 
        .pixel(scared_ghost_pixel),
        .flash_count(flash_count),
        .done(done_being_scared)
        );
        
    wire [11:0] ghost_down_rectangle_pixel, ghost_down_triangle_pixel, ghost_right_rectangle_pixel, ghost_right_triangle_pixel, ghost_left_rectangle_pixel, ghost_left_triangle_pixel, ghost_up_triangle_pixel, ghost_up_rectangle_pixel;
    ghost_down_rectangle gdr(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .color(color), .pixel(ghost_down_rectangle_pixel));
    ghost_down_triangle gdt(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .color(color), .pixel(ghost_down_triangle_pixel));
    ghost_right_rectangle grr(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .color(color), .pixel(ghost_right_rectangle_pixel));    
    ghost_right_triangle grt(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .color(color), .pixel(ghost_right_triangle_pixel));    
    ghost_left_rectangle glr(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .color(color), .pixel(ghost_left_rectangle_pixel));    
    ghost_left_triangle glt(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .color(color), .pixel(ghost_left_triangle_pixel));    
    ghost_up_rectangle gur(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .color(color), .pixel(ghost_up_rectangle_pixel));    
    ghost_up_triangle gut(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .color(color), .pixel(ghost_up_triangle_pixel));    

    wire [11:0] ghost_eyes_down_pixel, ghost_eyes_up_pixel, ghost_eyes_right_pixel, ghost_eyes_left_pixel;
    ghost_eyes_down ged(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .pixel(ghost_eyes_down_pixel));
    ghost_eyes_up geu(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .pixel(ghost_eyes_up_pixel));
    ghost_eyes_left gel(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .pixel(ghost_eyes_left_pixel));
    ghost_eyes_right ger(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount + 1), .vcount(vcount), .pixel(ghost_eyes_right_pixel));

    always @(posedge clk) begin
        graphics_counter <= graphics_counter + 1;
        if (graphics_counter == 0) triangle_graphics <= !triangle_graphics;
            
        if (hidden) begin
            if (hcount > x && hcount < x + 16 && vcount > y && vcount < y + 16) pixel <= 12'h000;
        end else begin
            case (state)
                GOING: begin
                    if (scared) state <= SCARED;
                
                    case (direction)
                        DOWN: begin
                            if (triangle_graphics) pixel <= ghost_down_triangle_pixel;
                            else pixel <= ghost_down_rectangle_pixel;
                        end
                        RIGHT: begin
                            if (triangle_graphics) pixel <= ghost_right_triangle_pixel;
                            else pixel <= ghost_right_rectangle_pixel;
                        end
                        LEFT: begin
                            if (triangle_graphics) pixel <= ghost_left_triangle_pixel;
                            else pixel <= ghost_left_rectangle_pixel;
                        end
                        UP: begin
                            if (triangle_graphics) pixel <= ghost_up_triangle_pixel;
                            else pixel <= ghost_up_rectangle_pixel;
                        end
                        default: begin
                            if (triangle_graphics) pixel <= ghost_right_triangle_pixel;
                            else pixel <= ghost_right_rectangle_pixel;
                        end
                    endcase
                end
                SCARED: begin
                    pixel <= scared_ghost_pixel;
                    if (caught) state <= EYES;
                    else if (done_being_scared) state <= GOING;
                end
                EYES: begin
                    if (start) state <= GOING;
                    case (direction)
                        DOWN: pixel <= ghost_eyes_down_pixel;
                        RIGHT: pixel <= ghost_eyes_right_pixel;
                        LEFT:  pixel <= ghost_eyes_left_pixel;
                        UP: pixel <= ghost_eyes_up_pixel;
                        default: pixel <= ghost_eyes_right_pixel;
                    endcase
                end
                default: begin
                    state <= GOING;
                    if (triangle_graphics) pixel <= ghost_down_triangle_pixel;
                    else pixel <= ghost_down_rectangle_pixel;
                end
            endcase
        end
    end
    
endmodule
