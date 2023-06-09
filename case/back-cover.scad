// Back of the case that covers the electronics
// TODO:
// * Add hole for power connector
// ----------------------------------------------------------------------------
use <parts.scad>
include <units.scad>
include <variables.scad>

usb_plug_h = 17;
usb_plug_w = 11;
back_depth = 1.5*cm;

for (pos = sh_positions) {
    translate(pos)
        screw_hole(sh_out_dia, sh_in_dia, sh_height);
}

difference () {
    box(case_width, case_height, back_depth, wall);

    // hack - holes in the back of the case too at the screw hole positions
    for (pos = sh_positions) {
        translate([pos[0], pos[1], -1])
            cylinder(d=sh_in_dia, h=sh_height/2);
    }

    // Airflow slits
    x_spacing = 1*unit;
    y_spacing = 1*cm;
    slit_width = case_width / 3;
    slit_height = wall;
    wall_offset = wall + 7;

    for (x = [0 : slit_width+x_spacing+wall_offset : case_width-x_spacing]) {
        for (y = [0:y_spacing:case_height-y_spacing]) {
            translate([x+wall_offset, y+wall_offset, -wall])
                cube([slit_width, slit_height, wall*3]);
        }
    }

    // Vertical slit in middle
    // translate([(case_width/2)-wall+.5, usb_plug_h+2, -wall])
    //     cube([slit_height, case_height - 25, wall*3]);

    // Gap for USB connector
    translate([(case_width/2)-(usb_plug_w/2), -1, -1])
        cube([usb_plug_w,usb_plug_h+1,back_depth+2]);
}
