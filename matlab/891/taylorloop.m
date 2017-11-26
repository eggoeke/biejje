## Copyright (C) 2017 
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
## @deftypefn {} {@var{retval} =} taylorloop (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <eggoeke@biejje>
## Created: 2017-08-26

function [y,error] = taylorloop (numloop, x)
y = zeros(1,numloop);
for i=0:numloop
  if i == 0
    y(i+1) = x.^i./factorial(i);
  else
    y(i+1) = x.^(i)./factorial(i) + y(i);
  end 
end

error = abs(exp(x)-y);
endfunction
