function [C, bccb] = TV_1D( imagesize , circulant )
% generate the discrete differencing matrix on the vector (1-D image) 
% of length imagesize.
% circulant = 1 generate the circulant matrix.
% circulant = 0 generate the non-circulant matrix.
% without specifying value of circulant, the default is 0.
if nargin ==1
    circulant = 0;
end

if circulant == 0
    C = sparse(1:imagesize-1,1:imagesize-1,1,imagesize-1,imagesize)...
        +sparse (1:imagesize-1,2:imagesize,-1,imagesize-1,imagesize);
else
    I = [2:imagesize,1];
    C = sparse(1:imagesize,1:imagesize,1,imagesize,imagesize)...
        +sparse (1:imagesize,I,-1,imagesize,imagesize);
end

bccb = C'*C;