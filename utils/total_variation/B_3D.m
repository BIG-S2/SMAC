function [B] = B_3D (d1,d2,d3)
% generate the agmented matirx for the circulant TV_3D operator, so that
% |B*C_circulant*x| = |C*x| = TV_3d(x)
p = d1 * d2 * d3;
B_1 = sparse (1:d1-1, 1:d1-1, 1, d1, d1 );
B_1 = kron (speye(d2*d3),B_1);
B_2 = sparse (1:d1*(d2-1),1:d1*(d2-1), 1, d1*d2,d1*d2);
B_2 = kron (speye(d3),B_2);
B_3 = sparse (1:d1*d2*(d3-1),1:d1*d2*(d3-1), 1, p,p);
B = blkdiag(B_1,B_2,B_3);