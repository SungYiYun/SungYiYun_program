%�Ĥ@�i��
RGB1 = imread('C:\Users\Tepao_Sung\Desktop\����j108-1\�q�����U�˴��P�E�_\20191002\33.tif');

R1 = RGB1(:,:,1);
G1 = RGB1(:,:,2);
B1 = RGB1(:,:,3);
subplot(2,2,1);imshow(RGB1);title('��l�Ϥ�');
subplot(2,2,2);imshow(R1);title('R');
subplot(2,2,3);imshow(G1);title('G');
subplot(2,2,4);imshow(B1);title('B');
figure;

HSV1 = rgb2hsv(RGB1);
H1 = HSV1(:,:,1);
S1 = HSV1(:,:,2);
V1 = HSV1(:,:,3);
subplot(2,2,1);imshow(RGB1);title('��l�Ϥ�');
subplot(2,2,2);imshow(H1);title('H');
subplot(2,2,3);imshow(S1);title('S');
subplot(2,2,4);imshow(V1);title('V');
figure;

%�ĤG�i��
RGB2 = imread('C:\Users\Tepao_Sung\Desktop\����j108-1\�q�����U�˴��P�E�_\20191002\44.tif');

R2 = RGB2(:,:,1);
G2 = RGB2(:,:,2);
B2 = RGB2(:,:,3);
subplot(2,2,1);imshow(RGB2);title('��l�Ϥ�');
subplot(2,2,2);imshow(R2);title('R');
subplot(2,2,3);imshow(G2);title('G');
subplot(2,2,4);imshow(B2);title('B');
figure;

HSV2 = rgb2hsv(RGB2);
H2 = HSV2(:,:,1);
S2 = HSV2(:,:,2);
V2 = HSV2(:,:,3);
subplot(2,2,1);imshow(RGB2);title('��l�Ϥ�');
subplot(2,2,2);imshow(H2);title('H');
subplot(2,2,3);imshow(S2);title('S');
subplot(2,2,4);imshow(V2);title('V');
