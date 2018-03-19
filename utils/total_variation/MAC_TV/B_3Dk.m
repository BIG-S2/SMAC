function [B, B1] = B_3Dk ( d1 , d2 , d3 , k )
% generate the agmented matrix for the circulant TV_3Dk operator, so that
% |B*C_circulant*x| = TV_3Dk(x)


% Agmented matrix for standard TV_3D operator
B1 = B_3D(d1 , d2 , d3 );

% repeating B1 for k-1 times on the diagonal
B = kron(eye(k-1),B1);