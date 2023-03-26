// Small "plate" that a NeoPixel with Pins will Fit into
cm=10;
hole_dia=1.5;
module neo_plate(size, thickness) {
    offset = size / 2;
    difference() {
        color("black") cube([size, size, thickness], center=false);

        // left side holes
        translate([(-.5*cm)+offset, (0.25*cm)+offset, -thickness])
            #cylinder(d=hole_dia, h=thickness*3);

        translate([(-.5*cm)+offset, (0*cm)+offset, -thickness])
            #cylinder(d=hole_dia, h=thickness*3);

        translate([(-.5*cm)+offset, (-0.25*cm)+offset, -thickness])
            #cylinder(d=hole_dia, h=thickness*3);

        // right side holes
        translate([(.5*cm)+offset, (0.25*cm)+offset, -thickness])
            #cylinder(d=hole_dia, h=thickness*3);

        translate([(.5*cm)+offset, (0*cm)+offset, -thickness])
            #cylinder(d=hole_dia, h=thickness*3);

        translate([(.5*cm)+offset, (-0.25*cm)+offset, -thickness])
            #cylinder(d=hole_dia, h=thickness*3);
    }
}
