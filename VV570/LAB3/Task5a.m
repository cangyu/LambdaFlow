clear all; close all; clc;

f = @(x) x.^2 - sin(x+1);
df = @(x) 2*x - cos(x+1);

[x_val, x_err, iter_num, y_val] = newton(f, df, 0.5, 1e-10, 1e-10, 50)