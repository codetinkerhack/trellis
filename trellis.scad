 
Trellis();

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module Trellis($fn=100) {
    // Temporary variables
    buttonSize = 11;
    buttonSpace = 4;
    borderWidthX = 2;
    borderWidthY = 4;
    height = 11;
    thickness = 5;
    buttonHeight = 10;
    space = 15;
    
    x=4;
    y=8;


    difference() {
        
        Top(buttonSize - buttonSpace + x*(buttonSpace+buttonSize), buttonSize - buttonSpace + y*(buttonSpace+buttonSize), borderWidthX, borderWidthY, height, thickness);
        
        // buttons placeholder matrix    
        for (i =[0:x-1]) {
            for (t =[0:y-1]) {
                translate([buttonSize + i*(buttonSize+buttonSpace), buttonSize+t*(buttonSpace+buttonSize), height-thickness-.2]) 
                Button(buttonSize, buttonSize/8, thickness+2);
            }
        } 

    }
    
//   translate([x *(buttonSpace+buttonSize)+space,0 , 0])
//    Top(buttonSize - buttonSpace + x*(buttonSpace+buttonSize), buttonSize - buttonSpace + y*(buttonSpace+buttonSize), borderWidthX, borderWidthY, height, thickness);
   
    // buttons matrix
//    color("Aqua", 1.0) {
    
//       for (i =[0:x-1]) {
//            for (t =[0:y-1]) {
//                translate([buttonSize + i*(buttonSize+buttonSpace), buttonSize+t*(buttonSpace+buttonSize), height-thickness-.2]) 
//                Button(buttonSize, buttonSize/8, thickness+2);
//            }
//        }
//    } 
}

module Button(size, radius, height) {
    
    offset = (size/2-radius);
        hull() {
            translate([-offset, -offset , 0]) cylinder(r=radius, h=height);
            translate([offset, -offset , 0]) cylinder(r=radius, h=height);
            translate([-offset, offset , 0]) cylinder(r=radius, h=height);
            translate([offset, offset , 0]) cylinder(r=radius, h=height); 
       }

}

module Top(sizex, sizey, borderWidthX, borderWidthY, height, thickness ) {

    radius = thickness/2;
    offsetx = (sizex)+borderWidthX;
    offsety = (sizey)+borderWidthY;


    difference() {
        
        
         translate([-borderWidthX, -borderWidthY, 0]) cube([sizex+(2*borderWidthX),sizey+(2*borderWidthY),height]);
        
         translate([0, 0, -.1]) cube([sizex,sizey,height-thickness]);
    
    
       hull() {
            translate([-borderWidthX, -borderWidthY , height-radius+.1]) cylinder(h=radius, r1=0, r2=radius);
            translate([-borderWidthX, offsety , height-radius+.1]) cylinder(h=radius, r1=0, r2=radius);
       }
       hull() {
            translate([offsetx, -borderWidthY , height-radius+.1]) cylinder(h=radius, r1=0, r2=radius);
            translate([offsetx, offsety , height-radius+.1]) cylinder(h=radius, r1=0, r2=radius);
       }
   }    
    
}