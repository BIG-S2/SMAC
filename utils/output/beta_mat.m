function [beta_vm] = beta_mat(b,p,k)
% convert the big vector of betas in the beta matrix
beta_vm = reshape(b,p+1,k-1);