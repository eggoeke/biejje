%author Erin %simple frequentist linear fit program using linear algebra & calculus %#y = #sigma = #x, must single column or single row % Fall 
function [ m,b,sigm,sigb ] = linfit( x,y,sigma )

%calculus way
[m,n] = size(sigma);
denom = zeros(m,n);
%can't just divide all elements in matrix in one go, need for loop :( 
for i = 1:m
    for p = 1:n
        if (sigma(i,p)~= 0 )> 0
            denom(i,p) = 1/(sigma(i,p).^2);
        end
    end
end
%make components of equations
alpha = sum(y.*denom);
beta = sum(denom);
gamma = sum(x.*denom);
epsilon = sum((x.^2).*denom);
delta = sum(x.*y.*denom);
squiggle = (gamma.^2) - epsilon.*beta;
%execute equations
sprintf('calculus')
b = -((alpha.*epsilon) - (delta.*gamma) )/ squiggle
m = ((alpha.*gamma) - (delta.*beta)) / squiggle
sigb = sqrt(epsilon/(epsilon.*beta - gamma.^2))
sigm = sqrt(beta/(epsilon.*beta - gamma.^2))

%linear algebra way
%setting up matrices as specified in packet
[m,n] = size(y);
if n > 1
    y = y';
end
%not really necessary, just for symmetry
[m,n] = size(denom);
if n > 1
    denom = denom';
end
[m,n] = size(x);
if n > 1
    x = x';
end
[m,n] = size(x);
x2 = ones(m,n+1);
w = zeros(m, m);
for i = 1:m
    x2(i,2) = x(i,1);
end
for p = 1:m
    w(p,p) = denom(p,1);
end
sprintf('linear algebra')
%A column 1 is the constant, column 2 is the term for x
A = inv(x2'*w*x2)*(x2'*w*y);
%sigmaA diagonal 1 is the error for constant, 2 for the x term
sigmaA = sqrt(inv(x2'*w*x2));
b = A(1,1)
sigb = sigmaA(1,1)
m = A(2,1)
sigm = sigmaA(2,2)

x1 = linspace(min(x)-2, max(x)+2, 100);
y1 = m*x1 + b;
errorbar(x,y,sigma,'o')
hold on
plot(x1, y1)
hold off
grid
end
