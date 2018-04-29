% Calculate PSNRdb of images
% X -> original image
% Y -> disrupted image
function y = my_psnr(X, Y)

% Get dimensions of input(=output) image
[xdim, ydim, zdim] = size(X);
y = zeros(xdim, ydim, zdim);

MSE = (X - Y) .^ 2;
MSE = sum(MSE(:)) / (xdim*ydim*zdim);

MAX = 255;

y = 10 * log10( MAX^2 / MSE);

end