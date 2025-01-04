`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Target Devices: Artix 7 - 35
// Description:    16-Bit Carry Look Ahead Adder
//////////////////////////////////////////////////////////////////////////////////


module cla16(
    input [15:0] a,
    input [15:0] b,
    output [15:0] c
);

    logic [3:0] cout;

    CARRY4 cla16_carry4_inst0 (.CI(1'b0),
                               .CYINIT(1'b0),
                               .DI(a[3:0]),
                               .S(b[3:0]),
                               .CO(cout[0]),
                               .O(c[3:0]));

    CARRY4 cla16_carry4_inst1 (.CI(cout[0]),
                               .CYINIT(1'b0),
                               .DI(a[7:4]),
                               .S(b[7:4]),
                               .CO(cout[1]),
                               .O(c[7:4]));

    CARRY4 cla16_carry4_inst2 (.CI(cout[1]),
                               .CYINIT(1'b0),
                               .DI(a[11:8]),
                               .S(b[11:8]),
                               .CO(cout[2]),
                               .O(c[11:8]));

    CARRY4 cla16_carry4_inst3 (.CI(cout[2]),
                               .CYINIT(1'b0),
                               .DI(a[15:12]),
                               .S(b[15:12]),
                               .CO(cout[3]),
                               .O(c[15:12]));


endmodule