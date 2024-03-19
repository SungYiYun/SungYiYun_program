clear all;close all;
temp=imread('grass.bmp');
figure;imshow(temp);
temp1=double(rgb2gray(temp));
[m, n]=size(temp1);
figure;imshow(temp1,[]);
%%%%%%%%%%%%%%% Image Generation Parameters
width = 64; height=64;numberOfImage=300;
%%%%%%%%%%%%%%%%%%%%%%
Partition1=ceil(0.6*numberOfImage);
Partition2=ceil(0.2*numberOfImage);
Partition3=ceil(0.2*numberOfImage);
%%%%%%%%%%%%%%%%%%%%%%%
rand('seed', 2);
Feature1=[];
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'r','LineWidth', 3);
temp2=temp1(a:a+height-1, b:b+width-1);
feature=gfeature(double(temp2),'0');
Feature1=[Feature1, feature];
end
%%%%%%%%%%%%%%%%%%%% Start the 2nd Image**********
temp=imread('wood.bmp');
figure;imshow(temp);
temp1=double(rgb2gray(temp));
[m, n]=size(temp1);
figure;imshow(temp1,[]);
Feature2=[];
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'b','LineWidth', 3);
temp2=temp1(a:a+height-1, b:b+width-1);
feature=gfeature(double(temp2),'0');
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
%%%%%% Train GRNN
%
pause
%
E_Tr=[];
E_Te=[];
x=[0.1:0.1:10];
for Sigma=0.1:0.1:10
net=newgrnn(P_Tr,T_Tr,Sigma);
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
Sigma=0.1;
net=newgrnn(P_Tr,T_Tr,Sigma);
out_Tr=round(sim(net,P_Tr),0);
out_Te=round(sim(net,P_Te),0);
out_Vali=round(sim(net,P_Vali),0);

EVAL_Train = Evaluate(T_Tr,out_Tr)
figure;plotconfusion(out_Tr, T_Tr);
EVAL_Test = Evaluate(T_Te,out_Te)
figure;plotconfusion(out_Te, T_Te);
EVAL_Vali = Evaluate(T_Vali,out_Vali)
figure;plotconfusion(out_Vali, T_Vali);

