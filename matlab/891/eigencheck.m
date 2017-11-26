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
## @deftypefn {} {@var{retval} =} eigencheck (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <eggoeke@biejje>
## Created: 2017-08-31

function [e1,e2] = eigencheck (matsize,numloop)
  e1 = zeros(numloop,matsize);
  e2 = e1;
  for i = 1:numloop
    mat = rand(matsize);
    [v,l] = eig(mat);
    for j = 1:matsize
      e1(i,j) = abs(det(mat-eye(matsize,matsize)*l(j,j)));
      e2(i,j) = mean(abs(mat*v(:,j)-l(j,j)*v(:,j)));
    end
  end

    
    

endfunction
