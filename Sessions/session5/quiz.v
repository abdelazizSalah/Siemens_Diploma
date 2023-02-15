module Session2Quiz #(
    parameter N = 4
) (
    load, clock, reset, data, count
);

// defining inputs
input load, clock, reset;
input [N-1:0] data;

// defining outputs
output [N-1:0] count;

// defining internal variables
reg [N-1:0] count;

always @(posedge clock or posedge reset) begin 
    if(reset) begin 
        count <= 0; 
    end else begin 
        if(load) begin 
            count <= data; 
        end else begin 
            count <= count + 1; 
        end
    end
end
    
endmodule