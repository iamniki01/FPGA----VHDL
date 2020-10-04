onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_counter/counter_inst/clk
add wave -noupdate /tb_counter/counter_inst/rst
add wave -noupdate /tb_counter/counter_inst/en
add wave -noupdate -radix unsigned /tb_counter/counter_inst/q
add wave -noupdate /tb_counter/counter_inst/q_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 180
configure wave -valuecolwidth 46
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
WaveRestoreZoom {0 ns} {335 ns}
