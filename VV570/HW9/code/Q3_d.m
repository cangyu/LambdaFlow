clear all; close all; clc;

phi = @(t, y) (2+0.01*t^2)*y;

N = 16;
h = 1;
t_val = linspace(0, 15, N);
y_val = zeros(size(t_val));
y_val(1) = 4;

% Iteration with Heun's method.
for i = 2:N
    k1 = phi(t_val(i-1), y_val(i-1));
    ystar = y_val(i-1) + h * k1;
    y_val(i) = y_val(i-1) + h/2 * (k1 + phi(t_val(i), ystar)); 
end
disp(y_val);
plot(t_val, log(y_val),'^-')
xlabel('t')
ylabel('log(y)')