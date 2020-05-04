`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 12:15:56 AM
// Design Name: 
// Module Name: memory
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

`include "defines.v"

module memory(
  clk, in, out, addr, write
    );
    
    input clk, write;
    input [7:0] in;
    input [7:0] addr;
    
    output [7:0] out;
    
    reg [7:0] MEM [255:0];
    initial 
      begin
        $readmemb("/home/kazami/simple_circuit/simple_circuit.srcs/sources_1/new/testvalue.bin", MEM);
      end
      
    always @(posedge clk)
      begin
        if (write)
          MEM[addr] = in;
      end
      
      assign out = MEM[addr];
    
endmodule
