function [ svp ] = lorenz( t,sv,p )
% Velocity function for lorenz system

% define constants from parameter array p
s = p(1);
r = p(2);
b = p(3);
% create new velocity state vector
svp = zeros(size(sv));

% define velocity vector using lorenz's equations
svp(1,1) = s*(sv(2,1)-sv(1,1));
svp(2,1) = sv(1,1)*(r-sv(3,1))-sv(2,1);
svp(3,1) = sv(1,1)*sv(2,1) - b*sv(3,1);

end

