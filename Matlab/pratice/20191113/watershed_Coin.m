close all;clear all;
x=imread('coins.png');
[m,n]=size(x);
xdb=double(x);
figure;imshow(xdb/255)

%�Q��sobel��l�p���׼v��
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(xdb, hy, 'replicate');
Ix = imfilter(xdb, hx, 'replicate');
hy
[Ix, Iy]=gradient(xdb);%���n
figure;mesh(Iy)
figure;quiver(Ix, Iy)
gradmag = sqrt(Ix.^2 + Iy.^2); 
figure;imshow(gradmag,[])
%figure; contour(xdb), hold on, quiver(Ix, Iy), hold off

%Otsu���Ϋe�� -> �I�k -> ���[��
level = graythresh(x);
plabel = im2bw(x,level); 
figure;imshow(plabel)
plabel1 = imfill(plabel,'holes');%�}�ɰ_��

%% ## �e�����[�ưϰ�
plabel2=imerode(plabel1, ones(10));%3,5,7,9,11�|����n
%plabel2=imerode(plabel1, ones(31));

plabel3=bwmorph(plabel2,'skel',Inf);     
figure;imshow(plabel3),title('���[�ƫe��')

%%�I���аO -> �I�k -> ���[�� 
back=1-plabel1;
back1=imerode(back,ones(3));
back2=bwmorph(back1,'skel',Inf);   
figure;imshow(back2),title('���[�ƭI��')

%�e�ᴺ�аO���@���������_�l�I
figure;imshow(plabel3|back2)

%% ## ���� ���/��׼v��
%gradmag2 = imimposemin(xdb, plabel3|back2); 
gradmag2 = imimposemin(gradmag, plabel3|back2);  
figure;imshow(gradmag2)
L2 = watershed(gradmag2);

rgb=label2rgb(L2);
figure;imshow(rgb)

XX=L2==0; 
figure;imshow(XX),title('�������u')





