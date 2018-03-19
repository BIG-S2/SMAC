function [ V ] = LUM_exp( u ,c )
% Value of LUM using exponetial apporximation when a is big
i = (u<c/(1+c));
V = (1-u).*i+1/(1+c)*exp(-(1+c)*u+c).*(1-i);
