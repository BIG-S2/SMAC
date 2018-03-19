function [B] = rec_2D(A,n_row, n_col)
% recover a vectorized 2D image
B = reshape(A,n_col, n_row);
B = B' ;