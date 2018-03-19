function [GB] = GB_2D (d1 , d2)
% generate the agmented matirx for the circulant TGV_2D operator, so that
% |GB*C_circulant*x| = |C*x| = TGV_2d(x)

Temp = ones(d1,d2);
p = d1*d2;

B_11 = Temp;
B_11(end,:,:)=0;
B_11(end-1,:,:)=0;
B_111=B_11(:);
B_11 = sparse (1:p,1:p,B_111,p,p);

B_12 = Temp;
B_12(end,:,:)=0;
B_12(:,end,:)=0;
B_121=B_12(:);
B_12 = sparse (1:p,1:p,B_121,p,p);

B_21 = Temp;
B_21(end,:,:)=0;
B_21(:,end,:)=0;
B_211=B_21(:);
B_21 = sparse (1:p,1:p,B_211,p,p);

B_22 = Temp;
B_22(:,end-1,:)=0;
B_22(:,end,:)=0;
B_221=B_22(:);
B_22 = sparse (1:p,1:p,B_221,p,p);

GB = blkdiag(B_11,B_12,B_21,B_22);