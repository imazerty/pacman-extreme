`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Updated 9/29/2017 V2.0
// Create Date: 10/1/2015 V1.0
// Design Name: 
// Module Name: labkit
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


module labkit(
   input CLK100MHZ,
   input[15:0] SW, 
   input BTNC, BTNU, BTNL, BTNR, BTND,
   output[3:0] VGA_R, 
   output[3:0] VGA_B, 
   output[3:0] VGA_G,
   inout[7:0] JA, 
   output VGA_HS, 
   output VGA_VS, 
   output LED16_B, LED16_G, LED16_R,
   output LED17_B, LED17_G, LED17_R,
   output[15:0] LED,
   output[7:0] SEG,  // segments A-G (0-6), DP (7)
   output[7:0] AN    // Display 0-7
   );
   

// create 25mhz system clock
    wire clock_25mhz;
    clock_quarter_divider clockgen(.clk100_mhz(CLK100MHZ), .clock_25mhz(clock_25mhz));

//  instantiate 7-segment display;  
    wire [31:0] data;
    wire [6:0] segments;
    display_8hex display(.clk(clock_25mhz),.data(data), .seg(segments), .strobe(AN));    
    assign SEG[6:0] = segments;
    assign SEG[7] = 1'b1;

//////////////////////////////////////////////////////////////////////////////////
//
//  remove these lines and insert your lab here

    //assign LED = SW;     
    //assign JA[7:0] = 8'b0;
    
    //assign LED16_R = BTNL;                  // left button -> red led
    //assign LED16_G = BTNC;                  // center button -> green led
    //assign LED16_B = BTNR;                  // right button -> blue led
    //assign LED17_R = BTNL;
   // assign LED17_G = BTNC;
   // assign LED17_B = BTNR; 



//
//////////////////////////////////////////////////////////////////////////////////




 
//////////////////////////////////////////////////////////////////////////////////
// sample Verilog to generate color bars
    
    wire [9:0] hcount;
    wire [9:0] vcount;
    wire hsync, vsync, at_display_area;
    reg vsync_prev;
    always @(posedge clock_25mhz) vsync_prev<=vsync;  //keeping track of vsync_prev to find falling and rising edges
    vga vga1(.vga_clock(clock_25mhz),.hcount(hcount),.vcount(vcount),
          .hsync(hsync),.vsync(vsync),.at_display_area(at_display_area));
    wire clk = clock_25mhz; //setting the system clock to 25MHz
    
    //Using center button as system reset
    wire reset;
    debounce centerbutton(.clock(clk), .noisy(BTNC),.clean(reset)); 
    
    // creating system state for different game modes
    wire [1:0] state;
    wire [11:0] menu_pixel;
    wire [5:0] menu_controls = {button_state1[7], button_state1[6],button_state1[1], button_state1[0], button_state1[3], button_state1[2]};
    game_menu(.clk(clk), .rset(system_rset),
                .hcount(hcount),.vcount(vcount),
                .controls(menu_controls),
                .pixel(menu_pixel),.state(state)
            );
    localparam [1:0] MENU = 2'd0;
    localparam [1:0] DEFAULT_LEVEL = 2'd1;
    localparam [1:0] CUSTOM_LEVEL = 2'd2;
    localparam [1:0] LEVEL_BUILDER = 2'd3;
    
    // creating defult map of walls and food. These are seperate to limit possiblity of walls diapearing in game
//    wire [79:0] food_default [29:0];
//    wire [19:0] walls_default [29:0];
      
//      assign food_default[0] = 80'h00000000000000000000;
//      assign food_default[1] = 80'h00611111111111111110;
//      assign food_default[2] = 80'h00100100000000010010;
//      assign food_default[3] = 80'h00100100000000010040;
//      assign food_default[4] = 80'h00111111111111111110;
//      assign food_default[5] = 80'h00000100000000010000;
//      assign food_default[6] = 80'h00000100000000010000;
//      assign food_default[7] = 80'h00121111100011111110;
//      assign food_default[8] = 80'h00100000100010000010;
//      assign food_default[9] = 80'h00101111117111111010;
//      assign food_default[10] =80'h00101000000000001010;
//      assign food_default[11] =80'h00101000000000001010;
//      assign food_default[12] =80'h00111000000000001110;
//      assign food_default[13] =80'h00101000000000001010;
//      assign food_default[14] =80'h00101000000000001010;
//      assign food_default[15] =80'h00101000000000001010;
//      assign food_default[16] =80'h00111111111111111110;
//      assign food_default[17] =80'h00100001001001000010;
//      assign food_default[18] =80'h0011111001001111110;
//      assign food_default[19] =80'h00100001006001000010;
//      assign food_default[20] =80'h00100001111111000010;
//      assign food_default[21] =80'h00100001000001000010;
//      assign food_default[22] =80'h00100001000001000010;
//      assign food_default[23] =80'h00111111000001110110;
//      assign food_default[24] =80'h00001010000000101000;
//      assign food_default[25] =80'h00001010000000101000;
//      assign food_default[26] =80'h00111111111111111110;
//      assign food_default[27] =80'h00100010001000100010;
//      assign food_default[28] =80'h00121111111111113110;
//      assign food_default[29] =80'h00000000000000000000;
      
//      assign walls_default[0] = 20'b01111111111111111111;
//      assign walls_default[1] = 20'b01000000000000000001;
//      assign walls_default[2] = 20'b01011011111111101101;
//      assign walls_default[3] = 20'b01011011111111101101;
//      assign walls_default[4] = 20'b01000000000000000001;
//      assign walls_default[5] = 20'b01111011111111101111;
//      assign walls_default[6] = 20'b01111011111111101111;
//      assign walls_default[7] = 20'b01000000011100000001;
//      assign walls_default[8] = 20'b01011111011101111101;
//      assign walls_default[9] = 20'b01010000000000000101;
//      assign walls_default[10] =20'b01010111110111110101;
//      assign walls_default[11] =20'b01010100000000010101;
//      assign walls_default[12] =20'b01000100000000010001;
//      assign walls_default[13] =20'b01010100000000010101;
//      assign walls_default[14] =20'b01010100000000010101;
//      assign walls_default[15] =20'b01010111111111110101;
//      assign walls_default[16] =20'b01000000000000000001;
//      assign walls_default[17] =20'b01011110110110111101;
//      assign walls_default[18] =20'b01000000110110000001;
//      assign walls_default[19] =20'b01011110110110111101;
//      assign walls_default[20] =20'b01011110000000111101;
//      assign walls_default[21] =20'b01011110111110111101;
//      assign walls_default[22] =20'b01011110111110111101;
//      assign walls_default[23] =20'b01000000111110000001;
//      assign walls_default[24] =20'b01110101111111010111;
//      assign walls_default[25] =20'b01110101111111010111;
//      assign walls_default[26] =20'b01000000000000000001;
//      assign walls_default[27] =20'b01011101110111011101;
//      assign walls_default[28] =20'b01000000000000000001;
//      assign walls_default[29] =20'b01111111111111111111;
      
//      // concatinating maps into single bus to pass to other modules
//     wire [2399:0] food_default_total = {food_default[29],food_default[28],food_default[27],food_default[26],food_default[25],
//                                          food_default[24],food_default[23],food_default[22],food_default[21],food_default[20],
//                                          food_default[19],food_default[18],food_default[17],food_default[16],food_default[15],
//                                          food_default[14],food_default[13],food_default[12],food_default[11],food_default[10],
//                                          food_default[9],food_default[8],food_default[7],food_default[6],food_default[5],
//                                          food_default[4],food_default[3],food_default[2],food_default[1],food_default[0]};
                                          
//     wire [599:0] walls_default_total = {walls_default[29],walls_default[28],walls_default[27],walls_default[26],walls_default[25],                        
//                                          walls_default[24],walls_default[23],walls_default[22],walls_default[21],walls_default[20],                          
//                                          walls_default[19],walls_default[18],walls_default[17],walls_default[16],walls_default[15],                          
//                                          walls_default[14],walls_default[13],walls_default[12],walls_default[11],walls_default[10],
//                                          walls_default[9],walls_default[8],walls_default[7],walls_default[6],walls_default[5],
//                                          walls_default[4],walls_default[3],walls_default[2],walls_default[1],walls_default[0]};      
                                          
    localparam [2399:0] food_default_param = 2400'h00000000000000000000_00121111111111113110_00100010001000100010_00111111111111111110_00001010000000101000_00001010000000101000_00111111000001110110_00100001000001000010_00100001000001000010_00100001111111000010_00100001006001000010_00111111001001111110_00100001001001000010_00111111111111111110_00101000000000001010_00101000000000001010_00101000000000001010_00111000000000001110_00101000000000001010_00101000000000001010_00101111117111111010_00100000100010000010_00121111100011111110_00000100000000010000_00000100000000010000_00111111111111111110_00100100000000010040_00100100000000010010_00611111111111111110_00000000000000000000;
    localparam [599:0] walls_default_param = 600'b01111111111111111111_01000000000000000001_01011101110111011101_01000000000000000001_01110101111111010111_01110101111111010111_01000000111110000001_01011110111110111101_01011110111110111101_01011110000000111101_01011110110110111101_01000000110110000001_01011110110110111101_01000000000000000001_01010111111111110101_01010100000000010101_01010100000000010101_01000100000000010001_01010100000000010101_01010111110111110101_01010000000000000101_01011111011101111101_01000000011100000001_01111011111111101111_01111011111111101111_01000000000000000001_01011011111111101101_01011011111111101101_01000000000000000001_01111111111111111111;
    // setting the walls to levelbuilder input or defalut based on a system state
    wire [599:0] walls_ingame = (state == CUSTOM_LEVEL) ? walls_output : walls_default_param;
    wire [2399:0] food_ingame = (state == CUSTOM_LEVEL) ? food_output : food_default_param;
    
    
    wire player1_won, player1_lost, player2_won, player2_lost; //comunication between games to know when the game is done
    
    wire system_rset = (button_state1[5]&button_state1[4]) |(button_state2[5]&button_state2[4])|reset; // system rset rsets all modules
    wire game_rset = (button_state1[5]|button_state2[5]) | system_rset |(state == LEVEL_BUILDER  | state == MENU); // resets just the game so orginal game can be played multiple times 
                      
    
    wire [11:0] player1_pixel;
    wire [2:0] lives1;
    wire [2:0] lives2;
    wire timer_done;
    
    // setting up player controls from the controler
    wire [7:0] button_state1;
    wire [7:0] button_state2;
    wire [3:0] player1_controls = SW[14] ? {button_state2[1], button_state2[0], button_state2[3], button_state2[2]}:
                                {button_state1[1], button_state1[0], button_state1[3], button_state1[2]} ;
    wire [3:0] player2_controls = SW[15] ?{button_state1[1], button_state1[0], button_state1[3], button_state1[2]} :
                     {button_state2[1], button_state2[0], button_state2[3], button_state2[2]};
    
    
    wire [3:0] state_display1;  //displaying state from player1 for debugging
    
    // Passing infomration about power up between modules
    wire [3:0] special_state_player1;
    wire [3:0] special_state_player2;
    
    //player 1 game
    game_fsm player1( .clk(clock_25mhz), .SW(SW[14]), .reset(game_rset),
        .controls(player1_controls), .start(button_state1[4]|button_state2[4]),
        .hcount(hcount), .vcount(vcount),.vsync(vsync),
        .total_pixel(player1_pixel),.lives(lives1),
        .player_won(player1_won), .player_lost(player1_lost), .opponent_lost(player2_lost), .opponent_won(player2_won),
        .special_state(special_state_player1),
        .special_state_enmey(special_state_player2),
         .walls_gamestart(walls_ingame), .food_gamestart(food_ingame), .enemy_controls(player2_controls)
        );
        
        wire [11:0] player1_lives_pixel;
     display_lives(.clk(clk),
                    .x(304),.y(5),
                    .hcount(hcount),.vcount(vcount),
                    .lives(lives1),
                    .pixel(player1_lives_pixel)
                         );
     //setting up player 2 game
     wire [11:0] player2_pixel;
    game_fsm player2( .clk(clock_25mhz), .SW(SW[15]), .reset(game_rset),
                .controls(player2_controls), .lives(lives2),
                .start(button_state1[4]|button_state2[4]),
                .hcount(hcount-336), // Giving delayed hcount so game will appear on right side of screen
                .vcount(vcount),.vsync(vsync),
                .total_pixel(player2_pixel),
                .player_won(player2_won), .player_lost(player2_lost), .opponent_lost(player1_lost), .opponent_won(player1_won),
                .special_state(special_state_player2),
                .special_state_enmey(special_state_player1),
                .walls_gamestart(walls_ingame), .food_gamestart(food_ingame), .enemy_controls(player1_controls)
                );
    wire [11:0] player2_lives_pixel;
     display_lives(.clk(clk),
                    .x(320),.y(5),
                    .hcount(hcount),.vcount(vcount),
                    .lives(lives2),
                    .pixel(player2_lives_pixel)
                         );
                    
   
   
   // setting up player 1 controler
   // JA is set up as inout so somepins can be inputs and others outputs
   wire controler1_data = JA[2];
   wire controler1_latch;
   assign JA[1] = controler1_latch;
   wire controler1_pulse; 
   assign JA[0] = controler1_pulse;
   assign LED[7:0] = button_state1;  // for debugging
   
   nes_controler controler1(.clk(clock_25mhz), .start((~vsync && vsync_prev)),
                      .data(controler1_data),
                       .latch(controler1_latch),.pulse(controler1_pulse),
                      .button_state(button_state1));              
   
   //setting up player 2 controller in same way
    wire controler2_data = JA[6];
    wire controler1_latch;
    assign JA[5] = controler1_latch;
    wire controler1_pulse; 
    assign JA[4] = controler1_pulse;

   nes_controler controler2(.clk(clock_25mhz), .start((~vsync && vsync_prev)),
                   .data(controler2_data),
                    .latch(controler2_latch),.pulse(controler2_pulse),
                   .button_state(button_state2));              
   
   
    wire [11:0] level_builder_pixel; // vga pixel for level builder
    // map out put information from level builder
    wire [599:0] walls_output;
    wire [2399:0] food_output;
    
    // giving levelbuilder inputs only when in level builder
    wire [4:0] level_builder_controls = (state == LEVEL_BUILDER) ?  {button_state1[7], button_state1[1], button_state1[0], button_state1[3], button_state1[2]} : 0;
    // instantiating levelbuilder
    level_builder #(.food_default(food_default_param), .walls_default(walls_default_param))
                builder ( .clk(clk), .hcount(hcount),.vcount(vcount),
            .rset(system_rset),.controls(level_builder_controls),
            .pixel(level_builder_pixel),
            .walls_output(walls_output),.food_output(food_output)
            );
    
   assign data = {state};  // for debugging 
  
   wire [11:0] game_pixel =player1_pixel|player2_pixel|player1_lives_pixel|player2_lives_pixel; 
                      
   wire [11:0] total_pixel = (state == MENU) ? menu_pixel :(state == LEVEL_BUILDER) ? level_builder_pixel : game_pixel; // displaying game when not in level builder mode
    //Do not touch this, required for hardware
    assign VGA_R = at_display_area ? total_pixel[11:8]: 0;
    assign VGA_G = at_display_area ? total_pixel[7:4]: 0;
    assign VGA_B = at_display_area ? total_pixel[3:0] : 0;
     
    // assign {VGA_R, VGA_G, VGA_B}=12'hFFF; 
    assign VGA_HS = ~hsync;
    assign VGA_VS = ~vsync;
    
    
    
//        assign data = {data1, data2, 6'b0, score};   // display 0123456 + SW
//    assign LED17_B =|controls_prev;
//    assign LED16_R= collision;   

endmodule





    


module clock_quarter_divider(input clk100_mhz, output reg clock_25mhz = 0);
    reg counter = 0;

    // VERY BAD VERILOG
    // VERY BAD VERILOG
    // VERY BAD VERILOG
    // But it's a quick and dirty way to create a 25Mhz clock
    // Please use the IP Clock Wizard under FPGA Features/Clocking
    //
    // For 1 Hz pulse, it's okay to use a counter to create the pulse as in
    // assign onehz = (counter == 100_000_000); 
    // be sure to have the right number of bits.

    always @(posedge clk100_mhz) begin
        counter <= counter + 1;
        if (counter == 0) begin
            clock_25mhz <= ~clock_25mhz;
        end
    end
endmodule

module vga(input vga_clock,
            output reg [9:0] hcount = 0,    // pixel number on current line
            output reg [9:0] vcount = 0,    // line number
            output reg vsync, hsync, 
            output at_display_area);

   // Comments applies to XVGA 1024x768, left in for reference
   // horizontal: 1344 pixels total
   // display 1024 pixels per line
   reg hblank,vblank;
   wire hsyncon,hsyncoff,hreset,hblankon;
   assign hblankon = (hcount == 639);    // active H  1023
   assign hsyncon = (hcount == 655);     // active H + FP 1047
   assign hsyncoff = (hcount == 751);    // active H + fp + sync  1183
   assign hreset = (hcount == 799);      // active H + fp + sync + bp 1343

   // vertical: 806 lines total
   // display 768 lines
   wire vsyncon,vsyncoff,vreset,vblankon;
   assign vblankon = hreset & (vcount == 479);    // active V   767
   assign vsyncon = hreset & (vcount ==490 );     // active V + fp   776
   assign vsyncoff = hreset & (vcount == 492);    // active V + fp + sync  783
   assign vreset = hreset & (vcount == 523);      // active V + fp + sync + bp 805

   // sync and blanking
   wire next_hblank,next_vblank;
   assign next_hblank = hreset ? 0 : hblankon ? 1 : hblank;
   assign next_vblank = vreset ? 0 : vblankon ? 1 : vblank;
   always @(posedge vga_clock) begin
      hcount <= hreset ? 0 : hcount + 1;
      hblank <= next_hblank;
      hsync <= hsyncon ? 0 : hsyncoff ? 1 : hsync;  // active low

      vcount <= hreset ? (vreset ? 0 : vcount + 1) : vcount;
      vblank <= next_vblank;
      vsync <= vsyncon ? 0 : vsyncoff ? 1 : vsync;  // active low

   end

   assign at_display_area = ((hcount >= 0) && (hcount < 640) && (vcount >= 0) && (vcount < 480));

endmodule

