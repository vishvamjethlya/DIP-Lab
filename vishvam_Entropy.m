clc;
clear;
close all;

% Load the given image
img = [1 1 1       2 0 0       3 3 3];

% Check if the image is RGB and convert it to grayscale
[rows,cols,channels] = size(img);
if channels == 3
    img = rgb2gray(img);
end

% Convert the image to a double matrix
img = double(img);

% Calculate the frequency of each intensity level
freq = zeros(1,8);
for i = 1:rows
    for j = 1:cols
        for k = 0:(2^(rows)-1)
            if img(i,j)==k
                freq(k+1) = freq(k+1) + 1;
            end
        end
    end
end

% Calculate the probability of each intensity level
prob = (1/(rows*cols)) * freq;

% Calculate the entropy of the image
entropy = 0;
for m = 1:(2^(rows)-1)
    if prob(m) ~= 0
        entropy = entropy + (freq(m)) * (prob(m)) * (log2(prob(m)));
    end
end
entropy = -(entropy);

% Calculate the average pixel intensity
sum_pixels = 0;
for s = 1:(rows*cols)
    sum_pixels = sum_pixels + img(s);
end
avg_pixel_intensity = sum_pixels / (rows*cols);

% Calculate the median pixel value
img_sorted = sort(img(:));
s = size(img_sorted);
index_median = round(s(1)/2);
median_pixel_value = img_sorted(index_median);

% Calculate the mode pixel value
[max_frequency_value,max_frequency_index] = max(freq);
mode_pixel_value = (max_frequency_index-1);

% Display the results
disp(['Entropy: ', num2str(entropy)]);
disp(['Average pixel intensity: ', num2str(avg_pixel_intensity)]);
disp(['Median pixel value: ', num2str(median_pixel_value)]);
disp(['Mode pixel value: ', num2str(mode_pixel_value)]);
