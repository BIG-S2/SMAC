function [B] = B_1D (n)
% generate the agmented matirx for the circulant TV_1D operator, so that
% |B*C_circulant*x| = |C*x| = TV_1d(x)

B = sparse (1:n-1, 1:n-1, 1, n, n );