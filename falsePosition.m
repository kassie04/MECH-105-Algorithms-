function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
%falsePosition finds the root of a function using false position method
%check that there are oposite signs 
root = 0;
func =  @(x) ((.518*233.15)/(x-.0018626154)) - (12.5577832)/(x*(x + .0018626154)*sqrt(233.15))-65000;
if nargin < 4 
    es = .0001;
    maxit = 200;
end 
if nargin < 5 
    maxit = 200;
end 
if func(xl)*func(xu) >= 0
    error('no sign change')
end
    %if f(xl) and f(xu) are 0, then that is the root 
        if func(xl) == 0
            root = xl;
            if func(xu) == 0 
                root = xu;
            end 
        end 
        fprintf('root found: %s\n', root)
iter = 0;
%relative error
xr = 1;
ea = abs((xr-xl)/xr)*100;
%actual falseposition calculation 

while ea > es && iter < maxit
    xrold = xr;
    xr = xu - ((func(xu)*(xl-xu))/((func(xl))-(func(xu))));
    ea = abs((xr-xrold)/xr)*100;
    %new upper/lower
    xl = xr;
    iter = iter + 1;
end 
root = xr;
fx = func(xr);
if xr == 0 && xrold == 0
    ea = 0;
end 
iter = iter - 1;
end