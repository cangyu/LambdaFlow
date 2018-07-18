n = 20;
xmin = -2;
xmax = 2;
x = linspace(xmin, xmax, n);
y = x.^2 -2;
myplot(x, y, '$$y = x^2 - \ln(x^2+2)$$','color','b','linestyle','-')