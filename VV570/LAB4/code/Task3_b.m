clear all; close all; clc;

a = 0;
b = 2*pi;
y0 = 0;
N = 41;

ret = euler(@stiff2ode, a, b, y0, N-1);
t = ret(:,1)';
y_euler = ret(:,2)';
y_exact = zeros(size(y_euler));
for i = 1:N
    y_exact(i) = stiff2solution(t(i));
end
err = abs(y_euler-y_exact);

plot(t, log(y_exact), '^-', t, log(y_euler), '*-')
xlabel('t')
ylabel('log(y(t))')
title('\lambda = 10000')
legend('Exact', 'Euler','Location','Northwest')

table((1:N)', t', y_exact', y_euler', err', 'VariableName', {'n', 't', 'Exact', 'Euler', 'err'})