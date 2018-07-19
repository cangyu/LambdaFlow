clear all; close all; clc;

f = @(x) exp(x)*(x-2).^3;
df = @(x) exp(x)*((x-2).^3 + 3*(x-2).^2);

a = 0;
b = 3;
x0 = (a+b)/2;
eps_x = 1e-10;
eps_y = 1e-10;
max_iter = 51;

[xval, x_err,iter_num yval] = newton(f, df, x0, eps_x, eps_y, max_iter)