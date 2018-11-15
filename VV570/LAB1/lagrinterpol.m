function [p]=lagrinterpol(x,y,z)
%--------------------------------------------------------------------------
%LAGRINTERPOL   Lagrange polynomial interpolation 
% Inputs 
%   x   vector of interpolation nodes
%   y   vector of funtion values at x
%   z   vector of points at which the interpolating polynomial need to be
%       evalauted
% Outpus
%   p   vector of polynomial values at z
%% NUMERICAL METHODS: MATLAB Programs, Mathews & Fink 2004 
%--------------------------------------------------------------------------
[m n] = size(y);
for j = 1:m
    a (:,1) = y (j,:)';
    for i = 2:n
        a (i:n,i) = ( a(i:n,i-1)-a(i-1,i-1) )./(x(i:n)-x(i-1))';
    end
    p(j,:) = a(n,n).*(z-x(n-1)) + a(n-1,n-1);
    for i = 2:n-1
        p(j,:) = p(j,:).*(z-x(n-i))+a(n-i,n-i);
    end
end
return