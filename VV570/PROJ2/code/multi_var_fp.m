function [x] = multi_var_fp(g, x0, x_tol, y_tol, custom_norm)
    x = x0;
    y_err = g(x0);
    if(y_err <= y_tol)
        return;
    end
    x_err = 0;
    
    while(x_err > x_tol || y_err > y_tol)
        cx = g(x);
        y_err = custom_norm(cx);
        x_err = custom_norm(cx-x);
        x = cx;
    end
end
