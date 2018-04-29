I3 = imread('../input/factory.jpg');
I3 = rgb2gray(I3);
I3 = double(I3);

% Sobel mask for edge detection
sobel = zeros(3,3,2);
sobel(:,:,1) = [-1 -2 -1; 0 0 0; 1 2 1];
sobel(:,:,2) = [-1 0 1; -2 0 2; -1 0 1];

% Roberts mask for edge detection
roberts = zeros(2,2,2);
roberts(:,:,1) = [-1 0; 0 1];
roberts(:,:,2) = [0 -1; 1 0];

% Apply masks to image
y1 = filter2d(I3,sobel);
y2 = filter2d(I3,roberts);

% rescale to 0-1 values
y1 = y1 - min(y1(:));
y1 = y1 / max(y1(:));

y2 = y2 - min(y2(:));
y2 = y2 / max(y2(:));

% Plot histogram to determine threshold
figure(1);
subplot(1,2,1);
hist(y1(:));
title('y1');

subplot(1,2,2);
hist(y2(:));
title('y2');

% Plot filtered images
figure(2);
subplot(3,2,[1,2]);
imshow(I3, []);
title('Original');

subplot(3,2,3);
imshow(y1);
title('Sobel');

subplot(3,2,5);
imshow(y2);
title('Roberts'); 

% Apply threshold to edge images
level1 = 0.55;
level2 = 0.5;

y1_t = im2bw(y1, level1);
y2_t = im2bw(y2, level2);  

subplot(3,2,4);
imshow(y1_t);
title('Sobel with Threshold');

subplot(3,2,6);
imshow(y2_t);
title('Roberts with Threshold');
