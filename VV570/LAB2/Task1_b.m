function [quad] = midpointquad(f,a,b,n)
xpts = linspace(a, b, n);
h = (b-a)/(n-1);
xmidpts = zeros(1, n-1);
for i = 1:n-1
    xmidpts(i) = f((xpts(i) + xpts(i+1))/2);
end
quad = h * sum(xmidpts);
end

