clear all;close all;
temp=imread('grass.bmp');
figure;imshow(temp);
temp1=double(rgb2gray(temp));
% Expand Size 1x1 to  Size 4x4
temp2=[temp1 temp1;temp1 temp1];
temp3=temp2;clear temp2;
[m, n]=size(temp3);
figure;imshow(temp3,[]);
%%%%%%%%%%%%%%% Image Generation Parameters
width = 64; height=64;numberOfImage=10;
%%%%%%%%%%%%%%%%%%%%%%
Partition=ceil(0.7*numberOfImage);   % Ratio of Training Data Set, Validataion Data S
%%%%%%%%%%%%%%%%%%%%%%%
rand('seed', 3);
RawImgData1=ones(height,width,numberOfImage);
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'r','LineWidth', 3);
temp4=temp3(a:a+height-1, b:b+width-1);
RawImgData1(:,:,i)=temp4;
end
%%%%%%%%%%%%%%%%%%%% Start the 2nd Image**********
temp=imread('wood1.bmp');
figure;imshow(temp);
temp1=double(rgb2gray(temp));
% Expand Size 1x1 to  Size 4x4
temp2=[temp1, temp1;temp1, temp1];
temp3=temp2;clear temp2;
[m, n]=size(temp3);
figure;imshow(temp3,[]);
RawImgData2=ones(height,width,numberOfImage);
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'b','LineWidth', 3);
temp4=temp3(a:a+height-1, b:b+width-1);
RawImgData2(:,:,i)=temp4;
end
% End Data Acquisition
P1=RawImgData1(:,:,1:Partition);
P2=RawImgData2(:,:,1:Partition);
P_Tr=cat(3, P1, P2);
T_Tr=[zeros(1,Partition) ones(1, Partition)]';
P1=RawImgData1(:,:,Partition+1:numberOfImage);
P2=RawImgData2(:,:,Partition+1:numberOfImage);
P_Te=cat(3,P1,P2);
T_Te=[zeros(1,numberOfImage-Partition), ones(1,numberOfImage-Partition)]';

imgDataTrain(:,:,1,:) = uint8(P_Tr(:,:,:));
imgDataTest(:,:,1,:) = uint8(P_Te(:,:,:));
labelsTrain = categorical(T_Tr);
labelsTest = categorical(T_Te);
warning off images:imshow:magnificationMustBeFitForDockedFigure
figure;montage(uint8(P_Tr), 'BorderSize', 2, 'BackgroundColor', 'g')
figure;montage(uint8(P_Te), 'BorderSize', 2, 'BackgroundColor', 'g')
% End Data Preparation
    disp('Push a Key')    
    pause
%
%% Prepare the CNN
% One of the simplest possible convnets, it contains one convolutional
% layer, one ReLU, one pooling layer, and one fully connected layer
layers = [  imageInputLayer([height width 1])
            convolution2dLayer(5,20)
            reluLayer
            maxPooling2dLayer(2, 'Stride', 2)
            fullyConnectedLayer(2)
            softmaxLayer
            classificationLayer()   ]
        
%% Attempt 1: Set training options and train the network
    
    miniBatchSize = 5;
    options = trainingOptions( 'sgdm',...
        'MiniBatchSize', miniBatchSize,'MaxEpoch',12,...
        'Plots', 'training-progress');
    net = trainNetwork(imgDataTrain, labelsTrain, layers, options);
    % 
    disp('Push a Key')
    pause
    %
%% Attempt 2: Change the learning rate
    options = trainingOptions( 'sgdm',...
        'MiniBatchSize', miniBatchSize,'MaxEpoch',12,...
        'Plots', 'training-progress',...
        'InitialLearnRate', 0.0001);
    net = trainNetwork(imgDataTrain, labelsTrain, layers, options);
%% Attempt 3: Change the network architecture - no need in this example
% layers = [
%     imageInputLayer([height width 1])
%     convolution2dLayer(3,16,'Padding',1)
%     batchNormalizationLayer
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     convolution2dLayer(3,32,'Padding',1)
%     batchNormalizationLayer
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2)
%     convolution2dLayer(3,64,'Padding',1)
%     batchNormalizationLayer
%     reluLayer
%     fullyConnectedLayer(2)
%     softmaxLayer
%     classificationLayer];
%     options = trainingOptions( 'sgdm',...
%         'MiniBatchSize', miniBatchSize,...
%         'Plots', 'training-progress');
%     net = trainNetwork(imgDataTrain, labelsTrain, layers, options);
%     
%% Classify the test data set
predLabelsTest = net.classify(imgDataTest);
testAccuracy = sum(predLabelsTest == labelsTest) / numel(labelsTest)
%save('ImageClassificationDL.mat');
%% How do we classify a test image? - performance 100%, no need in this example
% Predict the class of an image
%randIndx = randi(numel(labelsTest));
%img = imgDataTest(:,:,1,randIndx);
%actualLabel = labelsTest(randIndx);
%predictedLabel = net.classify(img);
%figure;imshow(img);
%title(['Predicted: ' char(predictedLabel) ', Actual: ' char(actualLabel)])
%
    disp('Push a Key')
    pause 
%
%%Test CNN;
%close all;clear all
%load('ImageClassificationDL.mat','height','width','layers','net');
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
img=uint8(I(a:a+height-1,b:b+width-1));
out1 = net.classify(img);
hold on;
if double(out1) == 1
  plot([b b b+width b+width b],[a a+height a+height a a], 'r:','LineWidth', 3)
else
  plot([b b b+width b+width b],[a a+height a+height a a],'b:','LineWidth',3)
end
end




