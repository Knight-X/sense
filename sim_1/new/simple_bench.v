`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2020 10:13:55 PM
// Design Name: 
// Module Name: simple_bench
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


module simple_bench(

    );
    reg a, b;
    
    wire c;
    
    hello_world uut(
    .a(a),
    .b(b),
    .c(c)
    );
    
    initial begin
    a = 0;
    b = 0;
    
    #100;
    $display("hello world");
    end
endmodule
