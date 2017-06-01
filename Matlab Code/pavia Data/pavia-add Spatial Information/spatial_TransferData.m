load newDa;

TrainIndex=[];
ValidIndex=[];
TestIndex=[];



[train,valid,test]=GetExample(1,3978,1326,1327);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(2,11189,3730,3730);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(3,1259,420,420);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(4,1838,613,613);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(5,807,269,269);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(6,3017,1006,1006);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(7,798,266,266);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(8,2208,737,737);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

[train,valid,test]=GetExample(9,568,190,189);
TrainIndex=[TrainIndex,train];
ValidIndex=[ValidIndex,valid];
TestIndex=[TestIndex,test];

%-------------------------------补充数据，随机取15个数和24个数
len1=length(TrainIndex);
len2=length(ValidIndex);
len3=length(TestIndex);
b=zeros(1,38);
c=zeros(1,43);
d=zeros(1,43);
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

paviaTrain=newDa(TrainIndex,:);
paviaTrain_gt=newDa_gt(TrainIndex,1);
paviaValid=newDa(ValidIndex,:);
paviaValid_gt=newDa_gt(ValidIndex,1);
paviaTest=newDa(TestIndex,:);
paviaTest_gt=newDa_gt(TestIndex,1);

%----------------------归一化
%{
maxN=max(max(newDa));
minN=min(min(newDa));
paviaTrain=(paviaTrain-minN)/(maxN-minN);
paviaValid=(paviaValid-minN)/(maxN-minN);
paviaTest=(paviaTest-minN)/(maxN-minN);
%}

save paviaTrain paviaTrain paviaTrain_gt;
save paviaValid paviaValid paviaValid_gt;
save paviaTest paviaTest paviaTest_gt;
save DataIndex TrainIndex ValidIndex TestIndex;



    




