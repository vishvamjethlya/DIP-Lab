% Digital Image Processing : Lab Task - 10

clc;
close all;
clear all;

% Load and display the original image
img = imread('lena512.bmp');
figure(1);
subplot(2,2,1);
imshow(img);
title('Original Image');

% Convert the image to grayscale
img_gray = rgb2gray(img);
subplot(2,2,2);
imshow(img_gray);
title('Grayscale Image');

% Pad the image with zeros
img_pad = padarray(img_gray, [1 1], 'both');
subplot(2,2,3);
imshow(img_pad);
title('Padded Image');

% Initialize the output array
result = zeros(size(img_pad));

% Loop through each pixel in the padded image
for i = 2:size(img_pad,1)-1
    for j = 2:size(img_pad,2)-1
        % Define the 3x3 window around the current pixel
        window = img_pad(i-1:i+1, j-1:j+1);
        
        % Create a binary matrix indicating which neighboring pixels are
        % brighter than the center pixel
        binary_mat = window > window(2,2);
        
        % Convert the binary matrix to a decimal value
        decimal_val = binary_mat * [128; 64; 32; 16; 0; 8; 4; 2; 1];
        
        % Store the decimal value in the output array
        result(i,j) = decimal_val;
    end
end

% Convert the output array to an 8-bit unsigned integer
result = uint8(result);

% Display the output image
subplot(2,2,4);
imshow(result);
title('Resulting Image');
