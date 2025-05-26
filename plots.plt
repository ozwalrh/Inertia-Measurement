$---------------------------------------------------------------------MDI_HEADER
[MDI_HEADER]
 FILE_TYPE     =  'plt'
 FILE_VERSION  =  2.0
 FILE_FORMAT   =  'ASCII'
$---------------------------------------------------------------------------PAGE
[PAGE]
 PAGE_LAYOUT  =  11.0
 NUMBER_OF_PLOTS  =  1.0
 PAGE_NAME  =  'page_1'
$---------------------------------------------------------------------------PLOT
[PLOT]
 INDEX  =  0.0
 NAME  =  'plot_1'
 TIME_LOWER_LIMIT  =  0.0
 TIME_UPPER_LIMIT  =  0.0
(LEGEND)
{placement   location      fill   grow_left   grow_down   font}
'top left'   18.8,82.2     1      FALSE       TRUE        9
(PLOT_BORDER)
{color   line_style    line_weight}
'BLACK'  'solid'       1.0
(PRIMARY_GRID)
{color    line_style    line_weight}
'SILVER'  'solid'       0.5
(SECONDARY_GRID)
{color    line_style    line_weight}
'SILVER'  'solid'       0.5
(LEGEND_BORDER)
{color   line_style    line_weight}
'BLACK'  'solid'       1.0
(GRAPH_AREA)
{minX        minY        maxX        maxY        auto_graph_area}
 16.3571      16.3978   150.0714     84.2741     yes
(NOTES)
{name       type             color     placement      alignment         location     font     autopos     autogenerate     numStrings}
'header'    'table header'   'BLACK'   'horizontal'   'center_bottom'   24.0,6.1     1        no          yes              1
 STRING_1_TEXT  =  'MODEL_1'
{name         type         color     placement      alignment      location     font     autopos     autogenerate     numStrings}
'analysis'    'analysis'   'BLACK'   'horizontal'   'center_top'   16.4,7.4     9        no          yes              1
 STRING_1_TEXT  =  'Analysis:  Last_Run'
{name     type     color     placement      alignment      location      font     autopos     autogenerate     numStrings}
'date'    'date'   'BLACK'   'horizontal'   'center_top'   150.1,7.4     9        no          yes              1
 STRING_1_TEXT  =  '2025-05-26 18:31:58'
{name      type      color     placement      alignment         location      font     autopos     autogenerate     numStrings}
'title'    'title'   'BLACK'   'horizontal'   'center_bottom'   83.2,86.3     9        no          yes              1
 STRING_1_TEXT  =  'MODEL_1'
(PLOT_AXES_FORMAT)
{axis_name    type          color    placement    scaling    offset    primary    limits}
'vaxis'       'vertical'    'BLACK'  'left'       'linear'   0.0       yes        0.000000,0.000000
'vaxis_1'     'vertical'    'BLACK'  'right'      'linear'   0.0       no         0.000000,0.000000
'vaxis_2'     'vertical'    'BLACK'  'left'       'linear'   15.3      no         0.000000,0.000000
'vaxis_3'     'vertical'    'BLACK'  'right'      'linear'   17.5      no         0.000000,0.000000
'vaxis_4'     'vertical'    'BLACK'  'left'       'linear'   32.8      no         0.000000,0.000000
'vaxis_5'     'vertical'    'BLACK'  'right'      'linear'   41.6      no         0.000000,0.000000
'vaxis_6'     'vertical'    'BLACK'  'left'       'linear'   48.1      no         0.000000,0.000000
'haxis'       'horizontal'  'BLACK'  'bottom'     'linear'   0.0       yes        0.000000,0.000000
(PLOT_AXES_LABELS)
{axis_name    label                                color     placement     alignment        font    autopos    offset    location}
'vaxis'       'Angle (rad)'                        'BLACK'   'vertical'    'center_bottom'  9       1          10.9      5.5,50.3
'vaxis_1'     'Acceleration (meter/sec**2)'        'BLACK'   'vertical'    'center_top'     9       1          13.1      163.1,50.3
'vaxis_2'     'Angular Acceleration (rad/sec**2)'  'BLACK'   'vertical'    'center_bottom'  9       1          13.1      -12.0,50.3
'vaxis_3'     'Force (newton)'                     'BLACK'   'vertical'    'center_top'     9       1          19.7      187.3,50.3
'vaxis_4'     'Angular Velocity (rad/sec)'         'BLACK'   'vertical'    'center_bottom'  9       1          10.9      -27.3,50.3
'vaxis_5'     'Velocity (meter/sec)'               'BLACK'   'vertical'    'center_top'     9       1          10.9      202.6,50.3
'vaxis_6'     'Length (meter)'                     'BLACK'   'vertical'    'center_bottom'  9       1          10.9      -42.6,50.3
'haxis'       'Time (sec)'                         'BLACK'   'horizontal'  'center_top'     9       1          9.0       83.2,7.4
(PLOT_AXES_TICS)
{axis_name    auto_divisions    use_divisions    divisions    increments    minor_divisions    color}
'vaxis'       'yes'             'yes'            4            1.000         2                  'BLACK'
'vaxis_1'     'yes'             'yes'            9            10.000        2                  'BLACK'
'vaxis_2'     'yes'             'yes'            10           10.000        2                  'BLACK'
'vaxis_3'     'yes'             'yes'            6            1.000         2                  'BLACK'
'vaxis_4'     'yes'             'yes'            5            1.500         2                  'BLACK'
'vaxis_5'     'yes'             'yes'            6            1.000         2                  'BLACK'
'vaxis_6'     'yes'             'yes'            4            0.500         2                  'BLACK'
'haxis'       'yes'             'yes'            5            1.000         2                  'BLACK'
(PLOT_AXES_NUMBERS)
{axis_name    trailing_zeros    decimal_places    scientific_range    font    color}
'vaxis'       0                 4                 -4,5                9.0     'BLACK'
'vaxis_1'     0                 4                 -4,5                9.0     'BLACK'
'vaxis_2'     0                 4                 -4,5                9.0     'BLACK'
'vaxis_3'     0                 4                 -4,5                9.0     'BLACK'
'vaxis_4'     0                 4                 -4,5                9.0     'BLACK'
'vaxis_5'     0                 4                 -4,5                9.0     'BLACK'
'vaxis_6'     0                 4                 -4,5                9.0     'BLACK'
'haxis'       0                 4                 -4,5                9.0     'BLACK'
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_1'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  'MEASURE(.MODEL_1.U1Rx, 0, 0, Ax_Ay_Az_Projection_Angles,  Z_component)'
 Y_UNITS  =  'angle'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'U1Rx'
 COLOR  =  'red'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_2'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  'MEASURE(.MODEL_1.U1Rz, 0, 0, Ax_Ay_Az_Projection_Angles,  Z_component)'
 Y_UNITS  =  'angle'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'U1Rz'
 COLOR  =  'blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_3'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  'MEASURE(.MODEL_1.U2Rx, 0, 0, Ax_Ay_Az_Projection_Angles,  Z_component)'
 Y_UNITS  =  'angle'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'U2Rx'
 COLOR  =  'magenta'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_4'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  'MEASURE(.MODEL_1.U2Rz, 0, 0, Ax_Ay_Az_Projection_Angles,  Z_component)'
 Y_UNITS  =  'angle'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'U2Rz'
 COLOR  =  'midnight_blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_5'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  'MEASURE(.MODEL_1.U3Rx, 0, 0, Ax_Ay_Az_Projection_Angles,  Z_component)'
 Y_UNITS  =  'angle'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'U3Rx'
 COLOR  =  'green'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_6'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  'MEASURE(.MODEL_1.U3Rz, 0, 0, Ax_Ay_Az_Projection_Angles,  Z_component)'
 Y_UNITS  =  'angle'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'U3Rz'
 COLOR  =  'blue_gray'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_7'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.acl_x_local'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'acl_x_local'
 COLOR  =  'red'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_8'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.acl_y_local'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'acl_y_local'
 COLOR  =  'blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_9'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.acl_z_local'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'acl_z_local'
 COLOR  =  'magenta'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_10'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_2'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.alpha_x_global'
 Y_UNITS  =  'angle/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'alpha_x_global'
 COLOR  =  'midnight_blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_11'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_2'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.alpha_y_global'
 Y_UNITS  =  'angle/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'alpha_y_global'
 COLOR  =  'green'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_12'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_2'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.alpha_z_global'
 Y_UNITS  =  'angle/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'alpha_z_global'
 COLOR  =  'blue_gray'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_13'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_fx'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_fx'
 COLOR  =  'red'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_14'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_fy'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_fy'
 COLOR  =  'blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_15'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_fz'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_fz'
 COLOR  =  'magenta'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_16'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_MEA_1'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_MEA_1'
 COLOR  =  'midnight_blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_17'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_fx'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_fx'
 COLOR  =  'green'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_18'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_fy'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_fy'
 COLOR  =  'blue_gray'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_19'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_fz'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_fz'
 COLOR  =  'red'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_20'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_fx'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_fx'
 COLOR  =  'blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_21'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_fy'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_fy'
 COLOR  =  'magenta'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_22'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_3'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_fz'
 Y_UNITS  =  'force'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_fz'
 COLOR  =  'midnight_blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_23'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_4'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.omega_x_global'
 Y_UNITS  =  'angle/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'omega_x_global'
 COLOR  =  'green'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_24'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_4'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.omega_y_global'
 Y_UNITS  =  'angle/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'omega_y_global'
 COLOR  =  'blue_gray'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  2.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_25'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_4'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.omega_z_global'
 Y_UNITS  =  'angle/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'omega_z_global'
 COLOR  =  'red'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_26'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_ax'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_ax'
 COLOR  =  'blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_27'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_ay'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_ay'
 COLOR  =  'magenta'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_28'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_az'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_az'
 COLOR  =  'midnight_blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_29'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_rx'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_rx'
 COLOR  =  'green'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_30'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_ry'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_ry'
 COLOR  =  'blue_gray'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_31'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_rz'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_rz'
 COLOR  =  'red'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_32'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_vx'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_vx'
 COLOR  =  'blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_33'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_vy'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_vy'
 COLOR  =  'magenta'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_34'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J1_vz'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J1_vz'
 COLOR  =  'midnight_blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_35'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_ax'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_ax'
 COLOR  =  'green'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_36'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_ay'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_ay'
 COLOR  =  'blue_gray'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_37'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_az'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_az'
 COLOR  =  'red'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_38'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_rx'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_rx'
 COLOR  =  'blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_39'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_ry'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_ry'
 COLOR  =  'magenta'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_40'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_rz'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_rz'
 COLOR  =  'midnight_blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_41'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_vx'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_vx'
 COLOR  =  'green'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_42'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_vy'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_vy'
 COLOR  =  'blue_gray'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_43'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J2_vz'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J2_vz'
 COLOR  =  'red'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_44'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_ax'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_ax'
 COLOR  =  'blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_45'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_ay'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_ay'
 COLOR  =  'magenta'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_46'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_1'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_az'
 Y_UNITS  =  'length/time**2'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_az'
 COLOR  =  'midnight_blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_47'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_rx'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_rx'
 COLOR  =  'green'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_48'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_ry'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_ry'
 COLOR  =  'blue_gray'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  3.5
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_49'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_6'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_rz'
 Y_UNITS  =  'length'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_rz'
 COLOR  =  'red'
 STYLE  =  'solid'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  4.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_50'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_vx'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_vx'
 COLOR  =  'blue'
 STYLE  =  'dash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  4.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_51'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_vy'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_vy'
 COLOR  =  'magenta'
 STYLE  =  'dot'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  4.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
$---------------------------------------------------------------------PLOT_CURVE
[PLOT_CURVE]
 NAME  =  'curve_52'
 PLOT  =  'plot_1'
 VERTICAL_AXIS  =  'vaxis_5'
 HORIZONTAL_AXIS  =  'haxis'
 HORIZONTAL_EXPRESSION  =  'sim_time()'
 VERTICAL_EXPRESSION  =  '.MODEL_1.J3_vz'
 Y_UNITS  =  'length/time'
 X_UNITS  =  'time'
 LEGEND_TEXT  =  'J3_vz'
 COLOR  =  'midnight_blue'
 STYLE  =  'dotdash'
 SYMBOL  =  'NONE'
 LINE_WEIGHT  =  4.0
 HOTPOINT  =  0.0
 INCREMENT_SYMBOL  =  1.0
