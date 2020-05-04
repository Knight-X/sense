`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 11:43:51 PM
// Design Name: 
// Module Name: risc
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


module risc(clk, reset

    );
    
    input clk;
    input reset;
    
    wire [7:0] Mem_IN;
    wire [7:0] Mem_OUT;
    wire [7:0] Mem_ADDR;
    
    wire write;
    
    processor pu(clk, reset, Mem_IN, Mem_OUT, Mem_ADDR, write);
    memory mu(clk, Mem_IN, Mem_OUT, Mem_ADDR, write);
endmodule
