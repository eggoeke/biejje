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
## @deftypefn {Function File} {@var{retval} =} fourier (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: eggoeke <eggoeke@nephele>
## Created: 2017-02-20

function [] = fouSeriesSINCOS (alpha,beta,tol,num,f)
a = ones(1,num);
b = zeros(1,num);
c = beta-alpha;
for i = 0:(num-1)
  a(1,i+1) = (2/c)*hello(alpha,beta,tol,@(x)f(x).*cos(((i.*2.*pi)/c).*x));
  b(1,i+1) =  (2/c)*hello(alpha,beta,tol,@(x)f(x).*sin(((i.*2.*pi)/c).*x));
end
four = @(x)a(1,1)/2;

if num > 1
  for q = 1:(num-1)
    four =  @(x)(four(x) + a(1,q+1)*cos(((q.*2.*pi)/(beta-alpha)).*x) + b(1,q+1)*sin(((q.*2.*pi)/(beta-alpha)).*x));
  endfor
endif
a(1,1) = a(1,1)/2;
%disp('a');
%disp(a);
%disp('b');
%disp(b);
x = linspace(alpha, beta, 1000);
y = four(x);
y2 = f(x);
figure
plot(x,y,x,y2)


endfunction
