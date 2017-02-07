clear all;
run ('init.m')
MSPE = zeros(50,5);
alpha = MSPE;
SSE = MSPE;
for sn = 1:5
    for t = 1:50
        rng(t)
        data.train_x = randn(100,32^2);
        rng(t)
        data.tune_x = randn(100,32^2);
        rng(t)
        data.test_x = randn(10000,32^2);
        beta = zeros(32,32);
        switch sn
            case 1
                beta(8:8+6,8:8+18) = 1;
                beta(8:8+18, 14:14+6) = 1;
            case 2
                beta = checkerboard(16,1,1)>0;
            case 3
                for  i =  1:32
                    for j =1:32
                        if (i-16.5)^2+(j-16.5)^2<64
                            beta(i,j)=1;
                        end
                    end
                end
            case 4
                for  i =  1:32
                    for j =1:32
                        if (i-16.5)^2+(j-16.5)^2<64
                            beta(i,j)=sqrt(64-(i-16.5)^2-(j-16.5)^2);
                        end
                    end
                end
            case 5
                c1 = [6,16.5,27,6,27];
                c2 = [6,16.5,27,27,6];
                
                for k =1:5
                    for  i =  1:32
                        for j =1:32
                            beta(i,j)=beta(i,j)+exp((-(i-c1(k))^2-(j-c2(k))^2)/15);
                        end
                    end
                end
        end
        
        %figure; imagesc(beta) ;
        b= beta(:);
        
        data.train_y = 20+data.train_x*b+randn(100,1);
        data.tune_y = 20+data.tune_x*b+randn(100,1);
        data.test_y = 20+data.test_x*b+randn(10000,1);
        
        imagesize = [32,32];
        
        
        options.itmax=1500;
        options.rho=1;
        options.l1flag =0;
        options.tol=5e-3;
        options.progress = false;
        
        options.lambda1=2.^[-Inf,-14:6:5];
        options.lambda2=2.^[-Inf,-14:6:5];
        
        
        [out] = SREG_II (data,imagesize,options);
        %figure;imagesc(out.coef);
        %figure;imagesc(out.MSPE_tune);
        MSPE(t,sn)= out.MSPE_test;
        alpha(t,sn) = out.b(1)-20;
        SSE(t,sn)=sum((out.b-[20;b]).^2);
        disp(t)
    end
end
figure
boxplot(alpha+20,'Labels',{'Sinario 1','Sinario 2','Sinario 3','Sinario 4','Sinario 5'})
title('Compare the Estimation of \alpha')

figure
boxplot(log10(MSPE),'Labels',{'Sinario 1','Sinario 2','Sinario 3','Sinario 4','Sinario 5'})
title('Compare the Mean Square Prediction Error (log 10 scale)')

figure
boxplot(log10(SSE),'Labels',{'Sinario 1','Sinario 2','Sinario 3','Sinario 4','Sinario 5'})
title('Compare the Sum of Square Estimation Error (log 10 scale)')


%
%
% %%%%%%%%%%%%%%%%%%% using GLMNET %%%%%%%%%%%%%
% addpath('C:\Users\LYF\Desktop\glmnet')
%
% clearvars options
% alpha = 0:0.1:1;
% lambda = 2.^[-Inf,-14:2:5];
% MSPE = zeros(11,11);
%
% for i =1:11
%     for j = 1:11
%         options.alpha = alpha (i);
%         options.lambda = lambda (j);
%
%         glmfit = glmnet (data.train_x, data.train_y,'gaussian',options);
%         tune_py = glmnetPredict(glmfit, data.tune_x);
%         MSPE(i,j) = mean((tune_py-data.tune_y).^2);
%     end
% end
% [i,j] = find(MSPE == min(MSPE(:)));
% options.alpha = alpha (i);
% options.lambda = options.lambda(j);
%
% glmfit = glmnet (data.train_x, data.train_y,'gaussian',options);
% test_py = glmnetPredict(glmfit, data.test_x);
% MSPE_test = mean((test_py-data.test_y).^2);
% figure;imagesc(reshape(glmfit.beta,imagesize))