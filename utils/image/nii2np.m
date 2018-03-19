function [data]= nii2np (nii,p,n)
data=reshape(nii.img,p,n)';