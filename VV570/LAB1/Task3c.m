syms x
f = symfun(1/(1+25*x^2),x);
xdata = linspace(-1, 1, 201);
ydata = double(f(xdata));

xs1 = cos(linspace(1,0,21)*pi);
xs2 = cos(linspace(1,0,41)*pi);
y_interp1 = polyval(polyfit(xs1, double(f(xs1)), 20), xdata);
y_interp2 = polyval(polyfit(xs2, double(f(xs2)), 40), xdata);

hold on
axis([-1 1 -5 5]);
plot(xdata, ydata, '-black');
plot(xdata, y_interp1, '--r');
plot(xdata, y_interp2, '-.b');
hold off
