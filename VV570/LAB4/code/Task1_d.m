clear all; close all; clc;

y0 = 1;
a = 0;
b = 1;
N = 21;

eqn = 'Dy = (y+t)/(y-t)';
init = 'y(0) = 1';
y = dsolve(eqn, init, 't');
t = linspace(a, b, N);
y_exact = eval(vectorize(y));

[~, y_ab2] = ab2(@butcher, [a, b], y0, N-1);
y_ab2 = y_ab2';
err = abs(y_ab2 - y_exact);

plot(t, y_exact, '^-', t, y_ab2,'*-')
xlabel('t')
ylabel('y(t)')
legend('Exact','Adams-Bashforth','Location','NorthWest')

table((1:N)', t', y_exact', y_ab2', err', 'VariableName', {'n', 't', 'Exact', 'Adams_Bashforth', 'err'})
