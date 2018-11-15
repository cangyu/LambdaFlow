clear all; close all; clc;

N = 101;
x1 = linspace(0.1, 1, N);
x2 = linspace(0.1, 1, N);
[X1, X2] = meshgrid(x1, x2); 

%f = @(x, y) 1/(x*y);
%f = @(x, y) x/y;
%f = @(x, y) x^2/y;
f = @(x, y) x^0.5 * y^0.5;
fv = zeros(N, N);

for i = 1:N
    for j = 1:N
        %fv(i, j) = f(x1(i), x2(j));
        %fv(i, j) = f(x1(i), x2(j));
        fv(i, j) = f(x1(i), x2(j));
    end
end

mesh(X1, X2, fv)