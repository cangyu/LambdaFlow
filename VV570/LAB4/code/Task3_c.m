clear all; close all; clc;

a = 0;
b = 2*pi;
y0 = 0;
N = 41;

ret = rk4(@stiff2ode, a, b, y0, N-1);
t = ret(:,1)';
y_rk4 = ret(:,2)';
y_exact = zeros(size(y_rk4));
for i = 1:N
    y_exact(i) = stiff2solution(t(i));
end
err = abs(y_rk4-y_exact);

plot(t, log(y_exact), '^-', t, log(y_rk4), '*-')
xlabel('t')
ylabel('log(y(t))')
title('\lambda = 10000 N=40')
legend('Exact', 'RK-4','Location','Northwest')

table((1:N)', t', y_exact', y_rk4', err', 'VariableName', {'n', 't', 'Exact', 'RK_4', 'err'})