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
## @deftypefn {Function File} {@var{retval} =} convertArray (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: eggoeke <eggoeke@nephele>
## Created: 2017-02-06
function f = convertArray(old_f)
    function r = new_f(X)
        X = num2cell(X);
        r = old_f(X{:});
    endfunction
    f = @new_f
endfunction