A = imread('C:\Users\Tepao_Sung\Desktop\sock.jpg');
imshow(A);title('��l�v��');

%�Ƕ��v��
B=rgb2gray(A);
figure;imshow(B);title('�Ƕ��v��');
[y,x]=imhist(B);
%figure;bar(x,y);title('�Ƕ��v�������');

%Watershed-�v������
[m,n]=size(B);
Bdb=double(B);%�Ϥ��নdouble�������(0~1)
%figure;imshow(Bdb/255);title('�Ƕ��v���নdouble');

hy=fspecial('sobel');%�Q��sobel��l�p���׼v��
hx=hy';
Iy = imfilter(Bdb, hy, 'replicate');
Ix = imfilter(Bdb, hx, 'replicate');
[Ix, Iy]=gradient(Bdb);
gradmag = sqrt(Ix.^2 + Iy.^2);
%figure;imshow(gradmag,[]);title('Sobel��l-��׼v��');

level=graythresh(B);%Otsu���μv��
plabel=imbinarize(B,level);
%figure;imshow(plabel);title('�v���j�Ƥ��G�Ȥ�');
plabel1=imfill(plabel,'holes');
figure;imshow(plabel1);title('�v����');

plabel2=imerode(plabel1, ones(5));%�e�����[��
plabel3=bwmorph(plabel2,'skel',Inf);
figure;imshow(plabel3);title('���[�ƫe��');

back=1-plabel1;%�I�����[��
back1=imerode(back,ones(5));
back2=bwmorph(back1,'skel',Inf);   
figure;imshow(back2),title('���[�ƭI��');

figure;imshow(plabel3|back2);title('�e�ᴺ�аO���@���������_�l�I');

gradmag2=imimposemin(gradmag, plabel3|back2);%
%figure;imshow(gradmag2);title('����������');
L2 = watershed(gradmag2);
rgb=label2rgb(L2);
figure;imshow(rgb);title('�ഫ�аO�x�}��RGB�Ϲ�');
XX=L2==0; 
figure;imshow(XX),title('�v������1-�������u');

%����Mask-�v���j��
M=fspecial('sobel');%Mask1
Gx=filter2(M,B,'valid');
Gy=filter2(M,B,'valid');
G=(Gx.^2+Gy.^2).^0.5;
figure;imshow(G,[]);title('Mask1-�v���j��1');

N=[0 1 2;-1 0 1;-2 -1 0];%Mask2
Hx=filter2(N,B,'valid');
Hy=filter2(N,B,'valid');
H=(Hx.^2+Hy.^2).^0.5;
figure;imshow(H,[]);title('Mask2-�v���j��2');
%K=(G.^2+H.^2).^0.5;
%Final=imbinarize(K);
%figure;imshow(Final);title('Mask2-�v���j��2');

%���� Otsu �� k-means,���Ϋe�z�v���j�Ƥ��G�Ȥ�
C1=graythresh(B);%Otsu
BW1=imbinarize(B,C1);
figure;imshow(BW1);title('�v������2-Otsu���G�Ȥ�');

J=double(B);%k-means
[m,n]=size(B);
X=reshape(J,m*n,1);
[cidx,ctrs]=kmeans(X,2);
rergb=reshape(cidx,m,n);
figure;imshow(rergb,[]);title('�v������3-k-means���G�Ȥ�');


