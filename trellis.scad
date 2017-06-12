 
Trellis();

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module Trellis($fn=100) {
    // Temporary variables
    buttonSize = 11;
    buttonSpace = 4;
    spaceToBorder = 7;
    borderWidth = 1.5;
    coverToEdge = 1;
    coverHeight = 1;
    topHeight = 1;
    
    x=4;
    y=4;

    difference() {
    Top((x+1)*(buttonSpace+buttonSize), (y+1)*(buttonSpace+buttonSize));
    
    // buttons placeholder matrix    
    for (i =[1:x]) {
        for (t =[1:y]) {
            translate([i*(buttonSpace+buttonSize), t*(buttonSpace+buttonSize), -.9]) 
            Button(buttonSize, buttonSize/8);
        }
    } 

    }
   
    // buttons matrix
//    color("Aqua", 1.0) {
    
//        for (i =[1:x]) {
//            for (t =[1:y]) {
//                translate([i*(buttonSpace+buttonSize/8), t*(buttonSpace+buttonSize/8), -.9]) 
//                Button(buttonSize, buttonSize/16);
//            }
//        } 
//    }
}

module Button(size, radius) {
    
    offset = (size/2-radius);
        hull() {
            translate([-offset, -offset , 0]) cylinder(r=radius, h=2);
            translate([offset, -offset , 0]) cylinder(r=radius, h=2);
            translate([-offset, offset , 0]) cylinder(r=radius, h=2);
            translate([offset, offset , 0]) cylinder(r=radius, h=2); 
       }

}

module Top(sizex, sizey ) {
    difference() {
        minkowski() {
            cube([sizex,sizey,2]);
            sphere(.5);
        }
        translate([1,1 , 1]) cube([sizex-2,sizey-2,2]);
    }
}