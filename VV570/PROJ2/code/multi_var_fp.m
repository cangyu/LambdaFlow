function [x] = multi_var_fp(g, x0, tol, custom_norm)
    x = x0;
    err = tol+1;
    while(err > tol)
        cx = g(x);
        err = custom_norm(cx-x);
        x = cx;
    end
end
