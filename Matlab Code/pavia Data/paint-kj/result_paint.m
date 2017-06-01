load realData
load DataIndex
load color
load re_kj.txt
re=re_kj+1;
index1=TrainIndex';
index1=[index1;ValidIndex'];
index1=[index1;TestIndex'];

index1=index(index1);
index1=index1-1;
pic=zeros(610,340);
for i=1:length(index1)
    row=mod(index1(i),610)+1;
    colume=fix(index1(i)/610)+1;
    pic(row,colume)=re(i);
end

for i=1:610
for j=1:340

c=pic(i,j);

if(c~=0)
    plot(j+20,-i+610+20,'.','color',[color(c,1),color(c,2),color(c,3)]);
     
    hold on
end
end
end

xlim([0,620]);
ylim([0,660]);