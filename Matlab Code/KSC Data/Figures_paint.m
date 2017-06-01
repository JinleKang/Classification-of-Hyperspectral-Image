

ksc=(100-ksc)/100;
pavia=(100-pavia)/100;
indian=(100-indian)/100;
level=[0.0 0.1 0.2 0.3 0.4 0.5]
plot(level,ksc,'*-b',level,pavia,'o-r',level,indian,'.-g')
legend('KSC data','Pavia data','Indian data');
set(legend,'FontSize',7)
xlabel('Corrupted level ');
ylabel('Accuracy ');
axis([0 0.5 0.6 1.0]);
set(gca,'XTick',0:0.1:0.5);

% bar(y);
% legend('KSC data','Pavia data','Indian data','Location','bestoutside');
% axis([0 6 0.5 1.0]);
% set(legend,'FontSize',7)
% ylabel('Accuracy ');
% xlabel('Number of hidden layers ');