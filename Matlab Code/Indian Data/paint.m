load Indian_pines_corrected
load Indian_pines_gt
load color

Data=indian_pines_corrected;
Data_gt=indian_pines_gt;

for i=1:145
for j=1:145
index=Data_gt(i,j);
if(index~=0)
plot(j+20,-i+145+20,'.','color',[color(index,1),color(index,2),color(index,3)]);
hold on
end
end
end

xlim([0 175]);
ylim([0 175]);