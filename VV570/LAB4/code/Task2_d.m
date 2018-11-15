clear all; close all; clc;

x0 = [-8;8;27];
a = 0;
b = 20;

[t, X] = ode45(@Phi, [a, b], x0);

figure(1)
plot(X(:,1), X(:,2))
xlabel('x1')
ylabel('x2')
figure(2)
plot(X(:,1), X(:,3))
xlabel('x1')
ylabel('x3')
figure(3)
plot(X(:,2), X(:,3))
xlabel('x2')
ylabel('x3')
figure(4)
subplot(3,1,1)
plot(t,X(:,1))
xlabel('t')
ylabel('x1')
subplot(3,1,2)
plot(t,X(:,2))
xlabel('t')
ylabel('x2')
subplot(3,1,3)
plot(t,X(:,3))
xlabel('t')
ylabel('x3')
