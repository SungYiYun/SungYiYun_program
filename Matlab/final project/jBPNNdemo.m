clear all
TrainInput=[0.0052    0.0049    0.0170    0.0082; 5.4494    5.4898    4.6070    5.0939;    0.0108    0.0108    0.0581    0.0269;12.2925   11.6269   11.6075   13.5387; 0.3036    0.2987    0.3171    0.3111; 0.0289    0.0280    0.0428    0.0362];
TrainOutput=[0 0 1 1];
rng(3)
net=newff(TrainInput, TrainOutput,12);
out=sim(net,TrainInput)
net=train(net,TrainInput,TrainOutput);
out=sim(net,TrainInput)