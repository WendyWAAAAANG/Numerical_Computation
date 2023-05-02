function w = Newton(f, fp, x0, N, tol)
% Assumes f is differentiable.
% initialize k, represents times of interation.
k = 0;
% initialize xprev and xnext, represent x in iteration.
xprev = x0;
xnext = x0 - f(x0) ./ fp(xprev);
% using while-loop to do iteration.
% if function value smaller than tol, then halt the loop.
% also iteration time cannot exceed N.
while k <= N && f(xprev) > tol
    xprev = xnext;
    xnext = xnext - f(xnext) ./ fp(xnext);
    % increase times of loop.
    k = k + 1;
    % return root and times of iteration.
    w = [xnext k];
end
