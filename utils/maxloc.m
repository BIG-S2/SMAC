function [rn,cn] = maxloc (M) 
[rn,cn] = find(ismember(M,max(M(:))));