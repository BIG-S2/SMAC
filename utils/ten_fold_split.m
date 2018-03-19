function [fold_index,test_index] = ten_fold_split(n)
index = randperm(n)';
fold_size = floor(floor(n)/10);
fold_index = zeros(fold_size,10);
fold_index(:,1) = index(1:fold_size);
for i = 2:10
    index (1:fold_size)= [];
    fold_index(:,i) = index(1:fold_size);
end

index (1:fold_size)= [];

test_index = index;



