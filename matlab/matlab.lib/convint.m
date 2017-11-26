function [new] = convint(a,b,tol,f)
%Converges simp function to a given tolerance
% [a,b] is the interval
% tolerance is the tolerance (ie .000001)
% f is the anonymous function (ie @(x)x)
%Written by Math Phys Class Feb 6, 2017
n = 10;
old = simp(a,b,n,f);
n=n*10;
new = simp(a,b,n,f);
% compare new and old integrals until they are not different within
%the tolerance
while((abs(old-new) > tol)
  old = new;
  n=n*10;
  new = simp(a,b,n,f);
end
end