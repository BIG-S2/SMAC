function [B] = vet_2D(A)
% vectorize a 2D image
% the output is a row vector of the image
B = reshape(A',size(A(:)));
B = B' ;