
function [c] = getc (alpha,beta,n,y,x,tol,f,q)
% Written by Lizzie Ruprecht on March 20, 2017
% With assistance from Hank Corbett and Don Smith
% This program finds the C values, and uses a convergence program-
%-(convint) to do so


k=2./(beta-alpha);
for d=1:n
om = -1i*2*pi/(beta-alpha);
a(d)=convint(alpha,beta,tol,om,f,q,d-1);
end
c=k*a;
