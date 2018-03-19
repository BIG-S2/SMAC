function [x] = tv_prox(y,l,im_size,iter_max,tol)
% solve the problem of total variation proximal operator
% x = argmin 1/2*||x-y||^2+l*|x|_tv
% x = argmin 1/2*||x-y||^2+|Dx| 
% x,v = argmin 1/2*||x-y||^2+|v| s.t. Dx-v=0;
% author: Leo Yu-Feng Liu
% email: yufengliu622@gmail.com
% 04/08/2017

%total number of voxels/pixels in the space;
p = prod(im_size);
dim = length(im_size);
[D,bccb] = TV_operator(im_size);% discrete tv operator;
bccb = l*bccb;
C = [l*D];
ind0 = find_ind(im_size);
C_t = C(~ind0,:);
%======================================================================
% initialize the parameters
%======================================================================
x = y;
v = zeros(sum(~ind0),1);
u = v;
for t = 1:iter_max
    x_old = x;
    %======================================================================
    % x updates using FFT
    %======================================================================
    y1 = v - u;
    y2 = zeros((dim)*p,1);
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
    fprintf('\n current function value is : %6.3e',f_val)
    rel_change = norm(x-x_old)/norm(x_old);
    if rel_change  < tol
        break
    end
end
