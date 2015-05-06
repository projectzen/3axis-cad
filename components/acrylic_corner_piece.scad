//import("acrylic_nut.stl");
block_width=50;
block_height=101.3;
hex_side_length=7.5;

hex_height=7;
hex_offset=0.2;

bolt_height=15;
bolt_radius=5;
bolt_offset_1=10;
bolt_offset_2=25;

difference() {
    cube(size=[block_width, block_width, block_height],center=true);
    
    translate([0,0,block_height/2-hex_height/2])
        hexagon(hex_side_length, hex_height+hex_offset);
    translate([0,0,block_height/2-bolt_height/2])
        cylinder(h=bolt_height, r=bolt_radius, center=true);
    
    translate([0,0,-1*block_height/2+hex_height/2])
        hexagon(hex_side_length, hex_height+hex_offset);
    translate([0,0,-1*block_height/2+bolt_height/2])
        cylinder(h=bolt_height, r=bolt_radius, center=true);
    
    translate([0,block_width/2-hex_height/2, bolt_offset_1])
        rotate([90,0,0])
            hexagon(hex_side_length, hex_height+hex_offset);
    translate([0,block_width/2-bolt_height/2, bolt_offset_1])
        rotate([90,0,0])
            cylinder(h=bolt_height, r=bolt_radius, center=true);
    
    translate([0,block_width/2-hex_height/2, -1*bolt_offset_1])
        rotate([90,0,0])
            hexagon(hex_side_length, hex_height+hex_offset);
    translate([0,block_width/2-bolt_height/2, -1*bolt_offset_1])
        rotate([90,0,0])
            cylinder(h=bolt_height, r=bolt_radius, center=true);
            
    translate([block_width/2-hex_height/2, 0, bolt_offset_2])
        rotate([0,90,0])
            hexagon(hex_side_length, hex_height+hex_offset);
    translate([block_width/2-bolt_height/2, 0, bolt_offset_2])
        rotate([0,90,0])
            cylinder(h=bolt_height, r=bolt_radius, center=true);
            
     translate([block_width/2-hex_height/2, 0, -1*bolt_offset_2])
        rotate([0,90,0])
            hexagon(hex_side_length, hex_height+hex_offset);
    translate([block_width/2-bolt_height/2, 0, -1*bolt_offset_2])
        rotate([0,90,0])
            cylinder(h=bolt_height, r=bolt_radius, center=true);
}

module hexagon(size, height) {
    linear_extrude(height=height, center=true)
    polygon(points=[[size*sqrt(3)/2, size/2],[0, size],[-1*size*sqrt(3)/2, size/2],[-1*size*sqrt(3)/2, -1*size/2],[0, -1*size], [size*sqrt(3)/2, -1*size/2]]);
}