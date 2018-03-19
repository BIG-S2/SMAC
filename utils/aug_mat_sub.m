function [A_aug_sub] = aug_mat_sub (index,k)
% generate the matrix A, s.t. A*b_org = b_sub
% get the sub-seq from b according to the index. 
col = find(index);
row = 1:sum(index);
A = sparse(row,col,1,sum(index),length(index));
A = blkdiag(1,A);
A_aug_sub = kron(eye(k-1),A);