function [GB] = GB_3D (d1,d2,d3)
% generate the agmented matirx for the circulant TV_3D operator, so that
% |B*C_circulant*x| = |C*x| = TV_3d(x)
Temp = ones(d1,d2,d3);
p = d1*d2*d3;
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

B_13 = Temp;
B_13(end,:,:)=0;
B_13(:,:,end)=0;
B_131=B_13(:);
B_13 = sparse (1:p,1:p,B_131,p,p);

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

B_23 = Temp;
B_23(:,end,:)=0;
B_23(:,:,end)=0;
B_231=B_23(:);
B_23 = sparse (1:p,1:p,B_231,p,p);


B_31 = Temp;
B_31(end,:,:)=0;
B_31(:,:,end)=0;
B_311=B_31(:);
B_31 = sparse (1:p,1:p,B_311,p,p);

B_32 = Temp;
B_32(:,:,end)=0;
B_32(:,end,:)=0;
B_321=B_32(:);
B_32 = sparse (1:p,1:p,B_321,p,p);

B_33 = Temp;
B_33(:,:,end-1)=0;
B_33(:,:,end)=0;
B_331=B_33(:);
B_33 = sparse (1:p,1:p,B_331,p,p);

GB = blkdiag(B_11,B_12,B_13,B_21,B_22,B_23,B_31,B_32,B_33);
