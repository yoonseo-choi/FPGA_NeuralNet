module testbench ();
timeunit 10ns;
timeprecision 1ns;

logic Clk = 0;
logic x0, x1, out;
logic signed [7:0] w0, w1, bias;
logic expected;

always_comb begin

    w0 = 20;
    w1 = 20;
    bias = -30;

end

NN_AND nn_and0 (.*);


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

// reset and check for 0 & 0
#3 x0 = 0;
#3 x1 = 0;
$display ("Check %d && %d: ", x0, x1);
#3 expected = 0;
$display ("Expected: %d, Got: %d", expected, out);

#5 x0 = 0;
#5 x1 = 1;
$display ("Check %d && %d: ", x0, x1);
#5 expected = 0;
$display ("Expected: %d, Got: %d", expected, out);

#7 x0 = 1;
#7 x1 = 0;
$display ("Check %d && %d: ", x0, x1);
#7 expected = 0;
$display ("Expected: %d, Got: %d", expected, out);

#9 x0 = 1;
#9 x1 = 1;
$display ("Check %d && %d: ", x0, x1);
#9 expected = 1;
$display ("Expected: %d, Got: %d", expected, out);

end

endmodule