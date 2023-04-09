// Fibonacci Box - 1,1,2,3,5
use <base-modules.scad>
include <units.scad>
include <variables.scad>

// Screw holes in each corner
for (pos = sh_positions) {
    translate(pos)
        screw_hole(sh_out_dia, sh_in_dia, sh_height);
}

difference () {
    case();

    // hack - holes in the back of the case too at the screw hole positions
    for (pos = sh_positions) {
        translate([pos[0], pos[1], -1])
            cylinder(d=sh_in_dia, h=sh_height/2);
    }
}

// -- Modules --
module case () {
    union () {
        // one box
        translate([2*unit, 3*unit, 0])
            chamber(1, unit, case_depth, wall);

        // one' box
        translate([2*unit, (4*unit),0])
            chamber(1, unit, case_depth, wall);

        // two box
        translate([(0*unit), (3*unit), 0])
            chamber(2, unit, case_depth, wall);

        // three box
        translate([0*unit, 0*unit, 0])
            chamber(3, unit, case_depth, wall);

        // five box
        translate([3*unit, 0, 0])
            chamber(5, unit, case_depth, wall);
    }
}

module chamber(num, unit, depth, wall) {
    size = num * unit;
    center_offset = num % 2 == 0
        ? (num / 2) - (num * .25)
        : floor(num / 2);

    difference () {
        box(size, size, depth, wall);
        translate([(center_offset*unit), (center_offset*unit), 0])
        neo_holes(unit, wall);
    }
}
