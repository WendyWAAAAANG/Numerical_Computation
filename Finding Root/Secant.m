function u = Secant(f, x0, x1, N, tol)
% Secant method.
% Assumes f is differentiable.
% initialize k, represents times of interation.
k = 0;
% initialize xprev and xnext, for iteration.
xprev = x0;
xnext = x1;
% using while-loop to do iteration.
% if function value smaller than tol, then halt the loop.
% also iteration time cannot exceed N.
while f(xnext) > tol && k <= N
    % update xnext and xprev,
    % calculating by Secant formula.
    xtmp = xnext;
    xnext = xnext - ((xnext - xprev) / (f(xnext) - f(xprev))) * f(xnext);
    xprev = xtmp;
    % increase times of loop.
    k = k + 1;
    % return root and times of iteration.
    u = [xnext k];
end