clear all; close all; clc;

f = @(x) exp(x)*(x-2).^3;
df = @(x) exp(x)*((x-2).^3 + 3*(x-2).^2);

a = 0;
b = 3;
x0 = (a+b)/2;
max_iter = 50;

x(1) = x0;
for i = 1:max_iter
    x(i+1) = x(i) - f(x(i))/df(x(i));
end

n = length(x);
m = zeros(1, n);
for i = 2:n-1
    m(i+1) = -(x(i)-x(i-1))/(x(i+1) - 2*x(i) + x(i-1));
end

table((1:n)', x', m', 'VariableNames', {'n', 'x', 'm'})