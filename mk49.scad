 
Trellis();

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module Trellis($fn=100) {
    // Temporary variables
    buttonSizeX = 8.5;
    buttonSizeY = 15;
    buttonSpaceX = 5;
    buttonSpaceY = 5;
    borderWidthX = 5;
    borderWidthY = -.1;
    height = 6;
    thickness = 4;
    buttonHeight = 11;
    space = 10;
    
    x=6;
    y=8;


    difference() {
        
        Top(buttonSizeX - buttonSpaceX + x*(buttonSpaceX+buttonSizeX), buttonSizeY - buttonSpaceY + y*(buttonSpaceY+buttonSizeY), borderWidthX, borderWidthY, height, thickness);
        
        // buttons placeholder matrix    
         Buttons(x, y, buttonSizeX,buttonSizeY, buttonSpaceX, buttonSpaceY, thickness, height);

    }
    
 //   translate([2*space+x*(buttonSpaceX+buttonSizeX),0 , 3]) 
 //   Bottom(buttonSizeX - buttonSpaceX + x*(buttonSpaceX+buttonSizeX), buttonSizeY - buttonSpaceY + y*(buttonSpaceY+buttonSizeY), borderWidthX, borderWidthY, height, thickness);
   
    // buttons matrix
    //Buttons(x, y, buttonSize, buttonSpace, thickness, height);
}





module Button(sizeX, sizeY, radius, height) {
    
    offsetX = (sizeX/2-radius);
    offsetY = (sizeY/2-radius);
    
        hull() {
            translate([-offsetX, -offsetY , 0]) cylinder(r=radius, h=height);
            translate([offsetX, -offsetY , 0]) cylinder(r=radius, h=height);
            translate([-offsetX, offsetY , 0]) cylinder(r=radius, h=height);
            translate([offsetX, offsetY , 0]) cylinder(r=radius, h=height); 
       }

}

module Buttons(x, y, buttonSizeX, buttonSizeY, buttonSpaceX, buttonSpaceY, thickness, height) {
        // buttons matrix
    color("Aqua", 1.0) {
    
       for (i =[0:x-1]) {
            for (t =[0:y-1]) {
                translate([buttonSizeX + i*(buttonSizeX+buttonSpaceX), buttonSizeY+t*(buttonSpaceY+buttonSizeY), height-thickness-.2]) 
                Button(buttonSizeX, buttonSizeY, buttonSizeX/8, thickness+4);
            }
        }
    } 
}

module Top(sizex, sizey, borderWidthX, borderWidthY, height, thickness ) {

    radius = thickness/2;
    offsetx = (sizex)+borderWidthX;
    offsety = (sizey)+borderWidthY;
    
    screwR = 1.6;
    boltR = 3.5;


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
      
 //     translate([borderWidthX*3, -borderWidthY/2, -0.1]) cylinder(h=radius, r1=boltR, r2=boltR);
//      translate([sizex - borderWidthX*3, -borderWidthY/2, -0.1]) cylinder(h=radius, r1=boltR, r2=boltR);
      
 //     translate([borderWidthX*3, sizey+borderWidthY/2, -0.1]) cylinder(h=radius, r1=boltR, r2=boltR);
 //     translate([sizex - borderWidthX*3, sizey+borderWidthY/2, -0.1]) cylinder(h=radius, r1=boltR, r2=boltR);
       
       
        // pins
//         translate([borderWidthX*3, -borderWidthY/2, -.1]) cylinder(h=height+.2, r1=screwR, r2=screwR);
//         translate([sizex - borderWidthX*3, -borderWidthY/2, -.1]) cylinder(h=height+.2, r1=screwR, r2=screwR);
      
//         translate([borderWidthX*3, sizey+borderWidthY/2, -.1]) cylinder(h=height+.2, r1=screwR, r2=screwR);
//         translate([sizex - borderWidthX*3, sizey+borderWidthY/2, -.1]) cylinder(h=height+.2, r1=screwR, r2=screwR);
       
       
       // large holes
//         translate([borderWidthX*3, -borderWidthY/2, height-1]) cylinder(h=1+.1, r1=boltR, r2=boltR);
//         translate([sizex - borderWidthX*3, -borderWidthY/2, height-1]) cylinder(h=1+.2, r1=boltR, r2=boltR);
      
//         translate([borderWidthX*3, sizey+borderWidthY/2, height-1]) cylinder(h=1+.2, r1=boltR, r2=boltR);
//         translate([sizex - borderWidthX*3, sizey+borderWidthY/2, height-1]) cylinder(h=1+.2, r1=boltR, r2=boltR);


   }    
    
}

module Bottom(sizex, sizey, borderWidthX, borderWidthY, height, thickness ) {

    radius = thickness/2;
    offsetx = (sizex)+borderWidthX;
    offsety = (sizey)+borderWidthY;
    border = 2;
    thickness1 = 2;
    height1 = thickness1*3;
    
    screwR = 1.7;
    boltR = 3.5;

    difference() {
        
        
         translate([-borderWidthX, -borderWidthY, 0]) cube([sizex+(2*borderWidthX),sizey+(2*borderWidthY),height1+thickness1]);

         translate([sizex, 0, height1]) rotate([0,180,0])  scale([1.001,1.0001,1]) Top(sizex, sizey, borderWidthX, borderWidthY, height, thickness);

 translate([border, border, 0]) cube([sizex-border*2,sizey-border*2,height1]);        
        

        
         // pins
         translate([borderWidthX*3, -borderWidthY/2, -.1]) cylinder(h=height+.2, r1=screwR, r2=screwR);
         translate([sizex - borderWidthX*3, -borderWidthY/2, -.1]) cylinder(h=height+.2, r1=screwR, r2=screwR);
      
         translate([borderWidthX*3, sizey+borderWidthY/2, -.1]) cylinder(h=height+.2, r1=screwR, r2=screwR);
         translate([sizex - borderWidthX*3, sizey+borderWidthY/2, -.1]) cylinder(h=height+.2, r1=screwR, r2=screwR);

         // hex holes
         translate([borderWidthX*3, -borderWidthY/2, height1+thickness1-1.1]) cylinder(h=1.2, r1=boltR, r2=boltR);
         translate([sizex - borderWidthX*3, -borderWidthY/2, height1+thickness1-1.1]) cylinder(h=1.2, r1=boltR, r2=boltR);
      
         translate([borderWidthX*3, sizey+borderWidthY/2, height1+thickness1-1.1]) cylinder(h=1.2, r1=boltR, r2=boltR);
         translate([sizex - borderWidthX*3, sizey+borderWidthY/2, height1+thickness1-1.1]) cylinder(h=1.2, r1=boltR, r2=boltR);

   }    
    
}