/// @Author : Abdelaziz Salah Mohammed Abdou
/// This file contains the testbench for the FIFO module.

module FifoTB () ;
localparam  Time = 100;
reg clk_read, clk_write, rst, read_enable, write_enable;
reg ReadingIsFaster;
reg [7:0] data_in;
wire [7:0] data_out;
wire full_flag, empty_flag;  
FIFO fifoUUT (
    .clk_read(clk_read),
    .clk_write(clk_write),
    .rst(rst),
    .read_enable(read_enable),
    .write_enable(write_enable),
    .full_flag(full_flag),
    .empty_flag(empty_flag),
    .ReadingIsFaster(ReadingIsFaster),
    .data_in(data_in),
    .data_out(data_out)
    );
integer i; 
initial begin
    // try to read while the FIFO is empty
    rst = 1'b1;
    #Time;
    rst = 1'b0;
    #Time;
    ReadingIsFaster = 1; 
    read_enable = 1; 
    write_enable = 0;
    #Time;
    if(empty_flag == 1'b1) begin
        $display("Success! FIFO is empty");
    end else begin
        $display("Failure!, FIFO is not empty");
    end

    // write to the FIFO 2 words and then trying to read them 
    data_in = 8'b10101010;
    #Time; 
    ReadingIsFaster  = 0;
    read_enable = 0;
    write_enable = 1;
    // writing the first word
    #Time;
    #Time;
    data_in = 8'b11110000;
    // writing the second word
    #Time;
    #Time;
    data_in = 8'b00101001;
    #Time;
    #Time;
    data_in = 8'b00100000;
    #Time;
    #Time;
    // trying to read the first word
    read_enable = 1;
    write_enable = 0;
    ReadingIsFaster = 1;
    #Time;
    #Time;

    if(data_out == 8'b10101010) begin
        $display("Success! FIFO is reading the first word");
    end else begin
        $display("Failure!, FIFO is not reading the first word");
    end
    #Time;
    #Time;
    if(data_out == 8'b11110000) begin
        $display("Success! FIFO is reading the second word");
    end else begin
        $display("Failure!, FIFO is not reading the second word");
    end
    #Time;
    #Time;
    if(data_out == 8'b00101001) begin
        $display("Success! FIFO is reading the third word");
    end else begin
        $display("Failure!, FIFO is not reading the third word");
    end
    #Time;
    #Time;
    if(data_out == 8'b00100000) begin
        $display("Success! FIFO is reading the fourth word");
    end else begin
        $display("Failure!, FIFO is not reading the fourth word");
    end
    #Time;
    #Time;
    // writing till making the FIFO full
    ReadingIsFaster = 0; 
    read_enable = 0;
    write_enable = 1;
    for( i = 0 ; i < 32 ; i = i + 1) begin
        data_in = 8'b11110000 << (i % 8);
        #Time;
        #Time;
    end
    if(full_flag == 1'b1) begin
        $display("Success! FIFO is full");
    end else begin
        $display("Failure!, FIFO is not full");
    end

    // reading till making the FIFO empty
    ReadingIsFaster = 1;
    read_enable = 1;
    write_enable = 0;
    for( i = 0 ; i < 32 ; i = i + 1) begin
        #Time;
        #Time;
    end
    if(empty_flag == 1'b1) begin
        $display("Success! FIFO is empty");
    end else begin
        $display("Failure!, FIFO is not empty");
    end
end

// block for toggeling the clock
initial begin
    clk_read = 1'b1;
    clk_write = 1'b1;
    forever begin
        #Time;
    clk_read =  !clk_read;
    clk_write =!clk_write;
    end 
end

endmodule