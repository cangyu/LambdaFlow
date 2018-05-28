syms x
f = symfun(1/(1+25*x^2),x);
xdata = linspace(-1, 1, 201);
ydata = double(f(xdata));

hold on
axis([-1 1 0 1]);
plot(xdata, ydata, '-black');
for n = 5:1:20
    xs = linspace(-1, 1, n+1);
    ys = double(f(xs));
    c = newpoly(xs, ys);
    y_interp = polyval(c, xdata);
    plot(xdata, y_interp,'-');
end
hold off
