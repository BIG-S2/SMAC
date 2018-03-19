function [GB] = GB_1D (n)
% generate the agmented matirx for the circulant TV_1D operator, so that
% |GB*GC_circulant*x| = |GC*x| = TGV_1d(x)

GB = sparse (1:n-2, 1:n-2, 1, n, n );