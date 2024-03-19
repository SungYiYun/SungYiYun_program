%原始影像
A= imread('C:\Users\Tepao_Sung\Desktop\matlab_practice_piture\001.jpg');
imshow(A);title('原始影像');

%灰階影像
B=rgb2gray(A);
figure;imshow(B);title('灰階影像');
%[y,x]=imhist(B);
%figure;bar(x,y);title('灰階影像直方圖');

%應用ginput擷取關注區域
%figure;imshow(B);title('ginput 擷取關注區域影像');
%ginput
C=B(239.5:947.5000,415.5000:1.4255e+03);

%應用roipoly計算黃金標準
D=roipoly(C);
figure;imshow(D);title('黃金標準');

%Watershed-影像切割
E=double(C);
%利用sobel算子計算梯度影像
hy=fspecial('sobel');
hx=hy';
Ex = imfilter(E, hy, 'replicate');
Ey = imfilter(E, hx, 'replicate');
[Ex, Ey]=gradient(E);
F1 = sqrt(Ex.^2 + Ey.^2);
%figure;imshow(F1,[]);title('Sobel算子-梯度影像');
%Otsu切割影像
level=graythresh(C);
G1=imbinarize(C,level);
%figure;imshow(G1);title('影像強化之二值化');
hy=fspecial('sobel');%利用sobel算子計算梯度影像
hx=hy';
Iy = imfilter(G1, hy, 'replicate');
Ix = imfilter(G1, hx, 'replicate');
[Ix, Iy]=gradient(G1);
gradmag = sqrt(Ix.^2 + Iy.^2);
%figure;imshow(gradmag,[]);title('Sobel算子-梯度影像');

level=graythresh(C);%Otsu切割影像
plabel=imbinarize(C,level);
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

gradmag2=imimposemin(gradmag, plabel3|back2);
figure;imshow(gradmag2);title('分水嶺分割');
L2 = watershed(gradmag2);
rgb=label2rgb(L2);
figure;imshow(rgb);title('轉換標記矩陣到RGB圖像');
XX=L2==0; 
figure;imshow(XX);title('影像切割1-分水嶺線');
XXX=imfill(XX,'holes');
figure;imshow(XXX);title('影像切割1-分水嶺線(填滿)');

%Otsu-影像切割
C1=graythresh(C);
BW1=imbinarize(C,C1);
figure;imshow(BW1);title('影像切割2-Otsu之二值化');

%k-means-影像切割
J=double(C);
[m,n]=size(C);
X=reshape(J,m*n,1);
[cidx,ctrs]=kmeans(X,2);
rergb=reshape(cidx,m,n);
figure;imshow(rergb,[]);title('影像切割3-k-means之二值化');

%計算相似度
S1=sum(sum(D&XXX))/sum(sum(D|XXX));%Watershed
S2=sum(sum(D&BW1))/sum(sum(D|BW1));%Otsu
S3=sum(sum(D&rergb))/sum(sum(D|rergb));%K-means



