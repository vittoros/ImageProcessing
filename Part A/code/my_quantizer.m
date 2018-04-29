% Quantizer of colored image
function y = my_quantizer(X,l1,l2,l3)

% Get dimensions of input(=output) image
[xdim, ydim, zdim] = size(X);
y = zeros(xdim, ydim, zdim);

L = [l1 l2 l3]';
step = zeros(3,1);
% quantizer of 1st level
for i = 1 : 3
    mx = max(max(X(:,:,i)));
    mn = min(min(X(:,:,i)));

    step(i) = (mx-mn)/L(i);
    y(:,:,i) = X(:,:,i) - mn;
    y(:,:,i) = floor(y(:,:,i)/step(i)) + 1;
    
    y(:,:,i) = y(:,:,i) * step(i) - step(i)/2;
end


end