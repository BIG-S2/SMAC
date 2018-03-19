function [index_exp, index_3d] = expindex (index, imsize)
index = reshape(index, imsize(1),imsize(2),imsize(3));
index (:,:,1) = 0;
index (:,:,imsize(3)) = 0;
index (:,1,:) = 0;
index (:,imsize(2),:) = 0;
index (1,:,:) = 0;
index (imsize(1),:,:) = 0;
index_3d = index;
for i=2:(imsize(1)-1)
    for j = 2:(imsize(2)-1)
        for k = 2:(imsize(3)-1)
            if index(i,j,k)==1
                
%                 index_3d(i,j,k+1)=1;
%                 index_3d(i,j+1,k+1)=1;
%                 index_3d(i,j-1,k+1)=1;
%                 index_3d(i+1,j+1,k+1)=1;
%                 index_3d(i+1,j,k+1)=1;
%                 index_3d(i+1,j-1,k+1)=1;
%                 index_3d(i-1,j+1,k+1)=1;
%                 index_3d(i-1,j,k+1)=1;
%                 index_3d(i-1,j-1,k+1)=1;
                
                index_3d(i,j+1,k)=1;
                index_3d(i,j-1,k)=1;
                index_3d(i+1,j-1,k)=1;
                index_3d(i+1,j,k)=1;
                index_3d(i+1,j+1,k)=1;
                index_3d(i-1,j-1,k)=1;
                index_3d(i-1,j,k)=1;
                index_3d(i-1,j+1,k)=1;
%                 
%                 index_3d(i,j,k-1)=1;
%                 index_3d(i,j+1,k-1)=1;
%                 index_3d(i,j-1,k-1)=1;
%                 index_3d(i+1,j+1,k-1)=1;
%                 index_3d(i+1,j,k-1)=1;
%                 index_3d(i+1,j-1,k-1)=1;
%                 index_3d(i-1,j+1,k-1)=1;
%                 index_3d(i-1,j,k-1)=1;
%                 index_3d(i-1,j-1,k-1)=1;
            end
        end
    end
end
index_exp = index_3d(:);
