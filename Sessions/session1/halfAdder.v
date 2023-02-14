module HA #(parameter N = 8) (A,B,S,C);
// defining inputs 
input  A,B;

// defining outputs
output reg S;
output reg C;

// applying the logic
always @(*) begin
    S = A ^ B;
    C = A & B;
end

endmodule
