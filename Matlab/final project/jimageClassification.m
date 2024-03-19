clear all;close all;
temp=imread('pigskin.bmp');
figure;imshow(temp);
temp1=double(rgb2gray(temp));
% Expand Size 1x1 to  Size 4x4
temp2=[temp1 temp1;temp1 temp1];
temp3=temp2;clear temp2;
[m, n]=size(temp3);
figure;imshow(temp3,[]);
%%%%%%%%%%%%%%% Image Generation Parameters
width = 64; height=64;numberOfImage=50;
%%%%%%%%%%%%%%%%%%%%%%
Partition=ceil(0.7*numberOfImage);   % Ratio of Training Data Set, Validataion Data S
%%%%%%%%%%%%%%%%%%%%%%%
rand('seed', 3);
Feature1=[];
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'r','LineWidth', 3);
temp4=temp3(a:a+height-1, b:b+width-1);
feature=gfeature(double(temp4),'0');
Feature1=[Feature1, feature];
end
%%%%%%%%%%%%%%%%%%%% Start the 2nd Image**********
temp=imread('wood.bmp');
figure;imshow(temp);
temp1=double(rgb2gray(temp));
% Expand Size 1x1 to  Size 4x4
temp2=[temp1, temp1;temp1, temp1];
temp3=temp2;clear temp2;
[m, n]=size(temp3);
figure;imshow(temp3,[]);
Feature2=[];
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'b','LineWidth', 3);
temp4=temp3(a:a+height-1, b:b+width-1);
feature=gfeature(double(temp4),'0');
Feature2=[Feature2, feature];
end
% End Feature Extraction
P1=Feature1(:,1:Partition);
P2=Feature2(:,1:Partition);
P_Tr=[P1 P2];
T_Tr=[zeros(1,Partition) ones(1, Partition)];
P1=Feature1(:,Partition+1:numberOfImage);
P2=Feature2(:,Partition+1:numberOfImage);
P_Te=[P1 P2];
T_Te=[zeros(1,numberOfImage-Partition), ones(1,numberOfImage-Partition)];

%%%%%% Train GRNN
%
pause
%
A_Tr=[];
A_Te=[];
x=[0.1:0.1:4];
for Sigma=0.1:0.1:4;
net=newgrnn(P_Tr,T_Tr,Sigma);
out=sim(net,P_Tr);
accuracyTr=(length(T_Tr)-sum(abs(T_Tr-out>0.5)))/length(T_Tr);
A_Tr=[A_Tr accuracyTr];
out=sim(net,P_Te);
accuracyTe=(length(T_Te)-sum(abs(T_Te-out>0.5)))/length(T_Te);
A_Te=[A_Te accuracyTe];
end
figure;plot(x, A_Tr,'b-');hold on;plot(x, A_Te,'r');plot(x, A_Tr+A_Te,'g');
%%
pause
%%
Sigma=0.25;
net=newgrnn(P_Tr,T_Tr,Sigma);
%save('ImageClassification.mat');

%%Test Grnn ----Sigma=0.25;net=newgrnn(P_Tr,T_Tr,Sigma);
%close all;clear all
%load('ImageClassification.mat', 'net','height','width');
temp=imread('pigskin.bmp');
temp1=double(rgb2gray(temp));
temp=imread('wood.bmp');
temp2=double(rgb2gray(temp));
temp1=temp1(:,1:188);
I=[temp1 temp1;temp1 temp1;temp2 temp2;temp2 temp2];
figure;imshow(I,[])
while pause  
    disp('Select a test point')
[b,a]=ginput(1);
b=round(b);a=round(a);
N1=I(a:a+height-1,b:b+width-1);
F=gfeature(double(N1),'0');
out1=sim(net,F);
hold on;
if out1 > 0.5
  plot([b b b+width b+width b],[a a+height a+height a a], 'b:','LineWidth', 3)
else
  plot([b b b+width b+width b],[a a+height a+height a a],'r:','LineWidth',3)
end
end


