function [B] = rep_mat (n,A)
% Create a diagnal blcok matrix with n blocks of A


B = zeros([size(A) n n]);
B(:,:,1:n+1:n^2) = repmat(A, [1 1 n]);
B = permute(B, [1 3 2 4]);
B = reshape(B, n*size(A));