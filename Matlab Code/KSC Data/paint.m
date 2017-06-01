load KSC
load KSC_gt
load color

Data=KSC;
Data_gt=KSC_gt;

for i=1:512
for j=1:614
index=Data_gt(i,j);
if(index~=0)
plot(j,-i+512,'.','color',[color(index,1),color(index,2),color(index,3)]);
hold on
end
end
end

xlim([0 634]);
ylim([0 634]);