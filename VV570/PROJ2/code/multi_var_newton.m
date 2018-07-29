function [x] = multi_var_newton(f, Jf, x0, x_tol, y_tol, custom_norm)
    x = x0;
    y_err = custom_norm(f(x));
    if(y_err <= y_tol)
        return;
    end

    x_err = 0;
    while(x_err > x_tol || y_err > y_tol)
        dx = linsolve(Jf(x), -f(x));
        x_err = custom_norm(dx);
        x = x + dx;
        y_err = custom_norm(f(x));
    end
end

