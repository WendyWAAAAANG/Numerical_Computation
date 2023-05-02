function F = div_diff(x, y)
% div_diff function computes all divide differences from
% the data stored in x and y = f(x).
n = length(x);
m = length(y);
if m ~= n; error('x and y must be same size');
else
    F = zeros(n, n);
    for i = 1: n
        F(i, 1) = y(i);
    end
    for k = 1: n-1
        for i = 1: n-k
            F(i, k+1) = (F(i+1, k) - F(i, k)) / (x(i+k) - x(i));
        end
    end
end
end