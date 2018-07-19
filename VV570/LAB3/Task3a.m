clear all; close all; clc;

f = @(x) exp(x)-4*x.^2;
N = 101;
x1 = linspace(-1,0, N);
y1 = f(x1);
x2 = linspace(0,1, N);
y2 = f(x2);
x3 = linspace(4, 4.5);
y3 = f(x3);

subplot(1,3,1);
plot(x1, y1);
subplot(1,3,2);
plot(x2, y2);
subplot(1,3,3);
plot(x3, y3);
