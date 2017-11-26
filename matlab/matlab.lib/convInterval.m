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
## @deftypefn {Function File} {@var{retval} =} convInterval (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: eggoeke <eggoeke@nephele>
## Created: 2017-03-04

function [retval] = convInterval (a,n,tol,f)
int = 10;
old = simp(a,int,n,f);
int = 100;
new = simp(a,int,n,f);
% compare new and old integrals until they are not different within
%the tolerance
while((abs(old-new) > tol) && (int<10000000))
old = new;
int = int*10;
new = simp(a,int,n,f);
end
retval=new;

endfunction
