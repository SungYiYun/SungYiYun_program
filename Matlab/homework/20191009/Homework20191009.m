RGB1 = imread('C:\Users\Tepao_Sung\Desktop\雲科大108-1\電腦輔助檢測與診斷\20191002\33.tif');
[y,x]=imhist(RGB1);
subplot(2,2,1);imshow(RGB1);title('影像強化前');
subplot(2,2,2);bar(x,y);title('影像強化前-值方圖');
figure;

%方法1_結合stretchlim與 imadjust指令
limits=stretchlim(RGB1);
RGB2=imadjust(RGB1,limits,[0.1 0.9]);

%方法2_imadjust指令
RGB3=imadjust(RGB1,[0.1 0.9]);

%值方圖
subplot(2,2,1);imshow(RGB2);title('方法1-影像強化後');
[y,x]=imhist(RGB2);
subplot(2,2,2);bar(x,y);title('方法1-值方圖');

subplot(2,2,3);imshow(RGB3);title('方法2-影像強化後');
[y,x]=imhist(RGB3);
subplot(2,2,4);bar(x,y);title('方法2-值方圖');
