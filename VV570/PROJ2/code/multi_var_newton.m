function [x] = multi_var_newton(F, dF, x0, tol, custom_norm)
    x = x0;
    fx = F(x);
    dfx = dF(x);
    delta_x = linsolve(dfx, -fx);
    x = x + delta_x;
    err = custom_norm(delta_x);
    while(err > tol)
        fx = F(x);
        dfx = dF(x);
        delta_x = linsolve(dfx, -fx);
        x = x + delta_x;
        err = custom_norm(delta_x);
    end
end

