p = 1000;
r = rand(1, p+1);
T = toeplitz(r(:,1:p));
b = r(:,2:p+1);
tic
    a1 = inv(T)*b';
toc

tic
    a2 = solve_toeplitz(r)';
toc