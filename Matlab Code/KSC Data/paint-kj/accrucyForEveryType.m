load index
load DataIndex
load KSC_gt
load color
load re_kj.txt

re=re_kj+1;
index1=TestIndex';
%index1=[index1;ValidIndex'];
%index1=[index1;TestIndex'];
re=re(3901:end);
ac=zeros(13,14);
index1=index(index1);
index1=index1-1;
pic=zeros(512,614);
for i=1:length(index1)
    row=mod(index1(i),512)+1;
    colume=fix(index1(i)/512)+1;
    pic(row,colume)=re(i);
    
    if(KSC_gt(row,colume)==pic(row,colume))
      ac(KSC_gt(row,colume),KSC_gt(row,colume))=ac(KSC_gt(row,colume),KSC_gt(row,colume))+1;
    else
      ac(KSC_gt(row,colume),pic(row,colume))=ac(KSC_gt(row,colume),pic(row,colume))+1;
    end
    ac(KSC_gt(row,colume),14)=ac(KSC_gt(row,colume),14)+1;
end
ac=ac';

a=0;b=0;
for i=1:13
    ac(i,14)=sum(ac(i,1:13));
    a=ac(i,i)+a;
    b=(ac(i,14)*ac(14,i))+b;
    ac(i,15)=ac(i,i)/ac(i,14)*100;
    ac(15,i)=ac(i,i)/ac(14,i)*100;
end
ac(14,14)=sum(ac(14,1:13));
kappa=(ac(14,14)*a-b)/(ac(14,14)*ac(14,14)-b);

