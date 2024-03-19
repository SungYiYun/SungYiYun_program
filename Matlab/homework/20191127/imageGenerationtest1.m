%產生圖片
clear all;close all;

temp=imread('C:\Users\Tepao_Sung\Desktop\pigskin.bmp');
figure;imshow(temp);
temp1=rgb2gray(temp);
temp1=double(temp1);
% Expand Size 1x1 to  Size 4x4
temp2=[temp1, temp1;temp1, temp1];
temp3=[temp2, temp2;temp2, temp2];
[m, n]=size(temp3);
figure;imshow(temp3,[]);

% Image Generation Parameters
width=64;height=64;number=50;
for i=1:1:number
    C=floor(rand()*(m-width+1-1))+1;
    R=floor(rand()*(n-height+1-1))+1;
    image(:,:,i)=temp3(C:C+width-1,R:R+height-1);
end

figure;montage(image/max(max(temp1)), 'BorderSize', 2, 'BackgroundColor', 'b')
save('PigSkinData.mat');

% Load variable images back
close all;clear all;
load('PigSkinData.mat', 'image')
load('PigSkinData.mat', 'temp1')
figure;montage(image/max(max(temp1)), 'BorderSize', 2, 'BackgroundColor', 'r')