module RAM #(parameter N = 8) (dataIn, dataOut, address, rd,wr,clk);
// defining the inputs

input [N - 1: 0] address; 
input [15-1:0] dataIn; 
input rd, wr, clk;

// defining the outputs 
output reg [15-1:0]  dataOut; 
reg [N-1:0] mem [15-1:0];
// defining the writing always block 
always @(negedge clk) begin 
    if(wr == 1) begin 
        mem[address] <= dataIn; 
    end else begin 
        mem[address] <= mem[address]; 
    end
end

// defining the reading always block
always @ (posedge clk) begin 
    if(rd) begin
        dataOut <= mem[address]; 
    end else begin 
        mem[address] <= mem[address]; 
    end

end 
endmodule

module ROM #(parameter N  = 2)(clk, addr, dataOut);
// defining the inputs 
input clk; 
input [N-1:0] addr; 

// defining the output
output reg[3:0] dataOut;

// applying the logic 
always @ (posedge clk) begin
    case (addr) 
    0 : dataOut <= 4'b0000; 
    1 : dataOut <= 4'b0001; 
    2 : dataOut <= 4'b0010; 
    3 : dataOut <= 4'b0011; 
    endcase
end
endmodule