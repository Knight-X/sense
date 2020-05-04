`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2020 12:51:31 AM
// Design Name: 
// Module Name: general_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module general_register(clk, reset, in, load0, load1, load2, load3, out0, out1, out2, out3

    );
    
    input clk, reset;
    input load0, load1, load2, load3;
    
    output [7:0] out0, out1, out2, out3;
    
    reg [7:0] out0, out1, out2, out3;
    
    input [7:0] in;
    
    always @(posedge clk, posedge reset)
      begin
        if (reset) 
          begin
            out0 <= 0;
            out1 <= 0;
            out2 <= 0;
            out3 <= 0;
          end
        else if (load0) 
          begin
            out0 <= in;
          end
        else if (load1)
          begin 
            out1 <= in;
          end
        else if (load2)
          begin
            out2 <= in;
          end
        else if (load3)
          begin
            out3 <=  in;
          end
       end
       
endmodule
