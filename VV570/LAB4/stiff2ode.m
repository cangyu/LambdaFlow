function f = stiff2ode ( x, y )
% f = stiff2_ode ( x, y )
% computes the right side of the ODE
% dy/dx=f(x,y)=lambda*(-y+sin(x)) for lambda = 2
% x is independent variable
% y is dependent variable
% output, f is the value of f(x,y).
LAMBDA=2;
f = LAMBDA * ( -y + sin(x) );

end

