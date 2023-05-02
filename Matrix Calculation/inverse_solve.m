function [iA, x] = inverse_solve(A,b)
% use n and m to store # of row and columns.
[n, m] = size(A);
% firstly check whether matrix is a square matrix.
if n ~= m; error('A is not a square matrix');
end
% otherwise, the inverse of A exists.
% create [A | I] to do calculation.
I = eye(n);
AI = [A I];
% transform AI into upper triangle form.
for k = 1:n-1
   if A(k,k) ==0, error('Null diagonal element');
   end
   % for tow i below row k.
   for i = k+1:n
       % m is scalar for row i.
       m = AI(i,k)/AI(k,k);
       % put scalar m for row i in (i,k) position in A.
       A(i,k) = m;
       % update each element in matrix.
       for j = k:n*2
           % substract m*row k from row i->row i.
           % and only need to do this for columns from k+1 to n.
           % since the values before A(k,k) will be zero.
           AI(i,j) = AI(i,j) - m*AI(k,j);
       end
   end
end
% eliminate non-pivot elements into 0,
% that is, turn left-hand side matrix into identity matrix.
% for each row from last to 1st.
for k = n:-1:1
    % let pivot become 1, all elements in this row divided by pivot.
    AI(k,:) = AI(k,:) ./ AI(k,k);
    % turn non-pivot elements into 0.
    % for each row before k.
    for i = k-1:-1:1
        m = AI(i,k);
        % directly set element to 0.
        AI(i,k) = 0;
        % do same transformation on right matrix.
        for j = n+1:n*2
            AI(i,j) = AI(i,j) - m*AI(k,j);
        end
    end
end
% so we can find the value of inverse of A.
iA = AI(:,n+1:n*2);
% here, we solve solution of x,
% by using multiplication of Ai and b.
x = iA*b;
end