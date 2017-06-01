load DataIndex
load realData
load color
load indian_pines_gt
load re.txt
%re=re_kj;
re=re+1;
%re=original+1;
index1=TestIndex';

re=re(8301:end);
index1=index(index1);
%index1=index1-1;
pic=zeros(145,145);
ac=zeros(16,17);
for i=1:length(index1)
    if(mod(index1(i),145)==0)
        row=145;
        colume=fix(index1(i)/145);
    else
       row=mod(index1(i),145);
       colume=fix(index1(i)/145)+1;
    end
    pic(row,colume)=re(i);
    if(indian_pines_gt(row,colume)==pic(row,colume))
       ac(indian_pines_gt(row,colume),indian_pines_gt(row,colume))=ac(indian_pines_gt(row,colume),indian_pines_gt(row,colume))+1;
       
    else
      ac(indian_pines_gt(row,colume),pic(row,colume))=ac(indian_pines_gt(row,colume),pic(row,colume))+1; 
    end
    ac(indian_pines_gt(row,colume),17)=ac(indian_pines_gt(row,colume),17)+1;
end
ac=ac';

a=0;b=0;
for i=1:16
    ac(i,17)=sum(ac(i,1:16));
    a=ac(i,i)+a;
    b=(ac(i,17)*ac(17,i))+b;
    ac(i,18)=ac(i,i)/ac(i,17)*100;
    ac(18,i)=ac(i,i)/ac(17,i)*100;
end
ac(17,17)=sum(ac(17,1:16));
kappa=(ac(17,17)*a-b)/(ac(17,17)*ac(17,17)-b);
