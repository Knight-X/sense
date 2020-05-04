
module register_tb(

    );
    
    reg clk;
    reg reset;
    reg [7:0] data_in;
    wire [7:0] data_out;
    
    reg [7:0] load;
    
    register uut (
      .clk(clk),
      .reset(reset),
      .data_in(data_in),
      .load(load),
      .data_out(data_out)
      );
      
    initial begin
      clk = 0;
      reset = 0;
      data_in = 0;
      load = 0;
      #200;
      clk = 1;
      reset = 1;
      data_in = 1;
      load = 0;
      #100;
      clk = 0;
      reset = 0;
      #100;
      clk = 1;
      reset = 0;
      data_in = 1;
      load = 1;
    end
endmodule