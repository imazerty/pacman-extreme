`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2017 02:45:39 PM
// Design Name: 
// Module Name: pacman
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


module pacman #(
    parameter DOWN = 4'b0001,
    parameter UP = 4'b0010,
    parameter RIGHT = 4'b0100,
    parameter LEFT = 4'b1000
    ) (
    input clk,
    input reset,
    input [10:0] hcount,
    input [9:0] vcount,
    input hsync,
    input vsync,
    input [10:0] x,
    input [9:0] y,
    input [3:0] direction, // the direction pacman is facing
    input start, // putting start high when pacman is waiting to begin or dead will reset pacman
    input dead, // putting dead high will make pacman perform the death sequence
    output reg [11:0] pixel
    );
    
    // overall state of pacman
    reg [2:0] state = 0;
    localparam HOLDING = 0;
    localparam PLAYING = 1;
    localparam START_DYING = 2;
    localparam DYING = 3;
    localparam DEAD = 4;
    
    wire eighth_second_enable;
    reg eighth_second_divider_reset;
    divider_kim #(.SKIP_CYCLES(3_125_000)) eighth_second_divider(.clk_25mhz(clk), .reset(eighth_second_divider_reset), .interval_enable(eighth_second_enable));

    reg inner_graphics = 0;
    reg [6:0] graphics_counter = 0;
    
    reg [4:0] dying_state = 4'b0000;
    reg [4:0] next_dying_state = 4'b0000;
    
    localparam DYING1 = 1;
    localparam DYING2 = 2;
    localparam DYING3 = 3;
    localparam DYING4 = 4;
    localparam DYING5 = 5;
    localparam DYING6 = 6;
    localparam DYING7 = 7;
    localparam DYING8 = 8;
    localparam DYING9 = 9;
    localparam DYING10 = 10;
    localparam DYING11 = 11;
    localparam DYINGDONE = 12;
    
    wire [11:0] pacman_dying1_pixel, pacman_dying2_pixel, pacman_dying3_pixel, pacman_dying4_pixel, pacman_dying5_pixel, pacman_dying6_pixel, pacman_dying7_pixel, pacman_dying8_pixel, pacman_dying9_pixel, pacman_dying10_pixel, pacman_dying11_pixel;
    pacman_dying1 pd1(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying1_pixel));
    pacman_dying2 pd2(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying2_pixel));
    pacman_dying3 pd3(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying3_pixel));
    pacman_dying4 pd4(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying4_pixel));
    pacman_dying5 pd5(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying5_pixel));
    pacman_dying6 pd6(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying6_pixel));
    pacman_dying7 pd7(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying7_pixel));
    pacman_dying8 pd8(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying8_pixel));
    pacman_dying9 pd9(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying9_pixel));
    pacman_dying10 pd10(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying10_pixel));
    pacman_dying11 pd11(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_dying11_pixel));
    
    reg [3:0] mouth_state = 3'b000;
    reg [3:0] next_mouth_state = 3'b000;
    reg [20:0] mouth_counter = 0;
    
    localparam MOUTHOPEN      = 3'b000;
    localparam MOUTH1_OPENING = 3'b001;
    localparam MOUTH2_OPENING = 3'b011;
    localparam MOUTH3_OPENING = 3'b010;
    localparam MOUTHCLOSED    = 3'b110;
    localparam MOUTH3_CLOSING = 3'b100;
    localparam MOUTH2_CLOSING = 3'b101;
    localparam MOUTH1_CLOSING = 3'b111;
    
    wire [11:0] pacman_mouthclosed_pixel;
    pacman_mouthclosed pmc(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_mouthclosed_pixel));
    
    wire [11:0] pacman_down_mouthopen_pixel, pacman_down_mouth1_pixel, pacman_down_mouth2_pixel, pacman_down_mouth3_pixel;
    pacman_down_mouthopen pdm0(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_down_mouthopen_pixel));
    pacman_down_mouth1 pdm1(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_down_mouth1_pixel));
    pacman_down_mouth2 pdm2(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_down_mouth2_pixel));
    pacman_down_mouth3 pdm3(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_down_mouth3_pixel));    

    wire [11:0] pacman_up_mouthopen_pixel, pacman_up_mouth1_pixel, pacman_up_mouth2_pixel, pacman_up_mouth3_pixel;
    pacman_up_mouthopen pum0(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_up_mouthopen_pixel));
    pacman_up_mouth1 pum1(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_up_mouth1_pixel));
    pacman_up_mouth2 pum2(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_up_mouth2_pixel));
    pacman_up_mouth3 pum3(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_up_mouth3_pixel));    
    
    wire [11:0] pacman_right_mouthopen_pixel, pacman_right_mouth1_pixel, pacman_right_mouth2_pixel, pacman_right_mouth3_pixel;
    pacman_right_mouthopen prm0(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_right_mouthopen_pixel));
    pacman_right_mouth1 prm1(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_right_mouth1_pixel));
    pacman_right_mouth2 prm2(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_right_mouth2_pixel));
    pacman_right_mouth3 prm3(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_right_mouth3_pixel));    
    
    wire [11:0] pacman_left_mouthopen_pixel, pacman_left_mouth1_pixel, pacman_left_mouth2_pixel, pacman_left_mouth3_pixel;
    pacman_left_mouthopen plm0(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_left_mouthopen_pixel));
    pacman_left_mouth1 plm1(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_left_mouth1_pixel));
    pacman_left_mouth2 plm2(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_left_mouth2_pixel));
    pacman_left_mouth3 plm3(.clk(clk), .reset(reset), .inner_graphics(inner_graphics), .hcount(hcount + 1), .vcount(vcount), .x(x), .y(y), .pixel(pacman_left_mouth3_pixel));    
    
    always @(*) begin
        case (mouth_state)
            MOUTHOPEN: next_mouth_state <= MOUTH1_CLOSING;
            MOUTH1_CLOSING: next_mouth_state <= MOUTH2_CLOSING;
            MOUTH2_CLOSING: next_mouth_state <= MOUTH3_CLOSING;
            MOUTH3_CLOSING: next_mouth_state <= MOUTHCLOSED;
            MOUTHCLOSED: next_mouth_state <= MOUTH3_OPENING;
            MOUTH3_OPENING: next_mouth_state <= MOUTH2_OPENING;
            MOUTH2_OPENING: next_mouth_state <= MOUTH1_OPENING;
            MOUTH1_OPENING: next_mouth_state <= MOUTHOPEN;
            default: next_mouth_state <= MOUTHOPEN;
        endcase
        
        case (dying_state)
            DYING1: next_dying_state <= DYING2;
            DYING2: next_dying_state <= DYING3;
            DYING3: next_dying_state <= DYING4;
            DYING4: next_dying_state <= DYING5;
            DYING5: next_dying_state <= DYING6;
            DYING6: next_dying_state <= DYING7;
            DYING7: next_dying_state <= DYING8;
            DYING8: next_dying_state <= DYING9;
            DYING9: next_dying_state <= DYING10;
            DYING10: next_dying_state <= DYING11;
            DYING11: next_dying_state <= DYINGDONE;
            DYINGDONE: next_dying_state <= DYING1;
            default: next_dying_state <= DYING1;
        endcase
    end
    
    always @(posedge clk) begin
    
        if (graphics_counter == 0) inner_graphics <= !inner_graphics;
        graphics_counter <= graphics_counter + 1;
        mouth_counter <= mouth_counter + 1;
        
        if (mouth_counter == 0) mouth_state <= next_mouth_state;
    
        case (state)
            HOLDING: begin
                if (start) state <= PLAYING;
                if (dead) state <= START_DYING;
                pixel <= pacman_right_mouthopen_pixel;
            end
            PLAYING: begin
                if (dead) state <= START_DYING;
                
                case (mouth_state)
                    MOUTHOPEN: begin
                        if (direction == DOWN) pixel <= pacman_down_mouthopen_pixel;
                        else if (direction == UP) pixel <= pacman_up_mouthopen_pixel;
                        else if (direction == LEFT) pixel <= pacman_left_mouthopen_pixel;
                        else if (direction == RIGHT) pixel <= pacman_right_mouthopen_pixel;
                        else pixel <= pacman_right_mouthopen_pixel;
                    end
                    MOUTH1_CLOSING: begin
                        if (direction == DOWN) pixel <= pacman_down_mouth1_pixel;
                        else if (direction == UP) pixel <= pacman_up_mouth1_pixel;
                        else if (direction == LEFT) pixel <= pacman_left_mouth1_pixel;
                        else if (direction == RIGHT) pixel <= pacman_right_mouth1_pixel;
                        else pixel <= pacman_right_mouth1_pixel;
                    end
                    MOUTH2_CLOSING: begin
                        if (direction == DOWN) pixel <= pacman_down_mouth2_pixel;
                        else if (direction == UP) pixel <= pacman_up_mouth2_pixel;
                        else if (direction == LEFT) pixel <= pacman_left_mouth2_pixel;
                        else if (direction == RIGHT) pixel <= pacman_right_mouth2_pixel;
                        else pixel <= pacman_right_mouth2_pixel;
                    end
                    MOUTH3_CLOSING: begin
                        if (direction == DOWN) pixel <= pacman_down_mouth3_pixel;
                        else if (direction == UP) pixel <= pacman_up_mouth3_pixel;
                        else if (direction == LEFT) pixel <= pacman_left_mouth3_pixel;
                        else if (direction == RIGHT) pixel <= pacman_right_mouth3_pixel;
                        else pixel <= pacman_right_mouth3_pixel;
                    end
                    MOUTHCLOSED: begin
                        pixel <= pacman_mouthclosed_pixel;
                    end
                    MOUTH3_OPENING: begin
                        if (direction == DOWN) pixel <= pacman_down_mouth3_pixel;
                        else if (direction == UP) pixel <= pacman_up_mouth3_pixel;
                        else if (direction == LEFT) pixel <= pacman_left_mouth3_pixel;
                        else if (direction == RIGHT) pixel <= pacman_right_mouth3_pixel;
                        else pixel <= pacman_right_mouth3_pixel;
                    end
                    MOUTH2_OPENING: begin
                        if (direction == DOWN) pixel <= pacman_down_mouth2_pixel;
                        else if (direction == UP) pixel <= pacman_up_mouth2_pixel;
                        else if (direction == LEFT) pixel <= pacman_left_mouth2_pixel;
                        else if (direction == RIGHT) pixel <= pacman_right_mouth2_pixel;
                        else pixel <= pacman_right_mouth2_pixel;
                    end
                    MOUTH1_OPENING: begin
                        if (direction == DOWN) pixel <= pacman_down_mouth1_pixel;
                        else if (direction == UP) pixel <= pacman_up_mouth1_pixel;
                        else if (direction == LEFT) pixel <= pacman_left_mouth1_pixel;
                        else if (direction == RIGHT) pixel <= pacman_right_mouth1_pixel;
                        else pixel <= pacman_right_mouth1_pixel;
                    end
                    default: pixel <= pacman_right_mouthopen_pixel;
                endcase // end mouth case
            end // end PLAYING block
            START_DYING: begin
                eighth_second_divider_reset <= 1;
                pixel <= pacman_dying1_pixel;
                dying_state <= DYING1;
                state <= DYING;
            end
            DYING: begin
                eighth_second_divider_reset <= 0;
                if (eighth_second_enable) dying_state <= next_dying_state;
                if (dying_state == DYINGDONE) state <= DEAD;

                case (dying_state)
                    DYING1: pixel <= pacman_dying1_pixel;
                    DYING2: pixel <= pacman_dying2_pixel;
                    DYING3: pixel <= pacman_dying3_pixel;
                    DYING4: pixel <= pacman_dying4_pixel;
                    DYING5: pixel <= pacman_dying5_pixel;
                    DYING6: pixel <= pacman_dying6_pixel;
                    DYING7: pixel <= pacman_dying7_pixel;
                    DYING8: pixel <= pacman_dying8_pixel;
                    DYING9: pixel <= pacman_dying9_pixel;
                    DYING10: pixel <= pacman_dying10_pixel;
                    DYING11: pixel <= pacman_dying11_pixel;
                    default: pixel <= pacman_dying1_pixel;
                endcase
            end
            DEAD: begin
                if (hcount > x && hcount < x + 16 && vcount > y && vcount < y + 16) pixel <= 12'h000;
                if (start) state <= PLAYING;
            end
            default: begin
                pixel <= pacman_right_mouthopen_pixel;
                state <= HOLDING;
            end
            endcase
        end
endmodule
