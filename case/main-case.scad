// TODO:
// * adjust inner positions for wall thickness

use <neo-plate.scad>;

$fn = 50;
cm = 10;

// case heigth
height = 2.5*cm;

// unit size for boxes
unit = 1.5*cm;

// outer wall thickness
outer_wall = 1.5;

// inner wall thickness
inner_wall = 1;

// Outer shell
box(8*unit, 5*unit, height, outer_wall);

// one box
translate([2*unit,3*unit,0])
    union() {
        neo_plate(unit, outer_wall);
        box(1*unit, 1*unit, height, inner_wall);
    }


// one' box
translate([2*unit,4*unit,0])
    union () {
        neo_plate(unit, outer_wall);
        box(1*unit, 1*unit, height, inner_wall);
    }

// two box
translate([0*unit,3*unit,0])
    union () {
        box(2*unit, 2*unit, height, inner_wall);
        // center plate
        translate([.5*unit, .5*unit, 0])
            neo_plate(unit, outer_wall);
    }

// three box
translate([0*unit,0*unit,0])
    union () {
        box(3*unit, 3*unit, height, inner_wall);
        // center plate
        translate([1*unit, 1*unit, 0])
            neo_plate(unit, outer_wall);
    }

// five box (box already formed by border of other boxes)
// center plate
translate([(3*unit)+2*unit, 2*unit, 0])
    neo_plate(unit, outer_wall);


// -- Modules --
module box(w, l, h, wall) {
    difference() {
        cube([w, l, h]);
        translate([wall,wall,wall])
            cube([w-(wall*2), l-(wall*2), h+1]);
    }
}

module lid(w,l,wall) {
    cube([w,l,wall]);
    translate([wall,wall,wall])
        color("grey") cube([w-(wall*2), l-(wall*2), wall+1]);
}
