load KSC
load KSC_gt

Data=KSC;
Data_gt=KSC_gt;
[row,cloum,channel]=size(Data);



Data=reshape(Data,row*cloum,channel);
Data_gt=reshape(Data_gt,row*cloum,1);

index=[];
for i=1:row*cloum
    if(Data_gt(i)~=0)
        index=[index;i];
    end
end
%----------------------------------------获取有类别点，并除燥
realData=Data(index,:);
realData_gt=Data_gt(index,:);

[num,c]=size(realData);
x=[];
for i=1:num
    for j=1:channel
        if(realData(i,j)>60000)
            x=[x,i];
        end
    end
end
x=unique(x);

realData(x(1:end),:)=[];
realData_gt(x(1:end),:)=[];
index(x(1:end),:)=[];

point_index=index;

save realData realData realData_gt point_index;



        




