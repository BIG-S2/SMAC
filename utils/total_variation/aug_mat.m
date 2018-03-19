function [A_rec,A_sub] = aug_mat (index,k)
coder.extrinsic('sparse')
% generate the matrix A_rec, s.t. A_rec*b_sub = b_org
% convert the short sub-seq of b to the orginal length.

% generate the matrix A_sub, s.t. A_sub*b_org = b_sub
% get the sub-seq from b according to the index.
A = sparse(find(index),1:sum(index),1,length(index),sum(index));
AA = A';
A = blkdiag(1,A);
AA = blkdiag(1,AA);
A_rec = kron(eye(k-1),A);
A_sub = kron(ones(k-1,1),AA);