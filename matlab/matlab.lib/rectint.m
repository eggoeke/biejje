function [s]=rectint(a,b,n,f) 
% This is a program to perform rectangular integration
% INPUTS
% a= beginning of interval
% b= end of interval
% n= number of divisions
% f= anonymous function
% OUTPUTS
% s= sum of the areas of the rectangles
% written by the MathPhys class on February 2, 2017
% modified by Erin Goeke on February 16, 2017
x=linspace(a,b,n);
%create base length for rectangle
deltax=x(2)-x(1);
p = 0;
%make array for function
for p = 1:n
    y(1,p) = f(x(p));
end
%sum rectangles
s=sum(y(1:n-1))*deltax;
end
