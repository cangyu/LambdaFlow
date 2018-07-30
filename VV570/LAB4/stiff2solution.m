function y = stiff2solution ( x )
% y = stiff2_solution ( x )
% computes the solution of the ODE
% dy/dx=f(x,y)=lambda*(-y+sin(x)) for lambda = 2
% and initial condition y=0 at x=0
% x is the independent variable
% y is the solution value
LAMBDA=2;
y = (LAMBDA^2/(1+LAMBDA^2))*sin(x) + ...
(LAMBDA /(1+LAMBDA^2))*(exp(-LAMBDA*x)-cos(x));
end
