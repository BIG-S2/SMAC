function [ V ] = LUM( u ,a , c )
% Formula of LUM
i = (u<c/(1+c));
V = (1-u).*i+1/(1+c)*(a./((1+c)*u-c+a).^a).*(1-i);


