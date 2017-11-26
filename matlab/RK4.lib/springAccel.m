function [a]=springAccel(t,x,v,p)
k=p(1);%spring constant
m=p(2);%mass
a=-k*x/m;