// 'include "neuron.sv"
// 'include "sigmoid.sv"


module BNN (
    input x0, x1,
    input logic signed [15:0] wt [5:0],
    input logic signed [15:0] b [2:0],
    output logic out
);  

    // 3 three layer XNOR BNN

    /*           Truth Table        */
    // ============================ //
    //      x0      x1      out     //
    //      0       0       1       //
    //      0       1       0       //
    //      1       0       0       //
    //      1       1       1       //
    // ============================ //

    logic signed [15:0] y0, y1, y2, z0,z1, z2;
    logic out0, out1;

    neuron n0 (.x0(x0), .x1(x1), .w0(wt[0]), .w1(wt[1]), .y0(y0));
    sigmoid s0 (.h0(z0), .out(out0));
    
    neuron n1 (.x0(x0), .x1(x1), .w0(wt[2]), .w1(wt[3]), .y0(y1));
    sigmoid s1 (.h0(z1), .out(out1));

    neuron n2 (.x0(out0), .x1(out1), .w0(wt[4]), .w1(wt[5]), .y0(y2));
    sigmoid s2 (.h0(z2), .out(out));

    always_comb begin

        z0 = y0 + b[0];
        z1 = y1 + b[1];
        z2 = y2 + b[2];

    end


endmodule
    

        