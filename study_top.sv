`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////

module study_top(input         clk,
                 input   [3:0] x,
                 input   [3:0] y,
                 input         c_in_top,
                 input   [1:0] din,
                 output  [3:0] res,
                 output        c_out_top,
                 output [15:0] dout,
                 
                 // Extra PCB stuff
                 input   [1:0] btn,
                 output  [1:0] led,
                 output        led_r, led_g, led_b);
    
    logic  [3:0] sum_wire;
    logic  [3:0] sum_d;
    
    logic        cout_wire;
    logic        cout_d;
    
    logic [15:0] dout_wire;
    logic [15:0] dout_d;
    
    logic [15:0] din_sr[1:0];

    always_ff @(posedge clk)
    begin
        sum_d  <= sum_wire;
        cout_d <= cout_wire;
        dout_d <= dout_wire;
    end
    
    always_ff @(posedge clk)
        for (int i = 0; i < 2; i++)
            din_sr[i] <= {din_sr[i][14:0], din[i]};
    
    assign res       = sum_d;
    assign c_out_top = cout_d;
    assign dout      = dout_d;
    
//    nbit_adder #(4)
//                adder_4
//                (.a(x),
//                 .b(y),
//                 .cin(c_in_top),
//                 .sum(sum_wire),
//                 .cout(cout_wire));
                 
                 
    CARRY4 carry4_inst (.CI(c_in_top),
                        .CYINIT(1'b0),
                        .DI(x),
                        .S(y),
                        .CO(cout_wire),
                        .O(sum_wire));

    cla16 cla16_inst (.a(din_sr[0]),
                      .b(din_sr[1]),
                      .c(dout_wire));

    assign led   = 2'b00;
    assign led_r = 0;
    assign led_g = 1;
    assign led_b = 0;

endmodule
