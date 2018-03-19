function [x] = fl_prox(y,l_1,l_2,im_size,iter_max,tol)
% solve the problem of fused Lasso proximal operator
% x = argmin 1/2*||x-y||^2+l_1*|x|+l_2*|x|_tv
% x = argmin 1/2*||x-y||^2+|Dx| 
% x,v = argmin 1/2*||x-y||^2+|v| s.t. Dx-v=0;
% author: Leo Yu-Feng Liu
% email: yufengliu622@gmail.com
% 04/08/2017

%total number of voxels/pixels in the space;
p = prod(im_size);
dim = length(im_size);
[D,bccb] = TV_operator(im_size);% discrete tv operator;
bccb = (1+l_1^2)*speye(p)+l_2^2*bccb;
C = [l_1*speye(p);l_2*D];
ind0 = find_ind(im_size);
ind0 = [false(p,1);ind0];
C_t = C(~ind0,:);
%======================================================================
% initialize the parameters
%======================================================================
x = y;
v = zeros(sum(~ind0),1);
u = v;
for iter = 1:iter_max
    x_old = x;
    %======================================================================
    % x updates using FFT
    %======================================================================
    y1 = v - u;
    y2 = zeros((1+dim)*p,1);
    y2(~ind0) = y1;
    y2(ind0) = C(ind0,:)*x;
    x = invAb (bccb,y+C'*y2,im_size);
    %======================================================================
    % v updates using soft thresholding
    %======================================================================
    v = wthresh(C_t*x+u,'s', 1);
    %======================================================================
    % dual updates
    %======================================================================
    u = u+(C_t*x-v);
    %======================================================================
    % check tolarence
    %======================================================================
    f_val = 0.5*norm(x-y)^2+norm(C_t*x);
    fprintf('\n Iteration %.d: f_val : %6.3e',iter,f_val)
    rel_change = norm(x-x_old)/norm(x_old);
    if rel_change  < tol
        fprintf('Convergence achieved!')
        break
    end
end
