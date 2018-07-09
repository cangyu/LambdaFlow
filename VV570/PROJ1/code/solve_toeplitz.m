function [a] = solve_toeplitz(t)
    p = length(t)-1;
    r0 = t(1);
    r = t(:,2:p+1);
    a = zeros(1, p);
    
    for k = 1:p
        up = r(k);
        for i = 1:k-1
            up = up - a(i)*r(k-i);
        end
        
        down = -r0;
        for i = 1:k-1
            down = down + a(i)*r(i);
        end
        
        lambda = up/down;
        
        a(k) = -lambda;
        left =1;
        right = k-1;
        while(left<=right)
            tmp = a(left);
            a(left) = a(left) + lambda * a(right);
            if(left~=right)
                a(right) = a(right) + lambda * tmp;
            end
            left = left+1;
            right = right-1;
        end
    end
end
