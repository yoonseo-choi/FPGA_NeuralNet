module testbench ();
timeunit 10ns;
timeprecision 1ns;

logic Clk = 0;
logic x0, x1, out;
logic signed [15:0] wt [5:0];
logic signed [15:0] b [2:0];
logic expected;

always_comb begin

    wt = {20, 20, -20, -20, 20, 20};
    b = {-10, 10, -30};
    
end

BNN bnn0 (.*);

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS

#1 x0 = 0;
#1 x1 = 0;
#1 expected = 0;
// $display ("Bias: %d, %d, %d", b[0], b[1], b[2]);
// $display ("\n");
// $display ("Weight:");


// for (int i = 0; i < 6; i++) begin
//     $display ("%d", wt[i]);
// end


// reset and check for 0 & 0
#3 x0 = 0;
#3 x1 = 0;
$display ("Check %d && %d: ", x0, x1);
#3 expected = ~(x0^x1);
$display ("Expected: %d, Got: %d", expected, out);

#5 x0 = 0;
#5 x1 = 1;
$display ("Check %d && %d: ", x0, x1);
#5 expected = ~(x0^x1);
$display ("Expected: %d, Got: %d", expected, out);

#7 x0 = 1;
#7 x1 = 0;
$display ("Check %d && %d: ", x0, x1);
#7 expected = ~(x0^x1);
$display ("Expected: %d, Got: %d", expected, out);

#9 x0 = 1;
#9 x1 = 1;
$display ("Check %d && %d: ", x0, x1);
#9 expected = ~(x0^x1);
$display ("Expected: %d, Got: %d", expected, out);

end

endmodule