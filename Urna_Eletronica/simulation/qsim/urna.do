onerror {quit -f}
vlib work
vlog -work work urna.vo
vlog -work work urna.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.urna_vlg_vec_tst
vcd file -direction urna.msim.vcd
vcd add -internal urna_vlg_vec_tst/*
vcd add -internal urna_vlg_vec_tst/i1/*
add wave /*
run -all
