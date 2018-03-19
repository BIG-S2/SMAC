function [beta, beta0] = betai_mat (b,nrow,ncol,k)
% convert beta vector to matrix so that every entry are associated with the
% original image.
p = nrow*ncol;
beta_vm = beta_mat(b,p,k);
beta0 = zeros(1,(k-1));
beta = zeros(nrow,ncol,k-1);
for i = 1 : (k-1)
    beta0(1,i) = beta_vm(1,i);    
    beta (:,:,i) = rec_2D (beta_vm(2:p+1,i),nrow,ncol);
end