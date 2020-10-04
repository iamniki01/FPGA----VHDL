onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/dataflow_inst/Clk
add wave -noupdate -color Red /tb/dataflow_inst/Rst
add wave -noupdate /tb/dataflow_inst/Rdd
add wave -noupdate /tb/dataflow_inst/Wrt
add wave -noupdate /tb/dataflow_inst/sel
add wave -noupdate /tb/dataflow_inst/RnW
add wave -noupdate /tb/dataflow_inst/data_a
add wave -noupdate /tb/dataflow_inst/data_b
add wave -noupdate -color Cyan /tb/dataflow_inst/data_a_reg
add wave -noupdate -color Cyan /tb/dataflow_inst/data_b_reg
add wave -noupdate -color Magenta /tb/dataflow_inst/Bus_id
add wave -noupdate /tb/dataflow_inst/Clk2
add wave -noupdate -color Red /tb/dataflow_inst/Rstn
add wave -noupdate /tb/dataflow_inst/RD_reg
add wave -noupdate /tb/dataflow_inst/WR_reg
add wave -noupdate /tb/dataflow_inst/sel_reg
add wave -noupdate /tb/dataflow_inst/clk_sig
add wave -noupdate /tb/state_machine_inst/Clk2
add wave -noupdate /tb/state_machine_inst/Rstn
add wave -noupdate -color Gold /tb/state_machine_inst/RnW
add wave -noupdate -color Gold /tb/state_machine_inst/Bus_id
add wave -noupdate -color Magenta /tb/state_machine_inst/state
add wave -noupdate /tb/state_machine_inst/OE
add wave -noupdate /tb/state_machine_inst/Wre
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {719 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {612 ns} {1018 ns}
