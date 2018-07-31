clear all; close all; clc;

a = 0;
b = 1;
N = 51;
t = linspace(a, b, N);
h = 1/(N-1);
coef = [1/h^2 + 3/(2*h), 2-2/h^2, 1/h^2 - 3/(2*h)];
ya = 0;
yb = 10;
y = linspace(ya, yb, N);

for k = 1:10
    [cA, cb] = build_system(y,coef);
    cy = linsolve(cA, cb);
    
    for i = 2:N-1
        y(i) = cy(i-1);
    end
    
    plot(t, y, '^-')
    xlabel('t')
    ylabel('y')
    title('Solution of the BVP by FDM')
end

function [A, b] = build_system(y,coef)
    N = length(y);
    A = zeros(N-2, N-2);
    b = zeros(N-2, 1);
    
    for i = 1:N-2
        for j = -1:1
            ci = j+2;
            aj = i+j;
            if(aj==0 || aj ==N-1)
                b(i) = b(i)-coef(ci)*y(aj+1);
            else
                A(i,aj) = coef(ci);
            end
        end
    end
end
