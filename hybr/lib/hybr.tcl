set_db init_lib_search_path ./lib
set_db library ./lib/slow.lib
set_db library ./lib/typical.lib
set_db library ./lib/fast.lib
read_hdl {./hybr.v}
elaborate hybrid
read_sdc ./hybr.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt
write_hdl >hy_netlist.v
write_sdc > hy_output.sdc
gui_show
report timing -unconstrained > hy_timing_con.rpt
report timing > hy_timing.rpt
report power > hy_power.rpt
report area > hy_aea.rpt
report gates > hy_gates.rpt
