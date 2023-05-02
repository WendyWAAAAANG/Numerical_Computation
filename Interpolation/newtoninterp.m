function [F, polyvals] = newtoninterp(x, y, u)
% v = newtoninterp(x, y, u) computes the Newton method.
% interpolation value p(u) for the given data x and y.
% use n and m to store scale of x and y.
n = length(x);
m = length(y);
% use l to store scale of u.
l = length(u);
% use result to store the result.
% firstly chech whether x and y are in same size.
if m ~= n; error('x and y must be same size');
else
    % perform div_diff function, used to compute all divide differences
    % from the data stored in x and y = f(x).
    % first, initialize F, used to store pyrmaid.
    F = zeros(n, n);
    % for first column, just assign y(i).
    for i = 1: n
        F(i, 1) = y(i);
    end
    % for rest columns, use formula.
    for k = 1: n-1
        for i = 1: n-k
            F(i, k+1) = (F(i+1, k) - F(i, k)) / (x(i+k) - x(i));
        end
    end
    % Compute Newton polynomial using nested format.

    polyvals = zeros(1, l);
    for j = 1: n
        z = ones(1, l);
        for i = 1: j-1
            % nested formula.
            z = z .* (u - x(i));
        end
        polyvals = polyvals + F(1, j) * z;
    end
    plot(x, y, 'o', u, polyvals, '-');
end
end