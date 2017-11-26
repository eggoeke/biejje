function [c] =  Cn(alpha, beta, deltax, omega, f,q, p, tol)
c = 1/(deltax).*convint(alpha, beta, tol, omega, f, q, p);
end