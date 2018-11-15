clear all;
close all;

func = @(x) sqrt(log(x.^2+2));
xvec = myFP(func, 1, 1e-6, 10, 'Numerical solutions to $x^2=\ln(x^2+2)$','b--o');
n = length(xvec);

E = zeros(1, n);
eps = zeros(1, n);

for i = 2:n
    E(i) = abs(xvec(i) - xvec(i-1));
    eps(i) = abs(E(i)/xvec(i));
end

table((1:n)', xvec', E', eps', 'VariableNames', {'n', 'xvec', 'E', 'eps'})
