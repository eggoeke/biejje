function[output]=relax(initialArray,boundaryFunct,tol, p)
%Written on 5/3/17 by the MathPhys class to do Relaxation Method
output=feval(boundaryFunct,initialArray,p);
[nrows,ncolumns]=size(initialArray);
test=tol+1; 
    copy1=output;
    copy2=output;
    copy3=output;
    copy4=output;

while test>tol
    copy1(1:nrows-1,:)=output(2:nrows,:); %shifts up
    copy2(2:nrows,:)=output(1:nrows-1,:); %shifts down
    copy3(:,1:ncolumns-1)=output(:,2:ncolumns); %shifts left
    copy4(:,2:ncolumns)=output(:,1:ncolumns-1); %shifts right
    newArray=feval(boundaryFunct,(copy1+copy2+copy3+copy4)/4,p);%avg shifted matrices, returns avg of middle
    test=max(max(abs(newArray-output))); %absolute value of differences between arrays and find max 
    output=newArray;
end
