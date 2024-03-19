A = imread('C:\Users\Tepao_Sung\Desktop\sock.jpg');
imshow(A);title('原始影像');

%灰階影像
B=rgb2gray(A);
figure;imshow(B);title('灰階影像');
[y,x]=imhist(B);
%figure;bar(x,y);title('灰階影像直方圖');

%Watershed-影像切割
[m,n]=size(B);
Bdb=double(B);%圖片轉成double精度類型(0~1)
%figure;imshow(Bdb/255);title('灰階影像轉成double');

hy=fspecial('sobel');%利用sobel算子計算梯度影像
hx=hy';
Iy = imfilter(Bdb, hy, 'replicate');
Ix = imfilter(Bdb, hx, 'replicate');
[Ix, Iy]=gradient(Bdb);
gradmag = sqrt(Ix.^2 + Iy.^2);
%figure;imshow(gradmag,[]);title('Sobel算子-梯度影像');

level=graythresh(B);%Otsu切割影像
plabel=imbinarize(B,level);
%figure;imshow(plabel);title('影像強化之二值化');
plabel1=imfill(plabel,'holes');
figure;imshow(plabel1);title('影像填滿');

plabel2=imerode(plabel1, ones(5));%前景骨架化
plabel3=bwmorph(plabel2,'skel',Inf);
figure;imshow(plabel3);title('骨架化前景');

back=1-plabel1;%背景骨架化
back1=imerode(back,ones(5));
back2=bwmorph(back1,'skel',Inf);   
figure;imshow(back2),title('骨架化背景');

figure;imshow(plabel3|back2);title('前後景標記物作為分水嶺起始點');

gradmag2=imimposemin(gradmag, plabel3|back2);%
%figure;imshow(gradmag2);title('分水嶺分割');
L2 = watershed(gradmag2);
rgb=label2rgb(L2);
figure;imshow(rgb);title('轉換標記矩陣到RGB圖像');
XX=L2==0; 
figure;imshow(XX),title('影像切割1-分水嶺線');

%兩類Mask-影像強化
M=fspecial('sobel');%Mask1
Gx=filter2(M,B,'valid');
Gy=filter2(M,B,'valid');
G=(Gx.^2+Gy.^2).^0.5;
figure;imshow(G,[]);title('Mask1-影像強化1');

N=[0 1 2;-1 0 1;-2 -1 0];%Mask2
Hx=filter2(N,B,'valid');
Hy=filter2(N,B,'valid');
H=(Hx.^2+Hy.^2).^0.5;
figure;imshow(H,[]);title('Mask2-影像強化2');
%K=(G.^2+H.^2).^0.5;
%Final=imbinarize(K);
%figure;imshow(Final);title('Mask2-影像強化2');

%應用 Otsu 及 k-means,切割前述影像強化之二值化
C1=graythresh(B);%Otsu
BW1=imbinarize(B,C1);
figure;imshow(BW1);title('影像切割2-Otsu之二值化');

J=double(B);%k-means
[m,n]=size(B);
X=reshape(J,m*n,1);
[cidx,ctrs]=kmeans(X,2);
rergb=reshape(cidx,m,n);
figure;imshow(rergb,[]);title('影像切割3-k-means之二值化');


