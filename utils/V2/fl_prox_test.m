% close all;clearvars;
l_1 = 0;
l_2 = 13;
iter_max = 500;
tol = 1e-4;
% [x] = fl_prox(g(:),l_1,l_2,im_size,iter_max,tol);
% [x] = tv_prox(g(:),l,im_size,iter_max,tol);
% imagesc(reshape(x,im_size));
% 
im_size = [20,20,20];
yt=zeros(im_size);
yt(5:15,5:15,5:15)=5;
y = yt+randn(im_size);
y = y(:);
% y = g;
% yt = f;
% im_size = [512,512];

[x] = fl_prox(y,l_1,l_2,im_size,iter_max,tol);
psnr0 = psnr(y,yt(:));
psnr1  = psnr(g_denoise_atv, yt(:));
psnr2  = psnr(g_denoise_itv, yt(:));
psnr3=psnr(x,yt(:));
% subplot(131);plot(yt(:));
% subplot(132);plot(y);
% subplot(133);plot(x);

subplot(231);imagesc(reshape(yt,im_size));title('Original'); axis image; 
subplot(233);imagesc(reshape(y,im_size));title(sprintf('Noisy image\n PSNR = %.2f',psnr0)); axis image; 
subplot(234); imagesc(reshape(g_denoise_atv, M, N)); axis image; 
title(sprintf('Anisotropic TV denoising\n PSNR = %.2f',psnr1));
subplot(235); imagesc(reshape(g_denoise_itv, M, N)); axis image; 
title(sprintf('Isotropic TV denoising\n PSNR = %.2f',psnr2));
subplot(236);imagesc(reshape(x,im_size)); axis image; 
title(sprintf('TV-L1 denoising\n PSNR = %.2f',psnr3));


