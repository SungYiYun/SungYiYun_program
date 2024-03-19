A = imread('C:\Users\Tepao_Sung\Desktop\雲科大108-1\電腦輔助檢測與診斷\20191002\33.tif');
imshow(A);
figure;
I=rgb2gray(A);
imshow(I);
figure;

M=fspecial('sobel');
Gx=filter2(M,I,'valid');
Gy=filter2(M,I,'valid');
G=(Gx.^2+Gy.^2).^0.5;
imshow(G,[]);
figure;

N=[0 1 2;-1 0 1;-2 -1 0];
Hx=filter2(N,I,'valid');
Hy=filter2(N,I,'valid');
H=(Hx.^2+Hy.^2).^0.5;
imshow(H,[]);
figure;

K=(G.^2+H.^2).^0.5;
Final=imbinarize(K);
imshow(Final);
