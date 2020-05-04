`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 11:52:44 PM
// Design Name: 
// Module Name: register_tb
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
      data_in = 1;
      load = 1;
      #10;
      printf("go");
    end
endmodule
