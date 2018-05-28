%(a)
clear all;
close all;

syms x
f = symfun(1/(1+25*x^2),x);
N = 10;
xdata = linspace(-1, 1, N+1);
ydata = double(f(xdata));
polyfit(xdata, ydata, N)

%(b)
syms x
f = symfun(1/(1+25*x^2),x);
N = 20;
xdata = linspace(-1, 1, N+1);
ydata = double(f(xdata));
polyfit(xdata, ydata, N)