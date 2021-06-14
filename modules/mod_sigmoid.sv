module mod_sigmoid (input signed [63:0] h0, 
                    output bit [63:0] out
);

    sigmoid_ROM s_ (.in(h0), .out(out));

endmodule

