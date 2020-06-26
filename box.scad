/* The box */
/* [Main] */
show = "box"; // [box:Box, lid:Lid]
width = 50;
length = 100;
height = 40;
/* [Secondary] */
wallThikness = 2;
$fn = 50;

module box() {
    difference(){
        minkowski(){
            cube([width,length,height*2],true);
            sphere(wallThikness);
        }
        translate([0,0,wallThikness/2])
        cube([width,length,height*2+wallThikness],true);
        translate([0,0,height])
        cube([width+wallThikness*2,length+wallThikness*2,height*2],true);
    
        translate([0,0,-10])
        linear_extrude(10)
        difference(){
            
            square([width+wallThikness*2,length+wallThikness*2],true);
            minkowski(){
            square([width-wallThikness,length-wallThikness],true);
                circle(wallThikness);
            }
        }
    }
}


module lid(){
    difference(){
        #minkowski(){
            cube([width,length,40],true);
            sphere(wallThikness);
        }
        translate([0,0,-20])
        cube([width+wallThikness*2,length+wallThikness*2,40],true);
        translate([0,0,-wallThikness/2])///
        minkowski(){
            cube([width-wallThikness,length-wallThikness,20+wallThikness],true);
            sphere(wallThikness);
        }
        translate([0,0,-wallThikness/2])////
        minkowski(){
            cube([width-wallThikness*2,length-wallThikness*2,40-wallThikness],true);
            sphere(wallThikness);
        }
    }
    
}

if (show == "box")
    box();
else if (show == "lid")
    lid();
