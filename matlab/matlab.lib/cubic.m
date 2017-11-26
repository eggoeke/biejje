function [output] = cubic(x,para)
output = para(1)*x.^3 + para(2)*x.^2 + para(3)*x + para(4);
end