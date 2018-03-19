function ind = find_ind(imagesize)
%% find the extra index in the circulant matrix

switch length(imagesize)
    case 1
        grad_x = zeros(imagesize);
        grad_x(end) = 1;
        ind = grad_x(:);
    case 2
        grad_x = zeros(imagesize);
        grad_x(end,:) = 1;
        grad_y = zeros(imagesize);
        grad_y(:,end) = 1;
        ind = [grad_x(:);grad_y(:)];
    case 3
        grad_x = zeros(imagesize);
        grad_x(end,:,:) = 1;
        grad_y = zeros(imagesize);
        grad_y(:,end,:) = 1;
        grad_z = zeros(imagesize);
        grad_z(:,:,end) = 1;
        ind = [grad_x(:);grad_y(:);grad_z(:)];
end
ind = logical(ind);