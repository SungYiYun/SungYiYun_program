%%Test CNN;
close all;clear all
load('ImageClassificationDL.mat','height','width','layers','net');
temp=imread('pigskin.bmp');
temp1=double(rgb2gray(temp));
temp=imread('wood.bmp');
temp2=double(rgb2gray(temp));
temp1=temp1(:,1:188);
I=[temp1 temp1;temp1 temp1;temp2 temp2;temp2 temp2];
figure;imshow(I,[])
while pause  
    disp('Select a test point')
[b,a]=ginput(1);
b=round(b);a=round(a);
img=uint8(I(a:a+height-1,b:b+width-1));
out1 = net.classify(img);
hold on;
if double(out1) == 1
  plot([b b b+width b+width b],[a a+height a+height a a], 'r:','LineWidth', 3)
else
  plot([b b b+width b+width b],[a a+height a+height a a],'b:','LineWidth',3)
end
end
