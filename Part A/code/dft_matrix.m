% 2-D DFT through array mult
function y = dft_matrix(X)

% Get dimensions of input(=output) image
[xdim, ydim, zdim] = size(X);
y = zeros(xdim, ydim, zdim);

w1 = exp(-2*pi*1i/xdim);
W1 = zeros(xdim, xdim);
for i = 1 : xdim
    for j = 1 : xdim
        W1(i,j) = w1^((i-1)*(j-1));
    end
end

w2 = exp(-2*pi*1i/ydim);
W2 = zeros(ydim, ydim);
for i = 1 : ydim
    for j = 1 : ydim
        W2(i,j) = w2^((i-1)*(j-1));
    end
end

for i = 1 : zdim
    y(:,:,i) = W1 * X(:,:,i) * W2;
end

end