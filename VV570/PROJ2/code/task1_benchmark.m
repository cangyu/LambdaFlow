clear all; close all; clc;

f = @(x) [x(1)^2 - x(2); x(1)^2 + x(2)^2 -1];
Jf = @(x) [2*x(1), -1; 2*x(1), 2*x(2)];
norm_func = @(x) norm(x, 2);

x0 = [sqrt(2)/2; sqrt(2)/2];
x_tol = 1e-7;
y_tol = 1e-7;

tic
    x_fp = multi_var_fp(f, x0, x_tol, y_tol, norm_func);
toc

tic
    x_nt = multi_var_newton(f, Jf, x0, x_tol, y_tol, norm_func);
toc

tic
    x_bd = multi_var_broyden(f, x0, x_tol, y_tol, norm_func);
toc
