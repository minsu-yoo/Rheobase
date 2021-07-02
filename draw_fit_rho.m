function [fitted_params, error] = draw_fit_rho(cellN)


figure 
load rho

xdata = rho{cellN}(:,1); %duration array 
ydata = rho{cellN}(:,2); %current array


%Assigning parameters to optimize (ex. param(1) param(2))
% in the given equation
predicted = @(param,xdata) param(1)*(1+(param(2)./xdata));

% It helps the program to find easier with considerated intial values
param_initial = [10 1000];


%fitting happens here.
[fitted_params error]= lsqcurvefit(predicted, param_initial, xdata, ydata);


% Now, with the fitted parameters let's draw a fitted line.  
xpoints = linspace(0,2000,1000);
ypoints = fitted_params(1)*(1+(fitted_params(2)./xpoints));

fitted_params(1); %This is the fitted parameter!
fitted_params(2); %This is the fitted parameter!
error;

% Let's make it look better
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
title(['RGC #' num2str(cellN)]);


%line([fitted_params(2),fitted_params(2)],[0,30])
end




