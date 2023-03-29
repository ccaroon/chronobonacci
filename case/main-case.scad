// Fibonacci Box - 1,1,2,3,5
use <neo-holes.scad>

$fn = 50;
cm = 10;

// case depth
depth = 1.5*cm;
// unit size for chambers
unit = 1.6*cm;
// wall thickness
wall = 1;

// Screw holes in each corner
sh_in_dia = 2.9;
sh_out_dia = sh_in_dia + 1.5;
sh_height = 5;
sh_wall_adj = wall+(sh_out_dia-sh_in_dia);
sh_positions = [
    // top-left
    [sh_wall_adj,          (5*unit)-sh_wall_adj, 0],
    // bottom-left
    [sh_wall_adj,          sh_wall_adj,          0],
    // top-right
    [(8*unit)-sh_wall_adj, (5*unit)-sh_wall_adj, 0],
    // bottom-right
    [(8*unit)-sh_wall_adj, sh_wall_adj,          0]
];

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
            chamber(1, unit, depth, wall);

        // one' box
        translate([2*unit, (4*unit),0])
            chamber(1, unit, depth, wall);

        // two box
        translate([(0*unit), (3*unit), 0])
            chamber(2, unit, depth, wall);

        // three box
        translate([0*unit, 0*unit, 0])
            chamber(3, unit, depth, wall);

        // five box
        translate([3*unit, 0, 0])
            chamber(5, unit, depth, wall);
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


// Total box is w*l in size
// Inside of box is smaller than w*l
module box(w, l, h, wall) {
    difference() {
        cube([w, l, h]);
        translate([wall,wall,wall])
            cube([w-(wall*2), l-(wall*2), h+1]);
    }
}

module screw_hole(outer_dia, inner_dia, height) {
    difference () {
        cylinder(d=outer_dia, h=height);

        translate([0,0,-1])
            cylinder(d=inner_dia, h=height+2);
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

// module lid(w,l,wall) {
//     cube([w,l,wall]);
//     translate([wall,wall,wall])
//         color("grey") cube([w-(wall*2), l-(wall*2), wall+1]);
// }












// EOF
