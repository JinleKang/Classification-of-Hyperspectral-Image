function [TrainIndex,ValidIndex,TestIndex]= GetExample1( index,trainNum,validNum,testNum)
load realData;

%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x1=[];


for i=1:5211
if(realData_gt(i)==index)
x1=[x1,i];
end
end
chose=x1(randperm(length(x1)));
TrainIndex=chose(1:trainNum);
ValidIndex=chose(trainNum+1:trainNum+validNum);
TestIndex=chose(trainNum+validNum+1:trainNum+validNum+testNum);

end

