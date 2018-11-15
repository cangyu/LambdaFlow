clear all; close all; clc;

f = @(x) x.^2 - sin(x+1);

[x_val, x_err, iter_num, y_val] = secant(f, 0.5, 0.75, 1e-10, 1e-10, 50)