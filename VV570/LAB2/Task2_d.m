syms x
fsym = symfun(1/(1+25*x^2),x);
fano = @(x) 1./(1+25*x.^2);
exactf = int(fsym, -1, 1);
format longE
eval(exactf)
format short

% n = 20;
% [xval, w] = lgwt(n, -1, 1);
% yval = fano(xval);
% quad = sum(yval.*w);
% err = eval(quad - exactf);

n = 20;
[xval, w] = fclencurt(n+2, -1, 1);
yval = fano(xval);
quad = sum(yval.*w)
err = eval(quad - exactf)

