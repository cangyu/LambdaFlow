function [pi] = pi_machin()
pi = 4*(4*atan_inv(5) - atan_inv(239));

function [r] = atan_inv(x)
r = 0;
e = 1/x;
s = - x*x;
c = 1;
while (e ~= 0)
    r = r + e/c;
    e = e/s;
    c = c+2;
end
