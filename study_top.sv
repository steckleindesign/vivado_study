`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////

module study_top(input        clk,
                 input  [3:0] x,
                 input  [3:0] y,
                 input        c_in_top,
                 output [3:0] res,
                 output       c_out_top,
                 
                 // Extra PCB stuff
                 input  [1:0] btn,
                 output [1:0] led,
                 output       led_r, led_g, led_b);
    
    logic [3:0] sum_wire;
    logic [3:0] sum_d;
    
    logic       cout_wire;
    logic       cout_d;

    always_ff @(posedge clk)
    begin
        sum_d  <= sum_wire;
        cout_d <= cout_wire;
    end
    
    assign res       = sum_d;
    assign c_out_top = cout_d;
    
    nbit_adder #(4)
                adder_4
                (.a(x),
                 .b(y),
                 .cin(c_in_top),
                 .sum(sum_wire),
                 .cout(cout_wire));



    assign led   = 2'b00;
    assign led_r = 0;
    assign led_g = 1;
    assign led_b = 0;

endmodule
