function [L] = cholesky_decomp(A)
    [n, ~] = size(A);
    L = zeros(n, n);
    
    for j = 1:n
        for i = j:n
            s=0;
            k=1;
            while(k<j)
                s = s+L(i,k)*L(j,k);
                k = k+1;
            end
            
            if(i==j)
                L(i, j) = sqrt(A(i, j) - s);
            else
                L(i, j) = (A(i,j)-s)/L(j, j);
            end
        end
    end
end

