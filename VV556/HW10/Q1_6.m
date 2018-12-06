clear all; close all; clc;

syms a2;
syms a3;
syms x;

t1 = (x.^2 - 1.5.*x).^2;
t2 = (x.^2 - 1.5.*x) .* (x.^3 - 2.* x);

int(t1, 0, 1)
int(t2, 0, 2)

v1 = (x.^3 - 16/3 .*x.^2 + 6.*x) .* (6 .* x - 32/3);
v2 = (x.^3 - 16/3 .*x.^2 + 6.*x) .^2;

R = int(v1, 0, 1)/int(v2, 0, 1)