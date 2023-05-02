function v = piececubic(x, y, u)
% v = piececubic(x,y,u) finds the piecewise cubic value of S(x).
n = length(x);
a = zeros(n - 1, 1);
b = zeros(n - 1, 1);
c = zeros(n - 1, 1);
h = diff(x);
delta = diff(y) ./ diff(x);
a(1) = delta(1) / (h(1) ^ 2);
b(1) = 0;
c(1) = 0;
for i = 1:  n-2
    c(i+1) = 3*a(i)*h(i)^2 + 2*b(i)*h(i) + c(i);
    b(i+1) = 3 * a(i) * h(i) + b(i);
    a(i+1) = (delta(i+1) - c(i+1) - b(i+1)*h(i+1)) / (h(i+1)^2);
end
% Find subinterval index k so that x(k) <= u < x(l+1)
k = 1;
for j = 2: n-1
    if x(j) <= u
        k = j;
    end
end
% Evaluate spline at u.
v = a(k) * ((u-x(k))^3) + b(k)*((u-x(k))^2) + c(k)*(u-x(k)) + y(k);
end