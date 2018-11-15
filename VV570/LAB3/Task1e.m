clear all;
close all;

g = @(x) sqrt(log(x.^2+2));
xvec = naiveFP(g, 1, 1e-6, 10, 'Numerical solutions to $x^2=\ln(x^2+2)$','b--o');
