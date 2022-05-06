function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
x = [1 2 3 4 5 6];
y = [2 4 6 8 10 12];
if length(x) ~= length(y)
    error('X anf Y vectors are not the same length')
end 
for i = 1:length(x)-1 
    if x(2)-x(1) ~= x(i+1) - x(i)
        error('X vector does not have even spacing')
    end 
end
a = x(1);
b = x(length(x));
n = (length(x)-1);
a1 = x(length(x)-1);
yodd = y(2:2:length(y)-1);
yeven = y(3:2:length(y)-1);
yodd2 = y(2:2:length(y)-2);
yeven2 = y(3:2:length(y)-2);

if length(x) <= 2
    warning('This will be calculated using a single application of the trapezoidal rule')
    I = ((y(length(y))-y(1))*(b-a))/2;

%Simpsons 1/3 rule 
elseif rem(length(x),2) ~= 0 && length(x) > 2 || length(x) == 3
   I = ((b-a)/(3*(n)))*(y(1) + y(length(y)) + 4*(sum(yodd)) + 2*(sum(yeven)));

%simpsons 1/3 and trapezoidal
else rem(length(x),2) == 0 && length(x) > 3
    warning('Simpsons rule will be used in conjunction with a single application of trapezoidal rule')
    s = ((a1-a)/(3*(n-1)))*(y(1) + y(length(y)-1) + 4*(sum(yodd2)) + 2*(sum(yeven2)));
    t = (x(length(x))-x(length(x)-1))*((y(length(y))+y(length(y)-1))/2);
    I = s + t;
end 