wax_width = 88;
wax_height = 146;
wax_depth = 36;

mold_width = 78;			
mold_height = 116;			
mold_spacing = 10;
	
key_tolerance = 0.4;

union() {
    wax();
    translate([0, 0, wax_depth])
    positive_mold();
}

module positive_mold() {
    difference() {
        union() {
            translate([wax_width/2 + mold_spacing/2, 0, -wax_depth/2])
            cube(size = [mold_width, mold_height, wax_depth], center = true);
            translate([- wax_width/2 - mold_spacing/2, 0, -wax_depth/2])
            cube(size = [mold_width, mold_height, wax_depth], center = true);
        }
        rotate([180,0,0])
        import("negative-mold.stl", convexity=4);
    }
}

module wax() {
    union() {
        translate([wax_width/2 + mold_spacing/2, 0, wax_depth/2])
        difference() {
            cube(size = [wax_width, wax_height, wax_depth], center = true);
            cube(size = [mold_width, mold_height, wax_depth], center = true);
            translate([0,0,wax_depth/2 - 2])
            cube(size = [mold_width + 2, mold_height + 2, 2], center = true);
        }
        
        translate([-wax_width/2 - mold_spacing/2, 0, wax_depth/2])
        difference() {
            cube(size = [wax_width, wax_height, wax_depth], center = true);
            cube(size = [mold_width, mold_height, wax_depth], center = true);
            translate([0,0,wax_depth/2 - 2])
            cube(size = [mold_width + 2, mold_height + 2, 2], center = true);
        }
    }
}
