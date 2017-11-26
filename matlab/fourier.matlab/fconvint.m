function [new] = fconvint(alpha,beta,tol,f,p,trigflag,i)
%alpha = beginning of interval
%beta = end of interval
%tol = the tolerance each term is to be calculated to
%f = .m file name which makes an array of the function
%p = parameters for f
%trigflag = determines whether the coefficient for sine or cosine
%is to be calculated (0 = cos; 1 = sin)
%i = which term is to be calculated

%Written by Math Phys Class Feb 22, 2017
%Editted by eggoeke on 3/14/2017

%create start number of slices
n = 10;
%make linear space
x=linspace(alpha,beta,n);
%grab function array
y=feval(f,x,p);
%dot integrand with trig function it is describing and scale
%for all intervals
if trigflag==0
    y=y.*cos((i-1)*2*pi*x/(beta-alpha))*2/(beta-alpha);
else
    y=y.*sin(i*2*pi*x/(beta-alpha))*2/(beta-alpha);
end
%get preliminary integral to compare future integrals with
old = fsimp(x,y);
n=n*10;
%same as above only n the number of slices is increased
x=linspace(alpha,beta,n);
y=feval(f,x,p);
if trigflag==0
    y=y.*cos((i-1)*2*pi*x/(beta-alpha))*2/(beta-alpha);
else
    y=y.*sin(i*2*pi*x/(beta-alpha))*2/(beta-alpha);
end
new = fsimp(x,y);
%rinse, wash and repeat until the difference betweem the old and new
%integrals is less than the tolerance
while((abs(old-new) > tol )&(n < 10000000000))
    old = new;
    n=n*10;
    x=linspace(alpha,beta,n);
    y=feval(f,x,p);
    if trigflag==0
        y=y.*cos((i-1)*2*pi*x/(beta-alpha))*2/(beta-alpha);
    else
        y=y.*sin(i*2*pi*x/(beta-alpha))*2/(beta-alpha);
    end
    new = fsimp(x,y);
end
n;
end