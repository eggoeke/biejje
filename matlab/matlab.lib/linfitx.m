function [a,b,ae,be]=linfitx(x,xe,y,ye,tol)

s = ye;
[a,b,ae,be]=linfity(x,y,s,2);

del = tol+1;
while (del>tol)
    oldslope = b;
    s = sqrt(ye.^2+(b*xe).^2);
    [a,b,ae,be]=linfity(x,y,s,2);
    del = abs(b-oldslope);
end