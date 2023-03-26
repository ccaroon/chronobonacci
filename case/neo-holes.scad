// Small "plate" that a NeoPixel with Pins will Fit into
cm=10;
hole_dia=1.5;
// size (w,h) of imaginary plate
size = 1.5*cm;
module neo_holes(thickness) {
    offset = size / 2;
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
