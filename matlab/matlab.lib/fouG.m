% Fourier transform code
## g = 1/2pi  int f(x)*e^(-i alpha x)
% Input: y = array of the range of the function inverse is
% calculated for
% Output: g = array of of amplitudes of present in y in relation to 
% alpha (analogous to n in fourier series; only continuous)

% Written by Erin and Jen 3/13/17
% Edited by eggoeke 3/14/17
function [g]= fouG(y)
% compute the number of terms given in y
N = length(y);
% allocate space for an array which will contain exponential terms
% for summation and space for the fourier transform range
expC = ones(N,1);
g = ones(1,N);
for n = 1:N
    % declare entire array exponential terms for each term
    expC(:,1) = exp(-i.*(n-1).*(0:(N-1))'.*2*pi./N);
    % multiply y by exponential array to get sum, multiply by 
    % scalar and set to corresponding g term (amplitude) for
    % frequency(?)   
    g(n) = 1/N.*(y*expC);
end
end