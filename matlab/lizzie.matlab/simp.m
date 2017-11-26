function [d]=simp(a,b,y) 
% This is a program to perform parabolic integration
% INPUTS
% a= beginning of interval
% b= end of interval
% n= number of divisions
% OUTPUTS
% d= sum of the areas of the rectangles
% written by the MathPhys class on February 6, 2017
% continued Feburary 8,2017 
% modified by....on...to do...

n=length(y);
w = ones(size(y));
w(2:2:n-1)=4;
w(3:2:n-2)=2;
%tic
deltax=(b-a)/(n-1);
d = y*w'*deltax/3;
%toc
end