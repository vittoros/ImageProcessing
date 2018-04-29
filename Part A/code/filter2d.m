function y = filter2d(X,I)

% Get dimensions of input(=output) image
[xdim1, ydim1, zdim1] = size(X);
y = zeros(xdim1, ydim1, zdim1);

% Get dimensions of mask
[xdim2, ydim2, zdim2] = size(I);

% Expand image to size of xdim1+2*xdim2, ydim1+2*ydim2, zdim1
% (only xdim1+xdim2-1, ydim1+ydim2-1, zdim1 are needed)
% and keep xdim1, ydim1, zdim1 central pixels after correlation
cor = [repmat(X(:,1,:),1,xdim2) X repmat(X(:,ydim1,:),1,xdim2)];
cor = [ repmat(cor(1,:,:),ydim2,1) ; cor ; repmat(cor(xdim1,:,:),ydim2,1)];
[xdim3, ydim3, zdim3] = size(cor);
cor2 = zeros(xdim3, ydim3, zdim3);

% do correlation
for color = 1 : zdim1
for z = 1 : zdim2
    for i = 1 : xdim3 - xdim2 + 1
        for j = 1 : ydim3 - ydim2 + 1
            cor2(i,j,:) = cor2(i,j,:) + sum(sum(cor(i:i+xdim2-1, j:j+ydim2-1,color) .* I(:,:,z)));
        end
    end
end
end

y = cor2(xdim2 : xdim1+xdim2-1, ydim2 : ydim1+ydim2-1, :);

end