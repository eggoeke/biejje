function [SV, Time]=RK4(SVInitial,timeInitial, timeFinal, timeStep, accFunct, p)
Time=timeInitial:timeStep:timeFinal;
%Initialize SV array
nrows=length(SVInitial);
ncols=length(Time); %column for each time value 
SV=zeros(nrows,ncols);
SV(:,1)=SVInitial; %make sure SVInitial is column

%loop
for n=1:ncols-1 
    F1=feval(accFunct,Time(n),SV(:,n),p);
    F2=feval(accFunct,Time(n)+timeStep/2, F1*timeStep/2+SV(:,n), p);%adds 1/2 timestep to state vector
    F3=feval(accFunct,Time(n)+timeStep/2, F2*timeStep/2+SV(:,n), p);
    F4=feval(accFunct,Time(n)+timeStep, F3*timeStep+SV(:,n), p);
    SV(:,n+1)=SV(:,n)+timeStep*(F1+2*F2+2*F3+F4)/6;
end

    