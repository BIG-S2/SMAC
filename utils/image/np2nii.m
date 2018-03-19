function [nii] = np2nii(data, imsize)
[n,~]=size(data);
data1=data';
nii_data=reshape(data1(:),[imsize,n]);
nii=make_nii(nii_data);
