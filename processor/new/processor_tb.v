module processor_tb(

    );
    
    
    reg clk, reset;
    
    reg [7:0] Mem_OUT;
    
    wire [7:0] Mem_IN, Mem_ADDR;
    wire write;
        
    processor proc(
    .clk(clk), 
    .reset(reset),
    .Mem_IN(Mem_IN),
    .Mem_OUT(Mem_OUT),
    .Mem_ADDR(Mem_ADDR), 
    .write(write)
     );
     
     initial begin
       clk = 0;
       #5;
       clk = 1;
       #5;
       clk = 0;
       reset = 1;
       Mem_OUT = 8'b00000000;
       #5;
        reset = 0;
       clk = 1;
       Mem_OUT = 8'b01010010;
       #5;

       

  
       
     end

endmodule