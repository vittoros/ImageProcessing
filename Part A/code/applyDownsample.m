% Read image
I2 = imread('../input/pepper.jpg');
I2 = double(I2);

% Quantize to 4 Levels
l1 = 4;
l2 = 4;
l3 = 4;
I2_q1 = my_quantizer(I2,l1,l2,l3);

% Quantize to 6 Levels
l11 = 6;
l22 = 6;
l33 = 6;
I2_q2 = my_quantizer(I2,l11,l22,l33);

% Plot images
figure(1);
subplot(1,3,1);
imshow(mat2gray(I2));
title('Original');

subplot(1,3,2);
imshow(mat2gray(I2_q1));
title(['Quantized to ', num2str(l1), ' levels']);

subplot(1,3,3);
imshow(mat2gray(I2_q2));
title(['Quantized to ', num2str(l11), ' levels']);

% Calculate PSNR
snr1 = my_psnr(I2, I2_q1);
snr2 = my_psnr(I2, I2_q2);

disp(['PSNRdb for l = 4 -> snrdb = ', num2str(snr1)]); 
disp(['PSNRdb for l = 6 -> snrdb = ', num2str(snr2)]); 
