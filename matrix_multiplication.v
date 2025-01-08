//code for design
module matrix_multiplication (
    input [63:0] a00, a01, a10, a11, // 64-bit input
    input [63:0] b00, b01, b10, b11, // 64-bit input
    output [127:0] c00, c01, c10, c11 // output 128-bit
);

    assign c00 = a00 * b00 + a01 * b10; 
    assign c01 = a00 * b01 + a01 * b11; 
    assign c10 = a10 * b00 + a11 * b10; 
    assign c11 = a10 * b01 + a11 * b11; 

endmodule
module relu (
    input [127:0] x,
    output [127:0] y
);
    assign y = (x[127] == 1'b0) ? x : 128'b0; //REL U
endmodule
