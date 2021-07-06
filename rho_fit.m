


close all
load rho

xdata = rho{2}(:,1);
ydata = rho{2}(:,2);



predicted = @(param,xdata) param(1)*(1+(param(2)./xdata));



param_initial = [100 15];


fitted_params = lsqcurvefit(predicted, param_initial, xdata, ydata);


%function estim_y = fun(fitted_params, xvalue)

%estim_y = fitted_params(1)*(1+(fitted_params(2)/xvalue));

%end


xpoints = linspace(0,2000,1000);
ypoints = fitted_params(1)*(1+(fitted_params(2)./xpoints));

fitted_params(1)
fitted_params(2)

f_size = 15;
plot(xpoints,ypoints, '-c','LineWidth', 3)
hold on
plot(xdata,ydata,'r*','MarkerSize', 10,...
'LineWidth', 1) 
ylim([0 30])
set(gcf,'color','w')
set(gca,'FontSize',f_size)
xlabel('duration(ms)')
ylabel('threshold(uA)') 

%line([0,2000],[fitted_params(1),fitted_params(1)])



