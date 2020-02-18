thickness = 4;
kerf = 0.15;
baseJoinDepth = 15;
toPrint = true;

if(toPrint){
    projection(cut=true)AllToPrint();
} else {
    AllToPrint();
}

module AllToPrint(){
    for(i=[0:3]){
        translate([0,i*60,0])
        Element(6, 25);
        translate([70,i*80,0])
        Element(5, 30);
        translate([155,i*90,0])
        Element(4, 30);
        translate([235,i*110,0])
        Element(3, 30);
        translate([-65,i*60,0])
        Element(3, 15);
        translate([-105,i*60,0])
        Element(4, 15);
    }
}

//base module for elements 
module Element(noSides, apothem){
    difference() {
        Polygon(noSides, apothem);
        rotate([0,0,180/noSlides])
        translate([0,0, -thickness/2])
        Joints(360/noSides, noSides, thickness, apothem);
    }
}

//base module for a set of joints
module Joints(angle, noSides, thickness, apothem){
    for(i=[0:noSides-1]){
        rotate([0,0,angle*i+angle/2])
        translate([(apothem+kerf) - (baseJoinDepth-kerf)/4,0,thickness])
        Joint();
    }
}

//base module for a single joint
module Joint() {
    cube([(baseJoinDepth-kerf)/2, thickness-kerf, thickness],center=true);
}

//base module for polygon objects
module Polygon(noSides, apothem){ 
    angle=360/noSides;
    radius= apothem/cos(angle/2);
    cylinder(r=(radius+kerf), h=thickness, $fn=noSides);
       
}