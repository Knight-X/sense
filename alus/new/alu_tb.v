module alu_tb(

    );
    
    reg  [7:0] alu_in1, alu_in2;
    reg  [3:0] opcode;
    wire [7:0] alu_out;
    wire zero;
   
    
    alu a(
     .alu_in1(alu_in1),
     .alu_in2(alu_in2),
     .opcode(opcode),
     .zero(zero),
     .alu_out(alu_out)
     );
     
     initial begin
      alu_in1 = 0;
      alu_in2 = 0;
      opcode = 0;
      #500;
      alu_in1 = 0;
      alu_in2 = 3;
      opcode = 1;
      #300;
      opcode = 0;
      #200;

     end
endmodule