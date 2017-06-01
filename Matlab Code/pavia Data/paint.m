load color
load PaviaU
load PaviaU_gt

Data=paviaU;
Data_gt=paviaU_gt;

for i=1:610
for j=1:340
index=Data_gt(i,j);
if(index~=0)
plot(j+20,-i+610+20,'.','color',[color(index,1),color(index,2),color(index,3)]);
hold on
end
end
end
xlim([0,620]);
ylim([0,660]);