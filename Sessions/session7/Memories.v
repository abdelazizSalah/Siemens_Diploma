module RAM #(parameter N = 8) (dataIn, dataOut, address, rd,wr,clk);
// defining the inputs

input [N - 1: 0] address; 
input [15-1:0] dataIn; 
input rd, wr, clk;

// defining the outputs 
output reg [15-1:0]  dataOut; 
reg [N-1:0] mem [15-1:0];
// defining the writing always block 
always @(clk) begin 
    if(wr == 1) begin 
        mem[address] = dataIn; 
    end else begin 
        mem[address] = mem[address]; 
    end
end

// defining the reading always block
always @ (clk) begin 
    if(rd) begin
        dataOut = mem[address]; 
    end else begin 
        mem[address] = mem[address]; 
    end

end 
endmodule