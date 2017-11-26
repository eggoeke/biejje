% Returns a constantant acceleration for RK4
% Inputs
% time - time 
% sv - current state vector
% p - parameters
function [a]=constAccel(time,sv,p)
% set acceleration equal to the first array element in parameters
a(2,1)=p(1);
a(1,1) = sv(2,1);