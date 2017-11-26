function [ svp ] = lorenz( sv,t,p )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
s = p(1);
r = p(2);
b = p(3);
svp = zeros(size(sv));

svp(1,1) = s*(sv(2,1)-sv(1,1));
svp(2,1) = sv(1,1)*(r-sv(3,1))-sv(2,1);
svp(3,1) = sv(1,1)*sv(2,1) - b*sv(3,1);



end

