SP_NUM = 501;
x = linspace(0,2*pi, SP_NUM);
y = x;
for i = 1:SP_NUM
    y(i) = h(x(i));
end

PNT_NUM = 21;
%xs = linspace(0,2*pi, PNT_NUM);
xs = cos(linspace(pi, 0, PNT_NUM)) * pi + pi;
ys = xs;
for i = 1:PNT_NUM
    ys(i) = h(xs(i));
end

yspline = spline(xs, ys, x);
ylagrange = lagrinterpol(xs, ys, x);
ynewton = polyval(newpoly(xs, ys), x);

hold on
plot(x, y);
plot(xs, ys, '^');
plot(x, yspline,':');
plot(x, ylagrange, '-.');
plot(x, ynewton, '--');
legend('Original','Sample Pts', 'Spline', 'Lagrange', 'Newton');
hold off

function [ret] = h(x)
    ret = sin(x) + sin(5*x);
end