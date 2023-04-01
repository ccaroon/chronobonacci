// Shared Variables
include <units.scad>

// unit size for chambers
unit = 1.55*cm;

// case dims
case_depth  = 1*cm;
case_width  = 8*unit;
case_height = 5*unit;

// wall thickness
wall = 1;

// Screw Holes sizes and positions
sh_in_dia = 3.0;
sh_out_dia = sh_in_dia + 1.5;
sh_height = 5;
sh_wall_adj = wall+(sh_out_dia-sh_in_dia)+.75;

sh_positions = [
    // top-left
    [sh_wall_adj,              (case_height)-sh_wall_adj, 0],
    // bottom-left
    [sh_wall_adj,              sh_wall_adj,               0],
    // top-right
    [(case_width)-sh_wall_adj, (case_height)-sh_wall_adj, 0],
    // bottom-right
    [(case_width)-sh_wall_adj, sh_wall_adj,               0]
];
