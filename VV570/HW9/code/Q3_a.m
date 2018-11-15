clear all; close all; clc;

phi = @(t, y) (2+0.01*t^2)*y;

N = 16;
h = 1;
t_val = linspace(0, 15, N);
y_val = zeros(size(t_val));
y_val(1) = 4;

%Iteration using Euler's method.
for i = 2:N
    y_val(i) = y_val(i-1) + h * phi(t_val(i-1), y_val(i-1));
end
plot(t_val, log(y_val),'^-')
xlabel('t')
ylabel('log(y)')
