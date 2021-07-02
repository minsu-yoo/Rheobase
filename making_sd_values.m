
sd_values = zeros(nCell,3);


for i = 1:nCell
    
    [param error] = fit_rho(i);
    sd_values(i,1) = param(1);
    sd_values(i,2) = param(2);
    sd_values(i,3) = error;
    
end


    