function [x_opt] = downhill_simplex(f, x0, lambda, tol, custom_norm)
    % Initialization
    N = length(x0);
    for i = 1:N+1
        s(i).x = x0;
    end
    for i = 1:N
        s(i+1).x(i) = s(i+1).x(i) + lambda;
    end
    for i = 1:N+1
        s(i).y = f(s(i).x);
    end
    [~, idx] = sort([s.y]);
    s = s(idx);
    
    err = tol +1;
    % Iteration
    while (err > tol)
        x_avg = zeros(1, N);
        for i = 1:N
            x_avg = x_avg + s(i).x;
        end
        x_mir = 2*x_avg - s(N+1).x;
        y_mir = f(x_mir);
        
        best = s(1).y;
        last_but_one = s(N).y;
        worst = s(N+1).y;
        flag = 0;
        if((y_mir >= best) && (y_mir < last_but_one)) %介于最好与次差之间
            s(N+1).x = x_mir;
            s(N+1).y = y_mir;
            disp('a');
        elseif(y_mir < best) %优于最好
            x_guess = 3*x_avg - 2 * s(N+1).x;
            y_guess = f(x_guess);
            if(y_guess < y_mir)
                s(N+1).x = x_guess;
                s(N+1).y = y_guess;
                disp('b');
            else
                s(N+1).x = x_mir;
                s(N+1).y = y_mir;
                disp('c');
            end
        elseif((y_mir <= worst) && (y_mir >= last_but_one)) %介于最差与次差之间
            x_guess = 1.5*x_avg-0.5*s(N+1).x;
            y_guess = f(x_guess);
            if(y_guess < y_mir)
                s(N+1).x = x_guess;
                s(N+1).y = y_guess;
                disp('d');
            else
                flag = 1;
                disp('e');
            end
        else % 比最差点还差
            x_guess = 0.5*x_avg + 0.5*s(N+1).x;
            y_guess = f(x_guess);
            if(y_guess < y_mir)
                s(N+1).x = x_guess;
                s(N+1).y = y_guess;
                disp('f');
            else
                flag = 1;
                disp('g');
            end
        end
        if(flag) %全体向当前最优点收缩
            for i = 2:N+1
                s(i).x = 0.5*(s(1).x + s(i).x);
                s(i).y = f(s(i).x);
            end
        end
        x_pre = s(1).x;
        [~, idx] = sort([s.y]);
        s = s(idx);
        err = custom_norm(s(1).x - x_pre);
    end
    x_opt = s(1).x;
end

