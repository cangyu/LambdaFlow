clear all; close all; clc;

eqn = 'Dy = (y+t)/(y-t)';
init = 'y(0) = 1';
y = dsolve(eqn, init, 't');
pretty(y)
t = linspace(0, 1, 20);
expr = vectorize(y);
z = eval(expr);
plot(t, z)
