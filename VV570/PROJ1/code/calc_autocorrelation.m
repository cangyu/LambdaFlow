function [r] = calc_autocorrelation(s, j)
    n = length(s);
    r = 0;
    for i = 1:n-j
        r = r + s(i) * s(i+j);
    end
end

