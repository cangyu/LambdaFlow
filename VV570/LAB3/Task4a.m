clear all; close all; clc;

f = @(x) exp(x)*(x-2).^3;
df = @(x) exp(x)*((x-2).^3 + 3*(x-2).^2);

N = 101;
x = linspace(0, 3, N);
y = zeros(1, N);
dy = zeros(1, N);

for i = 1:N
    y(i) = f(x(i));
    dy(i) = df(x(i));
end

subplot(2,1,1)
plot(x, y)
title('f(x)')
subplot(2,1,2)
plot(x, dy)
title('Derivative of f(x)')
