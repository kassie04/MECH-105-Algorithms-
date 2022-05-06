function [ea,iter,root] = SecantandModified(x_1,func,maxit,s,es,x_0)
%UNTITLED5 Summary of this function goes here
%Function calculates the root using the secant method, but if only one
%bound is entered, the function then defaults to modifies secant. If there
%are 2 initial points (x_0 adn x_1), an s value is not needed. I there is
%one intial point (x_1), then an s value is needed.
%Secant method
 
iter = 0;
es = .0001;
ea = 1;
func = @(x) (7*sin(x))*(exp(-x)-1);
if nargin < 5
    error('Not enough inputs')
end
if nargin == 6 || isempty(s)
    while iter < maxit &&  ea > es 
    xr = x_1 - (func(x_1)*(x_0 - x_1))/(func(x_0)-func(x_1));
    ea = abs((xr-x_1)/xr);
    x_0 = x_1;
    x_1 = xr;
    iter = iter + 1;
    end
end 
if nargin == 5 || isempty(x_0)
    while iter < maxit && ea > es
        xr = x_1 - func(x_1)*(s*x_1)/(func(x_1 + (s*x_1))-func(x_1));
        ea = abs((xr-x_1)/xr);
        x_1 = xr;
        iter = iter + 1;
    end 
end 
root = x_1;
fprintf('the root is %s\n', root)
end
