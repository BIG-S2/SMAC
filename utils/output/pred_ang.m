function [pred_y,accuracy,conf_mat,pred_fx] = pred_ang(b,p,k,x,y)
% prediction of classification results
[beta_vm] = beta_mat(b,p,k);
B1 = beta_vm(2:p+1,:);
B0 = beta_vm(1,:);
fx = x*B1;
for i = 1:(k-1)
    fx(:,i) = fx(:,i)+B0(i);
end
XI = XI_gen(k);
pred_fx = fx*XI;
[~,pred_y] = max(pred_fx,[],2);
accuracy = sum(pred_y==y)/length(y);

conf_mat = zeros(k,k);
for i = 1:k
    for j = 1:k
        conf_mat(i,j) = sum(pred_y(y==i)==j);
    end
end