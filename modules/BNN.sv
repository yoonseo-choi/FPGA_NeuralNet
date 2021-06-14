// 'include "neuron.sv"
// 'include "sigmoid.sv"


module BNN (
    input Clk,
    input x0, x1,
    // input logic signed [15:0] wt [0:5],
    input logic signed [15:0] b [0:2],
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

    
    logic signed y0 [1:0];

    // neuron n0 (.x0(x0), .x1(x1), .w0(wt[0]), .w1(wt[1]), .y0(y[0]));
    // sigmoid s0 (.h0(z[0]), .out(h[0]));
    
    // neuron n1 (.x0(x0), .x1(x1), .w0(wt[2]), .w1(wt[3]), .y0(y[1]));
    // sigmoid s1 (.h0(z[1]), .out(h[1]));

    // fetch initial weights from ROM

    logic signed [15:0] wt [0:5];

    generate
        
        genvar i;

        for (i = 0; i < 6; i++) begin: fetch_weights

            weights_ROM wt_rom0 (.r_addr(i), .wt_out(wt[i]));

        end

    endgenerate

    // hidden layer

    generate 

        for (i = 0; i < 2; i++) begin: neuron_generation

            neuron n0 (.x0(x0), .x1(x1), .w0(wt[2*i]), .w1(wt[2*i+1]), .b(b[i]), .y(y0[i]));

        end

    endgenerate

    // output layer

    neuron n1 (.x0(y0[0]), .x1(y0[1]), .w0(wt[4]), .w1(wt[5]), .b(b[2]), .y(out));

    


endmodule
    

        