x = 56.08;
y = 48.62;
z = 9.40;
tolerance = 0.2;
thickness = 3;
cyl_height = 2.80;
cyl_radius = 2.40;
cyl_h_tol = cyl_height + 2*tolerance;

difference() {
    cube([x, y, z]);
    translate([thickness/2, thickness/2])
    cube([x - thickness, y - thickness, cyl_h_tol]);
}

translate([4, 4])
for (j = [0:5]) {
    for (i = [0:6]) {
        translate([i*8,j*8,z])
        cylinder(h=cyl_height,r=cyl_radius);
    }
}

translate([4, 4])
for (j = [0:5]) {
    for (i = [0:6]) {
        translate([i*8,j*8,0])
        difference() {
            cylinder(h=cyl_h_tol,r=cyl_radius + tolerance + thickness/2);
            cylinder(h=cyl_h_tol,r=cyl_radius + tolerance);
        }
    }
}