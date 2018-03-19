function [y,d] = LUM_solver(n)
% function to compute the intersection of the line and the exponential
% curve
x_max = -log(10^(-5)*n);
i = -1/n;
n_max = ceil((x_max+1/n)*10000);
y = zeros(n_max,1);
d = y;
for j = 1:n_max;
    d(j) = i;
    f=@(x) 1/n*exp(-x)-x+d(j);
    y(j)=fzero(f,[-1/n,x_max]);
    i=i+0.0001;
end



