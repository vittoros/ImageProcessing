% Read images with impulsive noise
I1 = imread('../input/building.jpg');
I2 = imread('../input/train.jpg');

I1 = double(I1);
I2 = double(I2);

% filter with 3x3 and 5x5 median filters
I1_med3 = median_filter(I1, 3);
I1_med5 = median_filter(I1, 5);

I2_med3 = median_filter(I2, 3);
I2_med5 = median_filter(I2, 5);

% plot results
figure(1);
subplot(1,2,1);
imshow(I1, [0 255]);
title('Original with impulsive noise');

subplot(1,2,2);
imshow(I2, [0 255]);
title('Original with impulsive noise');

figure(2);
subplot(1,2,1);
imshow(I1_med3, [0 255]);
title('3x3 Median filter');

subplot(1,2,2);
imshow(I1_med5, [0 255]);
title('5x5 Median filter');

figure(3);
subplot(1,2,1);
imshow(I2_med3, [0 255]);
title('3x3 Median filter');

subplot(1,2,2);
imshow(I2_med5, [0 255]);
title('5x5 Median filter');

% Use a weighted 5x5 median filter
I1_wmed = median_Wfilter(I1);
I2_wmed = median_Wfilter(I2);

% plot results
figure(4);
subplot(1,2,1);
imshow(I1_med5, [0 255]);
title('5x5 Median filter');

subplot(1,2,2);
imshow(I1_wmed, [0 255]);
title('5x5 weighted Median filter');

figure(5);
subplot(1,2,1);
imshow(I2_med5, [0 255]);
title('5x5 Median filter');

subplot(1,2,2);
imshow(I2_wmed, [0 255]);
title('5x5 weighted Median filter');


