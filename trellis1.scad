 
Trellis();

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module Trellis($fn=100) {
    // Temporary variables
    buttonSize = 11;
    buttonSpace = 4;
    borderWidth = 4;
    height = 13;
    coverHeight = 8;
    buttonHeight = 10;
    space = 2;
    
    x=4;
    y=8;

    offsetx=borderWidth+buttonSize;
    difference() {
        
        Top(offsetx + x*(buttonSpace+buttonSize), offsetx + y*(buttonSpace+buttonSize), borderWidth, height, coverHeight);
        
        // buttons placeholder matrix    
        for (i =[0:x-1]) {
            for (t =[0:y-1]) {
                translate([offsetx + i*(buttonSize+buttonSpace), offsetx + t*(buttonSpace+buttonSize), -coverHeight]) 
                Button(buttonSize, buttonSize/8, buttonHeight);
            }
        } 

    }
     translate([offsetx + x *(buttonSpace+buttonSize)+space,0 , 0])
     Top(offsetx + x *(buttonSpace+buttonSize), offsetx + y*(buttonSpace+buttonSize), borderWidth, height, coverHeight);
   
    // buttons matrix
//    color("Aqua", 1.0) {
    
//        for (i =[1:x]) {
//            for (t =[1:y]) {
//               translate([i*(buttonSpace+buttonSize), t*(buttonSpace+buttonSize), -coverHeight]) 
//                Button(buttonSize, buttonSize/8, buttonHeight);
            
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

module Top(sizex, sizey, borderWidth, height, coverHeight ) {
    radius = height/2;
    offsetx = (sizex-radius);
    offsety = (sizey-radius);

    difference() {
        
        hull() {
            translate([radius, radius , -radius]) sphere(r=radius);
           translate([radius, offsety , -radius]) sphere(r=radius);
            translate([offsetx, radius , -radius]) sphere(r=radius);
            translate([offsetx, offsety , -radius]) sphere(r=radius);
        }
        //translate([-2, -2, 0]) cube([sizex-(borderWidth+4)*2,sizey-(borderWidth+4)*2,coverHeight]);
        
         translate([0, 0, -height*1.5]) cube([sizex,sizey,height]);
         translate([borderWidth, borderWidth, -height*1.5+coverHeight]) cube([sizex-borderWidth*2,sizey-borderWidth*2,coverHeight]);
        
        
    }
}