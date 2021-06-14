module sigmoid_ROM (input signed [63:0] in, 
                    output bit [63:0] out
);

    bit [63:0] sigmoid_ROM [0:499];
    logic [63:0] idx;

    always_comb begin
        
        $readmemh("../sigmoid_hex.txt", sigmoid_ROM);       // look up sigmoid values from preprocessed LUT
        idx = in + 64'd250;
        out = sigmoid_ROM[idx];
        $display("%f", $bitstoreal(sigmoid_ROM[0]));
        $display("%f", $bitstoreal(sigmoid_ROM[248]));
        $display("%f", $bitstoreal(sigmoid_ROM[250]));
        $display("%f", $bitstoreal(sigmoid_ROM[251]));
        $display("%f", $bitstoreal(sigmoid_ROM[499]));

    end

endmodule