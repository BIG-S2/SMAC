function [GB,bccb] = GB_gen (l1,l2, d1,d2,d3,k)
p=d1*d2*d3;

if d3>1
    [~,C1,C10]=GTV_3Dk(d1,d2,d3,k);
elseif d2 > 1
    [~,C1,C10]=GTV_2Dk(d1,d2,k);
else
    [~,C1,C10]=GTV_1Dk(d1,k);
end
BB = [l1*speye(p+1);l2*C10];
GB = kron(eye(k-1),BB);

ctc=C1'*C1;
bccb = (1+l1^2)*speye(p)+l2^2*ctc;
