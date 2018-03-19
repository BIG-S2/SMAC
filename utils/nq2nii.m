function [nii] = nq2nii(data, mask)
imsize = size(mask);
[n,~]=size(data);

A = sparse(find(mask(:)),1:sum(mask(:)),1,length(mask(:)),sum(mask(:)));
data_full = data*A';
data_full=data_full';
nii_data=reshape(data_full(:),[imsize,n]);
nii=make_nii(nii_data);
