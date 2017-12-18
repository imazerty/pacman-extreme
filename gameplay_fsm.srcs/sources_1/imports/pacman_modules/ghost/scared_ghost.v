`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2017 10:21:32 PM
// Design Name: 
// Module Name: scared_ghost
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


module scared_ghost(
    input clk,
    input reset,
    input [10:0] hcount,
    input [9:0] vcount,
    input [10:0] x,
    input [9:0] y,
    input triangle_graphics,
    input scared,
    input [2:0] scared_time,
    input [2:0] flashes,
    output reg [11:0] pixel,
    output reg [2:0] flash_count,
    output reg done // goes high when the ghost has finished its scared sequence
    );
    
    wire [11:0] scared_blue_triangle_pixel, scared_blue_rectangle_pixel, scared_white_triangle_pixel, scared_white_rectangle_pixel;
    ghost_scared_blue_triangle gsbt(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount), .vcount(vcount), .pixel(scared_blue_triangle_pixel));
    ghost_scared_blue_rectangle gsbr(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount), .vcount(vcount), .pixel(scared_blue_rectangle_pixel));
    ghost_scared_white_triangle gswt(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount), .vcount(vcount), .pixel(scared_white_triangle_pixel));
    ghost_scared_white_rectangle gswr(.clk(clk), .reset(reset), .x(x), .y(y), .hcount(hcount), .vcount(vcount), .pixel(scared_white_rectangle_pixel));
    
    wire one_hz_enable;
    reg one_hz_divider_reset;
    divider_kim one_hz_divider(.clk_25mhz(clk), .reset(one_hz_divider_reset), .interval_enable(one_hz_enable));
    
    wire quarter_second_enable;
    reg quarter_second_divider_reset;
    divider_kim #(.SKIP_CYCLES(6_250_000)) quarter_second_divider(.clk_25mhz(clk), .reset(quarter_second_divider_reset), .interval_enable(quarter_second_enable));
    
    reg [2:0] state;
    reg [2:0] scared_time_count;
    
    localparam HOLDING = 3'b000;
    localparam SOLID_BLUE = 3'b001;
    localparam FLASHING_BLUE = 3'b010;
    localparam FLASHING_WHITE = 3'b100;
    
    always @(posedge clk) begin
        case (state)
            HOLDING: begin
                done <= 0;
                one_hz_divider_reset <= 1;
                quarter_second_divider_reset <= 1;
                scared_time_count <= 0;
                flash_count <= 0;
                if (scared) state <= SOLID_BLUE;
                
                if (triangle_graphics) pixel <= scared_blue_triangle_pixel;
                else pixel <= scared_blue_rectangle_pixel;
            end
            SOLID_BLUE: begin
                done <= 0;
                one_hz_divider_reset <= 0;
                quarter_second_divider_reset <= 1;
                flash_count <= 0;
                if (scared_time_count == scared_time) state <= FLASHING_BLUE;
                else if (one_hz_enable) scared_time_count <= scared_time_count + 1;
            
                if (triangle_graphics) pixel <= scared_blue_triangle_pixel;
                else pixel <= scared_blue_rectangle_pixel;
            end
            FLASHING_BLUE: begin
                one_hz_divider_reset <= 1;
                quarter_second_divider_reset <= 0;
                scared_time_count <= 0;
                
                if (flash_count == flashes) begin
                    done <= 1;
                    state <= HOLDING;
                end
                else if (quarter_second_enable) begin
                    state <= FLASHING_WHITE;
                    flash_count <= flash_count + 1;
                end
                
                if (triangle_graphics) pixel <= scared_blue_triangle_pixel;
                else pixel <= scared_blue_rectangle_pixel;
            end
            FLASHING_WHITE: begin
                one_hz_divider_reset <= 1;
                quarter_second_divider_reset <= 0;
                scared_time_count <= 0;
                                
                if (flash_count == flashes) begin
                    done <= 1;
                    state <= HOLDING;
                end
                else if (quarter_second_enable) begin
                    state <= FLASHING_BLUE;
                    flash_count <= flash_count + 1;
                end
                
                if (triangle_graphics) pixel <= scared_white_triangle_pixel;
                else pixel <= scared_white_rectangle_pixel;
            end
            default: begin
                one_hz_divider_reset <= 0;
                quarter_second_divider_reset <= 0;
                state <= HOLDING;
                scared_time_count <= 0;
                flash_count <= 0;
                pixel <= 12'hFFF;
                done <= 0;
            end
        endcase
    end
    
endmodule
