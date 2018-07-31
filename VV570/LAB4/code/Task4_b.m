clear all; close all; clc;

g = fzero(@bvp_shooting, 3)

function err = bvp_shooting(gamma)
    phi = @(t, y) [y(2); 3*y(2)-2*y(1)];
    [t, y_ode45] = ode45(phi, [0, 1], [0; gamma]);
    N = length(t);
    err = y_ode45(N) - 10;
end