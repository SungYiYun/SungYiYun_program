%A=100*ones(1,41);
%A(21)=101;
%plot(A);
%axis([1 50 90 110])

%M=[-1 2 -1];
%M1=fliplr(M);%¤ÏÂà

A=100*ones(41,41);
A(21,21)=10;
%surf(A);
%mesh(A);
mesh(A(2:40,2:40));
axis([1 41 -10 110])
M=-0.25*ones(3,3);
M(2,2)=2;
B=filter2(M,A,'valid');
hold on;
mesh(B);

%{
¤W½Ò½m²ß
load tire
I=ind2gray(X,map);
imshow(I);
M1=fspecial('sobel');
Gx=filter2(M1,I,'valid');
imshow(Gx, []);
%M2=transpose(M1);
M2=M1';
Gy=filter2(M2,I,'valid');
figure;imshow(Gy,[]);
imshow(Gx,[]);figure;imshow(Gy,[]);
G=(Gx.^2+Gy.^2).^0.5;
figure;imshow(G,[]);
figure;imshow(I);
figure;imhist(G);
BW1=edge(I,'sobel');
figure;imshow(BW1);
%}
