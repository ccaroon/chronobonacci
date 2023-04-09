// Base Module Library
include <units.scad>

// Total box is w*l in size
// Inside of box is smaller than w*l
module box(w, l, h, wall) {
    difference() {
        cube([w, l, h]);
        translate([wall,wall,wall])
            cube([w-(wall*2), l-(wall*2), h+1]);
    }
}

// Total box is larger than given w*l
// Inside of box is w*l
// module box2(w, l, h, wall) {
//     difference() {
//         cube([w+(wall*2), l+(wall*2), h]);
//         translate([wall,wall,wall])
//             cube([w, l, h+1]);
//     }
// }

module screw_hole(outer_dia, inner_dia, height) {
    difference () {
        cylinder(d=outer_dia, h=height);

        translate([0,0,-1])
            cylinder(d=inner_dia, h=height+2);
    }
}

module top_lip() {
    depth = 2.75;

    // Lip
    // translate([0,0,case_depth])
    difference() {
        cube([case_width, case_height, depth]);

        translate([-1,1,-1])
        cube([case_width+2, case_height-2, depth]);

        translate([-1,2,-1])
        cube([case_width+2, case_height-4, depth+2]);
    }
}

module neo_holes(unit, thickness) {
    hole_dia = 1.5;
    offset = unit / 2;

    // left side holes
    translate([(-.5*cm)+offset, (0.25*cm)+offset, -thickness])
        cylinder(d=hole_dia, h=thickness*3);

    translate([(-.5*cm)+offset, (0*cm)+offset, -thickness])
        cylinder(d=hole_dia, h=thickness*3);

    translate([(-.5*cm)+offset, (-0.25*cm)+offset, -thickness])
        cylinder(d=hole_dia, h=thickness*3);

    // right side holes
    translate([(.5*cm)+offset, (0.25*cm)+offset, -thickness])
        cylinder(d=hole_dia, h=thickness*3);

    translate([(.5*cm)+offset, (0*cm)+offset, -thickness])
        cylinder(d=hole_dia, h=thickness*3);

    translate([(.5*cm)+offset, (-0.25*cm)+offset, -thickness])
        cylinder(d=hole_dia, h=thickness*3);
}
