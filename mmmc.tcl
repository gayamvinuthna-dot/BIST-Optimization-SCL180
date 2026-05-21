create_library_set -name slow_lib \
-timing {
/mnt/hgfs/scl_bridge/SCLPDK_V3.0_KIT/scl180/stdcell/fs120/6M1L/liberty/lib_flow_ss/tsl18fs120_scl_ss.lib
}

create_rc_corner -name rc_corner

create_delay_corner -name delay_corner \
-library_set slow_lib \
-rc_corner rc_corner

create_constraint_mode -name constr \
-sdc_files {existing_bist.sdc}

create_analysis_view -name analysis_view \
-constraint_mode constr \
-delay_corner delay_corner

set_analysis_view \
-setup analysis_view \
-hold analysis_view
