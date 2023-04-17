% Digital Image Processing : Lab Task - 6

clc;
clear all;
close all;

% Load and display the original image
I = imread('trees.tif');
I_gray = rgb2gray(I);
figure(1);
subplot(2,3,1);
imshow(I_gray);
title('Original Image');

% Perform 2D Discrete Wavelet Transform using Haar wavelets
[LoD,HiD,LoR,HiR] = wfilters('haar');
[LL,LH,HL,HH] = dwt2(I_gray,LoD,HiD,'mode','symh');
DWt_1 = [LL, LH; HL, HH];

% Display the DWT image
subplot(2,3,2);
imshow(DWt_1, []);
title('DWT Image');

% Perform inverse DWT to reconstruct the image
Irec = idwt2(LL,LH,HL,HH,LoR,HiR);

% Display the reconstructed image
subplot(2,3,3);
imshow(Irec);
title('Reconstructed Image');
