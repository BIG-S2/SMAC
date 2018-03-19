function [C,bccb] = TV_operator (imagesize, flag)
% generate the discrete differencing matrix on the array of 1D-3D spaces.
% flag = 1 generate the circulant matrix.
% flag = 0 generate the non-circulant matrix.
% without specifying value of circulant, the default is 0.

if nargin <2
    flag = 1;
end

switch length(imagesize)
    case 1
        [C,bccb] = TV_1D(imagesize,flag);
    case 2
        [C,bccb] = TV_2D(imagesize(1),imagesize(2),flag);
    case 3
        [C,bccb] = TV_3D(imagesize(1),imagesize(2),imagesize(3),flag);
end
