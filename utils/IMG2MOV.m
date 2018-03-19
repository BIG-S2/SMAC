% cd ..
% init
% cd movie

function mov = IMG2MOV(img)

index = (img~=0);
img_min = min(img(:));
img_max = max(img(:));
img1 = img-img_min;
img2 = img1/(img_max-img_min);
img3 = img2.*index;
img4 = im2uint8(img3);




map = colormap(fireice);
img_size = size(img);
if length(img_size)==2
    mov_size = [img_size,1,1];
else
    mov_size = [img_size(1),img_size(2),1,img_size(3)];
end
mov = reshape(img,mov_size) ;
mov = immovie(mov,map);
