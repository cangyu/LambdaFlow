clear all; close all; clc;

f = @(x) exp(x)-4*x.^2;
df = @(x) exp(x) - 8*x;

a = -1;
b = 0;
x0 = (a+b)/2;
eps_x = 1e-10;
eps_y = 1e-10;
max_iter = 20;

[xval, x_err,iter_num yval] = newton(f, df, x0, eps_x, eps_y, max_iter)