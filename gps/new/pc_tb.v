module pc_tb(

    );
    
    reg clk;
    reg reset;
    reg inc, load;
    wire [7:0] data_out;
    
    reg [7:0] data_in;
    
    pc p(
     .clk(clk),
     .reset(reset),
     .data_in(data_in),
     .load(load),
     .inc(inc),
     .data_out(data_out)
     );
     
     initial begin
       clk = 0;
       reset = 0;
       inc = 0;
       load = 0;
       data_in = 0;
       #100;
       clk = 1;
       load = 1;
       data_in = 5;
       #100;
       clk = 0;
       load = 0;
       #100;
       clk = 1;
       inc = 1;
       #100;
     end
endmodule