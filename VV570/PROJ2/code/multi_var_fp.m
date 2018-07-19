function [x] = multi_var_fp(g, x0, tol, custom_norm)
    
    x = g(x0);
    err = abs(x - x0);
    while(err > tol)
        cur = g(x);
        err = custom_norm(cur-x);
        x = cur;
    end
end