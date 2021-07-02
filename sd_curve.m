function sd_curve(cellN)


load rho

figure;
plot(rho{cellN}(:,1), rho{cellN}(:,2),'*','MarkerSize', 10,...
'LineWidth', 2)

font_size = 15;
xlabel('druation(ms)')
ylabel('current(uA)') 
set(gcf,'color','w')
set(gca,'FontSize',font_size)



end