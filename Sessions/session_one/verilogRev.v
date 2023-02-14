// this is how we can make a comment in verilog
// or we can use /* */ to make a comment also. 

// numeric constants 
8'b00001010 // 8 bit binary constant
8'd10 // 8 bit decimal constant
8'h0A // 8 bit hex constant
8'o12 // 8 bit octal constant -> this is 8 bits but represented in octal form. 
// if we declared more bits for values which doesn't have that many bits, then the extra bits will be 0, from the left. 
"k" // this is ascii character constant.
// also if we assigned a value which is greater than the number of bits we declared, then the extra bits will be discarded.
//for example
1'd5 // this is 1 bit, so the value will be 1, because 5 is greater than 1 bit.

/// Now lets revise nets and variables 
wire[3:0] w; // this is a 4 bit wire. -> always assigned outside an always block. 
reg [1:7]r; // this is a 7 bit register. -> always assigned inside an always block.
reg [7:0] mem [31:0] ;// this is a 8 bit memory with 32 locations in each row.
integer k ; // compile time variable. 
genvar j ; // general variable. 

// Parameters
parameter N = 9; // this parameter is a value which make the module able to be reused but with different values, by which 
// we can make the module able to deal with 6 bits on one time, and in the next run time, we can make it deal with 8 bits for example.
// this is a compile time parameter.

// ie: N-bits adder, can work as 4-bits, 8-bits or 16-bits adder and so on.

// Local Parameters
localparam M = 9; // local param can be declared in a generate block, the idea behind it is to protect the value of the local param form the accidental redefine.
// local param hwa byb2a gowa el module nafso, maynf34 teb3to mn module le module tany, lakn el parameters te2dr tb3thom 3ady.


// Assignments 
// this is a blocking assignment.
// this means that the result of the multiplication will always appear on the wire which is called out.
assign out = A * B;



// this is a concatenation assignment, so we will put C and D as one big reg
// and will put the value of D[5:2] and C[1:9] and E in it.
assign {C,D} = {D[5:2],C[1:9],E} ; 


/// Operators 
A[N] // this is a selection operator, it will select the Nth bit of A.
A[N:M] // this is a part select operator, it will select the bits from N to M of A.

// Reduction: erilog has six reduction operators, these operators accept a single vectored (multiple bit) operand,
// performs the appropriate bit-wise reduction on all bits of the operand, 
// and returns a single bit result. For example, the four bits of A are ANDed together to produce Y1
// Note: ~ this is a bitwise negation operator, it will negate all the bits of A. -> it will negate each bit
// Note: ! this is a logical negation operator, it will result one bit, which indicate whethere the result is 0 or 1.
&A // this is a reduction AND operator, it will return 1 if all the bits of A are 1, otherwise it will return 0.
~&A // this is a reduction NAND operator, it will return 0 if all the bits of A are 1, otherwise it will return 1. 
|A // this is a reduction OR operator, it will return 1 if at least one bit of A is 1, otherwise it will return 0.
~|A // this is a reduction NOR operator, it will return 0 if at least one bit of A is 1, otherwise it will return 1.
^A // this is a reduction XOR operator, it will return 1 if the number of 1's in A is odd, otherwise it will return 0.
~^A // this is a reduction XNOR operator, it will return 0 if the number of 1's in A is odd, otherwise it will return 1.

// Replication
{N{A}} // this will replicate A N times.
{A,B,C} // this will concatenate A,B,C.

// bitwise operators
A & B // this is a bitwise AND operator, it will return 1 if both A and B are 1, otherwise it will return 0.
A | B // this is a bitwise OR operator, it will return 1 if at least one of A and B is 1, otherwise it will return 0.
A ^ B // this is a bitwise XOR operator, it will return 1 if A and B are different, otherwise it will return 0.
A ~ B // this is a bitwise XNOR operator, it will return 1 if A and B are the same, otherwise it will return 0.
A << B // this is a bitwise left shift operator, it will shift A to the left by B bits.
A >> B // this is a bitwise right shift operator, it will shift A to the right by B bits.

// Logical operators
A && B // this is a logical AND operator, it will return 1 if both A and B are 1, otherwise it will return 0.
A || B // this is a logical OR operator, it will return 1 if at least one of A and B is 1, otherwise it will return 0.
A ^^ B // this is a logical XOR operator, it will return 1 if A and B are different, otherwise it will return 0.
A ~^ B // this is a logical XNOR operator, it will return 1 if A and B are the same, otherwise it will return 0.

// Case 
always @(*) begin 
    case (A)
        2'b00: Y = 1'b0;
        2'b01: Y = 1'b1;
        2'b10: Y = 1'b1;
        2'b11: Y = 1'b0;
        default : Y = 1'b0;
            
    endcase 
end

// Casex this is used for don't care bits. (here x,z, and ? represents don't care bits)
always @(*) begin 
    casex (A) // this is recommended to never be used for synthesisable code.
       4'b1x?x: Encoded = 2'd0;
       4'b01xz: Encoded = 2'd1;
       4'b001x: Encoded = 2'd2;
       4'b0001: Encoded = 2'd3;
default: Encoded = 2'd0;
    endcase 
end

// loops 
always @ (*) begin 
    Count = 0 ; 
    for (i = 0 ; i < 8 ; i = i + 1) begin 
        if (A[i] == 1'b1) begin 
            Count = Count + 1 ; 
        end 
    end // these loops are used only inside always blocks.
end

/// Functions 
/*
    the purpose of the function is to make the code more readable and reusable.
    it follows this formate:
    function [return type] function_name (input [width:0] input1, input [width:0] input2, ...);
        // function body
    endfunction
    if the function doesn't return anything, we will use void as the return type.
*/
function [7:0] adder (input [3:0] A , input [3:0] B) ; 
    reg [7:0] C ; 
    C = A + B ; 
    return C ;
endfunction

/// Generate
/*
    generate is used to generate a block of code multiple times.
    it follows this formate:
    generate 
        for (i = 0 ; i < N ; i = i + 1) begin : gen_name
            // block of code
        end
    endgenerate
    the gen_name is used to name the block of code, so we can use it in the always block.
*/
generate 
    for (i = 0 ; i < N ; i = i + 1) begin : gen_name
        // block of code
        // this block should be a hardware block, so we usually insert blocks or modules here. 
    end
endgenerate

/// StateMachines
/*
    state machines are used to control the flow of the program.
    it follows this formate:
    always @ (posedge clk) begin
        case (state)
            state1: begin
                // block of code
                if (condition) begin
                    state <= state2;
                end
            end
            state2: begin
                // block of code
                if (condition) begin
                    state <= state1;
                end
            end
        endcase
    end
*/
reg [1:0]State;
localparam Start = 2'b00;
localparam Idle = 2'b01;
localparam Work = 2'b11;
localparam Done = 2'b10;
reg tReset;
always @(posedge Clk) begin
tReset <= Reset;
if(tReset) begin
State <= Start;
end else begin
case(State)
Start: begin
State <= Idle;
end
Idle: begin
State <= Work;
end
Work: begin
State <= Done;
end
Done: begin
State <= Idle;
end
default:;
endcase
end
end