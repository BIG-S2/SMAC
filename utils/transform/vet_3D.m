function [B] = vet_3D(A)
% vectorize a 3D image
% the output is a row vector of the image
[d1,d2,d3] = size(A);
for i = 1 : d3
    AA(:,:,i) = A(:,:,i)';
end
B = reshape(AA,size(A(:)));
B = B' ;