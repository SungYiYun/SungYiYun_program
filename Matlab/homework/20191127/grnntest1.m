%cd D:/0Matlabfiles
close all;clear all;
I=imread('C:\Users\Tepao_Sung\Desktop\1556079835730.jpg');%figure;imshow(I);
figure;imshow(I);
hold on
% ROI Acauisition & Feature Extraction
m=30;P=[];
for i= 1:1:2
    disp('Select a normal tissue')
[b,a]=ginput(1);
b=round(b);a=round(a);
hold on;plot([b b b+m b+m b],[a a+m a+m a a],'b-','LineWidth', 3)
N1=I(a:a+m,b:b+m);
FN=gfeature(double(N1),'0');
P=[P FN];
end
for i=1:1:2
    disp('Select a microcalcification tissue')
[b,a]=ginput(1);
b=round(b);a=round(a);
hold on;plot([b b b+m b+m b],[a a+m a+m a a],'r-','LineWidth', 3)
N1=I(a:a+m,b:b+m);
FD=gfeature(double(N1),'0');
P=[P FD];
end
%P=[FN01 FN02 FD01 FD02]
P
T=[0 0 1 1]

% Train GRNN
Sigma=1;
net=newgrnn(P,T,Sigma);
out=sim(net,P);
out
accuracy=(length(T)-sum(abs(T-out>0.5)))/length(T)

% Test GRNN
while pause
    disp('Select a test tissue')
[b,a]=ginput(1);
b=round(b);a=round(a);
N1=I(a:a+m,b:b+m);
F=gfeature(double(N1),'0');
out1=sim(net,F);
out1
hold on;
if out1 > 0.5
  plot([b b b+m b+m b],[a a+m a+m a a], 'r:','LineWidth', 3)
else
  plot([b b b+m b+m b],[a a+m a+m a a],'b:','LineWidth',3)
end
end