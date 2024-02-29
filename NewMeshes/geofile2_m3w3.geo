Lfm = 5e-4;
LfM = 2.5e-1;
Lfw = 2.5e-2;
dxb = 2;
L   = 8;
//+
Merge "geofile2.txt";
//+
Curve Loop(1) = {1, 2, 3, 4, 5, 6, 7};
//+
Plane Surface(100) = {1};
//+
//+
Physical Line(1) = {1};
Physical Line(3) = {3};
Physical Line(4) = {5,6}; 
Physical Line(5) = {4,7}; 
//+
//+
Physical Surface(100) = {100};
//+
//+
Field[1] = Distance; 
Field[1].PointsList = {6};
//+
//+
Field[2] = Threshold;
Field[2].InField = 1;
Field[2].LcMin = Lfm;
Field[2].LcMax = LfM;
Field[2].DistMin = Lfm*3;
Field[2].DistMax = LfM*4;
//+
//+
Field[3] = Distance; 
Field[3].PointsList = {6,7,5};
Field[3].CurvesList = {5,6};
Field[3].NumPointsPerCurve = 1000;
//+
//+
Field[4] = Threshold;
Field[4].InField = 3;
Field[4].LcMin = Lfw;
Field[4].LcMax = LfM;
Field[4].DistMin = Lfw*2; 
Field[4].DistMax = LfM*4;
//+
//+
Field[6] = Min;
Field[6].FieldsList = {4,2};
//+
//+
Background Field = 6;
Mesh.MeshSizeFromPoints = 0;
Mesh.AngleToleranceFacetOverlap = 1e-8;
//+
//+
//+
//+
Periodic Line {3} = {1} Translate {0,2*L,0} ;
