clear all; close all; clc;

f = @(x) [3*x(1) - cos(x(2)*x(3))-0.5; 
          x(1)^2 - 625*x(2)^2 - 0.25;
          exp(-x(1)*x(2))+20*x(3) - (3-10*pi)/3];
Jf = @(x) [3, x(3)*sin(x(2)*x(3)), x(2)*sin(x(2)*x(3));
           2*x(1), -1250*x(2), 0;
           -x(2)*exp(-x(1)*x(2)), -x(1)*exp(-x(1)*x(2)), 20];

g = @(x) [(1/2+cos(x(2)*x(3)))/3; sqrt(1/4-x(1)^2)/25; ((3-10*pi)/3-exp(-x(1)*x(2)))/20];

x_exact = [0.5, 0, -pi/6];

%--------------------------------------------------------------------------
disp('Without downhill simplex initialization');
%--------------------------------------------------------------------------
disp('fixed-point');
tic
    x_init = [0.1; 0.1; 0.1];
    tol = 1e-10;
    f_norm = @(x) norm(x, 2);
    x_fp = multi_var_fp(g, x_init, tol, f_norm);
toc

disp('newton');
tic
    x_init = [0.1; 0.1; 0.1];
    tol = 1e-10;
    f_norm = @(x) norm(x, 2);
    x_nt = multi_var_newton(f, Jf, x_init, tol, f_norm);
toc

disp('broyden');
tic
    x_init = [0.1; 0.1; 0.1];
    tol = 1e-10;
    A0_inv = inv(Jf(x_init));
    f_norm = @(x) norm(x, 2);
    x_bd = multi_var_broyden(f, x_init, A0_inv, tol, f_norm);
toc

%--------------------------------------------------------------------------
disp('With downhill simplex initialization');
%--------------------------------------------------------------------------
x0 = [0.1; 0.1; 0.1];
lambda = 1;
tol = 1e-7;
f_eval = @(x) norm(f(x),2);
f_norm =  @(x) norm(x, 2);
x_init = downhill_simplex(f_eval, x0, lambda, tol, f_norm);


disp('fixed-point');
tic
    tol = 1e-10;
    f_norm = @(x) norm(x, 2);
    x_fp = multi_var_fp(g, x_init, tol, f_norm);
toc

disp('newton');
tic
    tol = 1e-10;
    f_norm = @(x) norm(x, 2);
    x_nt = multi_var_newton(f, Jf, x_init, tol, f_norm);
toc

disp('broyden');
tic
    tol = 1e-10;
    A0_inv = inv(Jf(x_init));
    f_norm = @(x) norm(x, 2);
    x_bd = multi_var_broyden(f, x_init, A0_inv, tol, f_norm);
toc

%---------------------------------End--------------------------------------
