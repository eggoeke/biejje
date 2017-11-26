
##INPUT
##  Vectors u and v
##OUTPUT
##  String stating if they are orthogonal

## Author: eggoeke <eggoeke@nephele>
## Created: 2017-02-01

function [] = orthog (u, v)
%get size number of columns in vector u and store to w
w = size(u);
w = w(1,2);
%get size number of columns in vector v and store to t
t = size(v);
t = t(1,2);
if(t != w)
%give error if vectors arent the same size
  disp('vectors not the same size')
else
%if the dot product is zero the vectors are orthogonal
%if the dot product is not zero the vectors are not orthogonal
  if(dot(u,v) == 0)
    disp('orthogonal')
  else
   disp('not orthogonal')
  endif  
endif


endfunction
