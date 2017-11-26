function plotfou(x,funky,p,a,b)
% This program plots a function as well as the terms in a fourier
%   series (that have been calculated previously by another function
% Written by Don Smith 2/22/2017
% Editted by eggoeke on 3/14/17

% INPUTS
%  x = the array of x-values over which the function will be plotted
%  funky = the name of the function.  There must be a file funky.m
%  p = the array of parameters that the function funky needs
%  a = the array of "a" fourier coefficients
%  b = the array of "b" fourier coefficients

% grab array of function approximating and plot
y = feval(funky,x,p);
plot(x,y,'k')
hold on
% make arrays for containing the cosine and sine terms
zc = zeros(size(x));
zs = zeros(size(x));
 
% the first one for cosine is always weird: half a0
zc = zc + a(1)/2;

% create and add up the cosine terms
for n=2:length(a)
     term = a(n)*cos((n-1)*2*pi*x/(x(length(x))-x(1)));
     zc = zc + term;
end

% create and add up the sine terms
for n=1:length(b)
      term = b(n)*sin(n*2*pi*x/(x(length(x))-x(1)));
      zs = zs + term;
end

% add together the two for the approximation
total = zc + zs;

% plot the approximation
plot(x,total,'r')

hold off
end