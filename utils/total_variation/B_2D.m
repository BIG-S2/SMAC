function [B] = B_2D (d1 , d2)
% generate the agmented matirx for the circulant TV_2D operator, so that
% |B*C_circulant*x| = |C*x| = TV_2d(x)
p = d1 * d2;
B_1 = sparse (1:d1-1, 1:d1-1, 1, d1, d1);
B_1 = kron(speye(d2),B_1);
B_2 = sparse (1:d1*(d2-1),1:d1*(d2-1), 1, p,p);
B = blkdiag(B_1,B_2);