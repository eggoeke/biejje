
%% Author: eggoeke <eggoeke@nephele>
%% Created: 2017-05-09

function [output] = paraPlate (array, p)
s=size(array);
%plate seperation
sep = p(1);
%plate size
siz = p(2);
%potential for plates
potential = p(3);
%centering the dimensions for plates
dim = ones(1,2);
dim(1) = s(1)/2 - siz/2;
dim(2) = s(1)/2 + siz/2;
for i=1:2
  if(mod(dim(i),1) != 0)
    dim(i) = round(dim(i));
   endif
endfor
%centering the two rows the plates are on
rows = ones(1,2);
rows(1) = s(1)/2 + sep/2;
rows(2) = s(1)/2 - sep/2;
for i=1:2
  if(mod(rows(i),1) != 0)
    rows(i) = round(rows(i));
   endif
endfor
output=array;
output(1,:)=0;
output(:,1)=0;
output(s(1),:)=0;
output(:,s(2))=0;
output(rows(1),dim(1):dim(2))= potential;
output(rows(2),dim(1):dim(2)) = -potential;

endfunction
