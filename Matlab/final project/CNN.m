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
width = 64; height=64;numberOfImage=300;
%%%%%%%%%%%%%%%%%%%%%%
Partition1=ceil(0.6*numberOfImage);
Partition2=ceil(0.2*numberOfImage);
Partition3=ceil(0.2*numberOfImage);
%%%%%%%%%%%%%%%%%%%%%%%
rand('seed', 2);
RawImgData1=ones(height,width,numberOfImage);
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'r','LineWidth', 3);
temp4=temp3(a:a+height-1, b:b+width-1);
RawImgData1(:,:,i)=temp4;
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
RawImgData2=ones(height,width,numberOfImage);
for i=1:numberOfImage
a=ceil(rand*(m-height));
b=ceil(rand*(n-width));
hold on; plot([b b b+width b+width b],[a a+height a+height a a],'b','LineWidth', 3);
temp4=temp3(a:a+height-1, b:b+width-1);
RawImgData2(:,:,i)=temp4;
end

% End Data Acquisition
P1=RawImgData1(:,:,1:Partition1);
P2=RawImgData2(:,:,1:Partition1);
P_Tr=cat(3, P1, P2);
T_Tr=[zeros(1,Partition1) ones(1, Partition1)]';
P1=RawImgData1(:,:,Partition1+1:Partition1+Partition2);
P2=RawImgData2(:,:,Partition1+1:Partition1+Partition2);
P_Te=cat(3, P1, P2);
T_Te=[zeros(1,numberOfImage-(Partition1+Partition3)) ones(1,numberOfImage-(Partition1+Partition3))]';
P1=RawImgData1(:,:,Partition1+Partition2+1:numberOfImage);
P2=RawImgData2(:,:,Partition1+Partition2+1:numberOfImage);
P_Vali=cat(3, P1, P2);
T_Vali=[zeros(1,numberOfImage-(Partition1+Partition2)) ones(1, numberOfImage-(Partition1+Partition2))]';


imgDataTrain(:,:,1,:) = uint8(P_Tr(:,:,:));
imgDataTest(:,:,1,:) = uint8(P_Te(:,:,:));
imgDataVali(:,:,1,:) = uint8(P_Vali(:,:,:));
labelsTrain = categorical(T_Tr);
labelsTest = categorical(T_Te);
labelsVali = categorical(T_Vali);
warning off images:imshow:magnificationMustBeFitForDockedFigure
figure;montage(uint8(P_Tr), 'BorderSize', 2, 'BackgroundColor', 'g')
figure;montage(uint8(P_Te), 'BorderSize', 2, 'BackgroundColor', 'g')
figure;montage(uint8(P_Vali), 'BorderSize', 2, 'BackgroundColor', 'g')
% End Data Preparation
    disp('Push a Key')    
    pause
%
%% Prepare the CNN
% One of the simplest possible convnets, it contains one convolutional
% layer, one ReLU, one pooling layer, and one fully connected layer
% layers = [  imageInputLayer([height width 1])
%             convolution2dLayer(5,20)
%             reluLayer
%             maxPooling2dLayer(2, 'Stride', 2)
%             fullyConnectedLayer(2)
%             softmaxLayer
%             classificationLayer()   ]
%         
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
miniBatchSize = 10;
layers = [
    imageInputLayer([height width 1])
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,64,'Padding',1)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];
    options = trainingOptions( 'sgdm',...
        'MiniBatchSize', miniBatchSize,'MaxEpoch',10,...
        'Plots', 'training-progress','InitialLearnRate', 0.001);
    net = trainNetwork(imgDataTrain, labelsTrain, layers, options);
%     
%% Classify the test data set
predLabelsTrain = net.classify(imgDataTrain);
tainAccuracy = sum(predLabelsTrain == labelsTrain) / numel(labelsTrain)
predLabelsTest = net.classify(imgDataTest);
testAccuracy = sum(predLabelsTest == labelsTest) / numel(labelsTest)
predLabelsVali = net.classify(imgDataVali);
valiAccuracy = sum(predLabelsVali == labelsVali) / numel(labelsVali)


figure;plotconfusion(predLabelsTrain,labelsTrain);
figure;plotconfusion(predLabelsTest,labelsTest);
figure;plotconfusion(predLabelsVali,labelsVali);







