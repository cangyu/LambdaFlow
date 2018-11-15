clear all; close all; clc;

x0 = [-8;8;27];
a = 0;
b = 20;

[t, y_ode45] = ode45(@Phi, [a, b], x0);

plot(t, y_ode45(:,1), '-', t, y_ode45(:,2), '.-', t, y_ode45(:,3), '--')
xlabel('t')
ylabel('x')
legend('x(1)','x(2)','x(3)')
title('Solution by ode45')
