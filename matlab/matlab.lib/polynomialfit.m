function [ coef, sigmacoef ] = polynomialfit( x, y, sigma, n )
%POLYNOMIALFIT returns matrix with coeficients & uncertainty starting with the constant
% x, y, and sigma must be column matrixes
% @author erin Fall 2016


[m,s] = size(sigma);
denom = zeros(m,1);
w = zeros(m, m);
x2 = zeros(m,n);
for i = 1:m
    if (sigma(i,1)~= 0 )> 0
        denom(i,1) = 1/(sigma(i,1).^2);
    end
end 
for p = 1:n 
    for i = 1:m 
        x2(i,p) = x(i,1).^(p-1);
    end
end
for p = 1:m
    w(p,p) = denom(p,1);
end

coef = inv(x2'*w*x2)*(x2'*w*y)
sig = sqrt(inv(x2'*w*x2));
sigmacoef = zeros(n,1);
for i = 1:n
    sigmacoef(i,1) = sig(i,i);
end
sigmacoef
end

