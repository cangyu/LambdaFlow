clear all; close all; clc;

% ��������
x = 1:50;
y = x + rand(1,50)*10;
 
% ���ø�˹ģ���С�ͱ�׼��
r        = 3;
sigma    = 1;
y_filted = gauss_filter_1d(y, sigma, r);
 
% ��ͼ�Ա�
plot(x, y,'^-', x, y_filted,'o-');
title('��˹�˲�');
legend('�˲�ǰ','�˲���','Location','northwest')
