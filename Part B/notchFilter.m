%% Read 1st image
I = imread('input/radiograph_1.jpg');
I = double(I);

% Find DFT
I_f = fft2(I);
I_f = fftshift(I_f);

%% Set Points on DFT to cut off (4)
w = zeros(4,2);   
w(1,:) = [124 261];
w(2,:) = [215 247];
w(3,:) = [78 272];
w(4,:) = [255 242];
% 170 253 <- center

s = [20 20 45 45];

%% Find Notch filter
[x,y] = size(I);

H = ones(x,y);
for i = 1 : x
    for j = 1 : y
        for k = 1 : 4
            val = 1 - exp(-((i-w(k,1))^2 + (j-w(k,2))^2) / (s(k)^2));
            H(i,j) = H(i,j) * val;
        end
    end
end

% Pass image through filter
Y = I_f .* H;

%% Plot results
figure(1)
subplot(2,2,1);
plot = abs(I_f);
plot = log2(plot);
imshow(plot, []);
title('DFT of 1st Image');

subplot(2,2,2);
plot = abs(Y);
plot = log2(plot);
imshow(plot, []);
title('DFT of 1st Image After Filtering');

subplot(2,2,3);
imshow(I, []);
title('1st Image');

subplot(2,2,4);
y = fftshift(Y);
y = ifft2(y);
y = abs(y);
imshow(y, []);
title('Filtered 1st image');





%% ------------------------------------------------------------------------------------------------ %%
%  ------------------------------------------------------------------------------------------------
%  ------------------------------------------------------------------------------------------------
%  ------------------------------------------------------------------------------------------------
% Read 2st image
I = imread('input/radiograph_2.jpg');
I = double(I);

% Find DFT
I_f = fft2(I);
I_f = fftshift(I_f);

%% Set Points on DFT to cut off (2)
w = zeros(2,2);   
w(1,:) = [451 211];
w(2,:) = [444 278];
% 449 242 <- center

s = [10 10];

%% Find Notch filter
[x,y] = size(I);

H = ones(x,y);
for i = 1 : x
    for j = 1 : y
        for k = 1 : 2
            val = 1 - exp(-((i-w(k,1))^2 + (j-w(k,2))^2) / (s(k)^2));
            H(i,j) = H(i,j) * val;
        end
    end
end

% Pass image through filter
Y = I_f .* H;

%% Plot results
figure(2)
subplot(2,2,1);
plot = abs(I_f);
plot = log2(plot);
imshow(plot, [], 'XData', [-pi pi], 'YData', [-pi pi]);
title('DFT of 2nd Image');

subplot(2,2,2);
plot = abs(Y);
plot = log2(plot);
imshow(plot, [], 'XData', [-pi pi], 'YData', [-pi pi]);
title('DFT of 2nd Image After filtering');

subplot(2,2,3);
imshow(I, [], 'XData', [-pi pi], 'YData', [-pi pi]);
title('2nd Image');

subplot(2,2,4);
y = fftshift(Y);
y = ifft2(y);
y = abs(y);
imshow(y, [], 'XData', [-pi pi], 'YData', [-pi pi]);
title('Filtered 1st image');
