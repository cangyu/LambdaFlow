clear all; close all; clc;

f = @(x, y) exp(x)*(4*x^2 + 2*y^2 + 4*x*y + 2*y + 1);

N = 101;
y_val = linspace(-10, 10, N);
g_val = zeros(1, N);
for i = 1:N
    g = @(x) f(x, y_val(i));
    [xo, go] = fminunc(g, -y_val(i)/2);
    g_val(i) = go;
end

plot(y_val, g_val)
xlabel('y')
ylabel('g(y)')
title('Illustration of minimum of f(x, y) as y varies')