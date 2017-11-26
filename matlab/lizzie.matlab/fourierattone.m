
function [a,b] = fourierattone (alpha, beta, tol, f, p, ntermC, nsize)
% This program should produce a Fourier approximation of a given function
% Written by Lizzie Ruprecht on March 20, 2017
% With assistance from Hank Corbett and Don Smith



% INPUTS
% alpha=beginning of interval
% beta=end of interval
% tol=tolerance 
% f= function being approximated
% p= array of parameters to be passed to the function 
% ntermC= number of coefficients of the cosine function
% nsize= size of array of x-values

x= linspace(alpha,beta,nsize);
y= feval(f,x,p);
c= getc(alpha,beta,ntermC,y,x,tol,f,p); %coefficients of cosine function
a = (c+conj(c))/2;
b = (1i*(c-conj(c)))/2;


%b=getb(alpha,beta,ntermS,y,x,tol); % same as above line but for sine function
appx=getappx(a,b,x,alpha,beta); %gets approximation
plot(x,y,x,appx) %plots original function and Fourier approximation

foPlotc(x,y,appx); %plots original function and Fourier approximation



endfunction
