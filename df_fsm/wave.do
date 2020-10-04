onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_df_fsm/df_inst/Clk
add wave -noupdate /tb_df_fsm/df_inst/Rst
add wave -noupdate /tb_df_fsm/df_inst/Rdd
add wave -noupdate /tb_df_fsm/df_inst/Wrt
add wave -noupdate /tb_df_fsm/df_inst/Sel
add wave -noupdate /tb_df_fsm/df_inst/Data_a
add wave -noupdate /tb_df_fsm/df_inst/Data_b
add wave -noupdate /tb_df_fsm/df_inst/Bus_id
add wave -noupdate /tb_df_fsm/df_inst/Clk2
add wave -noupdate /tb_df_fsm/df_inst/Rstn
add wave -noupdate /tb_df_fsm/df_inst/RnW
add wave -noupdate /tb_df_fsm/df_inst/D_a
add wave -noupdate /tb_df_fsm/df_inst/D_b
add wave -noupdate /tb_df_fsm/df_inst/rdd_s
add wave -noupdate /tb_df_fsm/df_inst/wrt_s
add wave -noupdate -radix hexadecimal /tb_df_fsm/df_inst/add
add wave -noupdate /tb_df_fsm/df_inst/mux
add wave -noupdate /tb_df_fsm/df_inst/busID
add wave -noupdate /tb_df_fsm/df_inst/rw
add wave -noupdate /tb_df_fsm/df_inst/c2
add wave -noupdate /tb_df_fsm/fsm_inst/Bus_id
add wave -noupdate /tb_df_fsm/fsm_inst/Clk2
add wave -noupdate /tb_df_fsm/fsm_inst/Rstn
add wave -noupdate /tb_df_fsm/fsm_inst/RnW
add wave -noupdate /tb_df_fsm/fsm_inst/We
add wave -noupdate /tb_df_fsm/fsm_inst/Oe
add wave -noupdate /tb_df_fsm/fsm_inst/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {120 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 197
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
WaveRestoreZoom {0 ns} {629 ns}
