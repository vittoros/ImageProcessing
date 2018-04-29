% X -> input image
% k -> number of pixels to be expanded on each side
function y = expand_bord(X,k)

% Get dimensions of input image
[x,y] = size(X);

y = [ fliplr(X(:,1:k)) X fliplr(X(:,y-k+1:y))];
y = [ flipud(y(1:k,:)) ; y ; flipud(y(x-k+1:x,:))];

end