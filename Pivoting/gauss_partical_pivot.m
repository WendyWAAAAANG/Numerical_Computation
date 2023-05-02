function x = gauss_partical_pivot(A, b)
% compute the solution to Ax = b.
% assuems that gaussian elimination can be done without pivots.
% create augmented matrix.
AA = [A b];
% assign n = #rows, m = #columns
[n, m] = size(A);
% initialize a vector for solutions x.
x = zeros(n,1);
% check whether the equation has unique solution.
% if n ~= m, then equation either multisolution or no solution.
if n ~= m; error("A is not a square matrix");
% if n ~= size(b), then inproper number of value.
elseif n ~= size(b); error("b must be the same size as A");
% otherwise, we can use gaussian elimination to calculate solution.
else
    % reduce each row to upper triangular form.
    % for each row(except last).
    for k = 1:n-1
        % which means the matrix does not have unique solution.
        if A(k,k) == 0, error("Null diagonal element");
        end
        
        % here, we use partical pivot to select pivot.
        [~, cindex] = max(abs(AA(k:n, k)));
        kk = cindex + k - 1;
        % interchange mr-th row and current row.
        AA([kk k], :) = AA([k kk], :);
        
        % calculate m for elimination.
        for i = k+1:n
            % calculate m for each row.
            % m = scalar for row i.
            m = AA(i,k)/AA(k,k);
            for j = k:n+1
                % do elimination, by substituting correlated value.
                % subtract m*row k from row i -> row i.
                AA(i,j) = AA(i,j) - m*AA(k,j);
            end
            disp(AA);
        end
    end
    % matrix AA should already be in upper triangular form.
    % here we begin back-substitution.
    x(n) = AA(n,n+1)/AA(n,n);
    % for each row from row n-1 to row 1.
    for i = n-1:-1:1
        x(i) = (AA(i,n+1)-AA(i,i+1:n)*x(i+1:n))/AA(i,i);
    end
end