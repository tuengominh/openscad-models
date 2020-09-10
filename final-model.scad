$fn = 180;

flower();

module flower() {
    union() {
        translate([-20,0,0])
        petal();
        translate([0,-20,0])
        rotate([0,0,90]) 
        petal();
        translate([20,0,0])
        rotate([0,180,0]) 
        petal();
        translate([0,20,0])
        rotate([0,0,-90]) 
        petal();
    }
}

module petal() {
    translate([20,0,0])
    vertical_piece(6);
    translate([12,0,0])
    vertical_piece(10);
    translate([-12,0,0])
    horizontal_piece(18);
}

module vertical_piece(radius) {
    hull() {
      cylinder(r=radius, h=3, center=true);
      translate([-radius,0,0])  
      rotate([90,0,0]) 
      cylinder(r=radius, h=3, center=true);
    }
}

module horizontal_piece(radius) {
    translate([radius*0.75,0,0])
    hull() {
      cylinder(r=radius, h=3, center=true);
      translate([-radius/2,0,0])  
      rotate([90,0,0]) 
      cylinder(r=radius/2, h=3, center=true);
    }
}