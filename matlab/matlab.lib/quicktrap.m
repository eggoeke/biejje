function [d]=quicktrap(a,b,n,f) 
% This is a program to perform rectangular integration
% INPUTS
% a= beginning of interval
% b= end of interval
% n= number of divisions
% f= anonymous function
% OUTPUTS
% s= sum of the areas of the rectangles
% written by the MathPhys class on February 6, 2017
% modified by....on...to do...

x=linspace(a,b,n);
%make weighting array (coefficient values for summation terms)
w = ones(size(x));
w(1) = .5;
w(n) = .5;
%create function array
p = 0;
for p = 1:n
    y(1,p) = f(x(p));
end
deltax=x(2)-x(1);
%use inner product to sum trapezoids
d = y*w'*deltax;
end
