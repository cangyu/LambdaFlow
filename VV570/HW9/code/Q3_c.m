clear all; close all; clc;

phi = @(t, y) (2+0.01*t^2)*y;
phi_t = @(t, y) 0.02*t*y;
phi_y = @(t, y) 2+0.01*t^2;
dphi = @(t, y) phi_t(t, y) + phi_y(t, y) * phi(t, y);

N = 16;
h = 1;
t_val = linspace(0, 15, N);
y_val = zeros(size(t_val));
y_val(1) = 4;

%Iteration with the 2nd-order Taylor.
for i = 2:N
    y_val(i) = y_val(i-1) + h * phi(t_val(i-1), y_val(i-1)) + h^2/2 * dphi(t_val(i-1), y_val(i-1));
end
disp(y_val);
plot(t_val, log(y_val),'^-')
xlabel('t')
ylabel('log(y)')