`timescale 1ns / 1ps
// Full Adder
// Stewart Dulaney

module full_adder_v(C, B, A, S, COUT);
    input C;
    input B;
    input A;
    output S;
    output COUT;

    wire m1,m2,m3,m4,m5,m6,m7;
    assign m1=~C&~B&A;
    assign m2=~C&B&~A;
    assign m3=~C&B&A;
    assign m4=C&~B&~A;
    assign m5=C&~B&A;
    assign m6=C&B&~A;
    assign m7=C&B&A;
    assign S=m1|m2|m4|m7;
    assign COUT=m3|m5|m6|m7;
endmodule
