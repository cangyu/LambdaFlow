n = 5;
a = 1;
b = 2;

f = @(x) x.^2 - log(x.^2+2);
xvec = zeros(1, n);
for j = 1:n
    xvec(j) = (a+b)/2;
    if f(a)*f(xvec(j))<0
        b = xvec(j);
    else
        a = xvec(j);
    end
end

format long
table((1:n)',xvec','VariableNames', {'n', 'x_n'})
format short