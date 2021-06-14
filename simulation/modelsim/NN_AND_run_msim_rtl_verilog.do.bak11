transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/yoons/Desktop/FPGA_NeuralNet/modules {C:/Users/yoons/Desktop/FPGA_NeuralNet/modules/mod_sigmoid.sv}
vlog -sv -work work +incdir+C:/Users/yoons/Desktop/FPGA_NeuralNet/modules {C:/Users/yoons/Desktop/FPGA_NeuralNet/modules/sigmoid_ROM.sv}

vlog -sv -work work +incdir+C:/Users/yoons/Desktop/FPGA_NeuralNet/modules {C:/Users/yoons/Desktop/FPGA_NeuralNet/modules/testbench_sigmoid.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench_sigmoid

add wave *
view structure
view signals
run -all
