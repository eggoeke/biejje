%Inputs:
% SVInitial - column vector of initial conditions
% timeInitial - start time
% timeFinal - stop time
% timeStep - time slices
% accFunct - .m file which returns the acceleration based on inputs
% p - parameters for the acceleration function
function [SV, Time]=RK4(SVInitial,timeInitial, timeFinal, timeStep, accFunct, p)
Time=linspace(timeInitial,timeStep,timeFinal);
%Initialize SV array
nrows=length(SVInitial);
ncols=length(Time); %column for each time value 
SV=zeros(nrows,ncols);
SV(:,1)=SVInitial; %make sure SVInitial is column

%loop for each step
for n=1:ncols-1 
    F1=feval(accFunct,Time(n),SV(:,n),p); %Euler's method
    %Use the previous method's solution as an approximate derivative and run through equations again
    F2=feval(accFunct,Time(n)+timeStep/2, F1*timeStep/2+SV(:,n), p);
    F3=feval(accFunct,Time(n)+timeStep/2, F2*timeStep/2+SV(:,n), p);
    F4=feval(accFunct,Time(n)+timeStep, F3*timeStep+SV(:,n), p);
    % Average different solutions together with weighting to get final approximate derivative
    SV(:,n+1)=SV(:,n)+timeStep*(F1+2*F2+2*F3+F4)/6; %find velocity using acceleration
 %   SV(1,n+1)=SV(1,n)+timeStep*SV(2,n); %find position using velocity
end

    