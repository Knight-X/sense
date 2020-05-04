`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2020 12:50:31 AM
// Design Name: 
// Module Name: alu
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

module aluu(alu_in1, alu_in2, opcode, zero, alu_out
    );
    
    input [7:0] alu_in1, alu_in2;
    
    input [3:0] opcode;
    
    output zero;
    output [7:0] alu_out;
    
    reg [7:0] alu_out;
    
    assign zero = ~|(alu_out);

 
    always @(*)
    begin
      case(opcode)
        `NOP: alu_out = 0;
        `ADD: alu_out = alu_in1 + alu_in2;
        `SUB: alu_out = alu_in1 - alu_in2;
        `AND: alu_out = alu_in1 & alu_in2;
        `NOT: alu_out = ~alu_in1;
        default: alu_out = 0;
      endcase
    end


endmodule
