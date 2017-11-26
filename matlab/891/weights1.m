        function c=weights1(xi,x,n_s,m)

% Compute coefficients for finite difference approximation for the
% derivative of order 0 to k at xbar based on grid values at points in x.
%
% This function returns a matrix c of dimension k by n, where n=length(x),
% containing coefficients to approximate u^{(k)}(xbar), 
% the zeroth to k'th derivative of u evaluated at xbar,  based on n_s values
% of u at x(1), x(2), ... x(n).  
%
% If U is a column vector containing u(x) at these n points, then 
% c(k,:)*U will give the approximation to u^{(k)}(xi).
%
% Note for k=0 this can be used to evaluate the interpolating polynomial 
% itself.
%
% Requires length(x) > k.  
% Usually the elements x(i) are monotonically increasing
% and x(1) <= xbar <= x(n), but neither condition is required.
% The x values need not be equally spaced but must be distinct.  
%
% This program should give the same results as fdcoeffV.m, but for large
% values of n is much more stable numerically.
%
% Based on the program "weights" in 
%   B. Fornberg, "Calculation of weights in finite difference formulas",
%   SIAM Review 40 (1998), pp. 685-691.
%
% Note: Forberg's algorithm can be used to simultaneously compute the
% coefficients for derivatives of order 0, 1, ..., m where m <= n-1.
% This gives a coefficient matrix C(1:n,1:m) whose k'th column gives
% the coefficients for the k'th derivative.

        c=zeros(n_s,m); c(1,1)=1.0;
        c1=1.0;
        c4=x(1)-xi;

        for i=2:n_s
            mn=min(i,m);
            c2=1.0;
            c5=c4;
            c4=x(i)-xi;

            for j=1:i-1
                    c3=x(i)-x(j);
                    c2=c3*c2;
                    for k=mn:-1:2
                        c(i,k)=c1*((k-1)*c(i-1,k-1)-c5*c(i-1,k))/c2;
                    end
                    c(i,1)=-c1*c5*c(i-1,1)/c2;
                    for k=mn:-1:2
                        c(j,k)=(c4*c(j,k)-(k-1)*c(j,k-1))/c3;
                    end
                    c(j,1)=c4*c(j,1)/c3;
            end
                c1=c2;
        end
        c=c';