%´ú¸Õgfeature2
close all;clear all;

%´ú¸Õpigskin
I=imread('C:\Users\Tepao_Sung\Desktop\pigskin.bmp');
imshow(I)
J=rgb2gray(I);
imshow(J)
%f1=gfeature(double(J),'0');
%f1;

figure(1)
[b,a]=ginput(1);
b=round(b);a=round(a);
hold on;plot([b b b+30 b+30 b],[a a+30 a+30 a a],'b-')
N1=I(a:a+30,b:b+30);
FN01=gfeature(double(N1),'0');

figure(1)
[b,a]=ginput(1);
b=round(b);a=round(a);
hold on;plot([b b b+30 b+30 b],[a a+30 a+30 a a],'b-')
N1=I(a:a+30,b:b+30);
FN02=gfeature(double(N1),'0');

%´ú¸Õwood
%pause
I=imread('C:\Users\Tepao_Sung\Desktop\wood.bmp');
figure;imshow(I)
J=rgb2gray(I);
imshow(J)
%f2=gfeature(double(J),'0');
%f2;

figure(2)
[b,a]=ginput(1);
b=round(b);a=round(a);
hold on;plot([b b b+30 b+30 b],[a a+30 a+30 a a],'r-')
N2=I(a:a+30,b:b+30);
FN11=gfeature(double(N2),'0');

figure(2)
[b,a]=ginput(1);
b=round(b);a=round(a);
hold on;plot([b b b+30 b+30 b],[a a+30 a+30 a a],'r-')
N2=I(a:a+30,b:b+30);
FN12=gfeature(double(N2),'0');

P=[FN01 FN02 FN11 FN12];
T=[0 0 1 1];