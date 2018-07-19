function [xvec] = myFP( f, x0, tol, nmax, varargin)
%myFP: Fixed-point iteration algorithm in Task1-g.
%Input:
%   f: Input function.
%   x0: Initial guess.
%   tol: Tolerance used to determine convergence.
%   namx: Max number of iterations.
%   varargin: Custom plotting parameters.
%Output:
%   xvec: Intermediate iteration records.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function outputlocalfunc()
            plot(0:(length(xvec)-1), xvec, varargin{2:end});            
            h = xlabel('$n$' );
            set(h,'Interpreter','latex', 'FontSize', 18);
            h = ylabel('$x_n$' );
            set(h,'Interpreter','latex', 'FontSize', 18);            
            str = varargin{1};
            title(str, 'Interpreter','latex', ...
                'fontsize',18, 'color','black'); 
            format long
            table( (0:(length(xvec)-1))', xvec', ...
                'VariableNames', {'n', 'x_n'})
            format short
        
    end

    function [ret] = judge_zero(x, eps)
        if abs(x)<eps
            ret = 1;
        else
            ret = 0;
        end
    end

    xvec = x0;    
    for j = 1:nmax
        alpha = f(xvec(j));
        beta = f(alpha);
        
        up = beta*xvec(j)-alpha.^2;
        down = beta-2*alpha+xvec(j);
        
        if judge_zero(down, 1e-12)
            warning('Divisor too small!');
        end
        
        res = up/down;
        
        if abs(xvec(j) - res) < tol 
            outputlocalfunc()
            return
        else
            xvec(j+1) = res;
        end
    end
    
    outputlocalfunc()
    
end

