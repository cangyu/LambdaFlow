syms x
fsym = symfun(1/(1+25*x^2),x);
fano = @(x) 1./(1+25*x.^2);
exactf = int(fsym, -1, 1);
format longE
eval(exactf)
format short
