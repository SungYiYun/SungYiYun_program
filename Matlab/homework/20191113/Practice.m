x=imread('coins.png');
[m,n]=size(x);
xdb=double(x);
figure;imshow(xdb/255);

level = graythresh(x);
plabel = im2bw(x,level); 
figure;imshow(plabel)
plabel1 = imfill(plabel,'holes');

plabel2=imerode(plabel1, ones(10));
plabel3=bwmorph(plabel2,'skel',Inf);
figure;imshow(plabel3),title('骨架化前景')

back=1-plabel1;
back1=imerode(back,ones(3));
back2=bwmorph(back1,'skel',Inf);   
figure;imshow(back2),title('骨架化背景')

figure;imshow(plabel3|back2)

hy = fspecial('sobel');
hx = hy';
Iy = imfilter(xdb, hy, 'replicate');
Ix = imfilter(xdb, hx, 'replicate');
[Ix, Iy]=gradient(xdb);
gradmag = sqrt(Ix.^2 + Iy.^2); 
figure;imshow(gradmag,[])

gradmag2 = imimposemin(gradmag, plabel3|back2);  
figure;imshow(gradmag2)
L2 = watershed(gradmag2);
rgb=label2rgb(L2);
figure;imshow(rgb);
XX=L2==0; 
figure;imshow(XX),title('分水嶺線')
