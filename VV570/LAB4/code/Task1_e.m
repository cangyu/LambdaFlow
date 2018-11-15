clear all; close all; clc;

eqn = 'Dy = (y+t)/(y-t)';
init = 'y(0) = 1';

y0 = 1;
y = dsolve(eqn, init, 't');
a = 0;
b = 1;
N = 21;

t = linspace(a, b, N);
y_exact = eval(vectorize(y));

ret = rk4(@butcher, a, b, y0, N-1);
y_rk4 = ret(:,2)';

err = abs(y_rk4 - y_exact);

plot(t, y_exact, '^-', t, y_rk4,'*-')
xlabel('t')
ylabel('y(t)')
legend('Exact','RK-4','Location','NorthWest')

table((1:N)', t', y_exact', y_rk4', err', 'VariableName', {'n', 't', 'Exact', 'RK_4', 'err'})
