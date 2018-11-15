clear all; close all; clc;

eqn = 'Dy = (y+t)/(y-t)';
init = 'y(0) = 1';

y0 = 1;
y = dsolve(eqn, init, 't');
a = 0;
b = 1;
N = 21;

df = @(t, y) [(y+t)/(y-t) 2/(y-t)*(1-2*t^2/(y-t)^2) -12*t/(y-t)^3*(1+2*t^2/(y-t)^2) -12/(y-t)^5*((y^2-2*t*y-5*t^2)*(1+2*t^2/(y-t)^2)+4*t^2*(1-2*t^2/(y-t)^2))];

t = linspace(a, b, N);
y_exact = eval(vectorize(y));

ret = taylor(df, a, b, y0, N-1);
y_t4 = ret(:,2)';

err = abs(y_t4 - y_exact);

plot(t, y_exact, '^-', t, y_t4,'*-')
xlabel('t')
ylabel('y(t)')
legend('Exact','Taylor4','Location','NorthWest')

table((1:N)', t', y_exact', y_t4', err', 'VariableName', {'n', 't', 'Exact', 'Taylor4', 'err'})
