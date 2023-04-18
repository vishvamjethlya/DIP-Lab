clc;
clear all;
close all
%DCT Image Compression
[x,y] = uigetfile('*.jpg*','select the grayscale image'); % here ...
x=filename;y=pathname
filewithpath=strcat(y,x);
img temp =imread(filewithpath);
original image=img temp;
img=original image;
%checking for colored image
imgr = rgb2gray(original image);
figure
imshow(img)
title('original image')
imwrite(img,'org.jpg')
data= size(img,2);
samples divide eighth =(data /8);
coloumn 8 = [];
for colour=1:3 %color layer
for i=1:size(img,1)
rowwise = dct(double(img(i,:,colour)));
coloumn 8(i,:,colour)= idct(rowwise(1:samples divide eighth),data);
endfor
endfor
dat 2 =size(img,1);
samplesEighth=floor(dat 2/8);
coloumn 8f=[];
for k=1:3 %all color layer
for i=1:size(img,2) %all coloumn
DCT 8 = dct(double(coloumn 8(:,i,k)));
coloumn 8f(:,i,k)= idct(DCT 8(1:samplesEighth),dat 2);
endfor
endfor
dct 1 =(uint8(coloumn 8));
%dct 1=rgb2gray(dct 1);
figure
imshow(dct 1)
title('COMPRESSED IMAGE');
imwrite(dct 1,'OUT.jpg')