function [WY_tilda] = diag_Wy(y_train,k)
% funtion to generate the WY_tilda matix in the ADMM alg

wy = Y_matrix_gen(y_train,k);
wy = wy(:);
n = length(wy);
WY_tilda = spdiags(wy(:),0,n,n);