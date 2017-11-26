1%% Author: eggoeke <eggoeke@nephele>
%% Created: 2017-04-03
%% Help from Don

function [out] = binner (in, bin)
  floor = in(1,1); % Define time axis origin
  in(:,1) = in(:,1) - floor; % Subtract first time value from all times
  binnum = round(in(:,1)/bin-0.5); % Define an array of bin numbers for each data
  maxbin = max(binnum); % What is the highest bin number?

  out = zeros(maxbin,3); % Define the output array: time, avg, num points in bin
  out(:,1) = bin*(0:maxbin-1)'; % Define new time axis with evenly spaced points
  
  for i=0:maxbin-1 % Step through each bin
    ninbin = binnum(binnum==i); % Identify the points in this bin
    if length(ninbin>0) % If there are more than zero points in the bin
      out(i+1,3) = length(ninbin); % Number of points in the bin
      out(i+1,2) = sum(in((binnum==i),2))/out(i+1,3); % Average of all points in bin
    end
  end
  % Subtract off the average value of all bins that have points in them
  out((out(:,3)>0),2) = out((out(:,3)>0),2) - mean(out((out(:,3)>0),2)); 
  
endfunction
