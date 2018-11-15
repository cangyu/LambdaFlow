clear all; close all; clc;

syms x
h = @(a) int(x/(exp(x)-1), x, [0, a]);
f = @(a) 1-2/a*(1/a*eval(h(a)) + a/6 -1) - 0.7;

a_val = linspace(40, 80, 11);
for i = 1:length(a_val)
    y_val(i) = f(a_val(i));
end

 plot(a_val, y_val)