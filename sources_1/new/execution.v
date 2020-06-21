`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2020 12:07:29 AM
// Design Name: 
// Module Name: execution
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

module execution(clk, reset, ready, opcode, src, dest, Mem_Out
    );
    input ready;
    output[3:0] opcode;
    output[1:0] src, dest;
    input clk, reset;
    output[7:0] Mem_Out;
    
    wire [7:0] alu_in1, alu_in2, alu_out;
    
    reg [3:0] state, next_state;
    reg load_OP1, load_OP2, load_AR, load_IR, load_flag, load_PC;
    reg inc_PC, load_R0, load_R1, load_R2, load_R3;
 
    wire [7:0] pc_OUT;
    wire [7:0] R0_out, R1_out, R2_out, R3_out;
    wire [7:0] bus;
    reg error;
    reg write;
    
    reg sel_MEM, sel_PC, sel_ALU;
    reg sel_R0, sel_R1, sel_R2, sel_R3;
    
    register OP1 (clk, reset, bus, load_OP1, alu_in1);
    register OP2 (clk, reset, bus, load_OP2, alu_in2);
    register AR (clk, reset, bus, load_AR, Mem_ADDR);
    general_register GP (clk, reset, bus, load_R0, load_R1, load_R2, load_R3, R0_out, R1_out, R2_out, R3_out);  
    
        always @(posedge clk)
      begin
        if (reset)
          state <= `fetch1;
        else
          state <= next_state;
      end
     
      always @(state)
      begin
      load_OP1 = 0;
      load_OP2 = 0;
      sel_R0 = 0;
      sel_R1 = 0;
      sel_R2 = 0;
      sel_R3 = 0;
      next_state = state;
         
         case(state)
         `execute1:
          case(opcode)
               `ADD, `SUB, `AND: 
                 begin
                   next_state = `execute2;
                   load_OP1 = 1;
                   case(src)
                     `R0: sel_R0 = 1;
                     `R1: sel_R1 = 1;
                     `R2: sel_R2 = 1;
                     `R3: sel_R3 = 1;
                     default: error = 1;
                   endcase
                  end

                default: next_state = `stop;   
              endcase
           `execute2: 
                  begin
                    next_state = `execute3;
                    load_OP2 = 1;
                    case(dest)
                      `R0: sel_R0 = 1;
                      `R1: sel_R1 = 1;
                      `R2: sel_R2 = 1;
                      `R3: sel_R3 = 1;
                      default: error = 1;
                    endcase
                  end
                `execute3:
                  begin
                    next_state = `fetch1;
                    sel_ALU = 1;
                    load_flag = 1;
                    case(dest)
                      `R0: sel_R0 = 1;
                      `R1: sel_R1 = 1;
                      `R2: sel_R2 = 1;
                      `R3: sel_R3 = 1;
                      default: error = 1;
                    endcase
                  end
             endcase
   
      end
endmodule
