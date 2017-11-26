function [d]=simp(a,b,n,f) 
% This is a program to perform parabolic integration
% INPUTS
% a= beginning of interval
% b= end of interval
% n= number of divisions
% f= anonymous function
% OUTPUTS
% d= sum of the areas of the rectangles
% written by the MathPhys class on February 6, 2017
% continued Feburary 8,2017 
% modified by Erin Goeke on February 16, 2017

%make n prime
n=n*2+1;
x=linspace(a,b,n);
%create weighting array for quadratic approximation
w = ones(size(x));
w(2:2:n-1)=4;
w(3:2:n-2)=2;
%create function array
p = 0;
y = zeros(length(n));
for p = 1:n
    y(1,p) = f(x(p));
end
%calculate width of quadratic
deltax=x(2)-x(1);
%sum using inner product
d = y*w'*deltax/3;

