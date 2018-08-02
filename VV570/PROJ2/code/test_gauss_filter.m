clear all; close all; clc;

% 测试数据
x = 1:50;
y = x + rand(1,50)*10;
 
% 设置高斯模板大小和标准差
r        = 3;
sigma    = 1;
y_filted = gauss_filter_1d(y, sigma, r);
 
% 作图对比
plot(x, y,'^-', x, y_filted,'o-');
title('高斯滤波');
legend('滤波前','滤波后','Location','northwest')
