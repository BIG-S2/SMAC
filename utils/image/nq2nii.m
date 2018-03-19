function [nii] = nq2nii(data, mask)
imsize = size(mask);
[n,~]=size(data);
data1=data';
nii_data=reshape(data1(:),[imsize,n]);
nii=make_nii(nii_data);
