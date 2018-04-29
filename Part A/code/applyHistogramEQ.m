% Read images
I1 = imread('../input/dark_road_1.jpg');
I2 = imread('../input/dark_road_2.jpg');
I3 = imread('../input/dark_road_3.jpg');

I1 = double(I1);
I2 = double(I2);
I3 = double(I3);

% calculate histogramm
I1_hist = my_hist(I1);
I2_hist = my_hist(I2);
I3_hist = my_hist(I3);


% histogram equalization
% calcualte pdfs
[x,y] = size(I1);
I1_pdf = I1_hist / (x * y);  

[x,y] = size(I2);
I2_pdf = I2_hist / (x * y);  

[x,y] = size(I3);
I3_pdf = I3_hist / (x * y);  

% calculate cdfs
x = length(I1_pdf);
I1_cdf = zeros(x,1);
I1_cdf(1,1) = I1_pdf(1,1);
for i = 2 : x
    I1_cdf(i,1) = I1_cdf(i-1,1) + I1_pdf(i,1);
end

x = length(I2_pdf);
I2_cdf = zeros(x,1);
I2_cdf(1,1) = I2_pdf(1,1);
for i = 2 : x
    I2_cdf(i,1) = I2_cdf(i-1,1) + I2_pdf(i,1);
end

x = length(I3_pdf);
I3_cdf = zeros(x,1);
I3_cdf(1,1) = I3_pdf(1,1);
for i = 2 : x
    I3_cdf(i,1) = I3_cdf(i-1,1) + I3_pdf(i,1);
end


% equalize histogram
[x,y] = size(I1);
I1_eq = zeros(x,y);

for i = 1 : x
    for j = 1 : y
        I1_eq(i,j) = floor(I1_cdf(I1(i,j)+1) * 255);
    end
end

[x,y] = size(I2);
I2_eq = zeros(x,y);

for i = 1 : x
    for j = 1 : y
        I2_eq(i,j) = floor(I2_cdf(I2(i,j)+1) * 255);
    end
end

[x,y] = size(I3);
I3_eq = zeros(x,y);

for i = 1 : x
    for j = 1 : y
        I3_eq(i,j) = floor(I3_cdf(I3(i,j)+1) * 255);
    end
end

% plot results
% 1st image
figure(1);
subplot(2,2,1);
imshow(I1, [0 255]);
title('dark\_road\_1');

subplot(2,2,2);
bar(I1_hist);
title('histogram');

subplot(2,2,3);
imshow(I1_eq, [0 255]);
title('Equalized');

I1_eq_hist = my_hist(I1_eq);
subplot(2,2,4);
bar(I1_eq_hist);
title('histogram');

% 2nd image
figure(2);
subplot(2,2,1);
imshow(I2, [0 255]);
title('dark\_road\_2');

subplot(2,2,2);
bar(I2_hist);
title('histogram');

subplot(2,2,3);
imshow(I2_eq, [0 255]);
title('Equalized');

I2_eq_hist = my_hist(I2_eq);
subplot(2,2,4);
bar(I2_eq_hist);
title('histogram');

% 3rd image
figure(3);
subplot(2,2,1);
imshow(I3, [0 255]);
title('dark\_road\_3');

subplot(2,2,2);
bar(I3_hist);
title('histogram');

subplot(2,2,3);
imshow(I3_eq, [0 255]);
title('Equalized');

I3_eq_hist = my_hist(I3_eq);
subplot(2,2,4);
bar(I3_eq_hist);
title('histogram');


