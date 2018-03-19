function [ df ] = LUM_exp_diff( u ,c )
% Derivative of LUM_exp
i = (u<c/(1+c));
df = -1.*i-exp(-(1+c)*u+c).*(1-i);
