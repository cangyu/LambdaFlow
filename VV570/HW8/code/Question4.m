f = @(x) sin(1/x)/(pi + (x-2*pi)^2);

N = 101;
x = linspace(1e-6, 1, N);
y = zeros(1, N);
for i = 1:N
    y(i) = f(x(i));
end

% plot(x, y)
% [xo, yo] = fminsearch(f, -0.001)
% f(xo)

[xo_ga yo_ga] = ga(f, 1)
f(xo_ga)