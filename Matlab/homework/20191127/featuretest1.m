%�ϥ�gfeature1
close all; clear all;

%����pigskin
I=imread('C:\Users\Tepao_Sung\Desktop\pigskin.bmp');
imshow(I)
J=rgb2gray(I);
imshow(J)
f1=gfeature(double(J),'0');
f1

%����wood
I=imread('C:\Users\Tepao_Sung\Desktop\wood.bmp');
figure;imshow(I)
J=rgb2gray(I);
imshow(J)
f2=gfeature(double(J),'0');
f2