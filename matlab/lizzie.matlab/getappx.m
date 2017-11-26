function [appx] = getappx (a,b,x,alpha,beta)
% Written by Lizzie Ruprecht on March 20, 2017
% With assistance from Hank Corbett and Don Smith
% This program approximates the Fourier series


appx=ones(size(x))*a(1)/2;

for i=2:length(a); %uses 'a' values to calculate cos term
  appx=appx+a(i)*cos(2*pi*(i-1)*x/(beta-alpha));
end

for i=1:length(b); %uses 'b' values to calculate sin term
  appx=appx+b(i)*sin(2*pi*(i-1)*x/(beta-alpha));
end

