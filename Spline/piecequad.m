function v = piecequad(x, y, z0, u)
    % z0 -- derivative at the starting point.
    % u -- a value.
    n = length(x);
    % initialize each coefficient of spline.
    a = zeros(n - 1, 1);
    b = zeros(n, 1);
    c = zeros(n - 1, 1);
    b(1) = z0;
    % interitively calculate the coefficients.
    for i = 1: n - 1
        c(i) = y(i);
        b(i + 1) = 2 * (y(i+1) - y(i)) / (x(i+1) - x(i)) - b(i);
        a(i) = (b(i+1) - b(i)) / (2 * (x(i+1) - x(i)));
    end
    % find subinterval index k so that x(k) <= u < x(k+1)
    k = 1;
    for j = 2: n-1
       if x(j) <= u
           k = j;
       end
    end
    % Evaluate spline at u.
    v = a(k) * ((u - x(k))^2) + b(k) * (u - x(k)) + c(k);
end
