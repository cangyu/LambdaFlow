syms x
fsym = symfun(log(x),x);
fano = @(x) log(x);
exactf = int(fsym, 0, 1);
format longE
eval(exactf)
format short

N=5;
nvec = (2*10.^(1:1:N));
result = zeros(1,N);
error = zeros(1,N);
for i = 1:N
    result(i) = midpointquad(fano,0,1,nvec(i));
    error(i) = eval(result(i)-exactf);
end

format longE
T = table(categorical(nvec'),categorical(2./nvec'),result', error','VariableNames', {'n' 'h' 'Midpoint' 'Error'})
format short