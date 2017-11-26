function [apsi]=psiAcc(x,SV,p)
E=p(1);
m=p(2);
%h=6.62607E-34;
h=1;
a=p(3);
v0=p(4);
psi=SV(1);
if abs(x)<abs(a)
    potential=0;
else
    potential=v0;
end
    
apsi=[SV(2),-(E*psi-potential*psi)*2*m/(h^2)]';