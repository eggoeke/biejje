## Copyright (C) 2017 eggoeke
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} integrate (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn


## INPUT
##  N number of rectangles; > 1
##  f is function (format @(x)x.^2)
## Author: eggoeke <eggoeke@nephele>
## Created: 2017-02-02

function [sum] = integrate (f, a, b, N)
  dx = (b-a)/(N-1);
  x = linspace(a,b,N);
  sum = 0;
  for(i = 1:(N-1))
    sum = sum + dx*f(x(1,i));
  end
  
  

endfunction
