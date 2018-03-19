function [GC, BCCB] = GTV_3D(d1,d2,d3)
% generate the 2nd order discrete differencing matrix 
% on the 3-D image of size imagesize. circulant version.
C=TV_3D(d1,d2,d3,1);
D = kron(eye(3),C);
GC = D*C;
BCCB = GC'*GC;