proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir {C:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.cache/wt} [current_project]
  set_property parent.project_path {C:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.xpr} [current_project]
  set_property ip_repo_paths {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.cache/ip}} [current_project]
  set_property ip_output_repo {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.cache/ip}} [current_project]
  set_property XPM_LIBRARIES XPM_MEMORY [current_project]
  add_files -quiet {{C:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.runs/synth_1/VGA_ctrl_top_struc_cfg.dcp}}
  add_files -quiet {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom1/rom1.dcp}}
  set_property netlist_only true [get_files {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom1/rom1.dcp}}]
  add_files -quiet {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/rom2.dcp}}
  set_property netlist_only true [get_files {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/rom2.dcp}}]
  read_xdc -mode out_of_context -ref rom1 -cells U0 {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom1/rom1_ooc.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom1/rom1_ooc.xdc}}]
  read_xdc -mode out_of_context -ref rom2 -cells U0 {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/rom2_ooc.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/sources_1/ip/rom2/rom2_ooc.xdc}}]
  read_xdc {{C:/Users/sarah/OneDrive/Dokumente/FH/5. Sem/CHIP/Froeler_Project/impl/VGA_controller_project/VGA_controller_project.srcs/constrs_1/new/VGA_ctrl_project.xdc}}
  link_design -top VGA_ctrl_top_struc_cfg -part xc7a35tcpg236-1
  write_hwdef -file VGA_ctrl_top_struc_cfg.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force VGA_ctrl_top_struc_cfg_opt.dcp
  report_drc -file VGA_ctrl_top_struc_cfg_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force VGA_ctrl_top_struc_cfg_placed.dcp
  report_io -file VGA_ctrl_top_struc_cfg_io_placed.rpt
  report_utilization -file VGA_ctrl_top_struc_cfg_utilization_placed.rpt -pb VGA_ctrl_top_struc_cfg_utilization_placed.pb
  report_control_sets -verbose -file VGA_ctrl_top_struc_cfg_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force VGA_ctrl_top_struc_cfg_routed.dcp
  report_drc -file VGA_ctrl_top_struc_cfg_drc_routed.rpt -pb VGA_ctrl_top_struc_cfg_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file VGA_ctrl_top_struc_cfg_timing_summary_routed.rpt -rpx VGA_ctrl_top_struc_cfg_timing_summary_routed.rpx
  report_power -file VGA_ctrl_top_struc_cfg_power_routed.rpt -pb VGA_ctrl_top_struc_cfg_power_summary_routed.pb -rpx VGA_ctrl_top_struc_cfg_power_routed.rpx
  report_route_status -file VGA_ctrl_top_struc_cfg_route_status.rpt -pb VGA_ctrl_top_struc_cfg_route_status.pb
  report_clock_utilization -file VGA_ctrl_top_struc_cfg_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

