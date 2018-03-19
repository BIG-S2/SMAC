function [Y_matrix] = Y_matrix_gen(train_y,k )
% function to convert oringinal Y vector to the k-1 dimenstional space
nobs = length(train_y);

Y_matrix = zeros(nobs,k-1);

XI = transpose(XI_gen(k));

for j = 1:nobs
    Y_matrix(j,:) = XI(train_y(j),:);
end
