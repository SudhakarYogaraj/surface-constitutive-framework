// GMSH source file to create a triangular mesh for lid-driven cavity problem.
// The bottom surface of the cavity is covered with periodic square rough elements.

//====================================
// Roughness dimension
hei=0.05;
len=0.1;

// Dimension of the box
boxx=1.0;
boxy=1.0;

// Mesh spacing
h1=0.02*boxx;
h=0.002*boxx;
//====================================

// Create the first roughness element
Point(1)={0,0,0,h};
Point(2)={0.5*hei,0,0,h};
Point(3)={0.5*hei,-hei,0,h};
Point(4)={1.5*hei,-hei,0,h};
Point(5)={1.5*hei,0.0,0,h};
Point(6)={2.0*hei,0.0,0,h};
Line(1)={1,2};
Line(2)={2,3};
Line(3)={3,4};
Line(4)={4,5};
Line(5)={5,6};

// Copy the element created above to cover the entire bottom surface
Translate {1*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }
Translate {2*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }
Translate {3*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }
Translate {4*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }
Translate {5*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }
Translate {6*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }
Translate {7*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }
Translate {8*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }
Translate {9*len, 0, 0} { Duplicata{ Line{1,2,3,4,5}; } }

//Compound Line(1001)={1:50};

// Create bounding lines for cavity
Point(169)={boxx,boxy,0,h1};
Point(170)={0.0,boxy,0,h1};
Line(51)={168,169};
Line(52)={169,170};
Line(53)={170,1};

Line Loop(501)={1:53};
Plane Surface(101)={501};

Physical Surface(1)={101};

// Physical entities to enforce boundary conditions
Physical Line(1)={53};  // left
Physical Line(2)={1:50};  // bottom
Physical Line(3)={51};  // right
Physical Line(4)={52};  // top
