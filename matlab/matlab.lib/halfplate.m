function[output]=halfplate(array, p)
s=size(array);
output=array;
output(1,:)=0;
output(:,1)=p;
output(s(1),:)=0;
output(:,s(2))=0;
%output(10,10)=10*p;
