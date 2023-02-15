module dff_en_pre_tb ();
    reg E,D,clk, pre; 
    wire Q;
    integer i = 0;

    // instantiate the unit under test (UUT)
    dff_en_pre dff_en_pre (
        .E(E),
        .D(D),
        .Q(Q),
        .clk(clk),
        .pre(pre)
    );

    initial begin
        clk = 0; 
        forever #5 clk = ~clk;
    end

    initial begin
        pre = 0; 
        D = 0;
        #50;
        pre = 1;
        #100;
        for(i =0; i < 100; i = i+1) begin 
            // 90% of the time, E = 1, so Q should be D at positive edge of clock
            if(i < 90) begin
                E = 1; 
            // 10% of the time, E = 0, so Q should be Q at positive edge of clock
            end else begin 
                E = 0; 
            end 
            @(negedge clk)
                D = $random ; 
                #2;
        end
        $stop ;
    end
endmodule