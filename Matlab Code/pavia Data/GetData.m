load PaviaU
load PaviaU_gt

Data=paviaU;
Data_gt=paviaU_gt;
[row,cloum,channel]=size(Data);




Data=reshape(Data,row*cloum,channel);
Data_gt=reshape(Data_gt,row*cloum,1);

index=[];
for i=1:row*cloum
    if(Data_gt(i)~=0)
        index=[index;i];
    end
end
%----------------------------------------获取有类别点
realData=Data(index,:);
realData_gt=Data_gt(index,:);
point_index=index;
save realData realData realData_gt point_index;



        




