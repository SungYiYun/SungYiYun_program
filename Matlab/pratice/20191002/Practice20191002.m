load tire;
I=ind2gray(X,map);
imshow(I)
figure;
[y,x]=imhist(I);%�t�@�إ��kimhist(I);
bar(x,y)
figure;

J=(I-min(I(:)))/(max(I(:))-min(I(:)));
imshow(J)
figure;
J1=imadjust(I,[0 1]);%J���t�@�ؼg�k
imshow(J1)
figure;
%imshow(I,[ ])
%figure;
%imshow(I)

J=I+V;
K=imadjust(J,[0.1,0.9]);

