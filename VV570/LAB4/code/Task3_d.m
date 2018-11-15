clear all; close all; clc;

a = 0;
b = 2*pi;
y0 = 0;

[t, y_ode15s] = ode15s(@stiff2ode, [a, b], y0);
N = length(t);
y_exact = zeros(size(y_ode15s));
for i = 1:N
    y_exact(i) = stiff2solution(t(i));
end
err = abs(y_ode15s-y_exact);

plot(t, y_exact, '^-', t, y_ode15s, '*-')
xlabel('t')
ylabel('y(t)')
title('\lambda = 10000')
legend('Exact', 'ode15s','Location','Northeast')

table((1:N)', t, y_exact, y_ode15s, err, 'VariableName', {'n', 't', 'Exact', 'ode15s', 'err'})