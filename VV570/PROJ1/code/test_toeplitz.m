p = 10;
r = rand(1, p+1)
T = toeplitz(r(:,1:p))
b = r(:,2:p+1)
a1 = inv(T)*b'
a2 = solve_toeplitz(r)'