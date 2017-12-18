`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2017 10:03:08 AM
// Design Name: 
// Module Name: game_menu
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


module game_menu(
    input clk, rset,
    input [10:0] hcount,
    input [9:0] vcount,
    input [5:0] controls,
    output [11:0] pixel,
    output reg [1:0] state
    );
    
    wire left, right, up, down, A, B;
    assign {A, B, left, right, up, down} = controls;
    reg A_prev, B_prev, right_prev, left_prev, up_prev, down_prev;
    wire [11:0] letter_g1, letter_a1, letter_m1, letter_e1, letter_m2, letter_e2, letter_n1, letter_u1, title, pacman_pixel;
        assign title = letter_g1|letter_a1|letter_m1|letter_e1|letter_m2|letter_e2|letter_n1|letter_u1|pacman_pixel;
        wire [9:0] title_y = 5<<4;
        wire [10:0] title_x = 240; 
        letter_g (.clk(clk),.hcount(hcount),.vcount(vcount),
                    .x(title_x),.y(title_y),
                    .pixel(letter_g1) );
         letter_a (.clk(clk),.hcount(hcount),.vcount(vcount),
                   .x(title_x+16),.y(title_y),
                   .pixel(letter_a1) );
         letter_m (.clk(clk),.hcount(hcount),.vcount(vcount),
                  .x(title_x+32),.y(title_y),
                  .pixel(letter_m1) );
         letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                 .x(title_x+48),.y(title_y),
                 .pixel(letter_e1) );
         letter_m (.clk(clk),.hcount(hcount),.vcount(vcount),
                    .x(title_x+80),.y(title_y),
                    .pixel(letter_m2) );
         letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                   .x(title_x+96),.y(title_y),
                   .pixel(letter_e2) );
         letter_n (.clk(clk),.hcount(hcount),.vcount(vcount),
                  .x(title_x+112),.y(title_y),
                  .pixel(letter_n1) );
         letter_u (.clk(clk),.hcount(hcount),.vcount(vcount),
                     .x(title_x + 128),.y(title_y),
                     .pixel(letter_u1) ); 

          
          localparam [10:0] button_x=198;
          localparam [7:0] BUTTON_WIDTH = 255;
          localparam [7:0] BUTTON_HEIGHT = 32;
          localparam [9:0] button1_y=144;
                     
          wire [11:0] box1, button1;
          wire [11:0] letter_o21, letter_r21, letter_i21, letter_g21, letter_i22, letter_n21, letter_a21, letter_l21, 
                        letter_l22, letter_e21, letter_v21, letter_e22, letter_l23;
          assign button1 = box1|letter_o21|letter_r21|letter_i21|letter_g21|letter_i22|letter_n21|letter_a21|letter_l21| 
                                            letter_l22|letter_e21|letter_v21|letter_e22|letter_l23;
      
          wire [9:0] option1_y = button1_y + ((BUTTON_HEIGHT - 8)/2);
          wire [10:0] option1_x = button_x+16; 
          
          letter_o (.clk(clk),.hcount(hcount),.vcount(vcount),
                      .x(option1_x),.y(option1_y),
                      .pixel(letter_o21) );
           letter_r (.clk(clk),.hcount(hcount),.vcount(vcount),
                     .x(option1_x+16),.y(option1_y),
                     .pixel(letter_r21) );
           letter_i (.clk(clk),.hcount(hcount),.vcount(vcount),
                      .x(option1_x+32),.y(option1_y),
                      .pixel(letter_i21) );
           letter_g (.clk(clk),.hcount(hcount),.vcount(vcount),
                    .x(option1_x+48),.y(option1_y),
                    .pixel(letter_g21) );
           letter_i (.clk(clk),.hcount(hcount),.vcount(vcount),
                   .x(option1_x+64),.y(option1_y),
                   .pixel(letter_i22) );
           letter_n (.clk(clk),.hcount(hcount),.vcount(vcount),
                      .x(option1_x+80),.y(option1_y),
                      .pixel(letter_n21) );
           letter_a (.clk(clk),.hcount(hcount),.vcount(vcount),
                    .x(option1_x + 96),.y(option1_y),
                    .pixel(letter_a21) );
           letter_l (.clk(clk),.hcount(hcount),.vcount(vcount),
                       .x(option1_x+112),.y(option1_y),
                       .pixel(letter_l21) ); 
                       
           letter_l (.clk(clk),.hcount(hcount),.vcount(vcount),
                      .x(option1_x+144),.y(option1_y),
                      .pixel(letter_l22) );
           letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                     .x(option1_x+160),.y(option1_y),
                     .pixel(letter_e21) );  
           letter_v (.clk(clk),.hcount(hcount),.vcount(vcount),
                    .x(option1_x+176),.y(option1_y),
                    .pixel(letter_v21) ); 
           letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                       .x(option1_x+192),.y(option1_y),
                       .pixel(letter_e22) ); 
           letter_l (.clk(clk),.hcount(hcount),.vcount(vcount),
                      .x(option1_x+208),.y(option1_y),
                      .pixel(letter_l23) ); 
                      
                      
          wire [11:0] colour1 = 12'h0AA;  
          box(.clk(clk),.width(BUTTON_WIDTH),.height(BUTTON_HEIGHT),
              .color(colour1),
              .x(button_x),.hcount(hcount),
              .y(button1_y),.vcount(vcount),
              .pixel(box1)
              ); 
              
          wire [11:0] box2, button2;
          wire [9:0] button2_y = 244;
          wire [11:0] letter_c31, letter_u31, letter_s31, letter_t31, letter_o31, letter_m31, 
                             letter_l32, letter_e31, letter_v31, letter_e32, letter_l33;
           assign button2 = box2|letter_c31|letter_u31|letter_s31|letter_t31|letter_o31|letter_m31 
                            |letter_l32|letter_e31|letter_v31|letter_e32|letter_l33;
          
          wire [9:0] option2_y = button2_y + ((BUTTON_HEIGHT - 8)/2);
          wire [10:0] option2_x = button_x+32;
          
          letter_c (.clk(clk),.hcount(hcount),.vcount(vcount),
                        .x(option2_x),.y(option2_y),
                        .pixel(letter_c31) );
             letter_u (.clk(clk),.hcount(hcount),.vcount(vcount),
                       .x(option2_x+16),.y(option2_y),
                       .pixel(letter_u31) );
             letter_s (.clk(clk),.hcount(hcount),.vcount(vcount),
                        .x(option2_x+32),.y(option2_y),
                        .pixel(letter_s31) );
             letter_t (.clk(clk),.hcount(hcount),.vcount(vcount),
                      .x(option2_x+48),.y(option2_y),
                      .pixel(letter_t31) );
             letter_o (.clk(clk),.hcount(hcount),.vcount(vcount),
                     .x(option2_x+64),.y(option2_y),
                     .pixel(letter_o31) );
             letter_m (.clk(clk),.hcount(hcount),.vcount(vcount),
                        .x(option2_x+80),.y(option2_y),
                        .pixel(letter_m31) );
    
                         
             letter_l (.clk(clk),.hcount(hcount),.vcount(vcount),
                        .x(option2_x+112),.y(option2_y),
                        .pixel(letter_l32) );
             letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                       .x(option2_x+128),.y(option2_y),
                       .pixel(letter_e31) );  
             letter_v (.clk(clk),.hcount(hcount),.vcount(vcount),
                      .x(option2_x+144),.y(option2_y),
                      .pixel(letter_v31) ); 
             letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                         .x(option2_x+160),.y(option2_y),
                         .pixel(letter_e32) ); 
             letter_l (.clk(clk),.hcount(hcount),.vcount(vcount),
                        .x(option2_x+176),.y(option2_y),
                        .pixel(letter_l33) );
           wire [11:0] colour2 = 12'hB6F;  
           box(.clk(clk),.width(BUTTON_WIDTH),.height(BUTTON_HEIGHT),
               .color(colour2),
               .x(button_x),.hcount(hcount),
               .y(244),.vcount(vcount),
               .pixel(box2)
               ); 
               
          wire [11:0] box3, button3;
          wire [11:0] letter_b41, letter_u41, letter_i41, letter_l41, letter_d41, letter_e43, letter_r41,
                                   letter_l42, letter_e41, letter_v41, letter_e42, letter_l43;
          assign button3 = box3|letter_b41|letter_u41|letter_i41|letter_l41|letter_d41|letter_e43|letter_r41|
                              letter_l42|letter_e41|letter_v41|letter_e42|letter_l43;
         
          wire [9:0] button3_y = 344;
          wire [9:0] option3_y = button3_y + ((BUTTON_HEIGHT - 8)/2);
          wire [10:0] option3_x = button_x+24; 
          
          
          letter_l (.clk(clk),.hcount(hcount),.vcount(vcount),
                         .x(option3_x),.y(option3_y),
                         .pixel(letter_l42) );
         letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                          .x(option3_x+16),.y(option3_y),
                          .pixel(letter_e41) );  
         letter_v (.clk(clk),.hcount(hcount),.vcount(vcount),
                           .x(option3_x+32),.y(option3_y),
                           .pixel(letter_v41) ); 
         letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                              .x(option3_x+48),.y(option3_y),
                              .pixel(letter_e42) ); 
         letter_l (.clk(clk),.hcount(hcount),.vcount(vcount),
                             .x(option3_x+64),.y(option3_y),
                             .pixel(letter_l43) );
         
         letter_b (.clk(clk),.hcount(hcount),.vcount(vcount),
                             .x(option3_x + 96 ),.y(option3_y),
                             .pixel(letter_b41) );
         letter_u (.clk(clk),.hcount(hcount),.vcount(vcount),
                            .x(option3_x+112),.y(option3_y),
                            .pixel(letter_u41) );
         letter_i (.clk(clk),.hcount(hcount),.vcount(vcount),
                             .x(option3_x+128),.y(option3_y),
                             .pixel(letter_i41) );
         letter_l (.clk(clk),.hcount(hcount),.vcount(vcount),
                           .x(option3_x+144),.y(option3_y),
                           .pixel(letter_l41) );
         letter_d (.clk(clk),.hcount(hcount),.vcount(vcount),
                          .x(option3_x+160),.y(option3_y),
                          .pixel(letter_d41) );
          letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                             .x(option3_x+176),.y(option3_y),
                             .pixel(letter_e43) );
          letter_r (.clk(clk),.hcount(hcount),.vcount(vcount),
                             .x(option3_x+192),.y(option3_y),
                             .pixel(letter_r41) );
                             
          wire [11:0] colour3 = 12'hF33;  
          box(.clk(clk),.width(BUTTON_WIDTH),.height(BUTTON_HEIGHT),
             .color(colour3),
             .x(button_x),.hcount(hcount),
             .y(button3_y),.vcount(vcount),
             .pixel(box3)
             ); 
       wire [10:0] indicator1_x = button_x-16;
       wire [10:0] indicator2_x = button_x+BUTTON_WIDTH;
       wire [9:0] indicator_y = (istate == BUTTON2) ? button2_y+8 :(istate == BUTTON3) ? button3_y+8 : button1_y+8;
       wire [11:0] indicator1_pixel, indicator2_pixel;
       cherry(.clk(clk),
                 .x(indicator1_x),.hcount(hcount),
                 .y(indicator_y ),.vcount(vcount),
                 .pixel(indicator1_pixel)
                 ); 
        cherry(.clk(clk),
              .x(indicator2_x),.hcount(hcount),
              .y(indicator_y ),.vcount(vcount),
              .pixel(indicator2_pixel)
              );   

       localparam [1:0] MENU = 2'd0;
       localparam [1:0] DEFAULT_LEVEL = 2'd1;
       localparam [1:0] CUSTOM_LEVEL = 2'd2;
       localparam [1:0] LEVEL_BUILDER = 2'd3;
       reg [1:0] istate;
       localparam [1:0] BUTTON1 = 2'd0;
       localparam [1:0] BUTTON2 = 2'd1;
       localparam [1:0] BUTTON3 = 2'd2;
       localparam [1:0] HOLD = 2'd3;
          
       always @(posedge clk) begin
            up_prev<=up;
            down_prev<=down;
            right_prev<=right;
            left_prev<=left;
            A_prev<=A;
            B_prev<=B;
            if(rset) begin
                istate<=0;
                state<=0;
            end
            if(state == MENU) begin
                if(up & ~up_prev) istate<= (istate ==BUTTON1) ? BUTTON3 : istate-1;
                if(down & ~down_prev) istate<= (istate ==BUTTON3) ? BUTTON1 : istate+1;
                if (A & ~A_prev)begin
                    case(istate)
                        BUTTON1: state<=DEFAULT_LEVEL;
                        BUTTON2: state<=CUSTOM_LEVEL;
                        BUTTON3: state<=LEVEL_BUILDER;
                        default: state<=MENU;                
                    endcase
                end
            end 
            else begin
                if (B & ~B_prev) begin
                     state<=MENU;
                     istate<=BUTTON1;  
                end
                else istate<=HOLD;
            end
       
       
       end                         
    assign pixel = title|button1|button2|button3|indicator1_pixel|indicator2_pixel;
endmodule
