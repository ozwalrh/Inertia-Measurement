! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = meter  &
   angle = rad  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 5.0E-02  &
   spacing_for_grid = 1.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = MODEL_1
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .MODEL_1.steel  &
   adams_id = 1  &
   density = 7801.0  &
   youngs_modulus = 2.07E+11  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.ground.U1  &
   adams_id = 5  &
   location = -1.05, 0.8, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.ground.U2  &
   adams_id = 6  &
   location = 1.05, 0.8, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.ground.U3  &
   adams_id = 7  &
   location = -0.85, 0.8, 0.65  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.ground.r1  &
   adams_id = 8  &
   location = -1.05, 0.113, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.ground.r2  &
   adams_id = 9  &
   location = 1.05, 0.113, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.ground.r3  &
   adams_id = 10  &
   location = -0.85, 0.113, 0.65  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.ground.MARKER_27  &
   adams_id = 27  &
   location = -1.05, 0.8, -0.4  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.ground.MARKER_31  &
   adams_id = 31  &
   location = 1.05, 0.8, -0.4  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.ground.MARKER_35  &
   adams_id = 35  &
   location = -0.85, 0.8, 0.65  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.ground  &
   material_type = .MODEL_1.steel
!
part attributes  &
   part_name = .MODEL_1.ground  &
   name_visibility = off
!
!----------------------------------- cross1 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.cross1  &
   adams_id = 2  &
   location = -1.05, 0.8, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.cross1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.cross1.MARKER_3  &
   adams_id = 3  &
   location = -2.5E-02, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross1.cm  &
   adams_id = 45  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross1.MARKER_4  &
   adams_id = 4  &
   location = 0.0, 0.0, -2.5E-02  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross1.MARKER_28  &
   adams_id = 28  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross1.MARKER_29  &
   adams_id = 29  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.cross1  &
   material_type = .MODEL_1.steel
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .MODEL_1.cross1.CYLINDER_1  &
   adams_id = 1  &
   center_marker = .MODEL_1.cross1.MARKER_3  &
   angle_extent = 6.2831853072  &
   length = 5.0E-02  &
   radius = 1.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .MODEL_1.cross1.CYLINDER_2  &
   adams_id = 2  &
   center_marker = .MODEL_1.cross1.MARKER_4  &
   angle_extent = 6.2831853072  &
   length = 5.0E-02  &
   radius = 1.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .MODEL_1.cross1  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- cross2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.cross2  &
   adams_id = 3  &
   location = 1.05, 0.8, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.cross2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.cross2.MARKER_3  &
   adams_id = 11  &
   location = -2.5E-02, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross2.cm  &
   adams_id = 12  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross2.MARKER_4  &
   adams_id = 13  &
   location = 0.0, 0.0, -2.5E-02  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross2.MARKER_32  &
   adams_id = 32  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross2.MARKER_33  &
   adams_id = 33  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.cross2  &
   material_type = .MODEL_1.steel
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .MODEL_1.cross2.CYLINDER_1  &
   adams_id = 3  &
   center_marker = .MODEL_1.cross2.MARKER_3  &
   angle_extent = 6.2831853072  &
   length = 5.0E-02  &
   radius = 1.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .MODEL_1.cross2.CYLINDER_2  &
   adams_id = 4  &
   center_marker = .MODEL_1.cross2.MARKER_4  &
   angle_extent = 6.2831853072  &
   length = 5.0E-02  &
   radius = 1.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .MODEL_1.cross2  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- cross3 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.cross3  &
   adams_id = 4  &
   location = -0.85, 0.8, 0.65  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.cross3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.cross3.MARKER_3  &
   adams_id = 14  &
   location = -2.5E-02, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross3.cm  &
   adams_id = 15  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross3.MARKER_4  &
   adams_id = 16  &
   location = 0.0, 0.0, -2.5E-02  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross3.MARKER_36  &
   adams_id = 36  &
   location = 0.0, 0.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.cross3.MARKER_37  &
   adams_id = 37  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.cross3  &
   material_type = .MODEL_1.steel
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .MODEL_1.cross3.CYLINDER_1  &
   adams_id = 5  &
   center_marker = .MODEL_1.cross3.MARKER_3  &
   angle_extent = 6.2831853072  &
   length = 5.0E-02  &
   radius = 1.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .MODEL_1.cross3.CYLINDER_2  &
   adams_id = 6  &
   center_marker = .MODEL_1.cross3.MARKER_4  &
   angle_extent = 6.2831853072  &
   length = 5.0E-02  &
   radius = 1.0E-02  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .MODEL_1.cross3  &
   color = RED  &
   name_visibility = off
!
!------------------------------------ rod1 ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.rod1  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.rod1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.rod1.MARKER_17  &
   adams_id = 17  &
   location = -1.05, 0.8, -0.4  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod1.MARKER_18  &
   adams_id = 18  &
   location = -1.05, 0.113, -0.4  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod1.cm  &
   adams_id = 46  &
   location = -1.05, 0.4565, -0.4  &
   orientation = 3.1415926536, 1.5707963268, 1.5707963268
!
marker create  &
   marker_name = .MODEL_1.rod1.MARKER_30  &
   adams_id = 30  &
   location = -1.05, 0.8, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod1.MARKER_40  &
   adams_id = 40  &
   location = -1.05, 0.113, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.rod1  &
   density = 1.0E-03
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .MODEL_1.rod1.LINK_7  &
   i_marker = .MODEL_1.rod1.MARKER_17  &
   j_marker = .MODEL_1.rod1.MARKER_18  &
   width = 1.0E-02  &
   depth = 1.0E-02
!
part attributes  &
   part_name = .MODEL_1.rod1  &
   color = GREEN  &
   name_visibility = off
!
!------------------------------------ rod2 ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.rod2  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.rod2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.rod2.MARKER_19  &
   adams_id = 19  &
   location = 1.05, 0.8, -0.4  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod2.MARKER_20  &
   adams_id = 20  &
   location = 1.05, 0.113, -0.4  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod2.cm  &
   adams_id = 47  &
   location = 1.05, 0.4565, -0.4  &
   orientation = 3.1415926536, 1.5707963268, 1.5707963268
!
marker create  &
   marker_name = .MODEL_1.rod2.MARKER_34  &
   adams_id = 34  &
   location = 1.05, 0.8, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod2.MARKER_42  &
   adams_id = 42  &
   location = 1.05, 0.113, -0.4  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.rod2  &
   density = 1.0E-03
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .MODEL_1.rod2.LINK_8  &
   i_marker = .MODEL_1.rod2.MARKER_19  &
   j_marker = .MODEL_1.rod2.MARKER_20  &
   width = 1.0E-02  &
   depth = 1.0E-02
!
part attributes  &
   part_name = .MODEL_1.rod2  &
   color = MAIZE  &
   name_visibility = off
!
!------------------------------------ rod3 ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.rod3  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.rod3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.rod3.MARKER_21  &
   adams_id = 21  &
   location = -0.85, 0.8, 0.65  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod3.MARKER_22  &
   adams_id = 22  &
   location = -0.85, 0.113, 0.65  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod3.cm  &
   adams_id = 48  &
   location = -0.85, 0.4565, 0.65  &
   orientation = 3.1415926536, 1.5707963268, 1.5707963268
!
marker create  &
   marker_name = .MODEL_1.rod3.MARKER_38  &
   adams_id = 38  &
   location = -0.85, 0.8, 0.65  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.rod3.MARKER_44  &
   adams_id = 44  &
   location = -0.85, 0.113, 0.65  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.rod3  &
   density = 1.0E-03
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .MODEL_1.rod3.LINK_9  &
   i_marker = .MODEL_1.rod3.MARKER_21  &
   j_marker = .MODEL_1.rod3.MARKER_22  &
   width = 1.0E-02  &
   depth = 1.0E-02
!
part attributes  &
   part_name = .MODEL_1.rod3  &
   color = CYAN  &
   name_visibility = off
!
!--------------------------------- body_cube ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.body_cube  &
   adams_id = 8  &
   location = -5.0E-02, 0.1, -0.5  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body initial_velocity  &
   part_name = .MODEL_1.body_cube  &
   wx = 1.0  &
   wy = 1.3  &
   wz = 1.2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.body_cube
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.body_cube.cube_j1  &
   adams_id = 24  &
   location = -0.4, 0.4, 0.25  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.body_cube.cube_j2  &
   adams_id = 25  &
   location = 0.5, 0.4, 0.25  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.body_cube.MARKER_23  &
   adams_id = 23  &
   location = -0.45, -0.6, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.body_cube.cm  &
   adams_id = 49  &
   location = 5.0E-02, -0.1, 0.5  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .MODEL_1.body_cube.cube_j3  &
   adams_id = 26  &
   location = -0.2, 0.4, 1.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.body_cube.MARKER_39  &
   adams_id = 39  &
   location = -0.4, 0.4, 0.25  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.body_cube.MARKER_41  &
   adams_id = 41  &
   location = 0.5, 0.4, 0.25  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .MODEL_1.body_cube.MARKER_43  &
   adams_id = 43  &
   location = -0.2, 0.4, 1.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.body_cube  &
   material_type = .MODEL_1.steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .MODEL_1.body_cube.BOX_10  &
   adams_id = 10  &
   corner_marker = .MODEL_1.body_cube.MARKER_23  &
   diag_corner_coords = 1.0, 1.0, 1.0
!
part attributes  &
   part_name = .MODEL_1.body_cube  &
   color = MAGENTA  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .MODEL_1.U1Rx  &
   adams_id = 1  &
   i_marker_name = .MODEL_1.ground.MARKER_27  &
   j_marker_name = .MODEL_1.cross1.MARKER_28
!
constraint attributes  &
   constraint_name = .MODEL_1.U1Rx  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.U1Rz  &
   adams_id = 2  &
   i_marker_name = .MODEL_1.cross1.MARKER_29  &
   j_marker_name = .MODEL_1.rod1.MARKER_30
!
constraint attributes  &
   constraint_name = .MODEL_1.U1Rz  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.U2Rx  &
   adams_id = 3  &
   i_marker_name = .MODEL_1.ground.MARKER_31  &
   j_marker_name = .MODEL_1.cross2.MARKER_32
!
constraint attributes  &
   constraint_name = .MODEL_1.U2Rx  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.U2Rz  &
   adams_id = 4  &
   i_marker_name = .MODEL_1.cross2.MARKER_33  &
   j_marker_name = .MODEL_1.rod2.MARKER_34
!
constraint attributes  &
   constraint_name = .MODEL_1.U2Rz  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.U3Rx  &
   adams_id = 5  &
   i_marker_name = .MODEL_1.ground.MARKER_35  &
   j_marker_name = .MODEL_1.cross3.MARKER_36
!
constraint attributes  &
   constraint_name = .MODEL_1.U3Rx  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.U3Rz  &
   adams_id = 6  &
   i_marker_name = .MODEL_1.cross3.MARKER_37  &
   j_marker_name = .MODEL_1.rod3.MARKER_38
!
constraint attributes  &
   constraint_name = .MODEL_1.U3Rz  &
   name_visibility = off
!
constraint create joint spherical  &
   joint_name = .MODEL_1.J1  &
   adams_id = 7  &
   i_marker_name = .MODEL_1.body_cube.MARKER_39  &
   j_marker_name = .MODEL_1.rod1.MARKER_40
!
constraint attributes  &
   constraint_name = .MODEL_1.J1  &
   name_visibility = off
!
constraint create joint spherical  &
   joint_name = .MODEL_1.J2  &
   adams_id = 8  &
   i_marker_name = .MODEL_1.body_cube.MARKER_41  &
   j_marker_name = .MODEL_1.rod2.MARKER_42
!
constraint attributes  &
   constraint_name = .MODEL_1.J2  &
   name_visibility = off
!
constraint create joint spherical  &
   joint_name = .MODEL_1.J3  &
   adams_id = 9  &
   i_marker_name = .MODEL_1.body_cube.MARKER_43  &
   j_marker_name = .MODEL_1.rod3.MARKER_44
!
constraint attributes  &
   constraint_name = .MODEL_1.J3  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .MODEL_1.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=yes end_time=5.0 step_size=( 1/200 ) model_name=.MODEL_1"
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9.80665  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
executive_control set numerical_integration_parameters  &
   model_name = MODEL_1  &
   scale = 1.0, 1.0, 1.0E-03
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .MODEL_1.J1_fx  &
   from_first = yes  &
   object = .MODEL_1.J1  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_fx  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J1_fy  &
   from_first = yes  &
   object = .MODEL_1.J1  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_fy  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J1_fz  &
   from_first = yes  &
   object = .MODEL_1.J1  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_fz  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J2_fx  &
   from_first = yes  &
   object = .MODEL_1.J2  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_fx  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J2_fy  &
   from_first = yes  &
   object = .MODEL_1.J2  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_fy  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J2_fz  &
   from_first = yes  &
   object = .MODEL_1.J2  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_fz  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J3_fx  &
   from_first = yes  &
   object = .MODEL_1.J3  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_fx  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J3_fy  &
   from_first = yes  &
   object = .MODEL_1.J3  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_fy  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J3_fz  &
   from_first = yes  &
   object = .MODEL_1.J3  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = element_force  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_fz  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.omega_x_global  &
   from_first = no  &
   object = .MODEL_1.body_cube  &
   characteristic = cm_angular_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.omega_x_global  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.omega_y_global  &
   from_first = no  &
   object = .MODEL_1.body_cube  &
   characteristic = cm_angular_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.omega_y_global  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.omega_z_global  &
   from_first = no  &
   object = .MODEL_1.body_cube  &
   characteristic = cm_angular_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.omega_z_global  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.alpha_x_global  &
   from_first = no  &
   object = .MODEL_1.body_cube  &
   characteristic = cm_angular_acceleration  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.alpha_x_global  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.alpha_y_global  &
   from_first = no  &
   object = .MODEL_1.body_cube  &
   characteristic = cm_angular_acceleration  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.alpha_y_global  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.alpha_z_global  &
   from_first = no  &
   object = .MODEL_1.body_cube  &
   characteristic = cm_angular_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.alpha_z_global  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.acl_x_local  &
   from_first = yes  &
   object = .MODEL_1.J1  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_acceleration  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.acl_x_local  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.acl_y_local  &
   from_first = yes  &
   object = .MODEL_1.J1  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_acceleration  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.acl_y_local  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.acl_z_local  &
   from_first = yes  &
   object = .MODEL_1.J1  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.acl_z_local  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.J1_MEA_1  &
   from_first = yes  &
   object = .MODEL_1.J1  &
   coordinate_rframe = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_MEA_1  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_rx  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_displacement  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_rx  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_ry  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_displacement  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_ry  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_rz  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_displacement  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_rz  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_vx  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_vx  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_vy  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_vy  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_vz  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_vz  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_ax  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_ax  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_ay  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_ay  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J1_az  &
   to_point = .MODEL_1.body_cube.cube_j1  &
   characteristic = translational_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J1_az  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_rx  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_displacement  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_rx  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_ry  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_displacement  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_ry  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_rz  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_displacement  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_rz  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_vx  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_vx  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_vy  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_vy  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_vz  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_vz  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_ax  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_acceleration  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_ax  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_ay  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_acceleration  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_ay  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J2_az  &
   to_point = .MODEL_1.body_cube.cube_j2  &
   characteristic = translational_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J2_az  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_rx  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_displacement  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_rx  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_ry  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_displacement  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_ry  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_rz  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_displacement  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_rz  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_vx  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_vx  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_vy  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_vy  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_vz  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_vz  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_ax  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_acceleration  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_ax  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_ay  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_acceleration  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_ay  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .MODEL_1.J3_az  &
   to_point = .MODEL_1.body_cube.cube_j3  &
   characteristic = translational_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.J3_az  &
   color = WHITE
!
!---------------------------- Function definitions ----------------------------!
!
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
geometry modify shape cylinder  &
   cylinder_name = .MODEL_1.cross1.CYLINDER_1  &
   length = (5.0cm)  &
   radius = (1.0cm)
!
geometry modify shape cylinder  &
   cylinder_name = .MODEL_1.cross1.CYLINDER_2  &
   length = (5.0cm)  &
   radius = (1.0cm)
!
geometry modify shape cylinder  &
   cylinder_name = .MODEL_1.cross2.CYLINDER_1  &
   length = (5.0cm)  &
   radius = (1.0cm)
!
geometry modify shape cylinder  &
   cylinder_name = .MODEL_1.cross2.CYLINDER_2  &
   length = (5.0cm)  &
   radius = (1.0cm)
!
geometry modify shape cylinder  &
   cylinder_name = .MODEL_1.cross3.CYLINDER_1  &
   length = (5.0cm)  &
   radius = (1.0cm)
!
geometry modify shape cylinder  &
   cylinder_name = .MODEL_1.cross3.CYLINDER_2  &
   length = (5.0cm)  &
   radius = (1.0cm)
!
geometry modify shape link  &
   link_name = .MODEL_1.rod1.LINK_7  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
geometry modify shape link  &
   link_name = .MODEL_1.rod2.LINK_8  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
geometry modify shape link  &
   link_name = .MODEL_1.rod3.LINK_9  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
geometry modify shape block  &
   block_name = .MODEL_1.body_cube.BOX_10  &
   diag_corner_coords =   &
      (1m),  &
      (1m),  &
      (1m)
!
material modify  &
   material_name = .MODEL_1.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = MODEL_1
