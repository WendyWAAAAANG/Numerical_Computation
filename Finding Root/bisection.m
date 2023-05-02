function v = bisection(f, a, b, N, tol, esp)
% Function to find root of continuous f(x) within [a, b].
% Assume f(a) and f(b) bracket a root.
% initialize k, represents times of interation.
k = 0;
% initialize x, represents current independent variable.
x = 3;
% x = (a + b) / 2;
% using while-loop to do iteration.
% if criteria between a and b is smaller than esp, then halt the loop.
% also iteration time cannot exceed N.
while abs(a-b)/abs(b) > esp && k <= N && abs(f(x)) > tol
    % let x equals middle value of a and b.
    x = (a + b) / 2;
    % to check whether current x to replace a or b.
    if sign(f(x)) == sign(f(b))
        % sign of x is same as b, replace b.
        b = x;
    else
        % otherwise, sign of x is same as a, replace a.
        a = x;
    end
    % increase times of loop.
    k = k + 1;
    % assign current x to root.
    root = x;
    
    % return root and times of iteration.
    v = [root k];
end