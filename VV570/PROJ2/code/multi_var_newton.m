function [x] = multi_var_newton(f, Jf, x0, tol, custom_norm)
    x = x0;
    err = tol + 1;
    while(err > tol)
        dx = linsolve(Jf(x), -f(x));
        err = custom_norm(dx);
        x = x + dx;
    end
end

