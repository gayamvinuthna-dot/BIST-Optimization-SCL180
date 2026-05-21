set_attribute lib_search_path { \
/mnt/hgfs/scl_bridge/SCLPDK_V3.0_KIT/scl180/stdcell/fs120/6M1L/liberty/lib_flow_ss \
} /

set_attribute library {tsl18fs120_scl_ss.lib} /

read_hdl -v2001 lfsr_opt.v
read_hdl -v2001 sdm_opt.v
read_hdl -v2001 cxm_parallel_opt.v
read_hdl -v2001 misr_opt.v
read_hdl -v2001 bist_top_optimized.v

elaborate bist_top_optimized

read_sdc optimized_bist.sdc

synthesize -to_mapped -effort high

report timing > reports/timing_opt.rpt
report power  > reports/power_opt.rpt
report area   > reports/area_opt.rpt

write_hdl -mapped > netlists/bist_top_optimized_netlist.v

puts "=== Optimized Synthesis DONE ==="
