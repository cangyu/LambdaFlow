syms x
fsym = symfun(1/(1+25*x^2),x);
fsym(-1:1:1)
fano = @(x) 1./(1+25*x.^2);
fano(-1:1:1)
exactf = int(fsym, -1, 1);
format longE
eval(exactf)
format short

N=5;
nvec = (2*10.^(1:1:N));
result = zeros(1,N);
error = zeros(1,N);
for i = 1:N
    result(i) = trapezoidalquad(fano,-1,1,nvec(i));
    error(i) = eval(result(i)-exactf);
end

format longE
T = table(categorical(nvec'),categorical(2./nvec'),result', error','VariableNames', {'n' 'h' 'Midpoint' 'Error'})
format short