function [nii] = un_mask(data, mask)
% function to un mask data. Convert covariates matrix back to image object
% input:
%           data: an n by q matrix. 
%           mask: an nii object of 0,1. 
% output:
%           nii: nii object. containing the recovered images.
% Author: Leo Yu-Feng Liu
% Email: yufengliu622@gmail.com
% Last update: 09/07/2017.
nii = nq2nii(data, mask.img);