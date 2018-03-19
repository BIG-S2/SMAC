function [GB, GB1] = GB_3Dk ( d1 , d2 , d3 , k )
% generate the agmented matrix for the circulant GTV_3Dk operator, so that
% |GB*C_circulant*x| = GTV_3Dk(x)


% Agmented matrix for standard TV_3D operator
GB1 = GB_3D(d1 , d2 , d3 );

% repeating B1 for k-1 times on the diagonal
GB = kron(eye(k-1),GB1);