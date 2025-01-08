//code for test bench
module matrix_multiplication_tb;

    reg [63:0] a00, a01, a10, a11, b00, b01, b10, b11;
    wire [127:0] c00, c01, c10, c11;
    wire [127:0] relu_out;

    matrix_multiplication uut (
        .a00(a00), .a01(a01), .a10(a10), .a11(a11),
        .b00(b00), .b01(b01), .b10(b10), .b11(b11),
        .c00(c00), .c01(c01), .c10(c10), .c11(c11)
    );

    relu activation (
        .x(c00),
        .y(relu_out)
    );

    initial begin
        $dumpfile("matrix_multiplication.vcd");
        $dumpvars(0, matrix_multiplication_tb);

        // Input matrices
        a00 = 64'h0000000000000001; a01 = 64'h0000000000000002;
        a10 = 64'h0000000000000003; a11 = 64'h0000000000000004;

        b00 = 64'h0000000000000005; b01 = 64'h0000000000000006;
        b10 = 64'h0000000000000007; b11 = 64'h0000000000000008;

        #10 $display("Matrix C00: %h, ReLU(C00): %h", c00, relu_out);

        $finish;
    end
endmodule
