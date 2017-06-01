load newDa;

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

%-------------------------------²¹³äÊý¾Ý
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

indianTrain=newDa(TrainIndex,:);
indianTrain_gt=newDa_gt(TrainIndex,1);
indianValid=newDa(ValidIndex,:);
indianValid_gt=newDa_gt(ValidIndex,1);
indianTest=newDa(TestIndex,:);
indianTest_gt=newDa_gt(TestIndex,1);
%{
maxN=max(max(newDa));
minN=min(min(newDa));
indianTrain=(indianTrain-minN)/(maxN-minN);
indianValid=(indianValid-minN)/(maxN-minN);
indianTest=(indianTest-minN)/(maxN-minN);
%}
save indianTrain indianTrain indianTrain_gt;
save indianValid indianValid indianValid_gt;
save indianTest indianTest indianTest_gt;
save DataIndex TrainIndex ValidIndex TestIndex;



    




