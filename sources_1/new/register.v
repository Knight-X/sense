`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 11:48:07 PM
// Design Name: 
// Module Name: register
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


module register(clk, reset, data_in, load, data_out

    );
    input clk, reset;
    output[7:0] data_out;
    input [7:0] data_in;
    input load;
    
    reg [7:0] data_out;
    
    always @(posedge clk, posedge reset)
    begin
      if (reset)
        data_out <= 0;
      else if (load)
        data_out <= data_in;
      else
        data_out <= data_out;
    end
    
    
endmodule
