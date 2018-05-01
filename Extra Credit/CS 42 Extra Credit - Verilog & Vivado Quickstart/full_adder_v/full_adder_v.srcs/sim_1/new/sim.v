`timescale 1ns / 1ps
// Testbench for Full Adder
// Stewart Dulaney

module sim();
    reg C, B, A;
    wire S, COUT;
    full_adder_v U1(C, B, A, S, COUT);
    initial
    begin
        C = 1'b0;
        B = 1'b0;
        A = 1'b0;
        #100
        C = 1'b0;
        B = 1'b0;
        A = 1'b1;
        #100
        C = 1'b0;
        B = 1'b1;
        A = 1'b0;
        #100
        C = 1'b0;
        B = 1'b1;
        A = 1'b1;
        #100
        C = 1'b1;
        B = 1'b0;
        A = 1'b0;
        #100
        C = 1'b1;
        B = 1'b0;
        A = 1'b1;
        #100
        C = 1'b1;
        B = 1'b1;
        A = 1'b0;
        #100
        C = 1'b1;
        B = 1'b1;
        A = 1'b1;
    end
endmodule
