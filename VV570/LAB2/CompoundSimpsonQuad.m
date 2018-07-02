function [quad] = CompoundSimpsonQuad(f, a, b, n)
    quad = 0;
    xpts = linspace(a, b, n+1);
    h = (b-a)/n;
    for i = 1:n
        quad = quad + f(xpts(i)) + f(xpts(i+1)) + 4*f((xpts(i)+xpts(i+1))/2);
    end
    quad = quad * h/6;
end