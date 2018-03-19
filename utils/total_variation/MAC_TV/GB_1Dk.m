function [GB, GB1] = GB_1Dk (n , k)
% generate the agmented matrix for the circulant GTV_1Dk operator, so that
% |GB*C_circulant*x| = GTV_1Dk(x)


% Agmented matrix for standard GTV_1D operator
GB1 = GB_1D(n);
GB = kron(eye(k-1),GB1);