function [data_masked]= apply_mask (nii,mask)
% function to apply mask on nii data.
% input:
%           nii: an nii object. Must be 3D images.
%           mask: an nii object of 0,1. Must be same image size with nii
% output:
%           data_masked: n by q matrix. n is number of images, q is total
%           number of masked voxels.
% Author: Leo Yu-Feng Liu
% Email: yufengliu622@gmail.com
% Last update: 09/07/2017.


p = length(mask.img(:));
size_nii = size(nii.img);
if length(size_nii) == 3
    n = 1;
else
    n = size_nii(4);
end

nii_np=reshape(nii.img,p,n)';

data_masked = nii_np(:,mask.img(:)==1);
