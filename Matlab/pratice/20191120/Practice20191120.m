I=imread('eight.tif');
imshow(I);
ginput;%��ؼп���X��(�Ϊkgoogle�@�U)
J=I();%(y,x)�g�y��
figure;imshow(J);
K=roipoly(J);%��Ϥ������K���ΡA���O���Agoogle�d��
figure;imshow(K);
J1=K;
S1=(K&J1)/(K|J);%�p���Z��-�椣�q
%���}��
%A=K&J1;
A=sum(sum(K&J1));
B=sum(sum(K|J1));
S=A/B;


