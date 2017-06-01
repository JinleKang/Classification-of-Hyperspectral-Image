load realData;
% load CIFAR_Data;
TrainIndex=[];
ValidIndex=[];
TestIndex=[];



[train,valid,test]=GetExample(1,457,152,152);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(2,140,51,50);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(3,141,62,53);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(4,159,50,42);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(5,95,30,36);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(6,147,46,36);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(7,56,25,24);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(8,259,86,86);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(9,283,128,109);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(10,228,81,68);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(11,249,74,96);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(12,276,94,92);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(13,545,177,186);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];
%-------------------------------补充数据，随机取15个数和24个数
len1=length(TrainIndex);
len2=length(ValidIndex);
len3=length(TestIndex);
b=zeros(1,65);
c=zeros(1,44);
d=zeros(1,20);
for i=1:65
b(i)=(int32(1+(3035-1)*rand));
end
for i=1:44
c(i)=(int32(1+(1056-1)*rand));
end
for i=1:20
d(i)=(int32(1+(1030-1)*rand));
end
TrainIndex=[TrainIndex,TrainIndex(b)];
ValidIndex=[ValidIndex,ValidIndex(c)];
TestIndex=[TestIndex,TestIndex(d)];

kscTrain=realData(TrainIndex,:);
kscTrain_gt=realData_gt(TrainIndex,1);
kscValid=realData(ValidIndex,:);
kscValid_gt=realData_gt(ValidIndex,1);
kscTest=realData(TestIndex,:);
kscTest_gt=realData_gt(TestIndex,1);

%------------------------归一化
maxN=max(max(realData));
kscTrain=kscTrain/maxN;
kscValid=kscValid/maxN;
kscTest=kscTest/maxN;

save kscTrain kscTrain kscTrain_gt;
save kscValid kscValid kscValid_gt;
save kscTest kscTest kscTest_gt;
save DataIndex TrainIndex ValidIndex TestIndex;



    




