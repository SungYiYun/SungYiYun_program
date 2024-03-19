[X1, map1] = imread('C:\Users\Tepao_Sung\Desktop\雲科大108-1\電腦輔助檢測與診斷\20191002\001.tif');
RGB1 = ind2rgb(X1, map1);

R1 = RGB1(:,:,1);
G1 = RGB1(:,:,2);
B1 = RGB1(:,:,3);
subplot(2,2,1);imshow(RGB1);title('原始圖片');
hold on;
subplot(2,2,2);imshow(R1);title('R');
subplot(2,2,3);imshow(G1);title('G');
subplot(2,2,4);imshow(B1);title('B');

figure;
[X1, map1] = imread('C:\Users\Tepao_Sung\Desktop\雲科大108-1\電腦輔助檢測與診斷\20191002\001.tif');
HSV1 = rgb2hsv(RGB1);
H1 = HSV1(:,:,1);
S1 = HSV1(:,:,2);
V1 = HSV1(:,:,3);
subplot(2,2,1);imshow(RGB1);title('原始圖片');
hold on;
subplot(2,2,2);imshow(H1);title('H');
subplot(2,2,3);imshow(S1);title('S');
subplot(2,2,4);imshow(V1);title('V');