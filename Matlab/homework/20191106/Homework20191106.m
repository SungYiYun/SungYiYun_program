A = imread('C:\Users\Tepao_Sung\Desktop\sock.jpg');
imshow(A);
title('原始圖像');
figure;

%RGB轉為Gray
I=rgb2gray(A);
imshow(I);
title('灰階影像');
figure;

%Mask1
M=fspecial('sobel');
Gx=filter2(M,I,'valid');
Gy=filter2(M,I,'valid');
G=(Gx.^2+Gy.^2).^0.5;
imshow(G,[]);
title('影像強化1');
figure;

%Mask2
N=[0 1 2;-1 0 1;-2 -1 0];
Hx=filter2(N,I,'valid');
Hy=filter2(N,I,'valid');
H=(Hx.^2+Hy.^2).^0.5;
imshow(H,[]);
title('影像強化2');
figure;

K=(G.^2+H.^2).^0.5;
Final=imbinarize(K);
imshow(Final);
title('影像強化3');
figure;

%Otsu
C1=graythresh(I);
BW1=imbinarize(I,C1);
imshow(BW1);
title('影像強化之二值化1');
figure;

%k-means
[y,x]=imhist(I);
bar(x,y)
J=double(I);
m=size(I,1);
n=size(I,2);
X=reshape(J,m*n,1);
[cidx, ctrs]=kmeans(X,2);
C2=reshape(cidx,m,n);
imshow(C2,[]);
title('影像強化之二值化2');
figure;

%二值化輸出之相異性
t=(C1+C2)/2;
imshow(t,[]);
title('二值化輸出之相異性');
figure;
imhist(t);
title('二值化輸出之相異性');
