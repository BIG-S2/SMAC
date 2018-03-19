d=[-1:0.0001:10];
y=zeros(110001,1);
for i = 1:110001
f=@(x) exp(-x)-x+d(i);
y(i)=fzero(f,[-0.01,10.01]);
end