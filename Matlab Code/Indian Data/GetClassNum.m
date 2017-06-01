load realData

num=[];
for j=1:16
    x=0;
    for i=1:10249
        if(realData_gt(i)==j)
            x=x+1;
        end
    end
    num=[num,x];
end
