function GM = GM_gen (d1,d2,d3,k,flag,index)
% This program generate the GM matrix in the algorithm in updating v_3 part.
% the variable flag indicate whether the intercept term will be
% included in the L_1 penalty
% flag = 1 mean beta_0 is included in the L_1 penalty

if ~exist('flag','var')
    flag = 1;
end
p = d1*d2*d3;

I = spdiags(index, 0, p,p);
I1 = blkdiag(flag,I);

if d3 > 1
    GB = GB_3D ( d1 , d2 , d3);
    I2 = kron(eye(9),I);
elseif d2 > 1
    GB = GB_2D( d1 , d2);
    I2 = kron(eye(4),I);
else    
    GB = GB_1D( d1);
    I2 = GB;
end;

I3 = GB.*I2;
GM = kron(eye(k-1),blkdiag(I1,I3));
