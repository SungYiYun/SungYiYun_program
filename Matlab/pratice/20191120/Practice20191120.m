I=imread('eight.tif');
imshow(I);
ginput;%把目標選取出來(用法google一下)
J=I();%(y,x)寫座標
figure;imshow(J);
K=roipoly(J);%把圖片取成八角形，有別的，google查詢
figure;imshow(K);
J1=K;
S1=(K&J1)/(K|J);%計算績效-行不通
%分開算
%A=K&J1;
A=sum(sum(K&J1));
B=sum(sum(K|J1));
S=A/B;


