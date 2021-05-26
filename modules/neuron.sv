module neuron (
    input x0, x1,
    input [7:0] w0, w1,
    output logic [15:0] y0
);



    always_comb begin

        y0 = w0 * x0 + w1 * x1;

    end

endmodule