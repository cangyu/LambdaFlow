clear all; close all; clc;

f = @(x) exp(x)*(x-2).^3;
df = @(x) exp(x)*((x-2).^3 + 3*(x-2).^2);
ddf = @(x) exp(x)*((x-2).^3 + 6*(x-2).^2 + 6*(x-2));
dddf = @(x) exp(x)*((x-2).^3 + 9*(x-2).^2 + 18*(x-2) + 6);

N = 301;
x = linspace(0, 3, N);
y = zeros(1, N);
dy = zeros(1, N);
ddy = zeros(1, N);
dddy = zeros(1, N);

for i = 1:N
    y(i) = f(x(i));
    dy(i) = df(x(i));
    ddy(i) = ddf(x(i));
    dddy(i) = dddf(x(i));
end

subplot(4,1,1)
plot(x, y)
title('f(x)')

subplot(4,1,2)
plot(x, dy)
title('1st order derivative of f(x)')

subplot(4, 1, 3)
plot(x, ddy);
title('2nd order derivative of f(x)')

subplot(4, 1, 4)
plot(x, dddy);
title('3rd order derivative of f(x)')
