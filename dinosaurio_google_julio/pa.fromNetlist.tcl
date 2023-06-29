
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name dinosaurio_google_julio -dir "C:/Users/julio/OneDrive/Escritorio/sistemas digitales/dinosaurio_google_julio/planAhead_run_4" -part xa6slx9csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/julio/OneDrive/Escritorio/sistemas digitales/dinosaurio_google_julio/google_dinosaurio.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/julio/OneDrive/Escritorio/sistemas digitales/dinosaurio_google_julio} }
set_property target_constrs_file "GOOGLE.ucf" [current_fileset -constrset]
add_files [list {GOOGLE.ucf}] -fileset [get_property constrset [current_run]]
link_design
