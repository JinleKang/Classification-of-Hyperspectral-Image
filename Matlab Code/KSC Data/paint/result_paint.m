load index
load DataIndex
load color
load re.txt
re=re+1;
index1=TrainIndex';
index1=[index1;ValidIndex'];
index1=[index1;TestIndex'];

index1=index(index1);
index1=index1-1;
pic=zeros(512,614);
for i=1:length(index1)
    row=mod(index1(i),512)+1;
    colume=fix(index1(i)/512)+1;
    pic(row,colume)=re(i);
end

for i=1:512
for j=1:614

c=pic(i,j);

if(c~=0)
    plot(j,-i+512,'.','color',[color(c,1),color(c,2),color(c,3)]);
    hold on
end
end
end
xlim([0 634]);
ylim([0 634]);