% Read image and convert to double
I1 = imread('../input/clock.jpg');
I1 = rgb2gray(I1);
I1 = double(I1);

% 2-D DFT through 2x 1-D FFTs
dft1 = fr1dFFT(I1);

% Align zero-frequency component to center 
% and keep Amp part only
dft1 = fftshift(dft1);
dft1_abs = abs(dft1);

% 2-D DFT through DFT matrix mult
dft2 = dft_matrix(I1);

% Align zero-frequency component to center 
% and keep Amp part only
dft2 = fftshift(dft2);
dft2_abs = abs(dft2);

% Plot DFTs
figure(1);
imshow(imread('../input/clock.jpg'));
title('Original Image');

figure(2);
subplot(2,2,1);
imshow(dft1_abs, []);
title('Linear (FFT)');

subplot(2,2,2);
dft1_abs = log2(dft1_abs+1);
imshow(dft1_abs, []);
title('Logarithmic (FFT)');

subplot(2,2,3);
imshow(dft2_abs, []);
title('Linear (DFT matrix)');

subplot(2,2,4);
dft2_abs = log2(dft2_abs+1);
imshow(dft2_abs, []);
title('Logarithmic (DFT matrix)');