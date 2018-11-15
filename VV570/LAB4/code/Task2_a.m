clear all; close all; clc;

y0 = 1;
a = 0;
b = 1;

[t, y_ode23] = ode23(@butcher, [a, b], y0);

eqn = 'Dy = (y+t)/(y-t)';
init = 'y(0) = 1';
y = dsolve(eqn, init, 't');
y_exact = eval(vectorize(y));
err = abs(y_ode23 - y_exact);

plot(t, y_exact, '*-', t, y_ode23, '^-')
xlabel('t')
ylabel('y(t)')
legend('Exact','ode23','Location','NorthWest')

table((1:length(t))', t, y_exact, y_ode23, err, 'VariableName', {'n', 't', 'Exact', 'ode23', 'err'})
