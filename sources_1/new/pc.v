`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2020 10:56:06 PM
// Design Name: 
// Module Name: pc
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


module pc(clk, reset, data_in, load, inc, data_out

    );
    
    input clk, reset;
    input [7:0] data_in;
    input load, inc;
    
    output [7:0] data_out;
    
    reg [7:0] data_out;
    
    always @(posedge clk, posedge reset)
      begin
      
      if (reset)
        data_out <= 0;
      else if (load)
        data_out <= data_in;
      else if (inc)
        data_out <= data_out + 1'b1;
      end
endmodule
