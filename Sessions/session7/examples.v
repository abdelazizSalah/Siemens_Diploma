module  HalfAdderUsingAssign (
    S,C,A,B
);
// defining inputs
input A,B;

// defining outputs
output S,C;

assign S = A ^ B; // A xor B
assign C = A&B; // A and B
    
endmodule

module HalfAdderUsingGatesPrimitives (S,C,A,B) ;
// defining inputs
input A,B;

// defining outputs
output S,C;

xor #2 (S, A,B); // A xor B // #2 is the delay, S is the output which is defined in the begining of the gate
and #1 (C, A,B); 

endmodule

module FFAsynchronousReset (Q, D, CLK, Reset); 
// defining inputs 
input CLK, D, Reset;

// defining outputs
output Q; 

// defining internal variables
reg Q;

always @(negedge CLK, posedge Reset) begin // negedge is the negative edge of the clock 
if(Reset == 1'b1) begin
    Q <= 1'b0;
end else begin
Q <= D; // this is a non-blocking assignment, it will be executed at the end of the always block
end
end
endmodule
module FFSynchronousReset (Q, D, CLK, Reset); 
// defining inputs 
input CLK, D, Reset;

// defining outputs
output Q; 

// defining internal variables
reg Q;

always @(negedge CLK) begin // negedge is the negative edge of the clock 
if(Reset == 1'b1) begin
    Q <= 1'b0;
end else begin 
Q <= D; // this is a non-blocking assignment, it will be executed at the end of the always block
end
end
endmodule

module Latch (Q,D,CLK);
input D, CLK; // inputs are always wires. 

output reg Q;

always @(posedge CLK, D) begin
if(CLK == 1'b1) begin  // because it is level sensitive
Q <= D; 
end
end
endmodule