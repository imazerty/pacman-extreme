`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 03:31:53 PM
// Design Name: 
// Module Name: enemy_ai
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


module enemy_ai #(
    parameter DOWN = 4'b0001, // 1
    parameter UP = 4'b0010,   // 2
    parameter RIGHT = 4'b0100,// 3
    parameter LEFT = 4'b1000  // 4
    ) (
    input clk,
    input reset,
    input [10:0] pacman_x,
    input [9:0] pacman_y,
    input [3:0] pacman_direction,
    input [1:0] ghost_selector, // selects the ai rules to use for the ghost (blinky, pinky, or clyde)
    input [10:0] ghost_x,
    input [10:0] ghost_y,
    input [3:0] ghost_direction,
    input ghost_scared, // ghost stays in scared mode while this is high
    input ghost_caught, // ghost goes home when this is high
    input [3:0] open_directions,
    output reg [3:0] next_direction
    );
    
    // The boundaries of the ghosts' home
    localparam P1_HOME_LEFT = 64;
    localparam P1_HOME_RIGHT = 224;
    localparam P2_HOME_LEFT = 400;
    localparam P2_HOME_RIGHT = 560;
    localparam HOME_TOP = 160;
    localparam HOME_BOTTOM = 240;

    // the locations of the tiles above the doors
    localparam P1_ABOVE_DOOR_X = 144;
    localparam P2_ABOVE_DOOR_X = 480;
    localparam ABOVE_DOOR_Y = 144;

    // the divider between the two boards
    localparam BOARD_DIVIDER = 320;
    
    // the length and width of a single "tile" on the board
    localparam TILE_SIZE = 16;
    // the "proximity" of eight tiles
    localparam EIGHT_TILE_PROXIMITY = 32_768; // (8 * TILE_SIZE)^2 + (8 * TILE_SIZE)^2
    
    localparam BLINKY = 0;
    localparam PINKY = 1;
    localparam CLYDE = 2;
    
    reg [2:0] state = 0;
    assign ai_state = state;
    localparam HOME = 0;
    localparam LEAVE_HOME = 1;
    localparam START_CHASE = 2;
    localparam CHASE = 3;
    localparam START_SCATTER = 4;
    localparam SCATTER = 5;
    localparam START_SCARED = 6;
    localparam SCARED = 7;
    localparam CAUGHT = 8;
    
    wire one_hz_enable;
    reg one_second_divider_reset;
    divider_kim one_second_divider(.clk_25mhz(clk), .reset(one_second_divider_reset), .interval_enable(one_hz_enable));
    reg [2:0] release_counter = 0;
    localparam PINKY_RELEASE_DELAY = 3;
    localparam CLYDE_RELEASE_DELAY = 6;
    reg [2:0] chase_counter = 0;
    localparam CHASE_PERIOD = 7;
    reg [1:0] scatter_counter = 0;
    localparam SCATTER_PERIOD = 3;
    
    // the coordinates of the ghost's target location
    reg [10:0] target_x = 0;
    reg [9:0] target_y = 0;
    
    // the "proximity" of each adjacent location to the target location
    // this is not the actual from the adjacent locations to the target location, 
    // but deltaxsquared plus deltaysquared for each direction
    reg [19:0] ghost_proximity, up_proximity, down_proximity, left_proximity, right_proximity,
        ghost_deltax, ghost_deltay, up_deltax, up_deltay, down_deltax, down_deltay, left_deltax, left_deltay, right_deltax, right_deltay,
        ghost_deltaxsquared, ghost_deltaysquared, up_deltaxsquared, up_deltaysquared, down_deltaxsquared, down_deltaysquared, left_deltaxsquared, left_deltaysquared, right_deltaxsquared, right_deltaysquared;
    reg is_within_eight_tiles = 0;
    reg is_home = 1;
    reg is_above_door = 0;

    // sorted_directions is the four potential directions listed in order of proximity to the target
    reg [15:0] sorted_directions;

    reg [3:0] opposite_direction;
    divider_kim #(.SSKIP_CYCLES(400_000)) divider_400mhz(.clk_25mhz(clk), .interval_enable(enable_400mhz)); 
    
    // selects the set of directions to use for scattering
    reg [1:0] scatter_direction_selector = 2'b00;

    always @(posedge clk) begin
    
        // Manage state transitions
	case (state)
	    HOME: begin
		one_second_divider_reset <= 0;
		chase_counter <= 0;
		scatter_counter <= 0;
		if (one_hz_enable) release_counter <= release_counter + 1;
	    
		// start the chase after the release delay number of seconds
		// for each ghost
		case (ghost_selector)
		    BLINKY: state <= LEAVE_HOME;
		    PINKY: begin
                if (release_counter == PINKY_RELEASE_DELAY) begin
                    release_counter <= 0;
                    state <= LEAVE_HOME;
                end
		    end
		    CLYDE: begin
                if (release_counter == CLYDE_RELEASE_DELAY) begin
                    release_counter <= 0;
                    state <= LEAVE_HOME;
                end
		    end
		    default: state <= LEAVE_HOME;
		endcase
	    end
	    LEAVE_HOME: begin
            one_second_divider_reset <= 0;
            release_counter <= 0;
            chase_counter <= 0;
            scatter_counter <= 0;
            
            if (is_above_door) state <= START_CHASE; 
            
            if (|(open_directions & UP)) next_direction <= UP;
            else if (ghost_x < BOARD_DIVIDER) begin
                if (ghost_x < P1_ABOVE_DOOR_X) next_direction <= RIGHT;
                else next_direction <= LEFT;
            end else begin
                if (ghost_x < P2_ABOVE_DOOR_X) next_direction <= RIGHT;
                else next_direction <= LEFT;
            end
	    end
	    START_CHASE: begin
            one_second_divider_reset <= 1;
            release_counter <= 0;
            chase_counter <= 0;
            scatter_counter <= 0;
            state <= CHASE;
        end
	    CHASE: begin
            // stay in chase mode for seven seconds
            one_second_divider_reset <= 0;
            release_counter <= 0;
            scatter_counter <= 0;
            if (one_hz_enable) chase_counter <= chase_counter + 1;
            
            if (is_home) state <= HOME;
            else if (ghost_scared) state <= START_SCARED;
            else if (chase_counter == CHASE_PERIOD) state <= START_SCATTER;
	    end
	    START_SCATTER: begin
            one_second_divider_reset <= 1;
            chase_counter <= 0;
            release_counter <= 0;
            scatter_counter <= 0;
            state <= SCATTER;
	    end
	    SCATTER: begin
            one_second_divider_reset <= 0;
            chase_counter <= 0;
            release_counter <= 0;
            if (one_hz_enable) scatter_counter <= scatter_counter + 1;
            
            if (is_home) state <= HOME;
            else if (ghost_scared) state <= START_SCARED;
            else if (scatter_counter == SCATTER_PERIOD) state <= START_CHASE;
	    end
	    START_SCARED: begin
            one_second_divider_reset <= 1;
            chase_counter <= 0;
            scatter_counter <= 0;
            release_counter <= 0;
            state <= SCARED;
	    end
	    SCARED: begin
            one_second_divider_reset <= 1;
            chase_counter <= 0;
            scatter_counter <= 0;
            release_counter <= 0;
            
            if (is_home) state <= HOME;
            else if (ghost_caught) state <= CAUGHT;
            else if (!ghost_scared) state <= START_CHASE;
	    end
	    CAUGHT: begin
            one_second_divider_reset <= 1;
            chase_counter <= 0;
            scatter_counter <= 0;
            release_counter <= 0;
            
            if (is_home) state <= HOME;
	    end
	    default: begin
            one_second_divider_reset <= 1;
            chase_counter <= 0;
            release_counter <= 0;
            state <= HOME;
	    end
	endcase
        
        // Update the different locations' proximities to the target
        if (target_x < ghost_x) begin
            up_deltax <= ghost_x - target_x;
            right_deltax <= ghost_x - target_x + 1;
            left_deltax <= ghost_x - target_x - 1;
            down_deltax <= ghost_x - target_x;
        end else begin
            up_deltax <= target_x - ghost_x;
            right_deltax <= target_x - ghost_x - 1;
            left_deltax <= target_x - ghost_x + 1;
            down_deltax <= target_x - ghost_x;
        end
        
        if (target_y < ghost_y) begin
            up_deltay <= ghost_y - target_y - 1;
            right_deltay <= ghost_y - target_y;
            left_deltay <= ghost_y - target_y;
            down_deltay <= ghost_y - target_y + 1; 
        end else begin
            up_deltay <= target_y - ghost_y + 1;
            right_deltay <= target_y - ghost_y;
            left_deltay <= target_y - ghost_y;
            down_deltay <= target_y - ghost_y - 1;
        end
        
        up_deltaxsquared <= up_deltax * up_deltax;
        up_deltaysquared <= up_deltay * up_deltay;
        right_deltaxsquared <= right_deltax * right_deltax;
        right_deltaysquared <= right_deltay * right_deltay;
        left_deltaxsquared <= left_deltax * left_deltax;
        left_deltaysquared <= left_deltay * left_deltay;
        down_deltaxsquared <= down_deltax * down_deltax;
        down_deltaysquared <= down_deltay * down_deltay;
        
        up_proximity <= up_deltaxsquared + up_deltaysquared;
        right_proximity <= right_deltaxsquared + right_deltaysquared;
        left_proximity <= left_deltaxsquared + left_deltaysquared;
        down_proximity <= down_deltaxsquared + down_deltaysquared;
        
        // check whether the ghost is within eight tiles of pacman (for clyde)
        if (pacman_x < ghost_x) ghost_deltax <= ghost_x - pacman_x;
        else ghost_deltax <= pacman_x - ghost_x;
        if (pacman_y < ghost_y) ghost_deltay <= ghost_y - pacman_y;
        else ghost_deltay <= pacman_y - ghost_y;
        ghost_deltaxsquared <= ghost_deltax * ghost_deltax;
        ghost_deltaysquared <= ghost_deltay * ghost_deltay;
        ghost_proximity <= ghost_deltaxsquared + ghost_deltaysquared;
        is_within_eight_tiles <= ghost_proximity < EIGHT_TILE_PROXIMITY;

        // check whether the ghost is home
        if ((ghost_y > HOME_TOP && ghost_y < HOME_BOTTOM)
         && ((ghost_x > P1_HOME_LEFT && ghost_x < P1_HOME_RIGHT) || (ghost_x > P2_HOME_LEFT && ghost_x < P2_HOME_RIGHT))) is_home <= 1;
        else is_home <= 0;

        // check whether the ghost is in the tile above the door
        if (ghost_y > ABOVE_DOOR_Y - 8 && ghost_y < ABOVE_DOOR_Y + 8
         && ((ghost_x > P1_ABOVE_DOOR_X - 8 && ghost_x < P1_ABOVE_DOOR_X + 8) || (ghost_x > P2_ABOVE_DOOR_X - 8 && ghost_x < P2_ABOVE_DOOR_X + 8))) is_above_door <= 1;
        else is_above_door <= 0;
        
        
        if (!enable_400mhz) begin
            next_direction <= ghost_direction;
            case (ghost_direction)
                DOWN: opposite_direction <= UP;
                UP: opposite_direction <= DOWN;
                LEFT: opposite_direction <= RIGHT;
                RIGHT: opposite_direction <= LEFT;
            endcase
        end else begin
            // Control the ghost's next direction based on the state it's in, its proximity to pacman,
            // and which ghost it is
            case (state)
                HOME: begin
                    // bob up and down
                    if (ghost_direction == DOWN) begin
                        if (|(open_directions & DOWN)) next_direction <= DOWN;
                        else next_direction <= UP;
                    end else if (ghost_direction == UP) begin
                        if (|(open_directions & UP)) next_direction <= UP;
                        else next_direction <= DOWN;
                    end
                    else begin
                        case (ghost_selector)
                            BLINKY: next_direction <= UP;
                            PINKY: next_direction <= DOWN;
                            CLYDE: next_direction <= UP;
                            default: next_direction <= DOWN;
                        endcase
                    end
                end
                LEAVE_HOME: begin
                    // directions for leaving home must be handled on every clock cycle
                end
                START_CHASE: begin
                    // do nothing to the direction
                end
                CHASE: begin
                    // set the target position based on the ghost
                    case (ghost_selector)
                        BLINKY: begin
                            // Blinky targets pacman directly
                            target_x <= pacman_x;
                            target_y <= pacman_y;
                        end
                        PINKY: begin
                            // Pinky targets four tiles in front of pacman
                            case (pacman_direction)
                                UP: begin
                                    // In the original game, a bug caused pinky to target the tile
                                    // four tiles up and four tiles to the left of pacman when pacman
                                    // is facing up. I decided to keep that feature.
                                    target_x <= pacman_x - 4 * TILE_SIZE;
                                    target_y <= pacman_y - 4 * TILE_SIZE;
                                end
                                RIGHT: begin
                                    target_x <= pacman_x + 4 * TILE_SIZE;
                                    target_y <= pacman_y;
                                end
                                LEFT: begin
                                    target_x <= pacman_x - 4 * TILE_SIZE;
                                    target_y <= pacman_y;
                                end
                                DOWN: begin
                                    target_x <= pacman_x;
                                    target_y <= pacman_y + 4 * TILE_SIZE;
                                end
                            endcase
                        end
                        CLYDE: begin
                            // Clyde targets pacman if he is more than eight tiles away 
                            // from pacman. If he's within eight tiles of pacman, he targets 
                            // his corner instead.
                            if (is_within_eight_tiles) begin
                                // bottom left corner
                                target_x <= 0;
                                target_y <= 29 * TILE_SIZE;
                            end else begin
                                target_x <= pacman_x;
                                target_y <= pacman_y;
                            end
                        end
                        default: begin
                            target_x <= pacman_x;
                            target_y <= pacman_y;
                        end
                    endcase
                                
                    // If there is only one available direction, go that way
                    case (open_directions)
                        UP: next_direction <= UP;
                        DOWN: next_direction <= DOWN;
                        LEFT: next_direction <= LEFT;
                        RIGHT: next_direction <= RIGHT;
                        default: begin // if there's more than one available direction we have a choice to make
                            // Populate the sorted directions with the directions in the correct order
                            if (up_proximity < left_proximity) begin
                                if (up_proximity < right_proximity) sorted_directions <= {UP, RIGHT, LEFT, DOWN};
                                else sorted_directions <= {RIGHT, UP, DOWN, LEFT};
                            end else begin
                                if (left_proximity < down_proximity) sorted_directions <= {LEFT, DOWN, UP, RIGHT};
                                else sorted_directions <= {DOWN, LEFT, RIGHT, UP};
                            end
    
                            // Choose the direction to the closest available position that is not directly opposite the ghost's
                            // current direction and not taking us back into the ghost home
                            if (is_above_door) begin
                                // Don't let us go back into the ghost home
                                if ((sorted_directions[15:12] != DOWN) && (sorted_directions[15:12] != opposite_direction) && |(sorted_directions[15:12] & open_directions)) begin
                                    next_direction <= sorted_directions[15:12];
                                end
                                else if ((sorted_directions[11:8] != DOWN) && (sorted_directions[11:8] != opposite_direction) && |(sorted_directions[11:8] & open_directions)) begin
                                    next_direction <= sorted_directions[11:8];
                                end
                                else if ((sorted_directions[7:4] != DOWN) && (sorted_directions[7:4] != opposite_direction) && |(sorted_directions[7:4] & open_directions)) begin
                                    next_direction <= sorted_directions[7:4];
                                end
                                else begin
                                    next_direction <= sorted_directions[3:0];
                                end
                            end else begin
                                if ((sorted_directions[15:12] != opposite_direction) && |(sorted_directions[15:12] & open_directions)) begin
                                    next_direction <= sorted_directions[15:12];
                                end
                                else if ((sorted_directions[11:8] != opposite_direction) && |(sorted_directions[11:8] & open_directions)) begin
                                    next_direction <= sorted_directions[11:8];
                                end
                                else if ((sorted_directions[7:4] != opposite_direction) && |(sorted_directions[7:4] & open_directions)) begin
                                    next_direction <= sorted_directions[7:4];
                                end
                                else begin
                                    next_direction <= sorted_directions[3:0];
                                end
                            end
                        end
                    endcase
                end
                START_SCATTER: begin
                    // reverse the ghost's direction
                    case (ghost_direction)
                        UP: next_direction <= DOWN;
                        RIGHT: next_direction <= LEFT;
                        LEFT: next_direction <= RIGHT;
                        DOWN: next_direction <= UP;
                        default: next_direction <= next_direction;  
                    endcase
                end
                SCATTER: begin
                    // set the target position based on the ghost
                    case (ghost_selector)
                        BLINKY: begin
                            // top left corner
                            target_x <= 0;
                            target_y <= 0;
                        end
                        PINKY: begin
                            // top right corner
                            target_x <= 39 * TILE_SIZE;
                            target_y <= 0;
                        end
                        CLYDE: begin
                            // bottom left corner
                            target_x <= 0;
                            target_y <= 29 * TILE_SIZE;
                        end
                        default: begin
                            target_x <= 0;
                            target_y <= 0;
                        end
                    endcase
                                    
                    // If there is only one available direction, go that way
                    case (open_directions)
                        UP: next_direction <= UP;
                        DOWN: next_direction <= DOWN;
                        LEFT: next_direction <= LEFT;
                        RIGHT: next_direction <= RIGHT;
                        default: begin // if there's more than one available direction we have a choice to make
                            // Populate the sorted directions with the directions in the correct order
                            if (up_proximity < left_proximity) begin
                                if (up_proximity < right_proximity) sorted_directions <= {UP, RIGHT, LEFT, DOWN};
                                else sorted_directions <= {RIGHT, UP, DOWN, LEFT};
                            end else begin
                                if (left_proximity < down_proximity) sorted_directions <= {LEFT, DOWN, UP, RIGHT};
                                else sorted_directions <= {DOWN, LEFT, RIGHT, UP};
                            end
    
                            // Choose the direction to the closest available position that is not directly opposite the ghost's
                            // current direction and doesn't take us back into the ghost home
                            if (is_above_door) begin
                                // Don't let us go back into the ghost home
                                if ((sorted_directions[15:12] != DOWN) && (sorted_directions[15:12] != opposite_direction) && |(sorted_directions[15:12] & open_directions)) begin
                                    next_direction <= sorted_directions[15:12];
                                end
                                else if ((sorted_directions[11:8] != DOWN) && (sorted_directions[11:8] != opposite_direction) && |(sorted_directions[11:8] & open_directions)) begin
                                    next_direction <= sorted_directions[11:8];
                                end
                                else if ((sorted_directions[7:4] != DOWN) && (sorted_directions[7:4] != opposite_direction) && |(sorted_directions[7:4] & open_directions)) begin
                                    next_direction <= sorted_directions[7:4];
                                end
                                else begin
                                    next_direction <= sorted_directions[3:0];
                                end
                            end else begin
                                if ((sorted_directions[15:12] != opposite_direction) && |(sorted_directions[15:12] & open_directions)) begin
                                    next_direction <= sorted_directions[15:12];
                                end
                                else if ((sorted_directions[11:8] != opposite_direction) && |(sorted_directions[11:8] & open_directions)) begin
                                    next_direction <= sorted_directions[11:8];
                                end
                                else if ((sorted_directions[7:4] != opposite_direction) && |(sorted_directions[7:4] & open_directions)) begin
                                    next_direction <= sorted_directions[7:4];
                                end
                                else begin
                                    next_direction <= sorted_directions[3:0];
                                end
                            end
                        end                
                    endcase
                end
                START_SCARED: begin
                    // reverse the ghost's direction
                    case (ghost_direction)
                        UP: next_direction <= DOWN;
                        RIGHT: next_direction <= LEFT;
                        LEFT: next_direction <= RIGHT;
                        DOWN: next_direction <= UP;
                        default: next_direction <= next_direction;  
                    endcase
                end
                SCARED: begin
                    // if only one direction is available, go that way
                    // If there is only one available direction, go that way
                    case (open_directions)
                        UP: next_direction <= UP;
                        DOWN: next_direction <= DOWN;
                        LEFT: next_direction <= LEFT;
                        RIGHT: next_direction <= RIGHT;
                        default: begin // if there's more than one available direction we have a choice to make
                            // Randomly choose a sorting of directions. Pacman could be anywhere on
                            // the board, so we can XOR the last two bits of its x and y coordinates
                            // as a seed to create a two-bit random number.
                            case (scatter_direction_selector)
                                2'b00: begin
                                    scatter_direction_selector <= 2'b01;
                                    case (pacman_x[1:0]^pacman_y[1:0])
                                        2'b00: sorted_directions <= {DOWN, UP, LEFT, RIGHT};
                                        2'b01: sorted_directions <= {RIGHT, LEFT, UP, DOWN};
                                        2'b10: sorted_directions <= {UP, DOWN, RIGHT, LEFT};
                                        2'b11: sorted_directions <= {LEFT, RIGHT, DOWN, UP};
                                        default: sorted_directions <= {DOWN, UP, LEFT, RIGHT};
                                    endcase
                                end
                                2'b01: begin
                                    scatter_direction_selector <= 2'b10;
                                    case (pacman_x[1:0]^pacman_y[1:0])
                                        2'b00: sorted_directions <= {RIGHT, LEFT, UP, DOWN};
                                        2'b01: sorted_directions <= {UP, DOWN, RIGHT, LEFT};
                                        2'b10: sorted_directions <= {LEFT, RIGHT, DOWN, UP};
                                        2'b11: sorted_directions <= {DOWN, UP, LEFT, RIGHT};
                                        default: sorted_directions <= {DOWN, UP, LEFT, RIGHT};
                                    endcase
                                end
                                2'b10: begin
                                    scatter_direction_selector <= 2'b00;
                                    case (pacman_x[1:0]^pacman_y[1:0])
                                        2'b00: sorted_directions <= {UP, DOWN, RIGHT, LEFT};
                                        2'b01: sorted_directions <= {LEFT, RIGHT, DOWN, UP};
                                        2'b10: sorted_directions <= {DOWN, UP, LEFT, RIGHT};
                                        2'b11: sorted_directions <= {RIGHT, LEFT, UP, DOWN};
                                        default: sorted_directions <= {DOWN, UP, LEFT, RIGHT};
                                    endcase
                                end
                                default: begin
                                    scatter_direction_selector <= 2'b01;
                                    case (pacman_x[1:0]^pacman_y[1:0])
                                        2'b00: sorted_directions <= {DOWN, UP, LEFT, RIGHT};
                                        2'b01: sorted_directions <= {RIGHT, LEFT, UP, DOWN};
                                        2'b10: sorted_directions <= {UP, DOWN, RIGHT, LEFT};
                                        2'b11: sorted_directions <= {LEFT, RIGHT, DOWN, UP};
                                        default: sorted_directions <= {DOWN, UP, LEFT, RIGHT};
                                    endcase
                                end
                            endcase
                            
                            // Choose the next direction to be the most significant direction in the sorted directions
                            // that is not directly opposite the ghost's current direction and doesn't take us back into the ghost home
                            if (is_above_door) begin
                                // Don't let us go back into the ghost home
                                if ((sorted_directions[15:12] != DOWN) && (sorted_directions[15:12] != opposite_direction) && |(sorted_directions[15:12] & open_directions)) begin
                                    next_direction <= sorted_directions[15:12];
                                end
                                else if ((sorted_directions[11:8] != DOWN) && (sorted_directions[11:8] != opposite_direction) && |(sorted_directions[11:8] & open_directions)) begin
                                    next_direction <= sorted_directions[11:8];
                                end
                                else if ((sorted_directions[7:4] != DOWN) && (sorted_directions[7:4] != opposite_direction) && |(sorted_directions[7:4] & open_directions)) begin
                                    next_direction <= sorted_directions[7:4];
                                end
                                else begin
                                    next_direction <= sorted_directions[3:0];
                                end
                            end else begin
                                if ((sorted_directions[15:12] != opposite_direction) && |(sorted_directions[15:12] & open_directions)) begin
                                    next_direction <= sorted_directions[15:12];
                                end
                                else if ((sorted_directions[11:8] != opposite_direction) && |(sorted_directions[11:8] & open_directions)) begin
                                    next_direction <= sorted_directions[11:8];
                                end
                                else if ((sorted_directions[7:4] != opposite_direction) && |(sorted_directions[7:4] & open_directions)) begin
                                    next_direction <= sorted_directions[7:4];
                                end
                                else begin
                                    next_direction <= sorted_directions[3:0];
                                end
                            end
                        end
                    endcase
                end
                CAUGHT: begin
                    // take us back into the ghost home if we're right on top of it
                    if (is_above_door) next_direction <= DOWN;
                    else begin
                        // otherwise, head toward the spot directly above the ghost home
                        if (ghost_x < BOARD_DIVIDER) target_x <= P1_ABOVE_DOOR_X;
                        else target_x <= P2_ABOVE_DOOR_X;
                        target_y <= ABOVE_DOOR_Y;
                
                        // If there is only one available direction, go that way
                        case (open_directions)
                            UP: next_direction <= UP;
                            DOWN: next_direction <= DOWN;
                            LEFT: next_direction <= LEFT;
                            RIGHT: next_direction <= RIGHT;
                            default: begin // if there's more than one available direction we have a choice to make
                                // Populate the sorted directions with the directions in the correct order
                                if (up_proximity < left_proximity) begin
                                    if (up_proximity < right_proximity) sorted_directions <= {UP, RIGHT, LEFT, DOWN};
                                    else sorted_directions <= {RIGHT, UP, DOWN, LEFT};
                                end else begin
                                    if (left_proximity < down_proximity) sorted_directions <= {LEFT, DOWN, UP, RIGHT};
                                    else sorted_directions <= {DOWN, LEFT, RIGHT, UP};
                                end
        
                                // Choose the direction to the closest available position that is not directly opposite the ghost's
                                // current direction (we can go into the ghost home in this case)
                                if ((sorted_directions[15:12] != opposite_direction) && |(sorted_directions[15:12] & open_directions)) begin
                                    next_direction <= sorted_directions[15:12];
                                end
                                else if ((sorted_directions[11:8] != opposite_direction) && |(sorted_directions[11:8] & open_directions)) begin
                                    next_direction <= sorted_directions[11:8];
                                end
                                else if ((sorted_directions[7:4] != opposite_direction) && |(sorted_directions[7:4] & open_directions)) begin
                                    next_direction <= sorted_directions[7:4];
                                end
                                else begin
                                    next_direction <= sorted_directions[3:0];
                                end
                            end                
                        endcase
                    end
                end
                default: begin
                    // do nothing
                end
            endcase
        end
    end
endmodule
