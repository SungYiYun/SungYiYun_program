A = imread('C:\Users\Tepao_Sung\Desktop\sock.jpg');
imshow(A);
title('��l�Ϲ�');
figure;

%RGB�ରGray
I=rgb2gray(A);
imshow(I);
title('�Ƕ��v��');
figure;

%Mask1
M=fspecial('sobel');
Gx=filter2(M,I,'valid');
Gy=filter2(M,I,'valid');
G=(Gx.^2+Gy.^2).^0.5;
imshow(G,[]);
title('�v���j��1');
figure;

%Mask2
N=[0 1 2;-1 0 1;-2 -1 0];
Hx=filter2(N,I,'valid');
Hy=filter2(N,I,'valid');
H=(Hx.^2+Hy.^2).^0.5;
imshow(H,[]);
title('�v���j��2');
figure;

K=(G.^2+H.^2).^0.5;
Final=imbinarize(K);
imshow(Final);
title('�v���j��3');
figure;

%Otsu
C1=graythresh(I);
BW1=imbinarize(I,C1);
imshow(BW1);
title('�v���j�Ƥ��G�Ȥ�1');
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
title('�v���j�Ƥ��G�Ȥ�2');
figure;

%�G�Ȥƿ�X���۲���
t=(C1+C2)/2;
imshow(t,[]);
title('�G�Ȥƿ�X���۲���');
figure;
imhist(t);
title('�G�Ȥƿ�X���۲���');
