load newData

maxN=max(max(newData));
minN=min(min(newData));
newData=(newData-minN)/maxN;

d=3;
r=0.1;
rel=zeros(9,1);
w=[0;2;1;2;1;1;2;1;2];
neigbor=zeros(9,1);
dw=zeros(9,1);
[n1,n2]=size(newData);
n3=200;
newDa=zeros(n1,n3);
for i=1:n1
    for j=1:n3
        for k=1:8
            neigbor(k+1)=newData(i,n3*k+j);
            rel(k+1)=(newData(i,j)-newData(i,n3*k+j))^2;
        end
        neigbor(1)=newData(i,j);
        %dw=exp(-(w/(2*d*d))-(rel/(2*r*r)));
        dw=exp(-(w/(2*d*d))-rel);
        g=sum(neigbor.*dw)/sum(dw);
        newDa(i,j)=g;
    end
end
newDa_gt=newData_gt;
save newDa newDa newDa_gt;
        
