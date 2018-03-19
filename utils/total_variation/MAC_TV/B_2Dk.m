function [B, B1] = B_2Dk (n_row, n_col , k)
% generate the agmented matrix for the circulant TV_2Dk operator, so that
% |B*C_circulant*x| = TV_2Dk(x)


% Agmented matrix for standard TV_2D operator
B1 = B_2D(n_row,n_col);

% repeating B1 for k-1 times on the diagonal
B = kron(eye(k-1),B1);