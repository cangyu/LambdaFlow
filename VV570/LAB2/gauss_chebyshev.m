function [quad] = gauss_chebyshev(f, n)
    xpts = linspace(1, 2*n-1, n);
    for i = 1:n
        xpts(i) = cos(xpts(i)/(2*n)*pi);
    end
    
    quad = 0;
    for i = 1:n
        quad = quad + cf(f, xpts(i));
    end
    quad = pi/n * quad;
end

function [ret] = cf(f, x)
    ret = f(x) * sqrt(1-x.^2);
end
