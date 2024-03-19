%��l�v��
A= imread('C:\Users\Tepao_Sung\Desktop\matlab_practice_piture\001.jpg');
imshow(A);title('��l�v��');

%�Ƕ��v��
B=rgb2gray(A);
figure;imshow(B);title('�Ƕ��v��');
%[y,x]=imhist(B);
%figure;bar(x,y);title('�Ƕ��v�������');

%����ginput�^�����`�ϰ�
%figure;imshow(B);title('ginput �^�����`�ϰ�v��');
%ginput
C=B(239.5:947.5000,415.5000:1.4255e+03);

%����roipoly�p������з�
D=roipoly(C);
figure;imshow(D);title('�����з�');

%Watershed-�v������
E=double(C);
%�Q��sobel��l�p���׼v��
hy=fspecial('sobel');
hx=hy';
Ex = imfilter(E, hy, 'replicate');
Ey = imfilter(E, hx, 'replicate');
[Ex, Ey]=gradient(E);
F1 = sqrt(Ex.^2 + Ey.^2);
%figure;imshow(F1,[]);title('Sobel��l-��׼v��');
%Otsu���μv��
level=graythresh(C);
G1=imbinarize(C,level);
%figure;imshow(G1);title('�v���j�Ƥ��G�Ȥ�');
hy=fspecial('sobel');%�Q��sobel��l�p���׼v��
hx=hy';
Iy = imfilter(G1, hy, 'replicate');
Ix = imfilter(G1, hx, 'replicate');
[Ix, Iy]=gradient(G1);
gradmag = sqrt(Ix.^2 + Iy.^2);
%figure;imshow(gradmag,[]);title('Sobel��l-��׼v��');

level=graythresh(C);%Otsu���μv��
plabel=imbinarize(C,level);
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

gradmag2=imimposemin(gradmag, plabel3|back2);
figure;imshow(gradmag2);title('����������');
L2 = watershed(gradmag2);
rgb=label2rgb(L2);
figure;imshow(rgb);title('�ഫ�аO�x�}��RGB�Ϲ�');
XX=L2==0; 
figure;imshow(XX);title('�v������1-�������u');
XXX=imfill(XX,'holes');
figure;imshow(XXX);title('�v������1-�������u(��)');

%Otsu-�v������
C1=graythresh(C);
BW1=imbinarize(C,C1);
figure;imshow(BW1);title('�v������2-Otsu���G�Ȥ�');

%k-means-�v������
J=double(C);
[m,n]=size(C);
X=reshape(J,m*n,1);
[cidx,ctrs]=kmeans(X,2);
rergb=reshape(cidx,m,n);
figure;imshow(rergb,[]);title('�v������3-k-means���G�Ȥ�');

%�p��ۦ���
S1=sum(sum(D&XXX))/sum(sum(D|XXX));%Watershed
S2=sum(sum(D&BW1))/sum(sum(D|BW1));%Otsu
S3=sum(sum(D&rergb))/sum(sum(D|rergb));%K-means



