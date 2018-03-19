function [GC, BCCB] = GTV_2D( d1,d2)
% generate the 2nd order discrete differencing matrix 
% on the 2-D image of size imagesize. Circulant version.
C=TV_2D(d1,d2,1);
D = kron(eye(2),C);
GC = D*C;
BCCB = GC'*GC;