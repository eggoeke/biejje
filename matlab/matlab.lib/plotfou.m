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
## @deftypefn {Function File} {@var{retval} =} plotfou (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: eggoeke <eggoeke@nephele>
## Created: 2017-02-28

function [retval] = plotfou (x,y,a, b)
plot(x,y)
hold on;
var = zeros(size(x)) + a(1);
delx = x(length(x)) - x(1);
for p = 2:length(a)
  var = var + a(p)*cos((p-1).*x.*2.*pi/delx);
end
for p = 2:length(b)
  var = var + b(p)*sin((p-1).*x.*2.*pi/delx);
end
plot(x,var,'g')
hold off
endfunction
