function [GB, GB1] = GB_2Dk (d1, d2 , k)
% generate the agmented matrix for the circulant GTV_2Dk operator, so that
% |GB*C_circulant*x| = GTV_2Dk(x)


% Agmented matrix for standard GTV_2D operator
GB1 = GB_2D(d1,d2);

% repeating B1 for k-1 times on the diagonal
GB = kron(eye(k-1),GB1);