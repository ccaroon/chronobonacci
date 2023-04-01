// Back of the case that covers the electronics
use <base-modules.scad>
include <units.scad>
include <variables.scad>

back_depth = .75*cm;

for (pos = sh_positions) {
    translate(pos)
        screw_hole(sh_out_dia, sh_in_dia, sh_height);
}

difference () {
    box(case_width, case_height, back_depth, wall);

    // hack - holes in the back of the case too at the screw hole positions
    for (pos = sh_positions) {
        translate([pos[0], pos[1], -1])
            cylinder(d=sh_in_dia, h=sh_height/2);
    }
}
