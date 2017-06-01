load newData1

maxN=max(max(newData1));
minN=min(min(newData1));
newData1=(newData1-minN)/maxN;

d=3;
r=0.1;
rel=zeros(9,1);
w=[0;2;1;2;1;1;2;1;2];
neigbor=zeros(9,1);
dw=zeros(9,1);
newd=zeros(4785,176);
for i=1:4785
    for j=1:176
        for k=1:8
            neigbor(k+1)=newData1(i,176*k+j);
            rel(k+1)=(newData1(i,j)-newData1(i,176*k+j))^2;
        end
        neigbor(1)=newData1(i,j);
        %dw=exp(-(w/(2*d*d))-(rel/(2*r*r)));
        dw=exp(-(w/(2*d*d))-rel);
        g=sum(neigbor.*dw)/sum(dw);
        newd(i,j)=g;
    end
end
newd_gt=newData_gt1;
save newd newd newd_gt;


        
