function [GC, BCCB] = GTV_1D( d1)
% generate the 2nd order discrete differencing matrix 
% on the vector (1-D image) of length imagesize.
C=TV_1D(d1,1);
D = C;
GC = D*C;
BCCB = GC'*GC;