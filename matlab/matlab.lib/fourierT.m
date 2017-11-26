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
## @deftypefn {Function File} {@var{retval} =} fourierT (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: eggoeke <eggoeke@nephele>
## Created: 2017-03-13
## period is N*tau
## Can't get periods longer than N*tau with this technique
## We need alpha because with matlab we can only index with integers
## omega = regular frequency = 1/(N*tau)
## Seperation between datapoints give the smallest wavelength
## nyquistFreq = 1/(2*tau) = max freq with useful info
## to plot the real part sqrt(g*g)
## 1) alpha, nu or tau; 2) real vs imag vs power; 3) nu max or nyquist; 4) g, Y or both


function [retval] = fourierT (tau, N)
alpha = 2*pi./*(N.*tau);
for n = 1:N
  g(n) = 1./N * sum(y(p).*exp(-i.*(n-1).*(p-1).*2.*pi./N));
  alpha(n) = 2*pi./(N.*tau).*(n-1);
end

endfunction
