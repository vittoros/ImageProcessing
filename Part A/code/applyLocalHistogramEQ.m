% Read images
I1 = imread('../input/dark_road_1.jpg');
I2 = imread('../input/dark_road_2.jpg');
I3 = imread('../input/dark_road_3.jpg');

I1 = double(I1);
I2 = double(I2);
I3 = double(I3);

% apply local histogram equalization
k = 50;   % window size

I1_eq = local_histeq(I1,k);
I2_eq = local_histeq(I2,k);
I3_eq = local_histeq(I3,k);

k = 100;   % window size

I1_eq2 = local_histeq(I1,k);
I2_eq2 = local_histeq(I2,k);
I3_eq2 = local_histeq(I3,k);