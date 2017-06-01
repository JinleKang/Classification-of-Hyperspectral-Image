load PaviaU
load PaviaU_gt

Data=paviaU;
Data_gt=paviaU_gt;
[row,cloum,channel]=size(Data);

%-----------------------------去除无类别的点
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

%--------------------------------------------获取每个点的8个邻居index
neigbor=[];
[num,c]=size(realData);

for i=1:num
    a=index(i);
    if(a==1)
        b=[a+1+row,a+1,a+1+row,a+row,a+row,a+1+row,a+1,a+1+row];
    elseif(a==row)
        b=[a-1+row,a-1,a-1+row,a+row,a+row,a-1+row,a-1,a-1+row];
    elseif(a==(row*(cloum-1))+1)
        b=[a+1-row,a+1,a+1-row,a-row,a-row,a+1-row,a+1,a+1-row];
    elseif(a==row*cloum)
        b=[a-1-row,a-1,a-1-row,a-row,a-row,a-1-row,a-1,a-1-row];
    elseif(mod(a,row)==1&&a~=1&&a~=(row*(cloum-1))+1)
         b=[a+1-row,a+1,a+1+row,a-row,a+row,a+1-row,a+1,a+1+row];
    elseif(mod(a,row)==0&&a~=row&&a~=row*cloum)
        b=[a-1-row,a-1,a-1+row,a-row,a+row,a-1-row,a-1,a-1+row];
    elseif(a>1&&a<row)
        b=[a-1+row,a-1,a-1+row,a+row,a+row,a+1+row,a+1,a+1+row];
    elseif(a>(row*(cloum-1))+1&&a<row*cloum)
        b=[a-1-row,a-1,a-1-row,a-row,a-row,a+1-row,a+1,a+1-row];
    else
      b=[a-1-row,a-1,a-1+row,a-row,a+row,a+1-row,a+1,a+1+row];
    end
      neigbor=[neigbor;b];
end
save realData realData realData_gt index neigbor;

newData_gt=realData_gt;
newData=[];

for i=1:num
    a=realData(i,:);
    for j=1:8
        a=[a,Data(neigbor(i,j),:)];
    end
    newData=[newData;a];       
end

save newData newData newData_gt;
disp('finish');
            
        
          
      
        









save realData realData realData_gt index neigbor;
%--------------------------------------------加入邻居高光谱数据
newData_gt=realData_gt;
newData=[];

for i=1:num
    a=realData(i,:);
    for j=1:8
        a=[a,Data(neigbor(i,j),:)];
    end
    newData=[newData;a];       
end

save newData newData newData_gt

        




