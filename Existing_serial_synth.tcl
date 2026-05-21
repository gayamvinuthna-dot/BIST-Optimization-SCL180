# ============================================================
# Synthesis TCL — Existing Serial CXM
# Technology : SCL180nm / GPDK180
# ============================================================

# ------------------------------------------------------------
# 1. LIBRARY PATH
# ------------------------------------------------------------

set_attribute lib_search_path { /mnt/hgfs/scl_bridge/SCLPDK_V3.0_KIT/scl180/stdcell/fs120/6M1L/liberty/lib_flow_ss } /

# ------------------------------------------------------------
# 2. TARGET LIBRARY
# ------------------------------------------------------------

set_attribute library { tsl18fs120_scl_ss.lib } /

# ------------------------------------------------------------
# 3. READ RTL FILES
# ------------------------------------------------------------

read_hdl -v2001 existing_lfsr.v

read_hdl -v2001 existing_sdm.v

read_hdl -v2001 existing_cxm_serial.v

read_hdl -v2001 existing_misr.v

read_hdl -v2001 existing_bist_top.v

# ------------------------------------------------------------
# 4. ELABORATE TOP MODULE
# ------------------------------------------------------------

elaborate bist_top_serial

# ------------------------------------------------------------
# 5. READ SDC
# ------------------------------------------------------------

read_sdc existing_bist.sdc

# ------------------------------------------------------------
# 6. SYNTHESIS
# ------------------------------------------------------------

synthesize -to_mapped -effort medium

# ------------------------------------------------------------
# 7. REPORTS
# ------------------------------------------------------------

report timing > reports/timing_serial.rpt

report power  > reports/power_serial.rpt

report area   > reports/area_serial.rpt

report gates  > reports/gates_serial.rpt

report qor    > reports/qor_serial.rpt

# ------------------------------------------------------------
# 8. WRITE NETLIST
# ------------------------------------------------------------

write_hdl -mapped > netlists/bist_top_serial_netlist.v

# ------------------------------------------------------------
# DONE
# ------------------------------------------------------------

puts "\n=== Existing Serial CXM Synthesis DONE ==="
