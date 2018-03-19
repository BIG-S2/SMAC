function [X_comp] = X_cal(X, k)
coder.extrinsic('sparse')
% function to convert the observation X to the X_tilda in the ADMM alg
[nrow,~ ]= size (X);  
X_0 = ones (nrow,1);
X_new = horzcat (X_0, X);
X_new = sparse(X_new);
X_comp = kron(eye(k-1),X_new);


