// TODO:
// * adjust inner positions for wall thickness

$fn = 50;
cm = 10;

height = 3*cm;
unit = 1.5*cm;
outer_wall = 1.5;
inner_wall = 1;

box(8*unit, 5*unit, height, outer_wall);

// one
translate([2*unit,3*unit,0])
    box(1*unit, 1*unit, height, inner_wall);

// one'
translate([2*unit,4*unit,0])
    box(1*unit, 1*unit, height, inner_wall);

// two
translate([0*unit,3*unit,0])
    box(2*unit, 2*unit, height, inner_wall);

// three
translate([0*unit,0*unit,0])
    box(3*unit, 3*unit, height, inner_wall);

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
