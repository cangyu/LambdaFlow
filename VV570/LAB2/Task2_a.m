syms x
fsym = symfun(exp(x^2),x);
fano = @(x) (exp(x^2));
exactf = int(fsym, -1, 1);
format longE
eval(exactf)
format short

n = 20;
xval = linspace(-1,1,n+1);
yval = zeros(1,n+1);
for i = 1:n+1
    yval(i) = fano(xval(i));
end
[c, d] = newpoly(xval, yval);
c_int = polyint(c);
quad = polyval(c_int,1) - polyval(c_int,-1)
err = eval(quad - exactf)


