module neuron (
    input x0, x1,
    input signed [15:0] w0, w1, b,
    output logic y
);

    logic signed [15:0] h0;

    // accumulator
    always_comb begin

        h0 = w0 * x0 + w1 * x1;
        h0 += b;

    end

    sigmoid s0 (.h0(h0), .out(y));

endmodule


