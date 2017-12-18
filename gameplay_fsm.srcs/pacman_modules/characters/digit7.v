module digit 7 (
    input clk,
    input reset,
    input inner_graphics,
    input [10:0] hcount,
    input [9:0] vcount,
    input [10:0] x,
    input [9:0] y,
    output reg [11:0] pixel
    );

    always @(posedge clk) begin
        if (vcount == y && hcount == x) pixel <= 12'h000;
        else if (vcount == y + 0 && hcount == x + 1) pixel <= 12'h000;
        else if (vcount == y + 0 && hcount == x + 2) pixel <= 12'h000;
        else if (vcount == y + 0 && hcount == x + 3) pixel <= 12'h000;
        else if (vcount == y + 0 && hcount == x + 4) pixel <= 12'h000;
        else if (vcount == y + 0 && hcount == x + 5) pixel <= 12'h000;
        else if (vcount == y + 0 && hcount == x + 6) pixel <= 12'h000;
        else if (vcount == y + 0 && hcount == x + 7) pixel <= 12'h000;
        else if (vcount == y + 1 && hcount == x + 0) pixel <= 12'h000;
        else if (vcount == y + 1 && hcount == x + 1) pixel <= 12'hFFF;
        else if (vcount == y + 1 && hcount == x + 2) pixel <= 12'hFFF;
        else if (vcount == y + 1 && hcount == x + 3) pixel <= 12'hFFF;
        else if (vcount == y + 1 && hcount == x + 4) pixel <= 12'hFFF;
        else if (vcount == y + 1 && hcount == x + 5) pixel <= 12'hFFF;
        else if (vcount == y + 1 && hcount == x + 6) pixel <= 12'hFFF;
        else if (vcount == y + 1 && hcount == x + 7) pixel <= 12'hFFF;
        else if (vcount == y + 2 && hcount == x + 0) pixel <= 12'h000;
        else if (vcount == y + 2 && hcount == x + 1) pixel <= 12'hFFF;
        else if (vcount == y + 2 && hcount == x + 2) pixel <= 12'hFFF;
        else if (vcount == y + 2 && hcount == x + 3) pixel <= 12'h000;
        else if (vcount == y + 2 && hcount == x + 4) pixel <= 12'h000;
        else if (vcount == y + 2 && hcount == x + 5) pixel <= 12'h000;
        else if (vcount == y + 2 && hcount == x + 6) pixel <= 12'hFFF;
        else if (vcount == y + 2 && hcount == x + 7) pixel <= 12'hFFF;
        else if (vcount == y + 3 && hcount == x + 0) pixel <= 12'h000;
        else if (vcount == y + 3 && hcount == x + 1) pixel <= 12'h000;
        else if (vcount == y + 3 && hcount == x + 2) pixel <= 12'h000;
        else if (vcount == y + 3 && hcount == x + 3) pixel <= 12'h000;
        else if (vcount == y + 3 && hcount == x + 4) pixel <= 12'h000;
        else if (vcount == y + 3 && hcount == x + 5) pixel <= 12'hFFF;
        else if (vcount == y + 3 && hcount == x + 6) pixel <= 12'hFFF;
        else if (vcount == y + 3 && hcount == x + 7) pixel <= 12'h000;
        else if (vcount == y + 4 && hcount == x + 0) pixel <= 12'h000;
        else if (vcount == y + 4 && hcount == x + 1) pixel <= 12'h000;
        else if (vcount == y + 4 && hcount == x + 2) pixel <= 12'h000;
        else if (vcount == y + 4 && hcount == x + 3) pixel <= 12'h000;
        else if (vcount == y + 4 && hcount == x + 4) pixel <= 12'hFFF;
        else if (vcount == y + 4 && hcount == x + 5) pixel <= 12'hFFF;
        else if (vcount == y + 4 && hcount == x + 6) pixel <= 12'h000;
        else if (vcount == y + 4 && hcount == x + 7) pixel <= 12'h000;
        else if (vcount == y + 5 && hcount == x + 0) pixel <= 12'h000;
        else if (vcount == y + 5 && hcount == x + 1) pixel <= 12'h000;
        else if (vcount == y + 5 && hcount == x + 2) pixel <= 12'h000;
        else if (vcount == y + 5 && hcount == x + 3) pixel <= 12'hFFF;
        else if (vcount == y + 5 && hcount == x + 4) pixel <= 12'hFFF;
        else if (vcount == y + 5 && hcount == x + 5) pixel <= 12'h000;
        else if (vcount == y + 5 && hcount == x + 6) pixel <= 12'h000;
        else if (vcount == y + 5 && hcount == x + 7) pixel <= 12'h000;
        else if (vcount == y + 6 && hcount == x + 0) pixel <= 12'h000;
        else if (vcount == y + 6 && hcount == x + 1) pixel <= 12'h000;
        else if (vcount == y + 6 && hcount == x + 2) pixel <= 12'h000;
        else if (vcount == y + 6 && hcount == x + 3) pixel <= 12'hFFF;
        else if (vcount == y + 6 && hcount == x + 4) pixel <= 12'hFFF;
        else if (vcount == y + 6 && hcount == x + 5) pixel <= 12'h000;
        else if (vcount == y + 6 && hcount == x + 6) pixel <= 12'h000;
        else if (vcount == y + 6 && hcount == x + 7) pixel <= 12'h000;
        else if (vcount == y + 7 && hcount == x + 0) pixel <= 12'h000;
        else if (vcount == y + 7 && hcount == x + 1) pixel <= 12'h000;
        else if (vcount == y + 7 && hcount == x + 2) pixel <= 12'h000;
        else if (vcount == y + 7 && hcount == x + 3) pixel <= 12'hFFF;
        else if (vcount == y + 7 && hcount == x + 4) pixel <= 12'hFFF;
        else if (vcount == y + 7 && hcount == x + 5) pixel <= 12'h000;
        else if (vcount == y + 7 && hcount == x + 6) pixel <= 12'h000;
        else if (vcount == y + 7 && hcount == x + 7) pixel <= 12'h000;
        else pixel <= 12'h000;
    end
endmodule
