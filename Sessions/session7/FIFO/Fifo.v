// module FIFO #(parameter ADDR_WIDTH = 5, DATA_WIDTH = 8)(data_out, data_in, clk_read, clk_write, enqueue, dequeue); // that what should be delivered
module FIFO #(parameter ADDR_WIDTH = 5, DATA_WIDTH = 8)
                (data_out, data_in, clk_read,
                     clk_write, full_flag, empty_flag, read_enable, write_enable, rst ); // implementing my own logic
// defining the inputs 
input [DATA_WIDTH -1:0] data_in;
input clk_write, clk_read; 
input read_enable, write_enable, rst; 

// defining the outputs 
output reg empty_flag, full_flag; 
output reg [DATA_WIDTH -1 : 0] data_out;

// defining utilities 
// 31 because we have 5 bits for address, so we can access up to 2^5, 
// memory size = 32 * 8 = 256 bits. 
reg [DATA_WIDTH-1:0] dualPortMem [ 31 :0]; 
reg [ADDR_WIDTH-1 :0] readAddressPointer; 
reg [ADDR_WIDTH-1 :0] writeAddressPointer;
/// this is a flag which indicates which frequency is higher, reading or writing.
reg ReadingIsFaster; 

/// writing the FIFO algorithm
// implementing the reading algorithm
always @ (posedge clk_read, rst) begin 
    if(rst == 1'b1) begin 
        readAddressPointer <= 31; 
    end else begin 
        if(empty_flag != 1'b1 && read_enable == 1'b1) begin 
            // increment the read address, and applying the circular behaviour. 
            if(readAddressPointer != 5'b11111) begin
                readAddressPointer <= readAddressPointer + 1;
            end else begin 
                readAddressPointer <= 0 ; 
            end
            // put the data on the dataout
            data_out <= dualPortMem[readAddressPointer]; 

        end  else begin 
            // this indicates that we can't read.
            data_out <= data_out;
        end
    end
end 

// implementing the writing algorithm
always @ (negedge clk_write) begin 
    if (rst == 1'b1) begin 
        writeAddressPointer <= 0; 
    end else begin 
        if(full_flag != 1'b1 && write_enable == 1'b1) begin 
            // put the data on the dataout
            dualPortMem[writeAddressPointer] <= data_in; 

            // increment the read address, and applying the circular behaviour. 
            if(writeAddressPointer != 5'b11111) begin
                writeAddressPointer <= writeAddressPointer + 1;
            end else begin 
                writeAddressPointer <= 5'b01 ; 
            end
        end  else begin 
            // this indicates that we can't write now.
            dualPortMem[writeAddressPointer] <= dualPortMem[writeAddressPointer]  ;
        end
    end 
end 

// implementing the algorithm of changing the flags, combinational logic 
always @(ReadingIsFaster) begin 
    // if rate of reading is faster than that of writing 
    // setting initial values to avoid unintended latches. 
    empty_flag =0; 
    full_flag =0; 
    if(ReadingIsFaster == 1'b1) begin 
        if(readAddressPointer == writeAddressPointer) begin
            empty_flag = 1; 
        end
    end else begin 
        if(readAddressPointer == writeAddressPointer) begin
            full_flag = 1; 
        end
    end
end

endmodule