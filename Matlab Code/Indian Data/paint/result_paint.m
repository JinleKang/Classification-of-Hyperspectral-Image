load DataIndex
load realData
load color
load re.txt
re=re+1;
index1=TrainIndex';
index1=[index1;ValidIndex'];
index1=[index1;TestIndex'];

index1=index(index1);
index1=index1-1;
pic=zeros(145,145);
for i=1:length(index1)
    row=mod(index1(i),145)+1;
    colume=fix(index1(i)/145)+1;
    pic(row,colume)=re(i);
end
for i=1:145
for j=1:145
c=pic(i,j);
if(c~=0)
    plot(j+20,-i+145+20,'.','color',[color(c,1),color(c,2),color(c,3)]);
    hold on
end
end
end
xlim([0 175]);
ylim([0 175]);