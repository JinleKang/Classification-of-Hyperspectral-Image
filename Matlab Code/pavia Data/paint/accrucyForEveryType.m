load realData
load DataIndex
load color
load PaviaU_gt
load re.txt
%re=re_kj;
re=re+1;
re=re(34301:end);
index1=TestIndex';
%index1=[index1;ValidIndex'];
%index1=[index1;TestIndex'];

index1=index(index1);
%ndex1=index1-1;
pic=zeros(610,340);
ac=zeros(9,10);
for i=1:length(index1)
    if(mod(index1(i),610)==0)
        row=610;
        colume=fix(index1(i)/610);
    else
       row=mod(index1(i),610);
       colume=fix(index1(i)/610)+1;
    end
    
    
    pic(row,colume)=re(i);
    if(paviaU_gt(row,colume)==pic(row,colume))
          ac(paviaU_gt(row,colume),paviaU_gt(row,colume))=ac(paviaU_gt(row,colume),paviaU_gt(row,colume))+1;
    else
            ac(paviaU_gt(row,colume),pic(row,colume))=ac(paviaU_gt(row,colume),pic(row,colume))+1;
    end
    ac(paviaU_gt(row,colume),10)=ac(paviaU_gt(row,colume),10)+1;
end
ac=ac';


a=0;b=0;
for i=1:9
    ac(i,10)=sum(ac(i,1:9));
    a=ac(i,i)+a;
    b=(ac(i,10)*ac(10,i))+b;
    ac(i,11)=ac(i,i)/ac(i,10)*100;
    ac(11,i)=ac(i,i)/ac(10,i)*100;
end
ac(10,10)=sum(ac(10,1:9));
kappa=(ac(10,10)*a-b)/(ac(10,10)*ac(10,10)-b);
