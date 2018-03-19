function [XI] = XI_gen(k)
% function to generate the k vectors in the k-1 dimensional space.

XI = ones(k-1,k)/sqrt(k-1);
for i = 1:k-1
    for j = 2 : k
        XI(i,j) = -(1+sqrt(k))/((k-1)^(1.5));
    end
end
for ii = 2 : k
    XI(ii-1,ii) = XI(ii-1,ii)+sqrt(k/(k-1));
end