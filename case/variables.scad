// Shared Variables
include <units.scad>

// case depth
depth = 1*cm;

// unit size for chambers
unit = 1.55*cm;

// wall thickness
wall = 1;

// Screw Holes sizes and positions
sh_in_dia = 2.9;
sh_out_dia = sh_in_dia + 1.25;
sh_height = 5;
sh_wall_adj = wall+(sh_out_dia-sh_in_dia);

sh_positions = [
    // top-left
    [sh_wall_adj,          (5*unit)-sh_wall_adj, 0],
    // bottom-left
    [sh_wall_adj,          sh_wall_adj,          0],
    // top-right
    [(8*unit)-sh_wall_adj, (5*unit)-sh_wall_adj, 0],
    // bottom-right
    [(8*unit)-sh_wall_adj, sh_wall_adj,          0]
];
