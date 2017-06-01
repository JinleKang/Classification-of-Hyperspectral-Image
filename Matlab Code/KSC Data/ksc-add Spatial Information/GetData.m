load KSC
load KSC_gt

Data=KSC;
Data_gt=KSC_gt;
[row,cloum,channel]=size(Data);

%-----------------------------去除边界点和无类别的点
i=[1,row];
for j=1:cloum
    Data_gt(i,j)=-1;
end
i=[1,cloum];
for j=1:row
    Data_gt(j,i)=-1;
end

Data=reshape(Data,row*cloum,channel);
Data_gt=reshape(Data_gt,row*cloum,1);

index=[];
for i=1:row*cloum
    if(Data_gt(i)~=0&&Data_gt(i)~=-1)
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


%--------------------------------------------获取每个点的8个邻居index
neigbor=[];
[num,c]=size(realData);

for i=1:num
    a=index(i);
    b=[a-1-row,a-1,a-1+row,a-row,a+row,a+1-row,a+1,a+1+row];
    neigbor=[neigbor;b];
end

save realData realData realData_gt index neigbor;
%--------------------------------------------加入邻居高光谱数据
newData_gt1=realData_gt;
newData1=[];

for i=1:num
    a=realData(i,:);
    for j=1:8
        a=[a,Data(neigbor(i,j),:)];
    end
    newData1=[newData1;a];       
end
%--------------------------------------若点的邻居存在噪声数据，则去掉该点
x=[];
for i=1:num
    for j=1:channel*9
        if(newData1(i,j)>60000)
            x=[x,i];
        end
    end
end
newData1(x(1:end),:)=[];
newData_gt1(x(1:end),:)=[];

save newData1 newData1 newData_gt1

        




