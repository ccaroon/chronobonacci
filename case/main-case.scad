// Fibonacci Box - 1,1,2,3,5
use <neo-holes.scad>

$fn = 50;
cm = 10;

// case depth
depth = 2.5*cm;
// unit size for boxes
unit = 1.5*cm;
// outer wall thickness
outer_wall = 2;
// inner wall thickness
inner_wall = 1;

// Outer shell
// box(8*unit, 5*unit, depth, outer_wall);

// one box
translate([2*unit,3*unit,0])
chamber(1, unit, depth, inner_wall);

// one' box
translate([2*unit,4*unit,0])
chamber(1, unit, depth, inner_wall);

// two box
translate([0*unit,3*unit,0])
chamber(2, unit, depth, inner_wall);

// // three box
// translate([0*unit,0*unit,0])
// chamber(3, unit, depth, inner_wall);

// // five box (box already formed by border of other boxes)
// translate([3*unit, 0, 0])
// chamber(5, unit, depth, inner_wall);


// -- Modules --
module chamber(num, unit, depth, wall) {
    size = num * unit;
    center_offset = num % 2 == 0
        ? (num / 2) - (num * .25)
        : floor(num / 2);
    echo(size, center_offset);
    difference () {
        box(size, size, depth, wall);
        translate([center_offset*unit, center_offset*unit, 0])
        neo_holes(wall);
    }
}

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












// EOF
