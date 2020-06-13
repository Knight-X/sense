`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2020 12:08:45 AM
// Design Name: 
// Module Name: fetch
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

module fetch(clk, reset, Mem_Out, Mem_ADDR, opcode, src, dst, ready
    );
    
    output ready;
    output[7:0] Mem_ADDR;
    output[3:0] opcode;
    output[1:0] src, dst;
    input clk, reset;
    input[7:0] Mem_Out;
    
    reg sel_MEM, sel_PC;
    reg load_AR, load_IR, inc_PC;
    wire [3:0] sel_BUS;
    wire [7:0] bus;
    wire [7:0] pc_OUT;
    reg finish;
 
    reg [3:0] state, next_state;
    wire [7:0] instruction;
    reg load_PC;
    register AR (clk, reset, bus, load_AR, Mem_ADDR);
    register IR (clk, reset, bus, load_IR, instruction);
    pc PC (clk, reset, bus, load_PC, inc_PC, pc_OUT);

    

    assign ready = finish;
    assign opcode = instruction[7:4];
    assign src = instruction[3:2];
    assign dst = instruction[1:0];
    assign sel_BUS = sel_MEM ? 3'b000 :
                     sel_PC  ? 3'b101 : 3'bx;
                   
    assign bus = (sel_BUS == 3'b000) ? Mem_Out :
                 (sel_BUS == 3'b101) ? pc_OUT : 'bx;
    

    always @(posedge clk)
      begin
        if (reset)
          state <= `fetch1;
        else
          state <= next_state;
      end

       
    always @(state)
      begin
         inc_PC = 0;
         load_IR = 0;
         load_AR = 0;
         sel_PC = 0;
         sel_MEM = 0;
         finish = 0;
         next_state = state;
         
        case(state)
          `fetch1:
            begin
              next_state = `fetch2;
              sel_PC = 1;
              load_AR = 1;
            end
          `fetch2:
            begin
              next_state = `decode;
              sel_MEM = 1;
              load_IR = 1;
              inc_PC = 1;
              assign finish = 1;

            end
         endcase
       end
endmodule
