`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Target Devices: Artix 7 - 35
// Description:    N-bit adder
//////////////////////////////////////////////////////////////////////////////////


module nbit_adder #(parameter N = 4) (
    input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    input  logic         cin,
    output logic [N-1:0] sum,
    output logic         cout
);
     
    assign {cout, sum} = a + b + cin;
     
endmodule
