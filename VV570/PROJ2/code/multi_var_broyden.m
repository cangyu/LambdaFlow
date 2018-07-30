function [x] = multi_var_broyden(f, x0, A0, x_tol, y_tol, custom_norm)
    x = x0;
    fx = f(x);
    y_err = custom_norm(fx);
    if(y_err <= y_tol)
        return;
    end
    
    A_inv = inv(A0);
    x_err = 0;
    while(x_err > x_tol || y_err > y_tol)
        w = A_inv * fx;
        x_err = custom_norm(w);
        x = x-w;
        s = -w;
        cfx = f(x);
        y = cfx-fx;
        y_err = custom_norm(y);
        A_inv = A_inv + (s-A_inv*y)*s'*A_inv/(s'*A_inv*y);
    end
end
