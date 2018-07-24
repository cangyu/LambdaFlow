clear all; close all; clc;

f = @(a, b) 1/sin(b) + 1/sin(a+b);

N = 91;
alpha = linspace(45, 135, N);
l = zeros(1, N);
delta = 0.001;

for i = 1:N
    ca = deg2rad(alpha(i));
    cf = @(b) f(ca, b);
    [bo, lo] = fminbnd(cf, delta, pi-ca-delta);
    l(i) = lo;
end

plot(alpha, l);
xlabel('alpha /deg');
ylabel('L /m');
title('Allowable length of the ladder versus alpha');
