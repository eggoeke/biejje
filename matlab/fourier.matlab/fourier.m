function [a,b]=fourier(alpha,beta,tol,funky,p,nterm)
%This is a program to evaluate forier coefficients
% INPUTS
% alpha= begin interval
% beta= end of interval
% n= number of divisions
% funky= function to be approximated
%
% OUTPUTS
% a= coefficient
% b= coefficient
% written on Feburary, 20 2017

for i=1:nterm
    a(i)=fconvint(alpha,beta,tol,funky,p,0,i);
    b(i)=fconvint(alpha,beta,tol,funky,p,1,i);
end
end