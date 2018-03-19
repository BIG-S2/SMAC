function [v] = invAb (A,b, im_size)
% Compute A^-1 * b when A is a BCCB matrix.
a1 = full(A(:,1));
if length(im_size)>1
    b = reshape(b,im_size);
    a1 = reshape(a1,im_size);
end

v = ifftn(fftn(b)./fftn(a1)); % Using FFT and iFFT to compute A^-1 * b 
v = v(:);
end