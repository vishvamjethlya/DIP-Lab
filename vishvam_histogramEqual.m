clc;
clear all;
close all;

I = [52	55	61	59	79	61	76	61
     62	59	55	104	94	85	59	71
     63	65	66	113	144	104	63	72
     64	70	70	126	154	109	71	69
     67	73	68	106	122	88	68	68
     68	79	60	70	77	66	58	75
     69	85	64	58	55	61	65	83
     70	87	69	68	65	73	78	90];
 
 I = uint8(I);
 % Dimensions of Input Image
 [r,c,d] = size(I);

% Convert Color Image to Gray Scale
if d ==3
    I = rgb2gray(I);
end

I = double(I);
% Histogram of Input Image
Hin = zeros(1,256);
for i = 1:r
    for j = 1:c
        for k1 = 0:255
            if I(i,j)==k1
                Hin(k1+1)= Hin(k1+1)+1;
            end
        end
    end
end

% Histogram Equalization

% Normalization of Input Histogram
Hin_norm = (1/(r*c))*Hin;

% Generating CDF of Input Histogram
Hin_cdf = zeros(1,256);
Hin_cdf(1)= Hin_norm(1);
for i=2:256
    Hin_cdf(i)=Hin_cdf(i-1)+Hin_norm(i);
end

% De-Normalize CDF
Hin_cdf = round(255*Hin_cdf);
%Generate Output Image
Ih = zeros(r,c);
for i=1:r
    for j=1:c
        pix = (I(i,j)+1);
        Ih(i,j)= Hin_cdf(pix);
    end
end

% Histogram of Ouput Image
HOut = zeros(1,256);
for i =1:r
    for j=1:c
        for k=0:255
            if Ih(i,j) ==k
                HOut(k+1)= HOut(k+1)+1;
            end
        end
    end
end

% Plots
%Input Image
subplot(2,2,1);
imshow(uint8(I));


% Histogram of Input Image
subplot(2,2,2);
plot(Hin);


% Output Image
subplot(2,2,3);
imshow(uint8(Ih));


% Histogram of Output Image
subplot(2,2,4);
plot(HOut);