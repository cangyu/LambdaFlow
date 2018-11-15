clear all; close all; clc;

f = @(x) exp(x)-4*x.^2;

a = -1;
b = 0;
eps = 1e-10;

[xval, err, yval] = bisect(f, a, b, eps)