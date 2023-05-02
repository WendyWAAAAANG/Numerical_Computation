function R = romberg(f, a, b, n)
% calculate h as then length of subinterval.
h = (b - a) ./ (2 .^ (0: n-1));
% calculate first R as initialization.
R(1, 1) = (b - a) * (f(a)+f(b)) / 2;
% using for loop to construct pyrmaid.
for i = 2:n
    temp = 0;
    % firstly, construct first layer of pyrmaid.
    for j = 1: 2^(i-2)
        temp = temp + f(a + (2*j-1) * h(i));
    end
    % calculate R using temp value.
    R(i, 1) = R(i-1, 1)/2 + h(i) * temp;
    % then, using first layer's value,
    % calculate the rest of pyrmaid.
    for k = 2: i
       R(i, k) = (4^(k-1)*R(i, k-1)-R(i-1,k-1))/(4^(k-1)-1); 
    end
end