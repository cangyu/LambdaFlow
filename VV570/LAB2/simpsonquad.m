function [quad] = simpsonquad(f,a, b, n)
    xpts = linspace(a, b, n+1);
    h = (b-a)/n;
    xmidpts = zeros(1, n);
    for i = 1:n
        xmidpts(i) = f(xpts(i)) + 4*f((xpts(i)+xpts(i+1))/2) + f(xpts(i+1));
    end
    quad = h/6 * sum(xmidpts);
end