function [L, U, x, z] = lu_gauss(A,b)
% this function used to calculate the LU factorization of A.
% Assume A is not singular and that Gauss Elimination requires no row.
% use n and m to store # of row and columns.
[n, m] = size(A);
% firstly check whether matrix is a square matrix.
if n ~= m; error('A is not a square matrix');
end
% then continue to calculate L and U.
% for each row (except last row).
for k = 1:n-1
   if A(k, k) ==0, error('Null diagonal element');
   end
   % for tow i below row k.
   for i = k+1:n
       % m is scalar for row i.
       m = A(i,k)/A(k,k);
       % put scalar m for row i in (i,k) position in A.
       A(i,k) = m;
       % it is used to store L value.
       % part of A gets zeroed out in GE
       % so we can use such place to store L.
       for j = k+1:n
           % substract m*row k from row i->row i.
           % and only need to do this for columns from k+1 to n.
           % since the values before A(k,k) will be zero.
           A(i,j) = A(i,j) - m*A(k,j);
       end
   end
end
% L represents lower triangular matrix.
L = eye(n) + tril(A,-1);
% U represents upper triangular matrix.
U = triu(A);

% then, we implement substatition to calculate x.
% Step1, calculate Lz = b, using forward substitution.
% create augmented matrix of L.
AL = [L b];
% initialize z.
z = zeros(n,1);
% calculate z1, and use this to do further substitution.
z(1) = AL(1,n+1) / AL(1,1);
for i = 1:1:n
    z(i) = (AL(i,n+1) - AL(i,1:i-1)*z(1:i-1)) / AL(i,i);
end
% step2, calculate Ux = z, using backward substitution.
% create augmented matrix of U.
AU = [U z];
% initialize x.
x = zeros(n,1);
% calculate xn, and use this to do further substitution.
x(n) = AU(n,n+1) / AU(n,n);
for i = n-1:-1:1
    x(i) = (AU(i,n+1) - AU(i,i+1:n)*x(i+1:n)) / AU(i,i);
end
end