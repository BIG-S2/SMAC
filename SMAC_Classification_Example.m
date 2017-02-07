%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%=============SMAC with Cross Validation and ROC analysis pipeline=============%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clearvars;clc;close all;

%% Load the image data file.
load SIM1_FLAC.mat

%% Assign the class label accordingly.
Y = [ones(30,1);ones(30,1)*2]; % Class labels must be from 1 to K.

%% Assign the training, tuning and testing data set.
data.train_x = SIM1.train; % train images, n by p
data.train_y = Y; % train labels, n by 1
data.tune_x = SIM1.tune; % tune images, n by p
data.tune_y = Y; % tune labels, n by 1
data.test_x = SIM1.test; % test images, n by p
data.test_y =  [ones(300,1);ones(300,1)*2]; % test labels, n by 1

%% Assign the index vector.
% You can simply vectorize your mask matrix to get this. For a full image
% without masking, please use all ones, or skip this step, the program will
% give a default value for this.
data.index = ones(4000,1); 

%% Assign the image size.
imagesize = [20,20,10];  

%% Assign the options for the algorithm.
% You can skip this step, all the options will have a default values.
options.itmax=1000;  % Max iteration, default is 500.
options.rho=1; % Lagrangian parameter, default is 1.
options.l1flag =0; % Indicator of penalizing intercept. Default is 0.
options.tol=5E-4; % Tolerance for the convergence of the algorithm. Default is 10E-4.
options.progress = false; % Display the tuning progress. Default is false.
options.lambda1 = 2.^[-5:2:5]; % Penalty level for L1. Default is 8.^(-3:3);
options.lambda2 = 2.^[-5:2:5]; % Penalty level for TV. Default is 8.^(-3:3);

%% The beginning of the program

%======================Do Not Edit======================%
% Do not edit the following part, unless you really understand the code.
run('init.m') % add the full path of the package

[out1] = SMAC_I (data,imagesize,options); % run the classification with TV-I penalty

[out2] = SMAC_II (data,imagesize,options); % run the classification with TV-II penalty

%% Plot the tuning accuracy
figure; Tuning_Matrix_Plot(out1.tune_acc, 'SMAC-I') % Plot the tuning accuracy
figure; Tuning_Matrix_Plot(out2.tune_acc, 'SMAC-II')

%% Plot the coefficient images for the optimal model
k = length(unique(data.train_y));
for iii = 1:k-1
    eval( sprintf('view_nii(make_nii(-out1.coef_%d));',iii));
    colormap(fireice);
end

for iii = 1:k-1
    eval( sprintf('view_nii(make_nii(-out2.coef_%d));',iii));
    colormap(fireice);
end


%% Plot the ROC curves and compute the AUC
[AUC1] = ROC_analysis(data.test_y,data.test_x*out1.coef_1(:),1,'SMAC-I');
[AUC2] = ROC_analysis(data.test_y,data.test_x*out2.coef_1(:),1,'SMAC-II');


%====================================================%