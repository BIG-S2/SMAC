function [B] = rec_3D(A,d1, d2, d3)
% recover a vectorized 3D image
BB = reshape(A,d2, d1,d3);
for i = 1: d3
    B(:,:,i) = BB(:,:,i)';
end