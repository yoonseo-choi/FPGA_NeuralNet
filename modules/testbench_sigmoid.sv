module testbench_sigmoid ();

timeunit 10ns;
timeprecision 1ns;

logic Clk = 0;
logic signed [63:0] h0;
bit [63:0] out;


mod_sigmoid s0 (.*);


always begin: CLOCK_GENERATION

    #1 Clk = ~Clk;

end

initial begin: CLOCK_INITIALIZATION

    Clk = 0;

end

initial begin: TEST_VECTORS
    // #1 out0 = 32'b11000001100111010000100000110000;
    // check positive
    // $display("%f" , $itor(out0));
    // #1 t1 = 1;
    // t2 = $realtobits(0.0001);
    // $display ("%b", t2);
    // $display("%f", $bitstoreal(t2));

    $display("%f", $bitstoreal(64'h3f5059eea0727600));  // 0
    $display("%f", $bitstoreal(64'h3fe0000000000000));  // 251
    $display("%f", $bitstoreal(64'h3ff0000000000000));  // 500
  
    #1 h0 = 250;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));
    #1 h0 = 1;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));
    #1 h0 = 5;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));
    #1 h0 = 10;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));
    #1 h0 = 50;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));

    // check negative values
    #2 h0 = 0;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));
    #1 h0 = -1;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));
    #1 h0 = -5;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));
    #1 h0 = -10;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));
    #1 h0 = -50;
    $display("Sigmoid(%d): %f", h0, $bitstoreal(out));

    #10 $finish;

end
endmodule