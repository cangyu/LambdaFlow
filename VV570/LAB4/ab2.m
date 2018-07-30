function [ x, y ] = ab2 ( f, xRange, yInitial, numSteps )
% [ x, y ] = ab2 ( f, xRange, yInitial, numSteps ) uses
% Adams-Bashforth second-order method to solve a system
% of first-order ODEs y?=f(x,y).
% f = name of an m-file with signature
% yprime = f(x,y)
% to compute the right side of the ODE as a row vector
%
% xRange = [x1,x2] where the solution is sought on x1<=x<=x2
% yInitial = column vector of initial values for y at x1
% numSteps = number of equally-sized steps to take from x1 to x2
% x = column vector of values of x
% y = matrix whose k-th row is the approximate solution at x(k).
x=zeros(numSteps+1,1);
x(1) = xRange(1);
h = ( xRange(2) - xRange(1) ) / numSteps;
y(1,:) = transpose(yInitial);
yprime(1,:) = transpose(feval ( f, x(1), y(1,:) ));
k = 1;
xhalf = x(k) + 0.5 * h;
yhalf = y(k,:) + 0.5 * h * yprime(k,:);
yprime1 = transpose(feval ( f, xhalf, yhalf ));
x(k+1) = x(k) + h;
y(k+1,:) = y(k,:) + h * yprime1;
yprime(k+1,:) = transpose(feval ( f, x(k+1), y(k+1,:) ));
for k = 2 : numSteps
x(k+1) = x(k) + h;
y(k+1,:) = y(k,:) + ...
h * ( 3.0 * yprime(k,:) - yprime(k-1,:) ) / 2.0;
if k<numSteps
yprime(k+1,:) = transpose(feval ( f, x(k+1), y(k+1,:) ));
end
end

