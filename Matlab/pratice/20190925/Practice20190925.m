load trees;
RGB = ind2rgb(X,map);
subplot(2,2,1);imshow(RGB)
hold on;
subplot(2,2,2);imshow(RGB(:,:,1))
subplot(2,2,3);imshow(RGB(:,:,2))
subplot(2,2,4);imshow(RGB(:,:,3))

HSV = rgb2hsv(RGB);
figure;
subplot(2,2,2);imshow(HSV(:,:,1))
hold on;
subplot(2,2,3);imshow(HSV(:,:,2))
subplot(2,2,4);imshow(HSV(:,:,3))

z=RGB(:,1,:);
size(z)
zs=squeeze(z);
size(zs)

az=RGB(1,:,:);
azs=squeeze(az);

sz=RGB(:,1,:);
szs=squeeze(sz);

X(1:5,1:5)