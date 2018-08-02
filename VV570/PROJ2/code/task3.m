clear all; close all; clc;

alpha = 0.1;
gamma = 0.2;
phi = @(t, x) [gamma-alpha*x(1)^2*x(2); alpha*x(1)^2*x(2)-x(2)/(1+x(2))];
x0 = [1;1];
%--------------------------------------------------------------------------
disp('Part(a) -- x(t) and n(t) are calculated with ode45');
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
%--------------------------------------------------------------------------
disp('Part(b) -- alpha and gamma are approximated at each point using central difference');
%--------------------------------------------------------------------------
alpha_sol1 = zeros(1, N);
gamma_sol1 = zeros(1, N);
for i = 2:N-1
    [alpha_sol1(i), gamma_sol1(i)] = central_diff_param_solve(n, x, i ,dt);
end
alpha_est1 = mean(alpha_sol1(2:N-1));
gamma_est1 = mean(gamma_sol1(2:N-1));
fprintf('  estimated alpha: %f\n', alpha_est1);
fprintf('  estimated gamma: %f\n', gamma_est1);
%--------------------------------------------------------------------------
disp('Part(c) -- noise signals are generated using normrnd');
%--------------------------------------------------------------------------
sigma1 = sqrt(0.1);
sigma2 = sqrt(0.001);
eta = normrnd(0, sigma1, 1, N);
mu = normrnd(0, sigma2, 1, N);
ns = n + eta;
xs = x + mu;

figure(1)
subplot(2,1,1)
plot(t, n)
xlabel('t');
ylabel('n(t)');
title('original n(t)')
subplot(2,1,2)
plot(t, ns)
xlabel('t');
ylabel('n^*(t)');
title('n(t) with noise');

figure(2)
subplot(2,1,1)
plot(t, x)
xlabel('t');
ylabel('x(t)');
title('original x(t)')
subplot(2,1,2)
plot(t, xs)
xlabel('t');
ylabel('x^*(t)');
title('x(t) with noise');
%--------------------------------------------------------------------------
disp('Part(d) -- alpha and gamma are estimated utilizing the properies of nosie');
%--------------------------------------------------------------------------
en = mean(ns);
ex = mean(xs);

nsp = zeros(1, N);
xsp = zeros(1, N);
for i =2:N-1
    nsp(i) = 0.5*(ns(i+1)-ns(i-1))/dt;
    xsp(i) = 0.5*(xs(i+1)-xs(i-1))/dt;
end
ensp = mean(nsp(2:N-1));
exsp = mean(xsp(2:N-1));

en2xs = 0;
exo1xs = 0;
for i = 1:N
    en2xs = en2xs + ns(i)^2 * xs(i);
    exo1xs = exo1xs + xs(i)/(1+xs(i));
end
en2xs = en2xs/N;
exo1xs = exo1xs/N;
en2x = en2xs - ex*sigma1^2;

alpha_est2 = (exsp+exo1xs)/en2x;
gamma_est2 = ensp + alpha_est2*en2x;
fprintf('  estimated alpha: %f\n', alpha_est2);
fprintf('  estimated gamma: %f\n', gamma_est2);
%--------------------------------------------------------------------------
disp('Part(e) -- alpha and gamma are estimated without utilizing the properies of nosie');
%--------------------------------------------------------------------------
n_trial = 200;
alpha_est3 = zeros(1, n_trial);
gamma_est3 = zeros(1, n_trial);
for k = 1:n_trial
    cns = n + normrnd(0, sigma1, 1, N);
    cxs = x + normrnd(0, sigma2, 1, N);
    cur_alpha_sol = zeros(1, N);
    cur_gamma_sol = zeros(1, N);
    for i = 2:N-1
        [cur_alpha_sol(i), cur_gamma_sol(i)] = central_diff_param_solve(cns, cxs, i, dt);
    end
    alpha_est3(k) = mean(cur_alpha_sol(2:N-1));
    gamma_est3(k) = mean(cur_gamma_sol(2:N-1));
end
figure(3)
subplot(2,1,1)
plot(alpha_est3)
xlabel('Numerical Experiment Cnt')
ylabel('\alpha')
title('Coarse estimation of \alpha')
subplot(2,1,2)
plot(gamma_est3)
xlabel('Numerical Experiment Cnt')
ylabel('\gamma')
title('Coarse estimation of \gamma')

alpha_est3_mean = mean(alpha_est3);
gamma_est3_mean = mean(gamma_est3);

alpha_est3_err = zeros(1, n_trial);
gamma_est3_err = zeros(1, n_trial);
for k = 2:n_trial
    alpha_est3_err(k) = abs((alpha_est3(k)-alpha_est3_mean)/alpha_est3_mean);
    gamma_est3_err(k) = abs((gamma_est3(k)-gamma_est3_mean)/gamma_est3_mean);
end
figure(4)
subplot(2,1,1)
plot(alpha_est3_err);
xlabel('Numerical Experiment Cnt')
ylabel('Relative error of \alpha')
title('Coarse estimation of \alpha')
subplot(2,1,2)
plot(gamma_est3_err);
xlabel('Numerical Experiment Cnt')
ylabel('Relative error of \gamma')
title('Coarse estimation of \gamma')

gamma_est4 = ensp+exsp+exo1xs;
alpha_est4 = (gamma_est4-ensp)/en2xs;
fprintf('  estimated alpha: %f\n', alpha_est4);
fprintf('  estimated gamma: %f\n', gamma_est4);
%--------------------------------------------------------------------------
disp('Done!');
%--------------------------------------------------------------------------

function [ak, gk] = central_diff_param_solve(n, x, i, dt)
    n0 = n(i-1); x0 = x(i-1);
    n1 = n(i); x1 = x(i);
    n2 = n(i+1); x2 = x(i+1);
    
    np = 0.5*(n2 - n0)/dt;
    xp = 0.5*(x2 - x0)/dt;
    
    ak = (xp+x1/(1+x1))/(n1^2*x1);
    gk = np+ak*n1^2*x1;
end
