function M = M_gen(d1,d2,d3,k,flag,index)
% This program generate the M matrix in the algorithm in updating v_3 part.
% the variable flag indicate whether the intercept term will be
% included in the L_1 penalty
% flag = 1 mean beta_0 is included in the L_1 penalty
if ~exist('flag','var')
    flag = 1;
end
I = speye(d1*d2*d3);
I = blkdiag(flag,I);

if d3 > 1    
    [~,B1] = B_3Dk(d1,d2,d3,k);
    [~,C1] = TV_3Dk(d1,d2,d3,k,1);    
elseif d2 >1      
    [~,B1] = B_2Dk(d1,d2,k);
    [~,C1] = TV_2Dk(d1,d2,k,1);
else   
    [~,B1] = B_1Dk(d1,k);
    [~,C1] = TV_1Dk(d1,k,1);
end


ind = (C1*index==0);
ind = spdiags(ind,0,length(ind),length(ind));
B1  = B1.*ind;
IB1 = blkdiag(I,B1);
M   = kron(eye(k-1),IB1);