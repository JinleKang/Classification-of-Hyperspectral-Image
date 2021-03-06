load newData1;
% load CIFAR_Data;
TrainIndex=[];
ValidIndex=[];
TestIndex=[];



[train,valid,test]=GetExample(1,457,152,152);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(2,136,46,45);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(3,153,52,51);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(4,144,48,48);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(5,96,33,32);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(6,137,46,46);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(7,63,21,21);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(8,255,86,85);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(9,312,104,104);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(10,179,60,60);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(11,252,84,83);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(12,206,68,69);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(13,480,160,159);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];
%-------------------------------补充数据，随机取15个数和24个数
len1=length(TrainIndex);
len2=length(ValidIndex);
len3=length(TestIndex);
b=zeros(1,30);
c=zeros(1,40);
d=zeros(1,45);
for i=1:length(b)
b(i)=(int32(1+(len1-1)*rand));
end
for i=1:length(c)
c(i)=(int32(1+(len2-1)*rand));
end
for i=1:length(d)
d(i)=(int32(1+(len3-1)*rand));
end
TrainIndex=[TrainIndex,TrainIndex(b)];
ValidIndex=[ValidIndex,ValidIndex(c)];
TestIndex=[TestIndex,TestIndex(d)];

kscTrain=newData1(TrainIndex,:);
kscTrain_gt=newData_gt1(TrainIndex,1);
kscValid=newData1(ValidIndex,:);
kscValid_gt=newData_gt1(ValidIndex,1);
kscTest=newData1(TestIndex,:);
kscTest_gt=newData_gt1(TestIndex,1);

maxN=max(max(newData1));
kscTrain=kscTrain/maxN;
kscValid=kscValid/maxN;
kscTest=kscTest/maxN;

save kscTrain kscTrain kscTrain_gt;
save kscValid kscValid kscValid_gt;
save kscTest kscTest kscTest_gt;
save DataIndex TrainIndex ValidIndex TestIndex;



    




