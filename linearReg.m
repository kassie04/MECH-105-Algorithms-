function [fX, fY, slope, intercept, Rsquared] = linearReg(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
x = [1 2 3 4 5 6];
y = [1 2 1.3 3.75 2.5 100];
if length(x) ~= length(y)
    error('X and Y vectors are not the same length')
end 
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

n = length(x);
Q1index = floor((n + 1)/4);
Q3index = floor((3*n + 3)/4);
Q1 = sortedY(Q1index);
Q3 = sortedY(Q3index);
IQR = Q3-Q1;

LQ = 1.5*IQR;
ly = length(y);
y = sort(y);
x = sortedX;
k = isoutlier(y);
[~,I] = max(k);
x(I) = [];
y(I) = [];
    
 fY = y;
 fX = x;
 %linear regression (point slope format) 
 slope = (ly*(sum(fX.*fY)) - sum(fX.*fY))/(ly*(sum(fX.^2)) - (sum(fX)^2));
 intercept = mean(fY) - mean(fX)*slope;
 
 %Rsquared value 
 my = mean(fY);
 SStot = sum((fY - my).^2);
 SSres = sum((fY-fX).^2);
 Rsquared = 1 - (SSres/SStot);
 