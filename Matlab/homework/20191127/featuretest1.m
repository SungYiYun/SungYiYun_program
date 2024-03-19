%使用gfeature1
close all; clear all;

%測試pigskin
I=imread('C:\Users\Tepao_Sung\Desktop\pigskin.bmp');
imshow(I)
J=rgb2gray(I);
imshow(J)
f1=gfeature(double(J),'0');
f1

%測試wood
I=imread('C:\Users\Tepao_Sung\Desktop\wood.bmp');
figure;imshow(I)
J=rgb2gray(I);
imshow(J)
f2=gfeature(double(J),'0');
f2