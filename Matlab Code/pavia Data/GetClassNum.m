load realData

num=[];
for j=1:9
    x=0;
    for i=1:42776
        if(realData_gt(i)==j)
            x=x+1;
        end
    end
    num=[num,x];
end
