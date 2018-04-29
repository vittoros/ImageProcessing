% X -> input image
% k -> size of kernel(k x k) 
function y = local_histeq(X,k)

% Get dimensions of input image
[xdim,ydim] = size(X);

% expand borders (mirrored)
exp_size = floor(k/2);
X = expand_bord(X, exp_size);

tar = ceil(k/2);
window = zeros(k,k);
y = zeros(xdim,ydim);
for i = 1 : xdim
    for j = 1 : ydim
        window = X(i:i+k-1, j:j+k-1);
        
        % calcualte cdf
        hist = my_hist(window);
        pdf = hist / (k * k);  
        
        len = length(pdf);
        for z = 2 : len
            pdf(z,1) = pdf(z-1,1) + pdf(z,1);
        end
        
        y(i,j) = floor((pdf(window(tar,tar) + 1)) * 255);
    end
end

end