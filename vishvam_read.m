clc
clear all;
close all;
%Original image
I = imread('photo.jpg');
imshow(I);
figure();
%Grey scale image
IG = I(:,:,1);
imshow(IG);
figure();
%Red image
Ir = I;
Ir(:,:,2) = 0;
Ir(:,:,3) = 0;
imshow(Ir);
figure();
%Green image
Ig = I;
Ig(:,:,1) = 0;
Ig(:,:,3) = 0;
imshow(Ig);
figure();
%Blue image
Ib = I;
Ib(:,:,1) = 0;
Ib(:,:,2) = 0;
imshow(Ib);
figure();
%Taking average of red image
Iravg = (sum(sum(Ir)))./((size(Ir,1)).*(size(Ir,2)));
imshow(Iravg);
figure();
%Taking average of green image
Igavg = (sum(sum(Ig)))./((size(Ig,1)).*(size(Ig,2)));
imshow(Igavg);
figure();
%Taking average of blue image
Ibavg = (sum(sum(Ib)))./((size(Ib,1)).*(size(Ib,2)));
imshow(Ibavg);
figure();