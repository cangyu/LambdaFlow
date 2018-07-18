function [xvec] = naiveFP( f, x0, tol, nmax, varargin)
%naiveFP: Illusration of local functions 
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

    xvec = x0;    
    for j = 1:nmax
        res = f( xvec(j) );
        if abs( xvec(j) - res) < tol 
            outputlocalfunc()
            return
        else
            xvec(j+1) = res;
        end
    end
    
    outputlocalfunc()
    
end

