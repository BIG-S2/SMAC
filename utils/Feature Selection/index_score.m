function [index_new] = index_score(index,imsize,ub, lb)
% This is a function to compute a index score of each feature in the image,
% according to the neighborhood information.
index = reshape(index,imsize);
index_new.score = zeros(imsize);
if length (imsize)==2
    for ii = 2:imsize(1)-1
        for jj = 2:imsize(2)-1
            index_new.score(ii,jj)=index(ii+1,jj)+index(ii-1,jj)+...
                index(ii-1,jj-1)+index(ii,jj-1)+index(ii+1,jj-1)+...
                index(ii-1,jj+1)+index(ii,jj+1)+index(ii+1,jj+1);
        end
    end
end
if length (imsize)==3
    for ii = 2:imsize(1)-1
        for jj = 2:imsize(2)-1
            for kk = 2:imsize(3)-1
                index_new.score(ii,jj,kk)=index(ii+1,jj,kk)+index(ii-1,jj,kk)+...
                    index(ii-1,jj-1,kk)+index(ii,jj-1,kk)+index(ii+1,jj-1,kk)+...
                    index(ii-1,jj+1,kk)+index(ii,jj+1,kk)+index(ii+1,jj+1,kk)+...
                    index(ii+1,jj,kk+1)+index(ii,jj,kk+1)+index(ii-1,jj,kk+1)+...
                    index(ii-1,jj-1,kk+1)+index(ii,jj-1,kk+1)+index(ii+1,jj-1,kk+1)+...
                    index(ii-1,jj+1,kk+1)+index(ii,jj+1,kk+1)+index(ii+1,jj+1,kk+1)+...
                    index(ii+1,jj,kk-1)+index(ii,jj,kk-1)+index(ii-1,jj,kk-1)+...
                    index(ii-1,jj-1,kk-1)+index(ii,jj-1,kk-1)+index(ii+1,jj-1,kk-1)+...
                    index(ii-1,jj+1,kk-1)+index(ii,jj+1,kk-1)+index(ii+1,jj+1,kk-1);
            end
        end
    end
end
index_new.score = index_new.score(:); 
index_new.selection = index(:).*(index_new.score>lb)+(index_new.score>ub);
index_new.selection = index_new.selection>0;