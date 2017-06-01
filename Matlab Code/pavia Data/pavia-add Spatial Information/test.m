index=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
row=4;
cloum=5;

neigbor=[];
[c,num]=size(index);

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