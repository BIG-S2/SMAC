function [S] = S_tilda_gen (nobs, k)
% funtion to generate the S_tilda matix in the ADMM alg
 S = kron(ones((k-1),1),speye(nobs));