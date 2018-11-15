function [c] = calc_covariance(s, a, b, j, i)
    c = 0;
    for n=a:b
        c = c+s(n-j)*s(n-i);
    end
end

