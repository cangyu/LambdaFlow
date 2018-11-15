N = 5;
D = diag(rand(N,1))
U = orth(rand(N,N))
A = U' * D * U

l1 = chol(A)'
l2 = cholesky_decomp(A)