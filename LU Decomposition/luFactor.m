function [L, U, P] = luFactor(A)
%detailed description 
%lu decomposition makes upper and lower triangular matix and pivot matrix
%Use LU factorization algorithm to solve
%INPUTS:
%A= coefficient matrix
%OUTPUTS
%L= lower triangular matrix
%U= upper triangular matrix
%P= pivot matrix
%Created by Kasssssieieiei
%Date Created 03-25-22
%Input Error
%Square Matrix Check
[n,b] = size(A);
 L = zeros(n);
 U = L;
 P = eye(n);
 a = length(A);
 %square matrix check
if n ~= b
    error('matrix is not sqaure')
end
    %i = index of 1 through the matrix length
    for i=1:a
        % find the entry in the left column with the largest abs value
        %finds the rows that need to be pivoted
        [~,RI] = max(abs(A(i:end,i)));
        %using the index of the max value to determine the rows that need
        %to be switched
        RI = a-(a-i+1)+RI;    
        A([i RI],:) = A([RI i],:);
        L([i RI],:) = L([RI i],:);
        P([i RI],:) = P([RI i],:);
        %Finding the coeeficients and replacing the lower elements of 
        % the lower matrix
        U(i,1:a) = A(i,1:a);
        %The coefficient being added to the lower matrix is determined by 
        % the (a22/a21) pattern
        L(i:a,i) = A(i:a,i) / A(i,i);
        %excludes the top rows as (i+1:a) the code travels down a matrix 
        % while pivoting
        %(i+1:a) will always exclude the top most row -- in the second 
        % iteration the second row will be the new "top row" and it will 
        % exclude that one
        %This row that is being skipped, is the same row that has the 
        % coefficent change in the lower matrix (in the row corresponding 
        % to the iteration number)
        A(i+1:a,1:a) = A(i+1:a,1:a) - L(i+1:a,i)*A(i,1:a);
        
    %OH MY GOD FINALLY
    end
    U(:,end) = A(:,end);

end