x = 16;
y = 9;
h = 1;
thickness = 1;
angle = 10;

shape(x, y, h);
for (i=[0:3]) {
    rotate([0, angle*i, 0])
    shape(x + thickness*i, y + thickness*i, h);
}
for (i=[0:2]) {
    rotate([0, angle*i*(-1), 0])
    shape(x - thickness*i, y - thickness*i, h);
}

module shape(x, y, h) {
    difference() {
        cube([x,y,h],center=true);
        translate([0,0,0])
        cube([x - thickness,y - thickness,h],center=true);
    }
}
    