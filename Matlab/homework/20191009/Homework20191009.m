RGB1 = imread('C:\Users\Tepao_Sung\Desktop\����j108-1\�q�����U�˴��P�E�_\20191002\33.tif');
[y,x]=imhist(RGB1);
subplot(2,2,1);imshow(RGB1);title('�v���j�ƫe');
subplot(2,2,2);bar(x,y);title('�v���j�ƫe-�Ȥ��');
figure;

%��k1_���Xstretchlim�P imadjust���O
limits=stretchlim(RGB1);
RGB2=imadjust(RGB1,limits,[0.1 0.9]);

%��k2_imadjust���O
RGB3=imadjust(RGB1,[0.1 0.9]);

%�Ȥ��
subplot(2,2,1);imshow(RGB2);title('��k1-�v���j�ƫ�');
[y,x]=imhist(RGB2);
subplot(2,2,2);bar(x,y);title('��k1-�Ȥ��');

subplot(2,2,3);imshow(RGB3);title('��k2-�v���j�ƫ�');
[y,x]=imhist(RGB3);
subplot(2,2,4);bar(x,y);title('��k2-�Ȥ��');
