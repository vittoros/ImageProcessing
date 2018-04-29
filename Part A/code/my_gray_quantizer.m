% Quantizer of gray image
function y = my_gray_quantizer(X,L)

% Get dimensions of input(=output) image
[xdim, ydim] = size(X);
y = zeros(xdim, ydim);

mx = max(max(X(:,:)));
mn = min(min(X(:,:)));

step = (mx-mn)/L;
y(:,:) = X(:,:) - mn;
y(:,:) = floor(y(:,:)/step) + 1;

y(:,:) = y(:,:) * step - step/2;

end