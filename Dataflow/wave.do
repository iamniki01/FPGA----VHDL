onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/clk
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/rst
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/d1
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/d2
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/q
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/r11
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/r12
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/r13
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/r21
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/r22
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/r23
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/mul1
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/mul2
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/mul3
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/add1
add wave -noupdate -radix unsigned /tb_dataflow/dataflow_inst/add2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 232
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {171 ns} {334 ns}
