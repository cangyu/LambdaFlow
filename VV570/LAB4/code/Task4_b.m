clear all; close all; clc;

g = fzero(@bvp_shooting, 3);
disp(g);

[t, y_val] = ode45( @(t, y) [y(2); 3*y(2)-2*y(1)], [0, 1], [0; g]);
plot(t, y_val(:,1), '^-')
xlabel('t')
ylabel('y')
title('Solution of the BVP by Shooting')

function err = bvp_shooting(gamma)
    phi = @(t, y) [y(2); 3*y(2)-2*y(1)];
    [t, y_ode45] = ode45(phi, [0, 1], [0; gamma]);
    N = length(t);
    err = y_ode45(N,1) - 10;
end