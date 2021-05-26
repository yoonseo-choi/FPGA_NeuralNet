module sigmoid (input signed [15:0] h0,
                output logic out
);

    // can use 'real' instead of 'logic' for floating point probability

    always_comb begin

        if (h0 < 0) begin

            out = 0;

        end
        
        else begin

            out = 1;

        end

    end

endmodule