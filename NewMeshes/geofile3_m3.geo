Lfm = 1e-3;
LfM = 2.5e-1;
Lfw = 10e-2;
dxb = 2;
L   = 8;
//+
Merge "geofile3.txt";
//+
//+
Curve Loop(1) = {1, 2, 3, 4, 5, 6, 7};
Curve Loop(2) = {17, 16, 15, 14, 13, 12, 11};
Curve Loop(11) = {1, -122, 11, 111};
Curve Loop(12) = {2, -133, 12, 122};
Curve Loop(13) = {3, -144, 13, 133};
Curve Loop(14) = {4, -155, 14, 144};
Curve Loop(15) = {5, -166, 15, 155};
Curve Loop(16) = {6, -177, 16, 166};
Curve Loop(17) = {7, -111, 17, 177};
//+
//+
Plane Surface(100) = {1};
Plane Surface(200) = {2};
Plane Surface(12) = {11};
Plane Surface(23) = {12};
Plane Surface(34) = {13};
Plane Surface(45) = {14};
Plane Surface(56) = {15};
Plane Surface(67) = {16};
Plane Surface(71) = {17};
//+
//+
Physical Line(111) = {166};
//+
//+
Physical Surface(222) = {12};
Physical Surface(333) = {23};
Physical Surface(444) = {34};
Physical Surface(555) = {45,71};
Physical Surface(666) = {56,67};
Physical Surface(100) = {100};
Physical Surface(200) = {200};
//+
//+
Surface Loop(1) = {100,200,12,23,34,45,56,67,71};
//+
Volume(1) = {1};
//+
Physical Volume(1) = {1};
//+
Field[1] = Distance; 
Field[1].PointsList = {6,16};
Field[1].CurvesList = {166};
//+
Field[2] = Threshold;
Field[2].InField = 1;
Field[2].LcMin = Lfm;
Field[2].LcMax = LfM;
Field[2].DistMin = Lfm*3;
Field[2].DistMax = LfM*4;
//+
Field[3] = Distance; 
Field[3].PointsList = {6,16,7,17,5,15};
Field[3].CurvesList = {166,5,6,15,16,177,155};
Field[3].SurfacesList = {56,67};
//+
Field[4] = Threshold;
Field[4].InField = 3;
Field[4].LcMin = Lfw;
Field[4].LcMax = LfM;
Field[4].DistMin = Lfw*2; 
Field[4].DistMax = LfM*4;
//+
Field[6] = Min;
Field[6].FieldsList = {4,2};
//+
Background Field = 6;
Mesh.MeshSizeFromPoints = 0;
Mesh.AngleToleranceFacetOverlap = 1e-8;
Periodic Surface {34} = {12} Translate {0,2*L,0} ;

