// Back of the case that covers the electronics
use <base-modules.scad>
include <units.scad>
include <variables.scad>

for (pos = sh_positions) {
    translate(pos)
        screw_hole(sh_out_dia, sh_in_dia, sh_height);
}

difference () {
    box(8*unit, 5*unit, .75*cm, wall);

    // hack - holes in the back of the case too at the screw hole positions
    for (pos = sh_positions) {
        translate([pos[0], pos[1], -1])
            cylinder(d=sh_in_dia, h=sh_height/2);
    }
}
