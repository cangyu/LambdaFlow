clear all; close all; clc;

sol_init = bvpinit(linspace(0,1,5),[5,3]);
ode_sol = bvp4c(@ode_bvp,@ode_bc,sol_init);

x = linspace(0,1,51);
y = deval(ode_sol,x);
plot(x,y(1,:),'^-')
xlabel('x')
ylabel('y')
title('Solution by bvp4c')

ys = deval(ode_sol, 1/pi);
disp(ys(1,:));

function dydx = ode_bvp(x,y)
    dydx = [y(2); 3*y(2)-2*y(1)];
end

function ret = ode_bc(ya, yb)
    ret = [ya(1);yb(1)-10];
end
