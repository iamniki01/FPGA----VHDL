onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_counter/counter_inst/clk1
add wave -noupdate -color Red /tb_counter/counter_inst/rst
add wave -noupdate -color Yellow /tb_counter/counter_inst/en1
add wave -noupdate /tb_counter/counter_inst/q2
add wave -noupdate /tb_counter/counter_inst/q1_int
add wave -noupdate /tb_counter/counter_inst/q2_int
add wave -noupdate /tb_counter/counter_inst/clk2
add wave -noupdate -color Yellow /tb_counter/counter_inst/en2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 214
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
WaveRestoreZoom {7571 ns} {7719 ns}
