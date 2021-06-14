module weights_ROM (
    input [3:0] r_addr,
    output logic signed [15:0] wt_out
);

    // ROM for storing and updating all weights
    // read has no clock latency

    logic signed [15:0] weights_ROM [0:5];
    
    always_comb begin

        $readmemh("../weights.txt", weights_ROM);
        wt_out = weights_ROM[r_addr];
        $writememh("../copy_weights.txt", weights_ROM);
    
    end

endmodule






   