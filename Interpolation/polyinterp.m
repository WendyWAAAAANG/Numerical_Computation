function polyvals = polyinterp(x, y, u)
% n used to store the number of points.
n = length(x);
% l used to store the number of u's elements.
l = length(u);
% v used to store p(u).
% here is initialization.
v = linspace(0, 0, l);
polyvals = zeros(size(u));
% use for-statements generate all term of the Lagrange polynomial.
for i = 1: l
    for k = 1: n
        % w used to store the product of dpolynumial.
        w = 1;
        % computes the product of the fractions.
        for j = [1:k-1 k+1:n]
            w = w * (u(i) - x(j)) / (x(k) - x(j));
        end
        polyvals(i) = polyvals(i) + w * y(k);
    end
end
% plot the x-y data as circles ('o') and the polynomial data as '-'.
plot(x, y, 'o', u, polyvals, '-')
end
