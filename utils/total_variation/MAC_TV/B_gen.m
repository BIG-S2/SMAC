function [B,bccb] = B_gen (l1,l2, d1,d2,d3,k)
p=d1*d2*d3;

if d3>1
[~,C1,C10]=TV_3Dk(d1,d2,d3,k,1);
elseif d2>1
[~,C1,C10]=TV_2Dk(d1,d2,k,1);
else 
[~,C1,C10]=TV_1Dk(d1,k,1);
end
BB = [l1*speye(p+1);l2*C10];
B = kron(eye(k-1),BB);

ctc=C1'*C1;
bccb = (1+l1^2)*speye(p)+l2^2*ctc;
