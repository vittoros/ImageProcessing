%% Read image
I = imread('input/radiograph_2.jpg');
I = double(I);

% Find DFT
I_f = fft2(I);
I_f = fftshift(I_f);

%% Low-pass Butterworth filter
[x,y] = size(I);
w = 30;      
k = 11;

H1 = zeros(x,y);
for i = 1 : x
    for j = 1 : y
        H1(i,j) = 1 / (1 + (sqrt(i^2 + j^2)/w)^(2*k));
    end
end

% fftshift DFT of H1
x1 = floor(x/2);
y1 = floor(y/2);
H1 = padarray(H1,[x1 y1], 'symmetric');
H1 = H1(1:x,1:y);

% Plot filter
figure(1)
subplot(1,3,1);
H1_f = abs(H1);
H1_f = log2(H1_f);
imshow(H1_f, []);
title('low pass');

%% High-pass Butterworth filter
[x,y] = size(I);
w = 40;      
k = 11;

H2 = zeros(x,y);
for i = 1 : x
    for j = 1 : y
        H2(i,j) = 1 / (1 + (w/sqrt(i^2 + j^2))^(2*k));
    end
end

% fftshift DFT of H2
x1 = floor(x/2);
y1 = floor(y/2);
H2 = padarray(H2,[x1 y1], 'symmetric');
H2 = H2(1:x,1:y);

% Plot filter
subplot(1,3,2);
H2_f = abs(H2);
H2_f = log2(H2_f);
imshow(H2_f, []);
title('high pass');

%% Band-stop Butterworth filters
H = H1 + H2;

% plot filter
subplot(1,3,3);
H_f = abs(H);
H_f = log2(H_f);
imshow(H_f, []);
title('band-stop');

%% Pass image through filter and plot results
Y = I_f .* H;

% Plot results in Frequency
figure(2)
subplot(1,3,3);
Y2 = abs(Y);
Y2 = log2(Y2);
imshow(Y2, []);
title('DFT of 1st Image After filtering');

subplot(1,3,1);
I_f2 = abs(I_f);
I_f2 = log2(I_f2);
imshow(I_f2, []);
title('DFT of 1st Image');

subplot(1,3,2);
H_f = abs(H);
H_f = log2(H_f);
imshow(H_f, []);
title('band-stop filter');

% Plot results in Space
figure(3)
subplot(1,2,2);
plot = fftshift(Y);
plot = ifft2(plot);
plot = abs(plot);
plot = imshow(plot, []);
title('1st Image After filtering');

subplot(1,2,1);
imshow(I, []);
title('1st Image Before filtering');