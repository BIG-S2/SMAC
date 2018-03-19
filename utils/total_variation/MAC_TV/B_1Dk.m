function [B, B1] = B_1Dk (n,k)
% generate the agmented matrix for the circulant TV_1Dk operator, so that
% |B*C_circulant*x| = TV_1Dk(x)


% Agmented matrix for standard TV_1D operator
B1 = B_1D(n);
B = kron(eye(k-1),B1);