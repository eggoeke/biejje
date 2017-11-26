function [xout] = rk4(xi,tf,n,derivsRK,param)
%  Runge-Kutta integrator (4th order)
% Input arguments -
%   xi = initial value of dependent variable
%   tf = final time
%   n  = number of steps
%   derivsRK = right hand side of the ODE; derivsRK is the function
%              which returns dx/dt (passed as a function handle)
%              Calling format derivsRK(x,t,param).
%   param = extra parameters passed to derivsRK
% Output arguments -
%   xout = matrix with history of state vector
tau = tf/n;
half_tau = 0.5*tau;
time = linspace(0,tf,n);
nsv = length(xi);
xout = zeros(nsv,n);
xout(:,1)=xi;

for i=1:n-1
    t = time(i);
    x = xout(:,i);
    F1 = feval(derivsRK,x,t,param);  
    t_half = t + half_tau;
    xtemp = x + half_tau*F1;
    F2 = feval(derivsRK,xtemp,t_half,param);  
    xtemp = x + half_tau*F2;
    F3 = feval(derivsRK,xtemp,t_half,param);
    t_full = t + tau;
    xtemp = x + tau*F3;
    F4 = feval(derivsRK,xtemp,t_full,param);

    xout(:,i+1) = x + tau/6.*(F1 + F4 + 2.*(F2+F3));
end
return;
