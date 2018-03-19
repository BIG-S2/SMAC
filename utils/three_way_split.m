function [index1,index2,index3] = three_way_split(n)
index0 = randperm(n)';
index1 = index0(1:floor(n/2));
index2 = index0(floor(n/2)+(1:floor(n/4)));
index3 = index0((floor(n/2)+floor(n/4)+1):n);