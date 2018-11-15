syms x
fsym = symfun(1/(1+25*x^2),x);
fsym(-1:1:1)
fano = @(x) 1./(1+25*x.^2);
fano(-1:1:1)
exactf = int(fsym, -1, 1);
format longE
eval(exactf)
format short