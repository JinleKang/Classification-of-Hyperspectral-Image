load realData;

%----选择波段-------%
index=[97,95,92,98,101,82,64,93,60,86,99,94,58,96,83,85,84,127,139,172,114,138,91,81,37,170,126,147,185,76,167,135,151,87,53,80,196,32,128,137,173,107,100,90,115,168,184,79,143,141,1,106,199,169,6,3,174,124,134,51,50,183,190,149,154,158,160,105,120,155,148,178,102,181,140,144,186,59,195,142,104,103,132,121,150,49,52,193,171,71,146,129,145,180,182,179,43,45,13,108];
index=sort(index);
realData=realData(:,index);



TrainIndex=[];
ValidIndex=[];
TestIndex=[];



[train,valid,test]=GetExample(1,27,9,10);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(2,856,286,286);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(3,500,164,166);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(4,141,49,47);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(5,289,98,96);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(6,438,146,146);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(7,16,7,5);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(8,287,96,95);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(9,12,4,4);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(10,583,195,194);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(11,1473,492,490);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(12,356,118,119);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(13,123,42,40);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(14,759,256,250);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(15,231,77,78);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(16,56,18,19);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

%-------------------------------补充数据
len1=length(TrainIndex);
len2=length(ValidIndex);
len3=length(TestIndex);
b=zeros(1,53);
c=zeros(1,43);
d=zeros(1,55);
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

indianTrain=realData(TrainIndex,:);
indianTrain_gt=realData_gt(TrainIndex,1);
indianValid=realData(ValidIndex,:);
indianValid_gt=realData_gt(ValidIndex,1);
indianTest=realData(TestIndex,:);
indianTest_gt=realData_gt(TestIndex,1);

%----------------------------归一化
maxN=max(max(realData));
minN=min(min(realData));
indianTrain=(indianTrain-minN)/(maxN-minN);
indianValid=(indianValid-minN)/(maxN-minN);
indianTest=(indianTest-minN)/(maxN-minN);


save indianTrain indianTrain indianTrain_gt;
save indianValid indianValid indianValid_gt;
save indianTest indianTest indianTest_gt;
save DataIndex TrainIndex ValidIndex TestIndex;



    




