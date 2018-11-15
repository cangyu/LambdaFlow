clear all
syms x
N = 5;
miderror = zeros(1, N);
traperror = zeros(1, N);
simerror = zeros(1, N);
for i = 1:N
    fsym = symfun(i*x^(i-1), x);
    miderror(i) = midpointquad(fsym,0,1,1)-1;
    traperror(i) = trapezoidalquad(fsym, 0, 1, 1)-1;
    simerror(i) = simpsonquad(fsym, 0, 1, 1)-1;
end
format long
monomial = {'$1$';'$2x$';'$3x^2$';'$4x^3$';'$5x^4$'};
T = table(monomial, miderror', traperror', simerror', 'VariableNames', {'func' 'Midpointerror' 'TrapezoidalError' 'SimpsonError'})
format short
