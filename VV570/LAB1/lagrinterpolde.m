function [C, C1] = lagrinterpolde(X,Y) 
%--------------------------------------------------------------------------
%lagrinterpolde   Coefficients of Lagrange polynomial interpolation 
%                 and coefficients of the first derivative of it
% Inputs 
%   X   vector of interpolation nodes
%   Y   vector of funtion values at X
% Outpus
%   C   vector of coefficients of p
%   C1  vector of coefficients of p'
%% NUMERICAL METHODS: MATLAB Programs, Mathews & Fink 2004 
%--------------------------------------------------------------------------
w = length(X);
n = w - 1;
L = zeros(w,w);

for k = 1:n+1
    V = 1;
    for j = 1:n+1
        if k~=j
            V = conv(V, poly(X(j)))/(X(k)-X(j));
        end
    end
    L(k,:) = V;
end

C = Y*L;
C1 = C .* (n:-1:0);
C1 = C1(1:n);
