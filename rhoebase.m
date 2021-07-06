
rawData = xlsread('Sample_DATA_for_SD_curve_CSK.xlsx');  

%remove the non-number columns 
rawData(:,[2,4,6,8,10,12,14]) = [];

%toal number of cells in the data set 
nCell = size(rawData,1);

d1 = rawData(1,4:8); % take duration columns in the data set

rho = cell(nCell,1); % initialize the cell data structure
%it contains arrays.

% data structure reformation
for i =1:nCell
    
    current = [rawData(i,1:3) [10 15 20 25 30]];  
    duration = [[500 1000 2000] rawData(i,4:8)];
    [ordered_duration index] = sort(duration);
    ordered_current = current(index);
    
    rho{i} = [ordered_duration' ordered_current'];
    
end


save rho  %save the result as a file. 

