function [s]=trap(f,a,b,n) 
% This is a program to perform trapezoidal integration
% INPUTS
% a= beginning of interval
% b= end of interval
% n= number of divisions
% OUTPUTS
% s= matrix containing three summation methods
% one = for loop summation
% two = matlab sum function summation
% three = vectorized summations

% written by the MathPhys class on February 6, 2017
% modified by Erin Goeke on Feb 6, 2017

% create a linear space on the interval [a,b] with n terms
x=linspace(a,b,n);
% the change in x and base of our rectangles & triangles
delta=x(2)-x(1);
% create matrix of our function outputs
for p = 1:n
    y(1,p) = f(x(p));
end
% Display 'For loop' and begin clock for method execution
%di = 'For loop';
%disp(di);

% define var one
one=0;
% sum all rectangles and triangles on our interval,
% excluding the final rectangle & triangle as we are drawing
% our integral slices from left to right
for i=(1:n-1)
    one=one+.5*delta*(y(i) + y(i+1));
end
% display time taken to execute loop and the output given by it

%disp(one);
% display 'Sum' and begin clock for method execution
%di = 'Sum';
%disp(di);

% use matlab's sum function to add together all rectangles
two = sum(y(2:n-1))*delta + .5*delta*(y(1) + y(n));
% display time taken to execute loop and the output given by it

%disp(two);
% display 'Vectorized' and begin clock for method execution
%di = 'Vectorized';
%disp(di);

% create column matrix W which contains the coefficient
% for each integral slice to be multiplied by to achieve a
% trapezoidal shape 
w = ones(1,size(x,2));
w(1,1) = .5;
w(1,n) = .5;
% use dotproduct to create and sum our trapezoids
three = y*w'*delta;
% display time taken to execute loop and the output given by it

%disp(three);
% define our output
s = [one two three];
end
