W = 42.545;
D = 22;
RESOLUTION = 30;


%translate([W/2, 0, 4])
    import("C:/Users/comet/Documents/PD_Adapter.stl");


module RoundedCube(x, y, z, r) {
    cube([x-r*2, y, z], center=true);
    cube([x, y-r*2, z], center=true);
    translate([x/2-r, y/2-r, 0])
        cylinder(r=r, h=z, $fn=RESOLUTION, center=true);
    translate([x/2-r, -(y/2-r), 0])
        cylinder(r=r, h=z, $fn=RESOLUTION, center=true);
    translate([-(x/2-r), y/2-r, 0])
        cylinder(r=r, h=z, $fn=RESOLUTION, center=true);
    translate([-(x/2-r), -(y/2-r), 0])
        cylinder(r=r, h=z, $fn=RESOLUTION, center=true);
}


module Pipe(r_outer, r_inner, h) {
    difference() {
        cylinder(r=r_outer, h=h, $fn=RESOLUTION);
        cylinder(r=r_inner, h=h, $fn=RESOLUTION);
    }
}


module CaseLower() {
    // chassis
    w_outer = W + 3;
    d_outer = D + 3 + 4;
    h_outer = 6.5;
    r_outer = 4;
    
    w_inner = W + 0.6;
    d_inner = D + 3 + 0.6;
    h_inner = h_outer - 2;
    r_inner = 2;

    difference () {
        translate([-0.5, 0, h_outer/2-4])
            RoundedCube(w_outer, d_outer, h_outer, r_outer);
        translate([0, 0, h_inner/2-4+2])
            RoundedCube(w_inner, d_inner, h_inner, r_inner);
        // usb-c connector
        translate([W/2+1, 0, h_outer/2-4+2])
            cube([10, 10, 3], center=true);
    }
    translate([0, d_outer/2-2.5, h_inner/2-4+0.5])
        cube([w_inner-r_outer*4, 2, h_inner], center=true);
    translate([0, -(d_outer/2-2.5), h_inner/2-4+0.5])
        cube([w_inner-r_outer*4, 2, h_inner], center=true);
    
    // columns
    w_holes = 36;
    d_holes = 16;
    r_c = 1.2;
    h_c = 3;
    translate([0, 0, -2]) {
        translate([w_holes/2, d_holes/2, 0])
            cylinder(r=r_c, h=h_c, $fn=RESOLUTION);
        translate([w_holes/2, -d_holes/2, 0])
            cylinder(r=r_c, h=h_c, $fn=RESOLUTION);
        translate([-w_holes/2, d_holes/2, 0])
            cylinder(r=r_c, h=h_c, $fn=RESOLUTION);
        translate([-w_holes/2, -d_holes/2, 0])
            cylinder(r=r_c, h=h_c, $fn=RESOLUTION);
    }
}


module CaseUpper() {
    w = W + 0.6;
    d = D + 3 + 0.6;
    h = 1.5;
    r = 2;
    
    w_v = 33.6+0.6;
    d_v = 6;

    translate([0, 30, 1.5/2+1]) {
        difference() {
            RoundedCube(w, d, h, r);
            
            // usb-c connector
            translate([(w-8)/2, 0, 0])
                cube([8, 10, 3], center=true);
            
            // center void
            translate([-(w-w_v)/2, 0, 0])
                cube([w_v, d_v, 3], center=true);
            
        }
        
        // shroud
        difference() {
            hull() {
                translate([-(w-w_v)/2, 0, 0])
                    cube([w_v+2, d_v+6, 1.5], center=true);
                
                translate([-(w-w_v)/2, 0, 8-1/2])
                    cube([w_v+2, d_v+2, 1], center=true);
            }
            
            hull() {
                translate([-(w-w_v-1)/2, 0, 0])
                    cube([w_v-1, d_v, 1.5], center=true);
                
                translate([-(w-w_v-1)/2, 0, 8-1/2-1])
                    cube([w_v-1, d_v, 1], center=true);
            }
            translate([-w/2-1, -(d_v+6)/2, -2])
                cube([1, d_v+6, 20]);
            
            // hole for outlet
            translate([-w/2+1, -d_v/2, -2])
                cube([5, d_v, 20]);
        }
        

        // columns
        w_holes = 36;
        d_holes = 16;
        r_c_o = 1.2 + 1.0;
        r_c_i = 1;
        h_c = 1;
        translate([0, 0, -(1.5/2+1)]) {
            translate([w_holes/2, d_holes/2, 0])
                Pipe(r_outer=r_c_o, r_inner=r_c_i, h=h_c);
            translate([w_holes/2, -d_holes/2, 0])
                Pipe(r_outer=r_c_o, r_inner=r_c_i, h=h_c);
            translate([-w_holes/2, d_holes/2, 0])
                Pipe(r_outer=r_c_o, r_inner=r_c_i, h=h_c);
            translate([-w_holes/2, -d_holes/2, 0])
                Pipe(r_outer=r_c_o, r_inner=r_c_i, h=h_c);
        }
    }
}

translate([0, 0, 4])
    CaseLower();

//translate([0, -30, 4])
    CaseUpper();