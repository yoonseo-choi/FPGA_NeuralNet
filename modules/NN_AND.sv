// 'include "neuron.sv"
// 'include "sigmoid.sv"


module NN_AND (
    input x0, x1,
    input [7:0] w0, w1,     // +20, +20
    input [7:0] bias,       // -30
    output logic out
);  

    /*           Truth Table        */
    // ============================ //
    //      x0      x1      out     //
    //      0       0       0       //
    //      0       1       0       //
    //      1       0       0       //
    //      1       1       1       //
    // ============================ //


    logic [15:0] y0, h0;

    neuron n0 (.*);

    always_comb begin

        h0 = y0 + bias;

    end

    sigmoid s0 (.*);

endmodule
    

        