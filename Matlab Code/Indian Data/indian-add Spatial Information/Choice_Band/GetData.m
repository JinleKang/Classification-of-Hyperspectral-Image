load Indian_pines_corrected
load Indian_pines_gt

Data=indian_pines_corrected;
Data_gt=indian_pines_gt;
[row,cloum,channel]=size(Data);

%-----------------------------去除无类别的点

index1=[97,95,92,98,101,82,64,93,60,86,99,94,58,96,83,85,84,127,139,172,114,138,91,81,37,170,126,147,185,76,167,135,151,87,53,80,196,32,128,137,173,107,100,90,115,168,184,79,143,141,1,106,199,169,6,3,174,124,134,51,50,183,190,149,154,158,160,105,120,155,148,178,102,181,140,144,186,59,195,142,104,103,132,121,150,49,52,193,171,71,146,129,145,180,182,179,43,45,13,108];

Data=reshape(Data,row*cloum,channel);
Data_gt=reshape(Data_gt,row*cloum,1);
Data(:,index1)=[];

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

        




