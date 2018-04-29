% Calculate histogram of image X
% pixels of X -> integers 0 - 255
function y = my_hist(X)

% Get dimensions of input image
[xdim, ydim] = size(X);

y = zeros(256,1);
for i = 1 : xdim
    for j = 1 : ydim
        k = X(i,j) + 1;
        y(k,1) = y(k,1) + 1;
    end
end

end