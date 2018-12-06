clear all; close all; clc;

syms a2;
syms a3;
syms x;

p = a2 .* (x.^2 - 1.5.*x) + a3 .*(x.^3 - 2.* x);
ddp = 2.*a2 + 6.*a3.*x;

t1 = -p .* ddp;
t2 =p.^2;

R = int(t1, x, 0, 1) / int(t2, x, 0, 1);
simplify(R)
