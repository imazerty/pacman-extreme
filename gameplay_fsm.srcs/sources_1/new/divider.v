//creates a pulse every 1 second unless in warp mode because this lab takes long enough with out waiting for every timer
module divider(input clk, output reg one_hz, input sw, input reset);
    reg [28:0]count;
    reg reset_prev;
    
    assign warp_speed = sw; 
    always @ (posedge clk) begin
        reset_prev<=reset;
        if (reset&!reset_prev) count=0;
        else if (count >= (warp_speed ? 3 : 24_999_999)) count <= 0;
        else count <= count +1;
        one_hz <= (count == (warp_speed ? 3 : 24_999_999)) ;
    end
    
    
endmodule