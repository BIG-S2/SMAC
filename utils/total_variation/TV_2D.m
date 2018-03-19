function [C, bccb] = TV_2D (d1,d2,circulant)
% generate the discrete differencing matrix on the array of d1 rows and d2 columns.
% circulant = 1 generate the circulant matrix.
% circulant = 0 generate the non-circulant matrix.
% without specifying value of circulant, the default is 0.

if nargin == 2
    circulant = 0;
end

I_row = speye(d2);
I_col = speye(d1);

C_1 = kron (I_row, TV_1D(d1,circulant));
C_2 = kron (TV_1D(d2,circulant), I_col);
C = [C_1; C_2];
bccb = C_1'*C_1 + C_2'*C_2;