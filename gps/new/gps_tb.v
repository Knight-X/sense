module gps_tb(

    );
    
    reg clk;
    reg reset;
    reg  load_0, load_1, load_2, load_3;
    wire [7:0] out_0, out_1, out_2, out_3;
    
    reg [7:0] in;
    
    general_register gp(
     .clk(clk),
     .reset(reset),
     .load0(load_0),
     .load1(load_1),
     .load2(load_2),
     .load3(load_3),
     .in(in),
     .out0(out_0),
     .out1(out_1),
     .out2(out_2),
     .out3(out_3)
     );
     
     initial begin
      clk = 0;
      reset = 0;
      load_0 = 0;
      in = 0;
      load_1 = 0;
      load_2 = 0;
      load_3 = 0;
      #100;
      clk = 1;
      in = 3;
      load_0 = 1;
      #100;
      clk = 0;
      reset = 0;
      load_0 = 0;
      in = 0;
      load_1 = 0;
      load_2 = 0;
      load_3 = 0;
      #100;
      clk = 1;
      load_1 = 1;
      in = 5;
      #100;
            clk = 0;
      reset = 0;
      load_0 = 0;
      in = 0;
      load_1 = 0;
      load_2 = 0;
      load_3 = 0;
      #100;
      clk = 1;
      load_2 = 1;
      in = 6;
      #100;
            clk = 0;
      reset = 0;
      load_0 = 0;
      in = 0;
      load_1 = 0;
      load_2 = 0;
      load_3 = 0;
      #100;
      clk = 1;
      load_3 = 1;
      in = 9;
      #300;
     end
endmodule