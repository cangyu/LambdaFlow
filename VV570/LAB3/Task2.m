clear all;
close all;

func = @(x) atan((x-0.4)*(x-0.7));
xvec = myFP(func, 0, 1e-10, 50, 'Numerical solutions to $\tan(x)=(x-0.4)*(x-0.7)$','b--o');
n = length(xvec);

E = zeros(1, n);
eps = zeros(1, n);

for i = 2:n
    E(i) = abs(xvec(i) - xvec(i-1));
    eps(i) = abs(E(i)/xvec(i));
end

table((1:n)', xvec', E', eps', 'VariableNames', {'n', 'xvec', 'E', 'eps'})