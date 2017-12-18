`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2017 09:53:13 AM
// Design Name: 
// Module Name: game_fsm
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


module game_fsm(
    input clk, SW, 
    input reset, start, // start is used at teh start of the game to indicated the players are ready
    input [3:0] controls, // these come from the controler
    input [3:0] enemy_controls, // these come from the opponent controler
    input [9:0] hcount,
    input [9:0] vcount,
    input vsync,
    input opponent_lost, // information about opponent state so game can be won/lost based on opponent behaviour
    input opponent_won,
    output player_won, // sending information about player to opponent
    output player_lost,
    output reg [2:0] lives, // number of lives player has in game
    output [11:0] total_pixel, // pixel output for vga
    output reg [3:0] special_state, // sending information about specials to opponent for game interaction
    input [3:0] special_state_enmey, //getting information about eneny specials so games can interaction
    input [599:0] walls_gamestart, // getting walls and food information from level builder or default ... this is a poor naming choice
    input [2399:0] food_gamestart
    );
    
    reg vsync_prev;     // keeing track of vsync_prev to track rising and falling edges
    
    
    // controls for the charcters for teh game logic
    wire rset_positions; // moves charcters back to starting locations
    wire hold_position;  // holds all charcters in current positions
    
    // assigning controls to properly labeled wires
    wire up, down, left, right, rset;
    assign {rset, left, right, up, down} = {reset, controls[3], controls[2], controls[1], controls[0]};

    // creating special state to track what special is active
     //;reg [3:0] special_state=0;
     localparam NONE = 4'd0;                             
     localparam FOOD = 4'd1;
     localparam SPECIAL1 = 4'd2;
     localparam SPECIAL2 = 4'd3; 
     localparam SPECIAL3 = 4'd4;
     localparam SPECIAL4 = 4'd5;
     localparam SPECIAL5 = 4'd6;
     localparam SPECIAL6 = 4'd7;
      
        
    //PACMAN!!!!      
    wire [11:0] pacman_pixel;  // pacman visual
    
    //pacman location
    wire [9:0] pacman_x;
    wire [9:0] pacman_y;
      
    reg [1:0] pacman_speed=(special_state_enmey != SPECIAL3) ? 2 : 1;  //pacman speed in pixels per frame refresh.
                                                                        // one of the specials will slow enemy pacman down, speeds must be power of 2 
    
    localparam [5:0] pacman_size =8'h10; // used in calculations 
    reg [3:0]  pacman_aviable; // tracks which directions pacman can move in
    wire [3:0]  pacman_dir;// tracks pacmans current direction of movement
    
   
    reg lost_life=0;  // indicates that pac man just died
    reg pacman_start; // useed by graphics
    
    wire [3:0] pacman_controls =(special_state_enmey==SPECIAL2) ? {right, left, down, up}: {left, right, up, down};// giving pacman controls, flipping contols on opponent powerup


    // creating pacman graphics
     pacman player(.clk(clk),.reset(rset),
                    .hcount(hcount),.vcount(vcount),
                     .hsync(hsync),.vsync(vsync),
                     .x(pacman_x), .y(pacman_y),
                     .direction(pacman_dir),
                     .dead(lost_life),.pixel(pacman_pixel), .start(pacman_start)
                     );
                     
     // tracks pacmans desired direction and moves pacman when it is possible in that direction
     movement pacman_move(.clk(clk),.rset(rset_positions),.hold_position(hold_position),
                         .controls(pacman_controls),.aviable(pacman_aviable),
                         .x(pacman_x),.xstart(3<<4),
                         .y(pacman_y),.ystart(23<<4),
                         .speed(pacman_speed),.vsync(vsync), .dir(pacman_dir)
                         );    
            
    
                
   //GHOSTS!!!!
        localparam [7:0] GHOST_SIZE = 8'd16;  //used in claculations
        
        //first ghost
        wire [1:0] ghost_speed = (special_state != SPECIAL4) ? 2 : 1;  // ghost speed use in calculations also can be sloed sown with power ups, speed in pixels/frame
        
        //ghost locations
        wire [9:0] greenghost_x;
        wire [9:0] greenghost_y;
        
        wire [11:0] greenghost_pixel;//output for VGA
        wire [3:0] greenghost_dir; // indicated the ghost is going, used for graphics

      wire [3:0] green_controls = (special_state_enmey == SPECIAL6) ? enemy_controls : SW ? {left, right, up, down} : green_smart_controls; // indicates which direction the ghost wants to go
       // one of the power up allows your opponent to control the ghosts, also the switch alows for debug mode where the controler controls the ghost, other wise the AI output controls the ghost
      
      
      reg  [3:0] green_aviable =4'b1111; //indicates which directions the ghosts can go
      reg greenghost_dead;
      wire [11:0] greenghost_color = 12'hF80;
        ghost green_ghost(.clk(clk),
                   .hcount(hcount),.vcount(vcount),
                    .x(greenghost_x),.y(greenghost_y),
                    .direction(greenghost_dir),
                    .color(greenghost_color),.pixel(greenghost_pixel), .scared(special_state == SPECIAL1),
                    .caught(greenghost_dead), .start(~greenghost_dead)
                    );
                    
      
        movement greenghost_move(.clk(clk),.rset(rset_positions | greeghost_dead ),.hold_position(hold_position),
                      .controls(green_controls),.aviable(green_aviable),
                      .x(greenghost_x),.xstart(9<<4),
                      .y(greenghost_y),.ystart(11<<4),
                      .speed(ghost_speed),.vsync(vsync),
                      .dir(greenghost_dir)
                       );
        wire [3:0] green_smart_controls;
        enemy_ai green_move_smart(.clk(clk),.reset(rset),
                           .pacman_x(pacman_x),.pacman_y(pacman_y), .pacman_direction(pacman_dir),
                           .ghost_selector(0),
                           .ghost_x(greenghost_x), .ghost_y(greenghost_y),.ghost_direction(greenghost_dir),
                           .ghost_scared(special_state == SPECIAL1),
                           .open_directions(green_aviable),
                           .next_direction(green_smart_controls)
                            );
       
       wire [9:0] blueghost_x;
        wire [9:0] blueghost_y;
        wire [11:0] blueghost_pixel;
        wire [3:0] blueghost_dir;

        wire [3:0] blue_controls = (special_state_enmey == SPECIAL6) ? enemy_controls :blue_smart_controls;
        reg  [3:0] blue_aviable=4'b1111;
        reg blueghost_dead;
        wire [11:0] blueghost_color = 12'h0AA;
        ghost blue_ghost(.clk(clk),
                           .hcount(hcount),.vcount(vcount),
                            .x(blueghost_x),.y(blueghost_y),
                            .direction(blueghost_dir),
                            .color(blueghost_color),.pixel(blueghost_pixel), .scared(special_state == SPECIAL1),
                            .caught(blueghost_dead), .start(~blueghost_dead)
                            );
                            
              
         movement blueghost_move(.clk(clk),.rset(rset_positions | greeghost_dead ),.hold_position(hold_position),
                              .controls(blue_controls),.aviable(blue_aviable),
                              .x(blueghost_x),.xstart(7<<4),
                              .y(blueghost_y),.ystart(12<<4),
                              .speed(ghost_speed),.vsync(vsync), 
                              .dir(blueghost_dir)
                               );
        wire [3:0] blue_smart_controls;
        enemy_ai blue_move_smart(.clk(clk),
                                   .pacman_x(pacman_x),.pacman_y(pacman_y), .pacman_direction(pacman_dir),
                                   .ghost_selector(2'd2),
                                   .ghost_x(blueghost_x), .ghost_y(blueghost_y),.ghost_direction(blueghost_dir),
                                   .ghost_scared(special_state == SPECIAL1),
                                   .open_directions(blue_aviable),
                                   .next_direction(blue_smart_controls)
                                     );
          wire [9:0] pinkghost_x;
            wire [9:0] pinkghost_y;
            wire [11:0] pinkghost_pixel;
            wire [3:0] pinkghost_dir;
    
            wire [3:0] pink_controls = (special_state_enmey == SPECIAL6) ? enemy_controls : pink_smart_controls;
            reg  [3:0] pink_aviable=4'b1111;
            reg pinkghost_dead;
            wire [11:0] pinkghost_color = 12'hF6B;
            ghost pink_ghost(.clk(clk),.reset(rset),
                               .hcount(hcount),.vcount(vcount),
                                .x(pinkghost_x),.y(pinkghost_y),
                                .direction(pinkghost_dir),
                                .color(pinkghost_color),.pixel(pinkghost_pixel), .scared(special_state == SPECIAL1),
                                .caught(pinkghost_dead), .start(~pinkghost_dead)
                                );
                                
                  
             movement pinkghost_move(.clk(clk),.rset(rset_positions | greeghost_dead ),.hold_position(hold_position),
                                  .controls(pink_controls),.aviable(pink_aviable),
                                  .x(pinkghost_x),.xstart(11<<4),
                                  .y(pinkghost_y),.ystart(12<<4),
                                  .speed(ghost_speed),.vsync(vsync), 
                                  .dir(pinkghost_dir)
                                   );
            wire [3:0] pink_smart_controls;
            enemy_ai pink_move_smart(.clk(clk),.reset(rset),
                                       .pacman_x(pacman_x),.pacman_y(pacman_y), .pacman_direction(pacman_dir),
                                       .ghost_selector(2'b1),
                                       .ghost_x(pinkghost_x), .ghost_y(pinkghost_y),.ghost_direction(pinkghost_dir),
                                       .ghost_scared(special_state == SPECIAL1),
                                       .open_directions(pink_aviable),
                                       .next_direction(pink_smart_controls)
                                         );
                      
         reg [11:0] wall_pixel, ghostgate;
         wire [11:0] food_pixel; 
           
         wire [11:0] ghosts_pixel= (|blueghost_pixel) ? blueghost_pixel : greenghost_pixel;//(|pinkghost_pixel) ? pinkghost_pixel :(|blueghost_pixel) ? blueghost_pixel : greenghost_pixel;
         wire [11:0] eddible_pixel = food_pixel;
         wire [11:0] game_pixel = (|ghosts_pixel) ? pacman_pixel|wall_pixel|ghosts_pixel :pacman_pixel|wall_pixel|eddible_pixel|ghostgate;
         wire [11:0] game_pixel_grey = {2'b0, game_pixel[11:10],2'b0, game_pixel[7:6], 2'b0, game_pixel[3:2]};
         assign total_pixel= (hcount<320) ? 
                            (state == GAMESTART) ? game_pixel_grey|start_messege : game_pixel : 0; 
        

//GAME info goes here
     reg [9:0] score; //how big can the score go?
     reg [3:0] food_eaten;
     
     
     
     reg [19:0] walls [29:0];    
     reg [79:0] food [29:0];
     
      
     wire [6:0] x = hcount >> 4; ///hcount/16;
     wire [5:0] y = vcount >> 4;//(vcount)/16;
     
     reg [3:0] food_incell;// = {food[y][{hcount[10:4],2'd3}], food[y][{hcount[10:4],2'd2}], food[y][{hcount[10:4],2'd1}], food[y][{hcount[10:4],2'd0}]};
    
     reg [4:0] size;
     reg [11:0] colour;
     display_food food_display(.food(food_incell), .pixel(food_pixel),
                                .hcount(hcount), .vcount(vcount), .clk(clk));
    
    
     wire dead = (lives==0);
   
     wire collison_green;
 
     collision greenghost(.x_1(pacman_x-2),.y_1(pacman_y-2),
                     .w_1(8),.h_1(8),
                     .x_2(greenghost_x-2),.y_2(greenghost_y-2),
                     .w_2(8),.h_2(8),
                     .collision(collison_green)
                        );
      wire collison_blue;

      collision blueghost(.x_1(pacman_x-2),.y_1(pacman_y-2),
                    .w_1(8),.h_1(8),
                    .x_2(blueghost_x-2),.y_2(blueghost_y-2),
                    .w_2(8),.h_2(8),
                    .collision(collison_blue)
                       );
      wire collison_pink;
       collision pinkghost(.x_1(pacman_x-2),.y_1(pacman_y-2),
                           .w_1(8),.h_1(8),
                           .x_2(pinkghost_x-2),.y_2(pinkghost_y-2),
                           .w_2(8),.h_2(8),
                           .collision(collison_pink)
                              );    
    
     localparam [3:0] UP = 4'b0010;
     localparam [3:0] DOWN = 4'b0001;
     localparam [3:0] LEFT = 4'b1000;
     localparam [3:0] RIGHT = 4'b0100;
     
     reg [3:0] timer_value;
     reg start_timer;
     reg timer_done_prev;
     wire timer_done;
     timer timer1(.value(timer_value), .clk(clk), .start_timer(start_timer),
                     .timer_done(timer_done), .rset(rset));
                     
      reg [3:0] special_timer_value=5;
      reg special_start_timer;
      //reg timer_done_prev;
      wire special_timer_done;
      timer specials_timer(.value(special_timer_value), .clk(clk), .start_timer(special_start_timer),
                                          .timer_done(special_timer_done), .rset(rset));
      reg [3:0] state = 0;
      assign state_display = state;
      localparam GAMESTART = 4'd0;
      localparam GAMEPLAY = 4'd1;
      localparam TIMER = 4'd2;
      localparam GAMEWON = 4'd3;
      localparam GAMELOST = 4'd4;
      
      
      
      wire food_aviable = food[0] || food[1] || food[2] || food[3] || food[4] ||
                          food[5] || food[6] || food[7] || food[8] || food[9] || 
                          food[10] || food[11] || food[12] || food[13] || food[14] || 
                          food[15] || food[16] || food[17] || food[18] || food[19] || 
                          food[20] || food[21] || food[22] || food[23] || food[24] || 
                          food[25] || food[26] || food[27] || food[28] || food[29];
      reg hold = 0;
      reg food_rset = 0;
      reg char_rset = 0;
      always @(posedge clk)begin
         wall_pixel<=( (hcount < 11'd320) && (vcount < 10'd480) && (walls[y][x]==1) ) ? 
                                            (state == GAMEWON) ? 12'h 3_F_0 : (state == GAMELOST) ? 12'hF_0_0 : 12'h 0_7_F 
                                            : 12'd0;
         ghostgate<= (x==9 && y==10) ? 12'h00F : 12'h000;
         vsync_prev<=vsync;
         
         food_incell <= {food[y][{hcount[9:4],2'd3}], food[y][{hcount[9:4],2'd2}], food[y][{hcount[9:4],2'd1}], food[y][{hcount[9:4],2'd0}]};
       

         
         green_aviable[0]<= ~(walls[(greenghost_y+ghost_speed+GHOST_SIZE-1)>>4][(greenghost_x)>>4] 
                             || walls[(greenghost_y+ghost_speed+GHOST_SIZE-1)>>4][(greenghost_x+GHOST_SIZE-1)>>4]);
         green_aviable[1]<= ~(walls[(greenghost_y-ghost_speed)>>4][(greenghost_x)>>4] 
                             || walls[(greenghost_y-ghost_speed)>>4][(greenghost_x+GHOST_SIZE-1)>>4]);
         green_aviable[2]<= ~(walls[(greenghost_y)>>4][(greenghost_x+GHOST_SIZE-1+ghost_speed)>>4] 
                             || walls[(greenghost_y+GHOST_SIZE-1)>>4][(greenghost_x+GHOST_SIZE-1+ghost_speed)>>4]);
         green_aviable[3]<= ~(walls[(greenghost_y)>>4][(greenghost_x-ghost_speed)>>4] 
                             || walls[(greenghost_y+GHOST_SIZE-1)>>4][(greenghost_x-ghost_speed)>>4]);
                             
                             
         blue_aviable[0]<= ~(walls[(blueghost_y+ghost_speed+GHOST_SIZE-1)>>4][(blueghost_x)>>4] 
                              || walls[(blueghost_y+ghost_speed+GHOST_SIZE-1)>>4][(blueghost_x+GHOST_SIZE-1)>>4]);
          blue_aviable[1]<= ~(walls[(blueghost_y-ghost_speed)>>4][(blueghost_x)>>4] 
                              || walls[(blueghost_y-ghost_speed)>>4][(blueghost_x+GHOST_SIZE-1)>>4]);
          blue_aviable[2]<= ~(walls[(blueghost_y)>>4][(blueghost_x+GHOST_SIZE-1+ghost_speed)>>4] 
                              || walls[(blueghost_y+GHOST_SIZE-1)>>4][(blueghost_x+GHOST_SIZE-1+ghost_speed)>>4]);
          blue_aviable[3]<= ~(walls[(blueghost_y)>>4][(blueghost_x-ghost_speed)>>4] 
                              || walls[(blueghost_y+GHOST_SIZE-1)>>4][(blueghost_x-ghost_speed)>>4]); 
                              
         pink_aviable[0]<= ~(walls[(pinkghost_y+ghost_speed+GHOST_SIZE-1)>>4][(pinkghost_x)>>4] 
                            || walls[(pinkghost_y+ghost_speed+GHOST_SIZE-1)>>4][(pinkghost_x+GHOST_SIZE-1)>>4]);
         pink_aviable[1]<= ~(walls[(pinkghost_y-ghost_speed)>>4][(pinkghost_x)>>4] 
                            || walls[(pinkghost_y-ghost_speed)>>4][(pinkghost_x+GHOST_SIZE-1)>>4]);
         pink_aviable[2]<= ~(walls[(pinkghost_y)>>4][(pinkghost_x+GHOST_SIZE-1+ghost_speed)>>4] 
                            || walls[(pinkghost_y+GHOST_SIZE-1)>>4][(pinkghost_x+GHOST_SIZE-1+ghost_speed)>>4]);
         pink_aviable[3]<= ~(walls[(pinkghost_y)>>4][(pinkghost_x-ghost_speed)>>4] 
                            || walls[(pinkghost_y+GHOST_SIZE-1)>>4][(pinkghost_x-ghost_speed)>>4]);                       
                              
                          
         pacman_aviable[0]<= ~((walls[(pacman_y+pacman_speed+pacman_size-1)>>4][(pacman_x)>>4]
                                 || walls[(pacman_y+pacman_speed+pacman_size-1)>>4][(pacman_x+pacman_size-1)>>4])
                                 || (((((pacman_x>>4)==9) && (((pacman_y+pacman_speed+pacman_size-1)>>4)==10)
                                 ||((((pacman_x+pacman_size-1)>>4)==9) && (((pacman_y+pacman_speed+pacman_size-1)>>4)==10))))));
         pacman_aviable[1]<= ~(walls[(pacman_y-pacman_speed)>>4][(pacman_x)>>4] 
                              || walls[(pacman_y-pacman_speed)>>4][(pacman_x+pacman_size-1)>>4]);
         pacman_aviable[2]<= ~(walls[(pacman_y)>>4][(pacman_x+pacman_size-1+pacman_speed)>>4] 
                             || walls[(pacman_y+pacman_size-1)>>4][(pacman_x+pacman_size-1+pacman_speed)>>4]);
         pacman_aviable[3]<= ~(walls[(pacman_y)>>4][(pacman_x-pacman_speed)>>4] 
                             || walls[(pacman_y+pacman_size-1)>>4][(pacman_x-pacman_speed)>>4]);
         
         if(food_rset) begin
             {food[29],food[28],food[27],food[26],food[25],
            food[24],food[23],food[22],food[21],food[20],
            food[19],food[18],food[17],food[16],food[15],
            food[14],food[13],food[12],food[11],food[10],
            food[9],food[8],food[7],food[6],food[5],
            food[4],food[3],food[2],food[1],food[0]} <= food_gamestart;
            
            {walls[29],walls[28],walls[27],walls[26],walls[25],
            walls[24],walls[23],walls[22],walls[21],walls[20],
            walls[19],walls[18],walls[17],walls[16],walls[15],
            walls[14],walls[13],walls[12],walls[11],walls[10],
            walls[9],walls[8],walls[7],walls[6],walls[5],
            walls[4],walls[3],walls[2],walls[1],walls[0]} <= walls_gamestart;
          end
          
          if(rset) begin   
             lives<=3;
             score<=0;
             start_timer<=0;
             lost_life<=0;
             timer_value<=2;
             state<=GAMESTART;
             special_state=NONE;
             
         end
         else if(~vsync&& vsync_prev&& vcount<490)begin
             score<= score+food_eaten;
             food_eaten<=0;
             special_start_timer<=0;                
         end    
         
               
         case(state)
            GAMESTART: begin
                start_timer<=0;
                timer_value<=2;
                lives<=3;
                food_rset<=1;
                score<=0;
                lost_life<=0;
                hold<=1;
                char_rset = 1;
                special_state=NONE;
                pacman_start<=1;
                if(start) begin
                    hold<=0;
                    pacman_start<=0;
                    char_rset = 0;
                    start_timer<=0;
                    state<=GAMEPLAY;
                    greenghost_dead<=0;
                    blueghost_dead<=0;
                    pinkghost_dead<=0;
                end
            end
            GAMEPLAY: begin
                start_timer<=0;
                char_rset = 0;
                food_rset<=0;
                hold<=(special_state == SPECIAL6) ? 1 : 0;
                lost_life<=0;
                special_start_timer<=0;
                pacman_start<=0;
                greenghost_dead<=(special_state == SPECIAL1) ? greenghost_dead : 0;  // ghosts comeback to life if new special picked up
                blueghost_dead<=(special_state == SPECIAL1) ? blueghost_dead : 0;  // ghosts comeback to life if new special picked up
                pinkghost_dead<=(special_state == SPECIAL1) ? pinkghost_dead : 0;  // ghosts comeback to life if new special picked up
                if ((|pacman_pixel) && (|food_pixel))begin
                 {food[y][(x<<2)+3], food[y][(x<<2)+2], food[y][(x<<2)+1], food[y][(x<<2)]}<= 4'b0;
                 food_eaten<=food_incell;
                 lives <= (food_incell == SPECIAL5) ? (lives < 7) ? lives +1 : lives : lives; // if sepcial5 eaten gain life
                 special_start_timer<= (food_incell>1) ? 1: 0;
                 special_state<=(food_incell>1) ? food_incell : special_state;
                end
                
                if(special_timer_done) begin
                         special_state<=NONE;
                         greenghost_dead<=0;
                         blueghost_dead<=0;
                         pinkghost_dead<=0;                         
                  end  
                if(collison_green)begin
                   if(special_state == SPECIAL1)begin
                        score<=score+5;
                        greenghost_dead<=1;
                   end
                  
                   else begin
                     lives<=lives-1;
                     lost_life<=1;
                     timer_value<=2;
                     start_timer<=1;
                     state<= (lives > 1) ? TIMER : GAMELOST;
                     special_state<=NONE;   
                   end
                end 
                if(collison_blue)begin
                   if(special_state == SPECIAL1)begin
                        score<=score+5;
                        blueghost_dead<=1;
                   end
                  
                   else begin
                     lives<=lives-1;
                     lost_life<=1;
                     timer_value<=2;
                     start_timer<=1;
                     state<= (lives > 1) ? TIMER : GAMELOST;
                     special_state<=NONE;   
                   end
                end
                if(collison_pink)begin
                   if(special_state == SPECIAL1)begin
                        score<=score+5;
                        pinkghost_dead<=1;
                   end
                  
                   else begin
                     lives<=lives-1;
                     lost_life<=1;
                     timer_value<=2;
                     start_timer<=1;
                     state<= (lives > 1) ? TIMER : GAMELOST;
                     special_state<=NONE;   
                   end
                end  
                if (~food_aviable) state<=GAMEWON;
            end
            
            TIMER:begin  //this is the timer count down while pacman is dead for graphics and such
                
                hold<=1;
                char_rset<=0;
                lost_life<=0;
                if(timer_done) begin
                    char_rset<=1;
                    pacman_start<=1;
                end
                state<=(char_rset) ? GAMEPLAY : TIMER;
            end
            
            GAMELOST: hold<=1;
            GAMEWON: hold<=1;
         endcase   
         if (opponent_won) begin 
            state<=GAMELOST;
            greenghost_dead<=0;
            blueghost_dead<=0;
            special_state<=NONE;
         end
         if (opponent_lost) begin
            state<=GAMEWON;
            greenghost_dead<=0;
            blueghost_dead<=0;
            special_state<=NONE;
        end        
          
 
   end
   
    
    assign rset_positions = rset |char_rset ;
    assign hold_position = dead | hold;
    assign player_lost = dead;
    assign player_won = ~food_aviable;
    
    wire [11:0] letter_o21, letter_r21, letter_i21, letter_g21, letter_i22, letter_n21, letter_a21, letter_l21, 
                            letter_l22, letter_e21, letter_v21, letter_e22, letter_l23;
    wire [11:0]  start_messege = letter_o21|letter_r21|letter_i21|letter_g21|letter_i22|letter_n21|letter_a21|letter_l21| 
                     letter_l22|letter_e21|letter_v21|letter_e22|letter_l23;
    
      wire [9:0] option1_y = (11<<4);
      wire [9:0] option1_x = (4<<4); 
      
      letter_p (.clk(clk),.hcount(hcount),.vcount(vcount),
                  .x(option1_x),.y(option1_y),
                  .pixel(letter_o21) );
       letter_r (.clk(clk),.hcount(hcount),.vcount(vcount),
                 .x(option1_x+16),.y(option1_y),
                 .pixel(letter_r21) );
       letter_e (.clk(clk),.hcount(hcount),.vcount(vcount),
                  .x(option1_x+32),.y(option1_y),
                  .pixel(letter_i21) );
       letter_s (.clk(clk),.hcount(hcount),.vcount(vcount),
                .x(option1_x+48),.y(option1_y),
                .pixel(letter_g21) );
       letter_s (.clk(clk),.hcount(hcount),.vcount(vcount),
               .x(option1_x+64),.y(option1_y),
               .pixel(letter_i22) );
      
                   
       letter_s (.clk(clk),.hcount(hcount),.vcount(vcount),
                  .x(option1_x+96),.y(option1_y),
                  .pixel(letter_l22) );
       letter_t (.clk(clk),.hcount(hcount),.vcount(vcount),
                 .x(option1_x+112),.y(option1_y),
                 .pixel(letter_e21) );  
       letter_a (.clk(clk),.hcount(hcount),.vcount(vcount),
                .x(option1_x+128),.y(option1_y),
                .pixel(letter_v21) ); 
       letter_r (.clk(clk),.hcount(hcount),.vcount(vcount),
                   .x(option1_x+144),.y(option1_y),
                   .pixel(letter_e22) ); 
       letter_t (.clk(clk),.hcount(hcount),.vcount(vcount),
                 .x(option1_x+160),.y(option1_y),
                  .pixel(letter_l23) ); 
endmodule
