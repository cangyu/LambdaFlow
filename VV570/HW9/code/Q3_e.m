clear all; close all; clc;

phi = @(t, y) (2+0.01*t^2)*y;

N = 16;
h = 1;
t_val = linspace(0, 15, N);
y_val = zeros(size(t_val));

% Initialization
y_val(1) = 4;
y_val(2) = y_val(1) + h * phi(t_val(1), y_val(1));

% Iteration with the 2-step Adams-Bashforth method
for i = 3:N
    k1 = phi(t_val(i-1), y_val(i-1));
    k2 = phi(t_val(i-2), y_val(i-2));
    y_val(i) = y_val(i-1) + h/2 * (3*k1 - k2); 
end
disp(y_val);
plot(t_val, log(y_val),'^-')
xlabel('t')
ylabel('log(y)')