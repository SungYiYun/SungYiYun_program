RGB1 = imread('C:/Users/Tepao_Sung/Desktop/33.tif');
imshow(RGB1)
figure;
J = histeq(RGB1);
imshow(J)