function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
 if nargin('specialMatrix') > 2 
     error('only 2 imputs allowed')
 end

A = zeros(n,m)

for i = 1:m;
    A(1,i) = i
end
for i = 1:n
    A(i,1) = i 
end 
for i = 2:n 
    for j = 2:m 
        A(i,j) = A(i-1,j) + A(i,j-1)
    end

end
% Things beyond here are outside of your function