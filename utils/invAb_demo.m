d1=42;d2=41;d3=13;
c=TV_1D(d1,1);
A=c'*c+speye(d1*d2*d3);
b=randn(d1*d2*d3,1);
imagesize=d1;
x1=A\b;
x2=invAb_beta (A,b, imagesize);
diff = max(abs(x1-x2))


C=TV_3D(d1,d2,d3,1);
D = kron(eye(3),C);
TGV = D*C;
BCCB = TGV'*TGV;
% imagesc(BCCB)
A = BCCB+speye(size(BCCB,1));
b=randn(d1*d2*d3,1);
imagesize=[d1,d2,d3];

tic;
x1=A\b;
toc;
tic;
x2=invAb (A,b, imagesize);
toc;
diff = max(abs(x1-x2))