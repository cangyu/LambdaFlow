clear all
syms x
N = 5;
miderror = zeros(1, N);
traperror = zeros(1, N);
simerror = zeros(1, N);
clencurterror = zeros(1, N);
lgwterror = zeros(1, N);
for i = 1:N
    fsym = symfun(i*x.^(i-1), x);
    fano = @(t) i*t.^(i-1);
    miderror(i) = midpointquad(fsym,0,1,i)-1;
    traperror(i) = trapezoidalquad(fsym, 0, 1, i)-1;
    simerror(i) = simpsonquad(fsym, 0, 1, i)-1;
    [xpts, w] = fclencurt(i+2, 0, 1);
    clencurterror(i) = sum(fano(xpts).*w)-1;
    [xpts, w] = lgwt(i, 0, 1);
    lgwterror(i) = sum(fano(xpts).*w)-1;
end
format long
monomial = {'$1$';'$2x$';'$3x^2$';'$4x^3$';'$5x^4$'};
T = table(monomial, miderror', traperror', simerror', clencurterror', lgwterror', 'VariableNames', {'func' 'Midpointerror' 'TrapezoidalError' 'SimpsonError' 'ClenshawCurtisError' 'GaussLegendreError'})
format short