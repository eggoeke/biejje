% inverse Fourier Transform program

% inputs: g = array containing range of fourier transform
% outputs: y = range of approximation of original function by inverse
% fourier transform

% Written by Justin and Lizzie 3/13/17
% Editted by eggoeke 3/14/17
function [y] =inverseTransform(g)
% create N as the number of terms used
N=length(g);
% allocate space for exponential array
exponentials=ones(N,1);
for n=1:N
    % declare entire exponential array for each term
    exponentials(:,1)=exp(i*(n-1)*(0:N-1)'*2*pi/N);
    % multiply g by exponentials for the term to get
    % their sum on the domain and assign to a slot in y
    y(n)=g*exponentials;
end
end