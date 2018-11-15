syms a b c;
[a, b, c] = solve('(a+b)/(1+c)=atan(1)','(a+2*b)/(1+2*c)=atan(2)','(a+3*b)/(1+3*c)=atan(3)');
vpa(a, 14)
vpa(b, 14)
vpa(c, 14)

N = 10;
xdata = linspace(1, 3, N+1);
ydata = double(atan(xdata));
y_interp = linspace(-5, 5, N+1);

for i = 1:N+1
    x = xdata(i);
    y_interp(i) = (-0.64983370679341+2.7942445718816*x)/(1+1.73034871359*x);
end

hold on
plot(xdata, ydata,'-^');
plot(xdata, y_interp, '--r');
legend('Original','Rational Approx')
hold off
