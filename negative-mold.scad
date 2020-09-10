mold_width = 78;			
mold_height = 116;			
mold_depth = 15;			
mold_spacing = 10;

key_size = 3;		
key_tolerance = 0.4;		
key_margin = 7;	

negative_mold(); 

module negative_mold() {
    difference() {
        translate([mold_width/2 + mold_spacing, 0, mold_depth/2])
        bottom_mold();
        bottom_model();
    }
       
    difference() {
        translate([-mold_width/2 - mold_spacing, 0, mold_depth*3/2])
        rotate([0, 180, 0])
        top_mold();
        top_model();
    }
}

module bottom_mold() {
    difference() {
        cube(size = [mold_width, mold_height, mold_depth], center = true);
        
        translate([-mold_width/2 + key_margin, -mold_height/2 + key_margin, mold_depth/2])
        negative_key();
        translate([mold_width/2 - key_margin, mold_height/2 - key_margin, mold_depth/2])
        negative_key();
        
        translate([0, -mold_height*0.31, mold_depth/2])
        rotate([90, 0, 0])
        cylinder(mold_height/2, 1.5 + key_tolerance, 20 + key_tolerance);
    }

    translate(v = [-mold_width/2 + key_margin, mold_height/2 - key_margin, mold_depth/2])
    positive_key();
    translate(v = [mold_width/2 - key_margin, -mold_height/2 + key_margin, mold_depth/2])
    positive_key();
}

module top_mold(){
    difference() {
        translate([0, 0, mold_depth])
        cube(size = [mold_width, mold_height, mold_depth], center = true);
        
        translate(v = [mold_width/2 - key_margin, -mold_height/2 + key_margin, mold_depth/2])
        negative_key();
        translate(v = [-mold_width/2 + key_margin, mold_height/2 - key_margin, mold_depth/2])
        negative_key();
        
        translate([0, -mold_height*0.31, mold_depth/2])
        rotate([90, 0, 0])
        cylinder(mold_height/2, 1.5 + key_tolerance, 20 + key_tolerance);
    }

    translate(v = [mold_width/2 - key_margin, mold_height/2 - key_margin, mold_depth/2])
    positive_key();
    translate(v = [-mold_width/2 + key_margin, -mold_height/2 + key_margin, mold_depth/2])
    positive_key();
}

module positive_key() {
    sphere(r = key_size, $fn = 30);
}

module negative_key() {
    sphere(r = key_size + key_tolerance, $fn = 30);
}

module bottom_model() {
    translate([mold_spacing + mold_width/2, 0, mold_depth])
    import("final-model.stl", convexity=4);
}

module top_model() {
    rotate([0, 0, 180])
    bottom_model();
}
