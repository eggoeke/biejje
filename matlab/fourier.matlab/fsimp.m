function [d]=fsimp(x,y)
% This is a program to perform parabolic integration
% INPUTS
% x= beginning of interval
% y= end of interval
% n= number of divisions
% OUTPUTS
% d= sum of the areas of the rectangles
% written by the MathPhys class on February 6, 2017
% continued Feburary 8,2017
% edited by eggoeke on 3/14/17
n=length(x);
w = ones(size(x));
%create weighting array
w(2:2:n-1)=4;
w(3:2:n-2)=2;
deltax=x(2)-x(1);
%add it up!
d = y*w'*deltax/3;
end
