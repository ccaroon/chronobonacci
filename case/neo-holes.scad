// Small "plate" that a NeoPixel with Pins will Fit into
cm = 10;
hole_dia = 1.5;
module neo_holes(unit, thickness) {
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


    // difference () {
    //     union () {
    //         translate([sh_wall_adj, (num*unit)-sh_wall_adj, 0])
    //             cylinder(d=5,h=5);
    //         box(size, size, depth, wall);
    //     }
    //     translate([(center_offset*unit), (center_offset*unit), 0])
    //     neo_holes(unit, wall);
    //     translate([sh_wall_adj, (num*unit)-sh_wall_adj, -1])
    //         cylinder(d=2.9, h=7);
    // }
