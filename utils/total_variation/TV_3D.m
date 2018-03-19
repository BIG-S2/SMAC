function [C,bccb] = TV_3D ( d1 , d2 , d3 , circulant)
% generate the discrete differencing matrix on the array of in 3-D spaces.
% circulant = 1 generate the circulant matrix.
% circulant = 0 generate the non-circulant matrix.
% without specifying value of circulant, the default is 0.

if nargin == 3
    circulant = 0;
end

C_1 = kron (speye(d2*d3), TV_1D(d1,circulant));
C_2 = kron (TV_1D(d2,circulant), speye(d1));
C_2 = kron (speye(d3),C_2);
C_3 = kron (TV_1D(d3,circulant),speye(d1*d2));
C = [C_1; C_2; C_3];
bccb = C_1'*C_1 + C_2'*C_2 + C_3'*C_3;
