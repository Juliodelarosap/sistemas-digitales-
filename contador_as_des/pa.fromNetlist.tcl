
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name contador_as_des -dir "C:/Users/haili/Desktop/Sistemas digitales/contador_as_des/planAhead_run_2" -part xa6slx9csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/haili/Desktop/Sistemas digitales/contador_as_des/contador.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/haili/Desktop/Sistemas digitales/contador_as_des} }
set_property target_constrs_file "entradas.ucf" [current_fileset -constrset]
add_files [list {entradas.ucf}] -fileset [get_property constrset [current_run]]
link_design
