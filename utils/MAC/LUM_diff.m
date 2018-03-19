function [ df ] = LUM_diff( u ,a , c )
% Formula of LUM
i = (u<c/(1+c));
df = -1.*i-(a./((1+c)*u-c+a).^(a+1)).*(1-i);
