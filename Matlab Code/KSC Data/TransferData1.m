load realData;
% load CIFAR_Data;
TrainIndex=[];
ValidIndex=[];
TestIndex=[];



[train,valid,test]=GetExample1(1,457,152,152);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(2,140,52,51);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(3,141,62,53);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(4,159,51,42);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(5,95,30,36);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(6,147,46,36);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(7,56,25,24);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(8,259,86,86);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(9,283,128,109);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(10,243,87,74);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(11,249,74,96);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(12,300,102,101);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample1(13,556,181,190);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];
%-------------------------------补充数据，随机取15个数和24个数
len1=length(TrainIndex);
len2=length(ValidIndex);
len3=length(TestIndex);
b=zeros(1,15);
c=zeros(1,24);

for i=1:15
b(i)=(int32(1+(3085-1)*rand));
end
for i=1:24
c(i)=(int32(1+(1076-1)*rand));
end

TrainIndex=[TrainIndex,TrainIndex(b)];
ValidIndex=[ValidIndex,ValidIndex(c)];

kscTrain=realData(TrainIndex,:);
kscTrain_gt=realData_gt(TrainIndex,1);
kscValid=realData(ValidIndex,:);
kscValid_gt=realData_gt(ValidIndex,1);
kscTest=realData(TestIndex,:);
kscTest_gt=realData_gt(TestIndex,1);



save kscTrain kscTrain kscTrain_gt;
save kscValid kscValid kscValid_gt;
save kscTest kscTest kscTest_gt;



    




