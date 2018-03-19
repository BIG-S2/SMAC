function [soft_th] = soft(t,tau)
% the soft-thresholding function
soft_th = sign(t).*max(0,abs(t)-tau);