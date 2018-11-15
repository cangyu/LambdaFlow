clear all; close all; clc;

h = 0.1;
[x, y] = meshgrid(0:h:2*pi, -1:h:1);
px = ones(size(x));
py = stiff2ode(x, y);
quiver(x, y, px, py)
axis tight equal
hold on
x1 = (0:h:2*pi);
y1 = stiff2solution(x1);
plot(x1, y1, 'r')
title('\lambda=10000')
hold off
