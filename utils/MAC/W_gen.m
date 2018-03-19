function [W] =W_gen (y,k)
coder.extrinsic('sparse')
% function for generation W matirix as needed in the algorithm
[Y_matrix] = Y_matrix_gen(y,k );
n = length(y);
row = repmat(1:n,1,k-1);
col = 1:n*(k-1);
W = sparse(row,col,Y_matrix(:));
 