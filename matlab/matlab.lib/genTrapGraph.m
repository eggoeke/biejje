% INPUTS
% f = function to integrate in form @(x)1
% a = lower limit of function integral
% b = upper limit of function integral
% lowlim = lower limit of n trapezoids to evaluate for integral && < 2
% uplim = upper limit of n trapezoids to evaluate for integral
% res = step size for evaluating from lower limit to upper limit for
% the number of trapezoids
% OUTPUTs
% Graph containing three subplots of the converge of the for loop, sum,
% and vectorize method of calculating the integral through summing trapezoids
% Author: eggoeke <eggoeke@nephele>
% Created: 2017-02-06

function [] = genTrapGraph(f, a, b, lowlim, uplim, res)
% define the difference between upper and lower limit
dif = uplim - lowlim;
% disallow the upper limit to be greater than the lower limit
if(dif > 0)
% if the resolution is greater than the difference than make it the same size
  if(res > dif)
    disp('Choosing a resolution equivelant to interval')
    res = dif;
% if the resolution is not a factor of the interval enter if loop
  elseif(rem(dif,res) != 0)
% search for a factor of the interval by checking to see if there is
% a factor greater than the given resolution. If the interval is primes
% the resolution is the interval length 
    while(rem(dif,res) != 0)
% a little redundant as it is only used for the first term
% however it doesn't impede performance too much and I'm a little lazy
        if(rem(dif,(res-1))==0)
           res = res-1;
           break 
        elseif(rem(dif,(res+1))==0)
           res = res+1;
           break    
        else 
          res = res+1;
        end
     end
  end
% Add one to the resolution so that x contains only integers
  res = res+1;
% Create a linear space for the x of our graph (number of trapezoids)
  x = linspace(lowlim, uplim, res);
% Allocate space for the ranges of our plots
  y = zeros(res,3);
% Match the matrix given by the trap function to our range
  for i = 1:res
    dontresusevariablenamesstupid = trap(f,a,b,x(i));
% For loop method
    y(i,1) = dontresusevariablenamesstupid(1,1);
% Sum method
    y(i,2) = dontresusevariablenamesstupid(1,2);
% Vectorized method
    y(i,3) = dontresusevariablenamesstupid(1,3);
  end
% Graph the three functions to the plot in red, green and blue
  figure
  ax1 = subplot(1,3,1);
  ax2 = subplot(1,3,2);
  ax3 = subplot(1,3,3);
  loglog(ax1,x,y(1:res,1),'g')
    axis([ax1 ax2],[lowlim uplim -10 10])
    xlabel('Number of trapezoids')
    ylabel('Method output')
    title('For loop integration')

  plot(ax2,x,y(1:res,2),'r')
    axis([ax1 ax2],[lowlim uplim -10 10])
    xlabel('Number of trapezoids')
    ylabel('Method output')
    title('Sum integration')

  loglog(ax3,x,y(1:res,3),'b')
    axis([ax1 ax2],[lowlim uplim -10 10])
    xlabel('Number of trapezoids')
    ylabel('Method output')
    title('Vectorized integration')

else
  x = 'Please make sure your lower limit is less than your upper limit';
  disp(x)
end

endfunction
