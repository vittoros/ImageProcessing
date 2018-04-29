% Median weighted Filtering
% X -> input image
function y = median_Wfilter(X)

% Use a weighted 5x5 median filter
f = [ 0 1 1 1 0;
    1 2 2 2 1;
    1 2 4 2 1;
    1 2 2 2 1;
    0 1 1 1 0];

% Get size of input image
[xdim, ydim] = size(X);
s = size(f,1);
exp_size = floor(s/2);
sum_s = sum(s(:));

y = zeros(xdim, ydim);

% Pad image with zeros
X = [ zeros(exp_size, ydim+2*exp_size) ;
    zeros(xdim, exp_size) X zeros(xdim, exp_size) ;
    zeros(exp_size, ydim+2*exp_size) ];

% pass sXs median filter through image
med = zeros(s,s);
med2 = zeros(sum_s,1);
med_pos = ceil(s*s/2);
for i = 1 : xdim
    for j = 1 : ydim
        % part of image that will be sorted
        med = X(i : i+s-1, j : j+s-1);
        
        % apply weights
        zz = 1;
        for z1 = 1 : s
            for z2 = 1 : s
                targ = zz + f(z1,z2);
                med2(zz: targ,1) = med(z1,z2); 
                zz = targ;
            end
        end

        % sort and pick median
        med2 = sort(med2);
        y(i,j) = med2(med_pos);
    end
end

end