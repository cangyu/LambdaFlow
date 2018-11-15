function ret = Phi(t,X)
    t1 = 10*(X(2)-X(1));
    t2 = 28*X(1) - X(2) - X(1)*X(3);
    t3 = -8/3*X(3) + X(1)*X(2);
    ret = [t1;t2;t3];
end

