function [x] = multi_var_broyden(f, x0, A_inv, tol, custom_norm)
    % 先用牛顿法算出x1
    x_pre = x0;
    fx_pre = f(x_pre);
    w = A_inv*(-fx_pre);
    err = custom_norm(w);
    x = x_pre + w;
    % 迭代
    while(err > tol)
        s = x - x_pre;
        fx_cur = f(x);
        y = fx_cur - fx_pre;
        A_inv = A_inv + (s-A_inv*y)*s'*A_inv/(s'*A_inv*y);
        w = A_inv*fx_cur;
        err = custom_norm(w);
        x_pre = x;
        x = x-w;
        fx_pre = fx_cur;
    end
end
