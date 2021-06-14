module sigmoid (input signed [15:0] h0,
                output logic out
);

    // can use 'real' instead of 'logic' for floating point probability

    always_comb begin

        out = (h0 < 0) ? 0:1;

    end

endmodule