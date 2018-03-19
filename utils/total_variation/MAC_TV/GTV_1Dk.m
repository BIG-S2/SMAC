function [C,C1,C10] = GTV_1Dk( n , k)
% =======================================================================%
% generate the discrete differencing matrix on the vector of length n.
% include the coefficient of \beta_0 
% ready for use in the ADMM algorithm
% =======================================================================%
% C1 is one block of the differencing matrix
% C is the matrix repeating C1 for k-1 time on the diagnal ready to use for
% MAC models with k classes
% =======================================================================%
% circulant = 1 generate the circulant matrix.
% circulant = 0 generate the non-circulant matrix.
% without specifying value of circulant, the default is 0.
% =======================================================================%

C1 = GTV_1D(n);

[s1,~] = size(C1);
% including the coefficient for the intercept \beta_0
% coefficients for \beta_0 are all 0 in each row
C10 = [zeros(s1,1),C1];
% repeating C1 for k-1 times on the diagonal
C = kron(eye(k-1),C10);