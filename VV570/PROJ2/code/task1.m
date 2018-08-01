clear all; close all; clc;

f = @(x) [(x(1,1).^2 - x(2,1)); (x(1,1).^2 + x(2,1).^2 -1)];
Jf = @(x) [2*x(1), -1; 2*x(1), 2*x(2)];

tic
    g = @(x) [sqrt(x(2)); sqrt(1-x(1)^2)];
    x0 = [sqrt(2)/2; sqrt(2)/2];
    %x0 = [0.5; 0.5];
    tol = 1e-10;
    f_nm = @(x) norm(x, 2);
    x_fp = multi_var_fp(g, x0, tol, f_nm);
toc

tic
    x0 = [sqrt(2)/2; sqrt(2)/2];
    tol = 1e-10;
    f_nm = @(x) norm(x, 2);
    x_nt = multi_var_newton(f, Jf, x0, tol, f_nm);
toc

tic
    x0 = [sqrt(2)/2; sqrt(2)/2];
    A0_inv = Jf(x0)^-1;
    tol = 1e-10;
    f_nm = @(x) norm(x, 2);
    x_bd = multi_var_broyden(f, x0, A0_inv, tol, f_nm);
toc
