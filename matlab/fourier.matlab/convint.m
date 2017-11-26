function [new] = convint(a,b,tol,omega,f,q,term)
%Written by Math Phys Class Feb 6, 201
n = 10;
x=linspace(a,b,n); 
y=feval(f,x,q).*exp(x.*term.*omega);
old = simp(a,b,y);
n=n*10;
x=linspace(a,b,n);
y=feval(f,x,q).*exp(x.*term.*omega);
new = simp(a,b,y);
while((abs(old-new) > tol )&(n < 10000000000))
    old = new;
    n=n*10;
    x=linspace(a,b,n); 
    y=feval(f,x,q).*exp(x.*term.*omega);
    new = simp(a,b,y);
end
end