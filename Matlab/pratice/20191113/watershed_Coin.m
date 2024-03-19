close all;clear all;
x=imread('coins.png');
[m,n]=size(x);
xdb=double(x);
figure;imshow(xdb/255)

%利用sobel算子計算梯度影像
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(xdb, hy, 'replicate');
Ix = imfilter(xdb, hx, 'replicate');
hy
[Ix, Iy]=gradient(xdb);%重要
figure;mesh(Iy)
figure;quiver(Ix, Iy)
gradmag = sqrt(Ix.^2 + Iy.^2); 
figure;imshow(gradmag,[])
%figure; contour(xdb), hold on, quiver(Ix, Iy), hold off

%Otsu切割前景 -> 侵蝕 -> 骨架化
level = graythresh(x);
plabel = im2bw(x,level); 
figure;imshow(plabel)
plabel1 = imfill(plabel,'holes');%洞補起來

%% ## 前景骨架化區域
plabel2=imerode(plabel1, ones(10));%3,5,7,9,11會比較好
%plabel2=imerode(plabel1, ones(31));

plabel3=bwmorph(plabel2,'skel',Inf);     
figure;imshow(plabel3),title('骨架化前景')

%%背景標記 -> 侵蝕 -> 骨架化 
back=1-plabel1;
back1=imerode(back,ones(3));
back2=bwmorph(back1,'skel',Inf);   
figure;imshow(back2),title('骨架化背景')

%前後景標記物作為分水嶺起始點
figure;imshow(plabel3|back2)

%% ## 切割 原圖/梯度影像
%gradmag2 = imimposemin(xdb, plabel3|back2); 
gradmag2 = imimposemin(gradmag, plabel3|back2);  
figure;imshow(gradmag2)
L2 = watershed(gradmag2);

rgb=label2rgb(L2);
figure;imshow(rgb)

XX=L2==0; 
figure;imshow(XX),title('分水嶺線')





