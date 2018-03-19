b=[-1:10^-5:12];
p=size(b,2);
y=zeros(p,1);
for i=1:p
f=@(x) exp(-x)-x+b(i);
y(i)=fzero(f,[-0.0001,12.0001]);
end