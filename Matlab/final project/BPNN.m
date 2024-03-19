clear all;close all;
temp=imread('grass.bmp');
figure;imshow(temp);
temp1=double(rgb2gray(temp));
% Expand Size 1x1 to  Size 4x4
temp2=[temp1 temp1 temp1;temp1 temp1 temp1;temp1 temp1 temp1];
temp3=temp2;clear temp2;
[m, n]=size(temp3);
figure;imshow(temp3,[]);

%%%%%%%%%%%%%%% Image Generation Parameters
width = 64; height=64;numberOfImage=200;

Partition1=ceil(0.6*numberOfImage);
Partition2=ceil(0.2*numberOfImage);
Partition3=ceil(0.2*numberOfImage);
%%%%%%%%%%%%%%%%%%%%%%%

rand('seed',2);
Feature1=[];
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'r','LineWidth', 3);
temp4=temp3(a:a+height-1, b:b+width-1);
feature=gfeature(double(temp4),'0');
Feature1=[Feature1, feature];
end
% Start the 2nd Image
temp=imread('wood.bmp');
figure;imshow(temp);
temp1=double(rgb2gray(temp));
% Expand Size 1x1 to  Size 4x4
temp2=[temp1, temp1,temp1;temp1, temp1,temp1;temp1, temp1,temp1];
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
P1=Feature1(:,1:Partition1);
P2=Feature2(:,1:Partition1);
P_Tr=[P1 P2];
T_Tr=[zeros(1,Partition1) ones(1, Partition1)];
P1=Feature1(:,Partition1+1:Partition1+Partition2);
P2=Feature2(:,Partition1+1:Partition1+Partition2);
P_Te=[P1 P2];
T_Te=[zeros(1,numberOfImage-(Partition1+Partition3)), ones(1,numberOfImage-(Partition1+Partition3))];
P1=Feature1(:,Partition1+Partition2+1:numberOfImage);
P2=Feature2(:,Partition1+Partition2+1:numberOfImage);
P_Vali=[P1 P2];
T_Vali=[zeros(1,numberOfImage-(Partition1+Partition2)), ones(1,numberOfImage-(Partition1+Partition2))];

%%
%pause
%%
E_Tr=[];
E_Te=[];
E_Vali=[];
x=[1:1:40];
for node=1:1:40
rng(3,'v4')
net=newff(P_Tr,T_Tr,node);
out_Tr=sim(net,P_Tr);
err_Tr=immse(T_Tr,out_Tr);
E_Tr=[E_Tr err_Tr];
out_Te=sim(net,P_Te);
err_Te=immse(T_Te,out_Te);
E_Te=[E_Te err_Te];
end
figure;plot(x, E_Tr,'b-');hold on;plot(x, E_Te,'r');plot(x, E_Tr+E_Te,'g');
%%
pause
%%
node=12;
net=newff(P_Tr,T_Tr,node);
 
out_Tr=sim(net,P_Tr);
out_Te=sim(net,P_Te);
out_Vali=sim(net,P_Vali);
figure;plotconfusion(T_Tr,out_Tr,'Training')
figure;plotconfusion(T_Te,out_Te,'Testing')
figure;plotconfusion(T_Vali,out_Vali,'Vali')