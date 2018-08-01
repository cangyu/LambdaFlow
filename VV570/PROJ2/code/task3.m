clear all; close all; clc;

alpha = 0.1;
gamma = 0.2;
phi = @(t, x) [gamma-alpha*x(1)^2*x(2); alpha*x(1)^2*x(2)-x(2)/(1+x(2))];
x0 = [1;1];

%--------------------------------------------------------------------------
disp('Part (a)');
%Calculate x(t) and n(t) using RK-4
%--------------------------------------------------------------------------
N = 501;
a = 0;
b = 200;
dt = (b-a)/(N-1);
sol = ode45(phi, [a,b], x0);
t = linspace(a,b,N);
y = deval(sol, t);
n = y(1,:);
x = y(2,:);

figure(1)
plot(t, n)
xlabel('t');
ylabel('n(t)');

figure(2)
plot(t, x)
xlabel('t');
ylabel('x(t)');

%--------------------------------------------------------------------------
disp('Part (b)');
% Approximate alpha and gamma at each point using central difference
%--------------------------------------------------------------------------
alpha_sol = zeros(1, N);
gamma_sol = zeros(1, N);

for i = 2:N-1
    np = 0.5*(n(i+1)-n(i-1))/dt;
    xp = 0.5*(x(i+1)-x(i-1))/dt;
    alpha_sol(i) = (xp+x(i)/(1+x(i)))/(n(i)^2*x(i));
    gamma_sol(i) = np+alpha_sol(i)*n(i)^2*x(i);
end

alpha_est = mean(alpha_sol(2:N-1));
gamma_est = mean(gamma_sol(2:N-1));
fprintf('estimated alpha: %f\n', alpha_est);
fprintf('estimated gamma: %f\n', gamma_est);

%--------------------------------------------------------------------------
disp('Part (c)');
%--------------------------------------------------------------------------
eta = normrnd(0, sqrt(0.1), 1, N);
mu = normrnd(0, sqrt(0.001), 1, N);
ns = n + eta;
xs = x + mu;

figure(3)
plot(t, ns)
xlabel('t');
ylabel('n^*(t)');

figure(4)
plot(t, xs)
xlabel('t');
ylabel('x^*(t)');

%--------------------------------------------------------------------------
disp('Part (d)');
%--------------------------------------------------------------------------



