set_db information_level 9

set_db optimize_constant_0_flops true

set_db optimize_constant_1_flops false

set_db delete_unloaded_seqs true

set_db lib_search_path ./lib

set_db lef_library {./lib/45lef/gsclib045_tech.lef ./lib/45lef/gsclib045_macro.lef}

set_db library ./lib/45lib/slow.lib

#set_db library ./lib/45lib/fast.lib

#set_db library ./lib/45lib/typical.lib

read_hdl ./csa.v

elaborate csa

#set_db lp_insert_clock_gating true

set_db lp_multi_vt_optimization_effort high

check_design -all

read_sdc ./csa.sdc

synthesize -to_generic -effort medium

synthesize -to_mapped -effort medium

#syn_map -effort medium

write_hdl > csa_netlist.v
write_sdc  > csa_output.sdc

report timing -unconstrained > csa_timing_uncon.rpt
report timing > csa_timing.rpt
report power > csa_power.rpt
report area > csa_area.rpt
report gates > csa_gates.rpt

gui_show
