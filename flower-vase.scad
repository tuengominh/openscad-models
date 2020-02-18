difference() {
    group() {
    shape(70,2);
    translate([0,0,80])
    rotate([0,0,40])
    shape(20,2);
    }
    translate([0,0,20])
    cylinder(h=340,r=40);
}

module shape(side, h) {
    for (i=[0:180]) {
      for (j=[0:1]) {
        translate([0,0,i])
        rotate([0,0,i])
        cube([side+i,side+i,h],center=true);
      }
    }
} 