clear all; close all; clc;

g = @(x) -0.5*exp(0.5*x);
 
x0 = -0.5;
tol = 1e-10;
max_iter = 20;

[iter_num, xval, x_err, pn] = fixpt(g, x0, tol, max_iter)