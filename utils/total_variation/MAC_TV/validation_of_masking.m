n=10;m=20;l=30;k=3;

c1=TV_1Dk( n,k);
b=randn((n+1)*(k-1),1);
c1b=c1*b;
c1b=sum(abs(c1b(:)));
c2=TV_1Dk( n,k,1);
c2b=c2*b;
m1=B_1Dk (n , k);
c2b=m1*c2b;
c2b=sum(abs(c2b(:)));
diff1=c1b-c2b;

c1=TV_2Dk( n,m,k);
b=randn((n*m+1)*(k-1),1);
c1b=c1*b;
c1b=sum(abs(c1b(:)));
c2=TV_2Dk( n,m,k,1);
c2b=c2*b;
m2=B_2Dk (n ,m, k);
c2b=m2*c2b;
c2b=sum(abs(c2b(:)));
diff2=c1b-c2b;

c1=TV_3Dk( n,m,l,k);
b=randn((n*m*l+1)*(k-1),1);
c1b=c1*b;
c1b=sum(abs(c1b(:)));
c2=TV_3Dk( n,m,l,k,1);
c2b=c2*b;
m3=B_3Dk (n ,m,l, k);
c2b=m3*c2b;
c2b=sum(abs(c2b(:)));
diff3=c1b-c2b;